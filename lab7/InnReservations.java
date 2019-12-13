import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import java.util.Map;
import java.util.Scanner;

//import jdk.nashorn.internal.runtime.regexp.joni.ScanEnvironment;

import java.util.LinkedHashMap;
import java.time.LocalDate;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Date;

public class InnReservations {
    public static int numMonths = 12;

    /* FR-1: Output a list of rooms to the user sorted by popularity. */
    public static void roomsAndRates(Connection connect) {
        String query = "WITH stayLengths AS (select Room, Code, CheckIn, Checkout, DATEDIFF(Checkout, CheckIn) as length from lab7_reservations group by Code), "
                + "popularities AS (SELECT Room, ROUND(SUM(length)/180,2) AS popScore FROM stayLengths GROUP BY Room), "
                + "mostRecent AS (SELECT Room, Code, Checkout, RANK() OVER (PARTITION BY Room ORDER BY CheckOut DESC) AS NextAvailRank, length FROM stayLengths) "
                + "SELECT r.RoomCode, r.RoomName, r.Beds, r.BedType, r.maxOcc, r.basePrice, r.decor, popularities.Room, popScore, Checkout AS nextAvail, length from popularities join mostRecent on popularities.Room = mostRecent.Room join lab7_rooms r on popularities.Room = r.RoomCode WHERE NextAvailRank = 1 Order by popScore DESC ";
        try (PreparedStatement prep_statement = connect.prepareStatement(query)) {
            ResultSet results = prep_statement.executeQuery();
            System.out.format("%-8s %-25s %-8s %-8s %-12s %-10s %-12s %-9s %-14s %-18s\n", "roomCode", "roomName",
                    "numBeds", "bedType", "maxOccupancy", "basePrice", "decor", "popScore", "nextAvailable",
                    "mostRecentyStayLength");
            while (results.next()) {
                String roomCode = results.getString("r.RoomCode");
                String roomName = results.getString("r.RoomName");
                int numBeds = results.getInt("r.Beds");
                String bedType = results.getString("r.BedType");
                int maxOccupancy = results.getInt("r.maxOcc");
                int basePrice = results.getInt("r.basePrice");
                String decor = results.getString("r.decor");
                float popScore = results.getFloat("popScore");
                String nextAvailable = results.getString("nextAvail");
                int mostRecentStayLength = results.getInt("length");
                System.out.format("%-8s %-25s %-8d %-8s %-12d %-10d %-12s %-9f %-14s %-18d\n", roomCode, roomName,
                        numBeds, bedType, maxOccupancy, basePrice, decor, popScore, nextAvailable,
                        mostRecentStayLength);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    /* FR-2: Allow a user to book a room. */
    public static void reservations(Connection connect) {
        PreparedStatement prep_statement = null;
        try {
            Scanner scanner = new Scanner(System.in);
            System.out.print("First Name: ");
            String firstName = scanner.nextLine();
            System.out.print("Last Name: ");
            String lastName = scanner.nextLine();
            System.out.print("Desired Room Code: ");
            String roomCode = scanner.nextLine();
            System.out.print("Desired bed type: ");
            String bed = scanner.nextLine();
            System.out.print("Begin Date: ");
            String beginDate = scanner.nextLine();
            System.out.print("End Date: ");
            String endDate = scanner.nextLine();
            System.out.print("Number of children: ");
            int numKids = scanner.nextInt();
            System.out.print("Number of adults: ");
            int numAdults = scanner.nextInt();
            String query = "";
            ArrayList<String> options = new ArrayList<String>();
            if (numAdults + numKids > 5) {
                System.out.println("No suitable rooms are available");
                return;
            }
            if (roomCode.equals("Any") && !(bed.equals("Any"))) {
                query = "with roomsAvail as (select distinct Room from lab7_reservations where Room NOT IN (select Room from lab7_reservations where CheckIn <= '"
                        + endDate + "' and Checkout >= '" + beginDate
                        + "')), numGuests as (select RoomCode from lab7_rooms where maxOcc >= (" + (numAdults + numKids)
                        + ")), typeBed as (select RoomCode from lab7_rooms where bedType = '" + bed
                        + "') select RANK() OVER (PARTITION BY roomsAvail.Room) as num, roomsAvail.Room as room from roomsAvail join numGuests on roomsAvail.Room = numGuests.RoomCode join typeBed on roomsAvail.Room = typeBed.RoomCode;";
            } else if (roomCode.equals("Any") && bed.equals("Any")) {
                query = "with roomsAvail as (select distinct Room from lab7_reservations where Room NOT IN (select Room from lab7_reservations where CheckIn <= '"
                        + endDate + "' and Checkout >= '" + beginDate
                        + "')), numGuests as (select RoomCode from lab7_rooms where maxOcc >= (" + (numAdults + numKids)
                        + ")) select RANK() OVER (PARTITION BY roomsAvail.Room) as num, roomsAvail.Room from roomsAvail as room join numGuests on roomsAvail.Room = numGuests.RoomCode";
            } else if (!(roomCode.equals("Any")) && bed.equals("Any")) {
                query = "with numGuests as (select RoomCode from lab7_rooms where maxOcc >= (" + (numKids + numAdults)
                        + ")) select RANK() OVER (PARTITION BY lab7_rooms.RoomCode) as num, lab7_rooms.RoomCode as room from lab7_rooms join numGuests on lab7_rooms.RoomCode = numGuests.RoomCode where lab7_rooms.RoomCode = '"
                        + roomCode
                        + "' and lab7_rooms.RoomCode NOT IN (select Room from lab7_reservations where CheckIn <= '"
                        + endDate + "' and CheckOut >= '" + beginDate + "')";
            } else if (!(roomCode.equals("Any")) && !(bed.equals("Any"))) {
                query = "with numGuests as (select RoomCode from lab7_rooms where maxOcc >= (" + numKids + numAdults
                        + ")) select RANK() OVER (PARTITION BY lab7_rooms.RoomCode) as num, lab7_rooms.RoomCode as room from lab7_rooms join numGuests on lab7_rooms.RoomCode = numGuests.RoomCode where lab7_rooms.RoomCode = '"
                        + roomCode + "' and lab7_rooms.bedType = '" + bed
                        + "' and lab7_rooms.RoomCode NOT IN (select Room from lab7_reservations where CheckIn <= '"
                        + endDate + "' and CheckOut >= '" + beginDate + "')";
            }
            prep_statement = connect.prepareStatement(query);
            ResultSet results = prep_statement.executeQuery();
            int numResults = 0;
            while (results.next()) {
                System.out.format("%n: %s\n", results.getString("num"), results.getString("room"));
                numResults++;
                options.add(String.format("%s %s to %s", results.getString("room"), beginDate, endDate));
            }
            if (numResults == 0) {
                // do similarity queries-- suggest 5 possibilities for different rooms or dates
                // suggest different dates
                int n = 0;
                while (numResults < 5) {
                    query = "with roomsAvail as (select distinct Room, CheckIn, CheckOut, DATE_ADD('" + beginDate
                            + "', INTERVAL " + n + " DAY) as beginDate, DATE_ADD('" + endDate + "', INTERVAL " + n
                            + "DAY) as endDate from lab7_reservations where Room NOT IN (select Room from lab7_reservations where CheckIn <= (select DATE_ADD('"
                            + endDate + "', INTERVAL " + n + " DAY)) and Checkout >= (select DATE_ADD('" + beginDate
                            + "', INTERVAL " + n
                            + " DAY)))), numGuests as (select RoomCode from lab7_rooms where maxOcc >= ("
                            + (numKids + numAdults)
                            + ")) select roomsAvail.Room as room from roomsAvail join numGuests on roomsAvail.Room = numGuests.RoomCode";
                    prep_statement = connect.prepareStatement(query);
                    results = prep_statement.executeQuery();
                    while (results.next()) {
                        System.out.format("%n: %s %s to %s\n", numResults + 1, results.getString("room"),
                                results.getString("beginDate"), results.getString("endDate"));
                        options.add(String.format("%s %s to %s\n", results.getString("room"),
                                results.getString("beginDate"), results.getString("endDate")));
                        numResults++;
                        if (numResults == 5)
                            break;
                    }
                    n++;
                }
            }
            System.out.print("Enter choice number or 'Cancel': ");
            String choice = scanner.nextLine();
            if (choice.equals("Cancel"))
                return;
            String roomChoice = options.get(Integer.parseInt(choice) - 1);
            String room = roomChoice.split(" ")[0];
            beginDate = roomChoice.split(" ")[1];
            endDate = roomChoice.split(" ")[2];
            System.out.println("Confirming reservation");
            System.out.println("First Name: " + firstName);
            System.out.println("Last Name: " + lastName);
            System.out.println("Check In Date: " + beginDate + ", Check Out Date: " + endDate);
            query = "with total as(select RoomCode, RoomName, bedType, basePrice, 1.18*((DATEDIFF('" + endDate + "', '"
                    + beginDate + "') * basePrice)) as totalCost from lab7_rooms where RoomCode = '" + room
                    + "'), weekend as(select basePrice, CASE WHEN DAYOFWEEK('" + endDate + "') < DAYOFWEEK('"
                    + beginDate + "') and DAYOFWEEK('" + endDate + "') = 1 then 1 WHEN DAYOFWEEK('" + endDate
                    + "') < DAYOFWEEK('" + beginDate + "') and DAYOFWEEK('" + endDate + "') > 1 then 2 WHEN DAYOFWEEK('"
                    + endDate + "') = DAYOFWEEK('" + beginDate + "') then 2 WHEN DAYOFWEEK('" + beginDate
                    + "') > 1 and DAYOFWEEK('" + endDate
                    + "') < 7 then 0 ELSE 0 END as weekendCost from lab7_rooms where RoomCode = '" + room
                    + "') select RoomCode, RoomName, bedType, totalCost + 0.1*(weekend.BasePrice*weekend.weekendCost) as total_cost from total join weekend";
            prep_statement = connect.prepareStatement(query);
            results = prep_statement.executeQuery();
            String basePrice = "100";
            while (results.next()) {
                System.out.format("Room Code: %s, Room name: %s, Bed Type: %s\n", results.getString("RoomCode"),
                        results.getString("RoomName"), results.getString("bedType"));
                System.out.format("Total Cost of Stay: $%d\n", results.getString("total_cost"));
                basePrice = results.getString("basePrice");
                System.out.println("Number of adults: " + numAdults + ", Number of kids: " + numKids);
            }
            System.out.print("Enter 'Confirm' to confirm your reservation, or 'Cancel' to cancel: ");
            choice = scanner.nextLine();
            if (choice.equals("Cancel"))
                return;
            // add reservation to database
            query = "select MAX(CODE) as max_code from lab7_reservations";
            prep_statement = connect.prepareStatement(query);
            results = prep_statement.executeQuery();
            String newCode = "";
            while (results.next()) {
                newCode = results.getString("max_code");
            }
            query = "insert into lab7_reservations(CODE, Room, CheckIn, Checkout, Rate, LastName, FirstName, Adults, Kids) values("
                    + newCode + " + 1, '" + room + "', '" + beginDate + "', '" + endDate + "', " + basePrice + ", '"
                    + firstName + "', '" + lastName + "', " + numAdults + ", " + numKids + ")";
            prep_statement = connect.prepareStatement(query);
            results = prep_statement.executeQuery();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    /* FR-3: Allow a user to make changes to a current reservation. */
    public static void reservationsChange(Connection connect) {
        try {
            Scanner scanner = new Scanner(System.in);
            System.out.print("Reservation code: ");
            String code = scanner.nextLine();
            System.out.print("First Name: ");
            String firstName = scanner.nextLine();
            System.out.print("Last Name: ");
            String lastName = scanner.nextLine();
            System.out.print("Begin Date: ");
            String beginDate = scanner.nextLine();
            System.out.print("End Date: ");
            String endDate = scanner.nextLine();
            System.out.print("Number of children: ");
            String numKids = scanner.nextLine();
            System.out.print("Number of adults: ");
            String numAdults = scanner.nextLine();

            int codeNum = Integer.parseInt(code);

            if (!firstName.equals("")) {
                PreparedStatement prep_statement = connect
                        .prepareStatement("UPDATE lab7_reservations SET firstname = ? WHERE Code = ?");
                prep_statement.setString(1, firstName);
                prep_statement.setInt(2, codeNum);
                prep_statement.executeUpdate();
            }
            if (!lastName.equals("")) {
                PreparedStatement prep_statement = connect
                        .prepareStatement("UPDATE lab7_reservations SET lastname = ? WHERE Code = ?");
                prep_statement.setString(1, lastName);
                prep_statement.setInt(2, codeNum);
                prep_statement.executeUpdate();
            }
            // TODO: check that udpated checkin and checkout dates don't
            // conflict with existing reservations
            if (!beginDate.equals("")) {
                PreparedStatement prep_statement = connect
                        .prepareStatement("UPDATE lab7_reservations SET checkin = ? WHERE Code = ?");
                Date parsed = new SimpleDateFormat("yyyy-MM-dd").parse(beginDate);
                java.sql.Date sqlDate = new java.sql.Date(parsed.getTime());
                prep_statement.setDate(1, sqlDate);
                prep_statement.setInt(2, codeNum);
                prep_statement.executeUpdate();
            }
            if (!endDate.equals("")) {
                PreparedStatement prep_statement = connect
                        .prepareStatement("UPDATE lab7_reservations SET checkout = ? WHERE Code = ?");
                Date parsed = new SimpleDateFormat("yyyy-MM-dd").parse(endDate);
                java.sql.Date sqlDate = new java.sql.Date(parsed.getTime());
                prep_statement.setDate(1, sqlDate);
                prep_statement.setInt(2, codeNum);
                prep_statement.executeUpdate();
            }
            if (!numKids.equals("")) {
                PreparedStatement prep_statement = connect
                        .prepareStatement("UPDATE lab7_reservations SET kids = ? WHERE Code = ?");
                prep_statement.setInt(1, Integer.parseInt(numKids));
                prep_statement.setInt(2, codeNum);
                prep_statement.executeUpdate();
            }
            if (!numAdults.equals("")) {
                PreparedStatement prep_statement = connect
                        .prepareStatement("UPDATE lab7_reservations SET adults = ? WHERE Code = ?");
                prep_statement.setInt(1, Integer.parseInt(numAdults));
                prep_statement.setInt(2, codeNum);
                prep_statement.executeUpdate();
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    /* FR-4: Allow a user to cancel a reservation. */
    public static void reservationCancellation(Connection connect, Scanner input) {
        PreparedStatement pstmt = null;
        try {
            System.out.print("Reservation Code: ");
            String userInput = input.nextLine();
            int resNum = Integer.parseInt(userInput);
            pstmt = connect.prepareStatement("select * from lab7_reservations where CODE = ?");
            pstmt.setString(1, Integer.toString(resNum));
            ResultSet rs = pstmt.executeQuery();
            int count = 0;
            System.out.format("| %-5s | %-4s | %-10s | %-10s | %-4s | %-20s | %-20s | %-6s | %-4s |%n", "Code", "Room",
                    "CheckIn", "CheckOut", "Rate", "LastName", "FirstName", "Adults", "Kids");
            while (rs.next()) {
                count++;
                String code = rs.getString("CODE");
                String room = rs.getString("Room");
                String checkIn = rs.getString("CheckIn");
                String checkOut = rs.getString("CheckOut");
                int rate = rs.getInt("Rate");
                String lastName = rs.getString("LastName");
                String firstName = rs.getString("FirstName");
                int adults = rs.getInt("Adults");
                int kids = rs.getInt("Kids");
                System.out.format("| %-5s | %-4s | %-10s | %-10s | %4d | %-20s | %-20s | %-6d | %-4d |%n", code, room,
                        checkIn, checkOut, rate, lastName, firstName, adults, kids);
            }
            if (count == 0) {
                System.out.println("No record of reservation with given code");
                return;
            }
            System.out.print("\nConfirm Cancellation? (y/n): ");
            userInput = input.nextLine();
            switch (userInput) {
            case "y":
                pstmt = connect.prepareStatement("delete from lab7_reservations where CODE = ?");
                pstmt.setString(1, Integer.toString(resNum));
                pstmt.executeUpdate();
                System.out.println("Cancellation Confirmed");
                break;
            default:
                break;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    /* FR-5: Allow a user to see specific details about a reservation. */
    public static void detailedReservaion(Connection connect, Scanner input) {
        PreparedStatement pstmt = null;
        try {
            int firstWhere = 0;
            System.out.println(
                    "\nSEARCH\nSearch Options: Firstname, Lastname, DateRange, RoomCode, ReservationCode\nOnly one search criteria needed.\n");
            System.out.print("First Name: ");
            String FirstName = input.nextLine();
            if (FirstName.isEmpty()) {
                FirstName = "any";
            }
            System.out.print("Last Name: ");
            String LastName = input.nextLine();
            if (LastName.isEmpty()) {
                LastName = "any";
            }
            System.out.println("Date Range: Start date - End date");
            System.out.print("Start Date (yyyy-mm-dd): ");
            String StartDate = input.nextLine();
            System.out.print("End Date (yyyy-mm-dd): ");
            String EndDate = input.nextLine();
            if (StartDate.isEmpty()) {
                StartDate = "any";
            }
            if (EndDate.isEmpty()) {
                EndDate = "any";
            }
            System.out.print("Room Code: ");
            String RoomCode = input.nextLine();
            if (RoomCode.isEmpty()) {
                RoomCode = "any";
            }
            System.out.print("Reservation Code: ");
            String ResCode = input.nextLine();
            if (ResCode.isEmpty()) {
                ResCode = "any";
            }
            String whereClause = "where ";
            boolean fnFound = false;
            boolean lnFound = false;
            boolean roomcFound = false;
            boolean rescFound = false;
            boolean sdFound = false;
            boolean edFound = false;
            if (!FirstName.toLowerCase().equals("any")) {
                firstWhere = 1;
                whereClause += "FirstName like ?";
                fnFound = true;
            }
            if (!LastName.toLowerCase().equals("any")) {
                if (firstWhere == 1) {
                    whereClause += " and ";
                }
                firstWhere = 1;
                whereClause += "LastName like ?";
                lnFound = true;
            }
            if (!RoomCode.toLowerCase().equals("any")) {
                if (firstWhere == 1) {
                    whereClause += " and ";
                }
                firstWhere = 1;
                whereClause += "Room like ?";
                roomcFound = true;
            }
            if (!ResCode.toLowerCase().equals("any")) {
                if (firstWhere == 1) {
                    whereClause += " and ";
                }
                firstWhere = 1;
                whereClause += "Code like ?";
                rescFound = true;
            }
            if (!StartDate.toLowerCase().equals("any")) {
                if (firstWhere == 1) {
                    whereClause += " and ";
                }
                whereClause += "CheckIn = ?";
                sdFound = true;
            }
            if (!EndDate.toLowerCase().equals("any")) {
                if (firstWhere == 1) {
                    whereClause += " and ";
                }
                whereClause += "CheckOut = ?";
                edFound = true;
            }
            String query = "select * from lab7_reservations " + whereClause + ";";
            pstmt = connect.prepareStatement(query);
            int setCount = 1;
            if (fnFound) {
                pstmt.setString(setCount, FirstName + "%");
                setCount++;
            }
            if (lnFound) {
                pstmt.setString(setCount, LastName + "%");
                setCount++;
            }
            if (roomcFound) {
                pstmt.setString(setCount, RoomCode + "%");
                setCount++;
            }
            if (rescFound) {
                pstmt.setString(setCount, ResCode + "%");
                setCount++;
            }
            if (sdFound) {
                pstmt.setString(setCount, StartDate);
                setCount++;
            }
            if (edFound) {
                pstmt.setString(setCount, EndDate);
                setCount++;
            }
            ResultSet rs = pstmt.executeQuery();
            System.out.format("\n| %-5s | %-4s | %-10s | %-10s | %-4s | %-20s | %-20s | %-6s | %-4s |%n", "Code",
                    "Room", "CheckIn", "CheckOut", "Rate", "LastName", "FirstName", "Adults", "Kids");
            while (rs.next()) {
                String code = rs.getString("Code");
                String room = rs.getString("Room");
                String checkIn = rs.getString("CheckIn");
                String checkOut = rs.getString("CheckOut");
                int rate = rs.getInt("Rate");
                String lastName = rs.getString("LastName");
                String firstName = rs.getString("FirstName");
                int adults = rs.getInt("Adults");
                int kids = rs.getInt("Kids");
                System.out.format("| %-5s | %-4s | %-10s | %-10s | %4d | %-20s | %-20s | %-6d | %-4d |%n", code, room,
                        checkIn, checkOut, rate, lastName, firstName, adults, kids);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    /* FR-6: See a month-by-month revenue of the entire year. */
    public static void revenue(Connection connect) {
        // commented out below is my attempt
        // Statement stmt = null;
        // Statement stmt2 = null;
        // PreparedStatement pstmt = null;
        // ResultSet rs = null;
        // String query = "";
        // try {
        // query = "create table IF NOT EXISTS revenue (\n" + "\n" + "Room CHAR(10),\n"
        // + "January DECIMAL(10,2),\n" + "February DECIMAL(10,2),\n"
        // + "March DECIMAL(10,2),\n" + "April DECIMAL(10,2),\n"
        // + "May DECIMAL(10,2),\n" + "June DECIMAL(10,2),\n"
        // + "July DECIMAL(10,2),\n" + "August DECIMAL(10,2),\n"
        // + "September DECIMAL(10,2),\n" + "October DECIMAL(10,2),\n"
        // + "November DECIMAL(10,2),\n" + "December DECIMAL(10,2),\n"
        // + "YearRevenue DECIMAL(10,2),\n" + "\n" + "PRIMARY KEY (Room)\n" + ");";
        // pstmt = conn.prepareStatement(query);
        // pstmt.executeUpdate();
        // query = "SELECT room, MONTHNAME(STR_TO_DATE(month_checkin, '%m')),
        // ROUND(SUM(MonthRev),0) as MonthRevenue\n"
        // + "FROM (\n" + " (SELECT room, month_checkin, SUM(CheckInMonthRev) as
        // MonthRev\n"
        // + " from (\n" + " (select room,\n" + " MONTH(checkin) as month_checkin, \n"
        // + " \n"
        // + " SUM(ROUND( (DATEDIFF(LAST_DAY(checkin), checkin)+1) * Rate,2)) as
        // CheckInMonthRev\n"
        // + " \n" + " from lab7_reservations\n"
        // + " where MONTH(checkin) != MONTH(checkout)\n"
        // + " GROUP BY MONTH(checkin), MONTH(checkout), room\n"
        // + " order by room, month_checkin)\n" + " \n" + " UNION ALL\n" + " \n"
        // + " \n" + " (select room,\n" + " MONTH(checkout) as month_checkin,\n"
        // + " SUM(ROUND((DAY(checkout) - 1) * Rate,2)) as CheckInMonthRev\n"
        // + " from lab7_reservations\n" + " where MONTH(checkin) != MONTH(checkout)\n"
        // + " GROUP BY MONTH(checkin), MONTH(checkout), room\n"
        // + " order by room, month_checkin)\n" + " ) as a1\n" + " GROUP BY room,
        // month_checkin\n"
        // + " ORDER BY month_checkin\n" + " )\n" + " \n" + " UNION ALL\n" + " \n"
        // + " (select room, \n" + " MONTH(checkin) as month_checkin, \n"
        // + " SUM(ROUND(DATEDIFF(checkout,checkin) * Rate,2)) as MonthRev\n"
        // + " from lab7_reservations\n" + " where MONTH(checkin) = MONTH(checkout)\n"
        // + " GROUP BY MONTH(checkin), MONTH(checkout), room\n"
        // + " order by room, month_checkin\n" + " )\n" + ") as m1\n"
        // + "GROUP BY room, month_checkin\n" + "ORDER BY room, month_checkin\n" + " \n"
        // + ";";
        // pstmt = conn.prepareStatement(query);
        // rs = pstmt.executeQuery();
        // int count = 0;
        // float sum = 0;
        // String revz = "";
        // while (rs.next()) {
        // String m_revenue = rs.getString("MonthRevenue");
        // String room = rs.getString("Room");
        // if (count == 11) {
        // revz = revz + m_revenue;
        // sum = sum + Float.parseFloat(m_revenue);
        // query = "INSERT INTO revenue(Room, January, February, March, April, May,
        // June, July, August, September, October, November, December, YearRevenue)
        // VALUES(?, "
        // + revz + ", ?);";
        // pstmt = conn.prepareStatement(query);
        // pstmt.setString(1, room);
        // pstmt.setFloat(2, sum);
        // pstmt.executeUpdate();
        // revz = "";
        // count = 0;
        // } else {
        // sum = sum + Float.parseFloat(m_revenue);
        // revz = revz + m_revenue + ", ";
        // count++;
        // }
        // }
        // query = "INSERT INTO revenue(Room, January, February, March, April, \n"
        // + "May, June, July, August, September, October, \n" + "November, December,
        // YearRevenue)\n"
        // + "SELECT Room, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Decem,
        // Rev\n" + "FROM(\n"
        // + "\n" + " SELECT 'Total' as Room,\n" + " ROUND(SUM(January),0) as Jan, \n"
        // + " ROUND(SUM(February),0) as Feb, \n" + " ROUND(SUM(March),0) as Mar,\n"
        // + " ROUND(SUM(April),0) as Apr,\n" + " ROUND(SUM(May),0) as May,\n"
        // + " ROUND(SUM(June),0) as Jun,\n" + " ROUND(SUM(July),0) as Jul,\n"
        // + " ROUND(SUM(August),0) as Aug,\n" + " ROUND(SUM(September),0) as Sep,\n"
        // + " ROUND(SUM(October),0) as Oct,\n" + " ROUND(SUM(November),0) as Nov,\n"
        // + " ROUND(SUM(December),0) as Decem,\n" + " ROUND(SUM(YearRevenue),0) as
        // Rev\n"
        // + " from revenue\n" + " ) as w1;";
        // pstmt = conn.prepareStatement(query);
        // pstmt.executeUpdate();
        // query = "select * from revenue";
        // pstmt = conn.prepareStatement(query);
        // rs = pstmt.executeQuery();
        // System.out.format(
        // "| %-8s | %-8s | %-8s | %-8s | %-8s | %-8s | %-8s| %-8s| %-8s | %-9s | %-8s |
        // %-8s | %-8s | %-11s |%n",
        // "Room", "January", "February", "March", "April", "May", "June", "July",
        // "August", "September",
        // "October", "November", "December", "YearRevenue");
        // while (rs.next()) {
        // String room = rs.getString("Room");
        // String January = rs.getString("January");
        // String February = rs.getString("February");
        // String March = rs.getString("March");
        // String April = rs.getString("April");
        // String May = rs.getString("May");
        // String June = rs.getString("June");
        // String July = rs.getString("July");
        // String August = rs.getString("August");
        // String September = rs.getString("September");
        // String October = rs.getString("October");
        // String November = rs.getString("November");
        // String December = rs.getString("December");
        // String YearRevenue = rs.getString("YearRevenue");
        // System.out.format(
        // "| %-8s | %-8s | %-8s | %-8s | %-8s | %-8s | %-8s| %-8s| %-8s | %-9s | %-8s |
        // %-8s | %-8s | %-11s |%n",
        // room, January, February, March, April, May, June, July, August, September,
        // October, November,
        // December, YearRevenue);
        // }
        // query = "drop table revenue;";
        // pstmt = conn.prepareStatement(query);
        // pstmt.executeUpdate();
        // } catch (Exception e) {
        // System.out.println(e);
        // }
        String query = "WITH resTotals AS ( " + "SELECT room, checkin, (CASE "
                + "WHEN MONTH(checkin) = MONTH(checkout) THEN (DATEDIFF(checkout,checkin))*rate "
                + "WHEN MONTH(checkin) < MONTH(checkout) THEN (DATEDIFF(LAST_DAY(checkin),checkin)+1)*rate "
                + "ELSE (DATEDIFF(checkout, (DATE_ADD(DATE_ADD(LAST_DAY(checkout),INTERVAL 1 DAY), INTERVAL - 1 MONTH))))*rate END) AS revenue "
                + "FROM lab7_reservations WHERE YEAR(checkin) = 2019)"
                + "SELECT room, ROUND(SUM(revenue),0) AS revenue " + "FROM resTotals WHERE MONTH(checkin) = ? "
                + "GROUP BY room";
        try {
            ResultSet[] monthResults = new ResultSet[numMonths];
            int[] monthlyTotalSums = new int[numMonths + 1];

            for (int i = 0; i < numMonths; ++i) {
                PreparedStatement month_prep = connect.prepareStatement(query);
                month_prep.setInt(1, i + 1);
                monthResults[i] = month_prep.executeQuery();
            }

            System.out.format("%-5s %-10s%-10s%-10s%-10s%-10s%-10s%-10s%-10s%-10s%-10s%-10s%-10s%-10s\n", "Room",
                    "January", "February", "March", "April", "May", "June", "July", "August", "September", "October",
                    "November", "December", "Total");

            do {
                for (int i = 0; i < numMonths; ++i) {
                    monthResults[i].next();
                }

                String room = monthResults[0].getString("room");
                int yearlyTotal = 0;
                int monthlyTotal;

                System.out.format("%-5s ", room);
                for (int i = 0; i < numMonths; ++i) {
                    monthlyTotal = monthResults[i].getInt("revenue");
                    monthlyTotalSums[i] += monthlyTotal;
                    yearlyTotal += monthlyTotal;
                    System.out.format("%-10d", monthlyTotal);
                }
                monthlyTotalSums[numMonths] += yearlyTotal;
                System.out.format("%-10d", yearlyTotal);
                System.out.println();
            } while (!monthResults[0].isLast());

            System.out.format("%-5s ", "Total");
            for (int i = 0; i < numMonths + 1; ++i) {
                System.out.format("%-10d", monthlyTotalSums[i]);
            }
            System.out.println();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    /* See the menu option. */
    public static void printMenu(Connection connect) {
        System.out.println("Enter any of the options below (check spelling, non-case sensitive):");
        System.out.println("   - Room");
        System.out.println("   - Book");
        System.out.println("   - Edit");
        System.out.println("   - Cancel");
        System.out.println("   - Details");
        System.out.println("   - Revenue");
        System.out.println("   - Quit");

    }

    /* Display a menu for user. */
    public static void mainMenu(Connection connect) {
        boolean exit = false;
        Scanner scanner = new Scanner(System.in);
        printMenu(connect);
        System.out.print("Please enter an option: ");
        String option = scanner.nextLine();
        if (option.equalsIgnoreCase("Room")) {
            roomsAndRates(connect);
            return;
        } else if (option.equalsIgnoreCase("Book")) {
            reservations(connect);
            return;
        } else if (option.equalsIgnoreCase("Edit")) {
            reservationsChange(connect);
            return;
        } else if (option.equalsIgnoreCase("Cancel")) {
            reservationCancellation(connect, scanner);
            return;
        } else if (option.equalsIgnoreCase("Details")) {
            detailedReservaion(connect, scanner);
            return;
        } else if (option.equalsIgnoreCase("Revenue")) {
            revenue(connect);
            return;
        } else if (option.equalsIgnoreCase("Help")) {
            printMenu(connect);
            return;
        } else if (exit) {
            System.out.println("Thank you!");
            System.exit(1);
        } else {
            System.out.println("Option not available. Please enter again.");
            return;
        }
    }

    /* Main program */
    public static void main(String[] args) {
        String url = System.getenv("JDBC_URL");
        String un = System.getenv("JDBC_USER");
        String ps = System.getenv("JDBC_PW");
        try (Connection connect = DriverManager.getConnection(url, un, ps)) {
            while (true) {
                mainMenu(connect);
            }
        } catch (Exception ex) {
            System.out.println("Connection error. Please check your environment variables and try again.");
            System.out.println(ex);
        }
    }
}

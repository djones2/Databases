import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Map;
import java.util.Scanner;
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
                double popScore = results.getDouble("popScore");
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
    public static void reservations(Connection connect, Scanner input) {
        PreparedStatement prep_statement = null;
        try {
            prep_statement = connect.prepareStatement("select * from lab7_reservations");
            ResultSet rs = prep_statement.executeQuery();
            int maxRes = 0;
            while (rs.next()) {
                int resNum = rs.getInt("CODE");
                if (resNum > maxRes) {
                    maxRes = resNum;
                }
            }
            maxRes++;
            System.out.print("First Name: ");
            String firstName = input.nextLine();
            System.out.print("Last Name: ");
            String lastName = input.nextLine();
            System.out.println("Room Code ('any' for no preference): ");
            String roomCode = input.nextLine();
            System.out.println("Bed Type ('any' for no preference): ");
            String bedType = input.nextLine();
            System.out.println("Start Date (yyyy-mm-dd): ");
            String startDate = input.nextLine();
            System.out.println("End Date (yyyy-mm-dd): ");
            String endDate = input.nextLine();
            System.out.println("Number of Children: ");
            String children = input.nextLine();
            System.out.println("Number of Adults: ");
            String adults = input.nextLine();
            if (firstName.isEmpty() || lastName.isEmpty() || roomCode.isEmpty() || bedType.isEmpty()
                    || startDate.isEmpty() || endDate.isEmpty() || children.isEmpty() || adults.isEmpty()) {
                System.out.println("All values are required to book a room, please try again");
                return;
            }
            int childrenNum = Integer.parseInt(children);
            int adultNum = Integer.parseInt(adults);
            int occ = childrenNum + adultNum;
            int count = 0;
            boolean found = false;
            boolean roomCodeFound = false;
            boolean bedTypeFound = false;
            String query = "select *, rank() over (order by RoomCode) roomOption from lab7_rooms where RoomCode not in (select Room from lab7_reservations join lab7_rooms on Room=RoomCode where (CheckIn <= ? and CheckOut > ?) and maxOcc >= ?)";
            if (!roomCode.toLowerCase().equals("any")) {
                roomCodeFound = true;
                query += " and RoomCode = ?";
            }
            if (!bedType.toLowerCase().equals("any")) {
                bedTypeFound = true;
                query += " and bedType = ?";
            }
            prep_statement = connect.prepareStatement(query);
            prep_statement.setString(1, endDate);
            prep_statement.setString(2, startDate);
            prep_statement.setInt(3, occ);
            if (roomCodeFound) {
                prep_statement.setString(4, roomCode);
                if (bedTypeFound) {
                    prep_statement.setString(5, bedType);
                }
            } else {
                if (bedTypeFound) {
                    prep_statement.setString(4, bedType);
                }
            }
            rs = prep_statement.executeQuery();
            int maximumOccupancy = 0;
            ArrayList<String[]> rooms = new ArrayList<String[]>();
            while (rs.next()) {
                count++;
                found = true;
                String roomOption = rs.getString("roomOption");
                roomCode = rs.getString("RoomCode");
                String roomName = rs.getString("RoomName");
                int beds = rs.getInt("Beds");
                bedType = rs.getString("bedType");
                int maxOcc = rs.getInt("maxOcc");
                int basePrice = rs.getInt("basePrice");
                String[] roomInfo = new String[] { roomCode, roomName, bedType, Integer.toString(basePrice) };
                rooms.add(roomInfo);
                String decor = rs.getString("decor");
                if (count == 1) {
                    System.out.format("\n| %-6s | %-8s | %-30s | %-4s | %-10s | %-10s | %-10s | %-15s |%n", "Option",
                            "Code", "Name", "Beds", "BedType", "Max Guests", "base price", "Decor");
                }
                System.out.format("| %-6s | %-8s | %-30s | %4d | %-10s | %10d | %10d | %-15s |%n", roomOption, roomCode,
                        roomName, beds, bedType, maxOcc, basePrice, decor);
                if (maxOcc > maximumOccupancy) {
                    maximumOccupancy = maxOcc;
                }
            }
            System.out.println();
            if (count == 0) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Calendar c = Calendar.getInstance();
                c.setTime(sdf.parse(startDate));
                c.add(Calendar.DAY_OF_MONTH, 3);
                endDate = sdf.format(c.getTime());
                System.out
                        .println("\nCould not find a matching room during this interval, instead showing rooms between "
                                + startDate + " and " + endDate);
                prep_statement = connect.prepareStatement(
                        "select *, rank() over(order by RoomCode) roomOption from lab7_rooms where RoomCode not in (select Room from lab7_rooms join lab7_reservations on Room=RoomCode where (CheckIn <= ? and CheckOut > ?) and maxOcc >= ?)");
                prep_statement.setString(1, endDate);
                prep_statement.setString(2, startDate);
                prep_statement.setInt(3, occ);
                rs = prep_statement.executeQuery();
                while (rs.next()) {
                    count++;
                    found = true;
                    String roomOption = rs.getString("roomOption");
                    roomCode = rs.getString("RoomCode");
                    String roomName = rs.getString("RoomName");
                    int beds = rs.getInt("Beds");
                    bedType = rs.getString("bedType");
                    int maxOcc = rs.getInt("maxOcc");
                    int basePrice = rs.getInt("basePrice");
                    String[] roomInfo = new String[] { roomCode, roomName, bedType, Integer.toString(basePrice) };
                    rooms.add(roomInfo);
                    String decor = rs.getString("decor");
                    if (count == 1) {
                        System.out.format("| %-6s | %-8s | %-30s | %-4s | %-10s | %-10s | %-10s | %-15s |%n", "Option",
                                "Code", "Name", "Beds", "BedType", "Max Guests", "base price", "Decor");
                    }
                    System.out.format("| %-6s | %-8s | %-30s | %4d | %-10s | %10d | %10d | %-15s |%n", roomOption,
                            roomCode, roomName, beds, bedType, maxOcc, basePrice, decor);
                    if (maxOcc > maximumOccupancy) {
                        maximumOccupancy = maxOcc;
                    }
                }
            }
            if (maximumOccupancy < occ) {
                System.out.println("We're sorry, we are currently unable to host any parties larger than "
                        + Integer.toString(maximumOccupancy) + " people, please consider booking multiple rooms");
                return;
            }
            if (found) {
                SimpleDateFormat df = new SimpleDateFormat("yyyy-mm-dd");
                Calendar startC = Calendar.getInstance();
                startC.setTime(df.parse(startDate));
                Calendar endC = Calendar.getInstance();
                endC.setTime(df.parse(endDate));
                int workDays = 0;
                int totalDays = 0;
                while (startC.getTimeInMillis() < endC.getTimeInMillis()) {
                    if (startC.get(Calendar.DAY_OF_WEEK) != Calendar.SATURDAY
                            && startC.get(Calendar.DAY_OF_WEEK) != Calendar.SUNDAY) {
                        workDays++;
                    }
                    totalDays++;
                    startC.add(Calendar.DAY_OF_MONTH, 1);
                }
                System.out.println("Enter the Option number of the room you'd like to select: ");
                int selectedRoom = Integer.parseInt(input.nextLine());
                String[] chosenRoom = rooms.get(selectedRoom - 1);
                int bp = Integer.parseInt(chosenRoom[3]);
                double totalCost = (bp * workDays + bp * 1.1 * (totalDays - workDays)) * 1.18;
                System.out.println("\nFirst Name: " + firstName);
                System.out.println("Last Name: " + lastName);
                System.out.println("Room Code: " + chosenRoom[0]);
                System.out.println("Room Name: " + chosenRoom[1]);
                System.out.println("Bed Type: " + chosenRoom[2]);
                System.out.println("Start Date: " + startDate);
                System.out.println("End Date: " + endDate);
                System.out.println("Adults: " + adults);
                System.out.println("Children: " + children);
                System.out.println("Total Cost: $" + String.valueOf(totalCost));
                System.out.println("\nConfirm? (y/n): ");
                String confirmation = input.nextLine();
                switch (confirmation) {
                case "y":
                    String reservationCode = Integer.toString(maxRes);
                    prep_statement = connect.prepareStatement(
                            "insert into lab7_reservations (Code, Room, CheckIn, CheckOut, Rate, LastName, FirstName, Adults, Kids) values (?, ?, ?, ?, ?, ?, ?, ?, ?);");
                    prep_statement.setString(1, reservationCode);
                    prep_statement.setString(2, chosenRoom[0]);
                    prep_statement.setString(3, startDate);
                    prep_statement.setString(4, endDate);
                    prep_statement.setInt(5, bp);
                    prep_statement.setString(6, lastName.toUpperCase());
                    prep_statement.setString(7, firstName.toUpperCase());
                    prep_statement.setInt(8, adultNum);
                    prep_statement.setInt(9, childrenNum);
                    prep_statement.executeUpdate();
                    System.out.println("\nReservation Confirmed");
                    System.out.println("Reservation Code: " + reservationCode);
                    break;
                default:
                    System.out.println("\nReservation not confirmed, returning to menu");
                }
            }
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
            //scanner.close();
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
        // pstmt = connect.prepareStatement(query);
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
        // pstmt = connect.prepareStatement(query);
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
        // pstmt = connect.prepareStatement(query);
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
        // pstmt = connect.prepareStatement(query);
        // pstmt.executeUpdate();
        // query = "select * from revenue";
        // pstmt = connect.prepareStatement(query);
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
        // pstmt = connect.prepareStatement(query);
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
        System.out.println("   - ROOM: View rooms and their popularity amongst our guests.");
        System.out.println("   - BOOK: Our favorite!");
        System.out.println("   - EDIT: Change an aspect of your current reservation.");
        System.out.println("   - CANCEL: We hate to see you go.");
        System.out.println("   - DETAILS: Find out more about your reservation.");
        System.out.println("   - REVENUE: See how we're doing.");
        System.out.println("   - QUIT: Hope you got what you need!");

    }

    /* Display a menu for user. */
    public static void mainMenu(Connection connect) {
        boolean exit = false;
        Scanner scanner = new Scanner(System.in);
        printMenu(connect);
        System.out.print("Please enter an option: ");
        String option = scanner.nextLine();
        //scanner.close();
        if (option.equalsIgnoreCase("Room")) {
            roomsAndRates(connect);
            return;
        } else if (option.equalsIgnoreCase("Book")) {
            reservations(connect, scanner);
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
        } else if (option.equalsIgnoreCase("Quit")) {
            System.out.println("Thank you!");
            System.exit(0);
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
        Connection connect = null;
        try {
            connect = DriverManager.getConnection(url, un, ps); 
            while (true) {
                mainMenu(connect);
            }
        } catch (Exception ex) {
            System.out.println("Connection error. Please check your environment variables and try again.");
            System.out.println(ex);
        }
    }
}

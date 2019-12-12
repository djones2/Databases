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

public class InnReservations {
    /* FR-1: Output a list of rooms to the user sorted by popularity. */
    public static void roomsAndRates(Connection connect) {
        PreparedStatement prep_statement = null;
        try {
            String query = "WITH stayLengths AS (select Room, Code, CheckIn, Checkout, DATEDIFF(Checkout, CheckIn) as length from lab7_reservations group by Code), popularities AS (SELECT Room, ROUND(SUM(length)/180,2) AS popScore FROM stayLengths GROUP BY Room), mostRecent AS (SELECT Room, Code, Checkout, RANK() OVER (PARTITION BY Room ORDER BY CheckOut DESC) AS NextAvailRank, length FROM stayLengths) SELECT r.RoomCode, r.RoomName, r.Beds, r.BedType, r.maxOcc, r.basePrice, r.decor, popScore, Checkout AS nextAvail, length from popularities join mostRecent on popularities.Room = mostRecent.Room join lab7_rooms r on popularities.Room = r.RoomCode WHERE NextAvailRank = 1 Order by popScore DESC ";
            prep_statement = connect.prepareStatement(query);
            ResultSet results = prep_statement.executeQuery();
            // System.out.format()
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
            if(numAdults + numKids > 5)
            {
               System.out.println("No suitable rooms are available");
               return;
            }
            if(roomCode.equals("Any") && !(bed.equals("Any")))
            {
               query = "with roomsAvail as (select distinct Room from lab7_reservations where Room NOT IN (select Room from lab7_reservations where CheckIn <= '" + endDate + "' and Checkout >= '" + beginDate + "')), numGuests as (select RoomCode from lab7_rooms where maxOcc >= (" + (numAdults+numKids)+")), typeBed as (select RoomCode from lab7_rooms where bedType = '" + bed + "') select RANK() OVER (PARTITION BY roomsAvail.Room) as num, roomsAvail.Room as room from roomsAvail join numGuests on roomsAvail.Room = numGuests.RoomCode join typeBed on roomsAvail.Room = typeBed.RoomCode;";
            }
            else if(roomCode.equals("Any") && bed.equals("Any"))
            {
               query = "with roomsAvail as (select distinct Room from lab7_reservations where Room NOT IN (select Room from lab7_reservations where CheckIn <= '" + endDate +"' and Checkout >= '" + beginDate + "')), numGuests as (select RoomCode from lab7_rooms where maxOcc >= (" + (numAdults+numKids) + ")) select RANK() OVER (PARTITION BY roomsAvail.Room) as num, roomsAvail.Room from roomsAvail as room join numGuests on roomsAvail.Room = numGuests.RoomCode";
            }
            else if(!(roomCode.equals("Any")) && bed.equals("Any"))
            {
               query = "with numGuests as (select RoomCode from lab7_rooms where maxOcc >= (" + (numKids+numAdults)+")) select RANK() OVER (PARTITION BY lab7_rooms.RoomCode) as num, lab7_rooms.RoomCode as room from lab7_rooms join numGuests on lab7_rooms.RoomCode = numGuests.RoomCode where lab7_rooms.RoomCode = '" + roomCode + "' and lab7_rooms.RoomCode NOT IN (select Room from lab7_reservations where CheckIn <= '" + endDate + "' and CheckOut >= '" + beginDate + "')";
            }
            else if(!(roomCode.equals("Any")) && !(bed.equals("Any")))
            {
               query = "with numGuests as (select RoomCode from lab7_rooms where maxOcc >= (" + numKids+numAdults +")) select RANK() OVER (PARTITION BY lab7_rooms.RoomCode) as num, lab7_rooms.RoomCode as room from lab7_rooms join numGuests on lab7_rooms.RoomCode = numGuests.RoomCode where lab7_rooms.RoomCode = '"+ roomCode + "' and lab7_rooms.bedType = '" + bed + "' and lab7_rooms.RoomCode NOT IN (select Room from lab7_reservations where CheckIn <= '" + endDate+ "' and CheckOut >= '" + beginDate + "')";
            }
            prep_statement = connect.prepareStatement(query);
            ResultSet results = prep_statement.executeQuery();
            int numResults = 0;
            while(results.next())
            {
               System.out.format("%n: %s\n", results.getString("num"), results.getString("room"));
               numResults++;
            }
            if (numResults == 0)
            {
               //do similarity queries-- suggest 5 possibilities for different rooms or dates
               query = "";
               prep_statement = connect.prepareStatement(query);
               ResultSet results = prep_statement.executeQuery();
            }
            // System.out.format()
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    /* FR-3: Allow a user to make changes to a current reservation. */
    public static void reservationsChange(Connection connect) {
        PreparedStatement prep_statement = null;
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
            String query = "update lab7_reservations set LastName = " + lastName +", FirstName = " + firstName + ",CheckIn = " + beginDate + ", CheckOut = " + endDate + ",Adults = " + numAdults + ", Kids = " + numKids + "where Code = " + code;
            prep_statement = connect.prepareStatement(query);
            ResultSet results = prep_statement.executeQuery();
            // System.out.format()
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    /* FR-4: Allow a user to cancel a reservation. */
    public static void reservationCancellation(Connection connect) {
        PreparedStatement prep_statement = null;
        try {
            Scanner scanner = new Scanner(System.in);
            System.out.print("Reservation Code: ");
            String code = scanner.nextLine();
            String query = "delete from lab7_reservations where CODE = " + code;
            prep_statement = connect.prepareStatement(query);
            ResultSet results = prep_statement.executeQuery();
            // System.out.format()
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    /* FR-5: Allow a user to see specific details about a reservation. */
    public static void detailedReservaion(Connection connect) {
        PreparedStatement prep_statement = null;
        try {
            String query = "";
            prep_statement = connect.prepareStatement(query);
            ResultSet results = prep_statement.executeQuery();
            // System.out.format()
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    /* FR-6: See a month-by-month revenue of the entire year. */
    public static void revenue(Connection connect) {
        PreparedStatement prep_statement = null;
        try {
            String query = "";
            prep_statement = connect.prepareStatement(query);
            ResultSet results = prep_statement.executeQuery();
            // System.out.format()
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
    }

    /* Display a menu for user. */
    public static void mainMenu(Connection connect) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Please enter an option: ");
        String option = scanner.nextLine();
        if (option.equalsIgnoreCase("Room")) {
            roomsAndRates(connect);
            return;
        } else if (option.equalsIgnoreCase("Book")) {
            roomsAndRates(connect);
            return;
        } else if (option.equalsIgnoreCase("Edit")) {
            roomsAndRates(connect);
            return;
        } else if (option.equalsIgnoreCase("Cancel")) {
            roomsAndRates(connect);
            return;
        } else if (option.equalsIgnoreCase("Details")) {
            roomsAndRates(connect);
            return;
        } else if (option.equalsIgnoreCase("Revenue")) {
            roomsAndRates(connect);
            return;
        } else if (option.equalsIgnoreCase("Help")) {
            printMenu(connect);
            return;
        } else {
            System.out.println("Option not available. Please enter again.");
            return;
        }
    }

    /* Main program */
    public static void main(String[] args) {
        Connection connect = null;
        String url = System.getenv("JDBC_URL");
        String un = System.getenv("JDBC_USER");
        String ps = System.getenv("JDBC_PW");
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

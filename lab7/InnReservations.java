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
            String query = "WITH stayLengths AS (
            select Room, Code, CheckIn, Checkout, DATEDIFF(Checkout, CheckIn) as length
                from lab7_reservations 
                    group by Code
                    ), popularities AS (
                        SELECT Room, ROUND(SUM(length)/180,2) AS popScore
                            FROM stayLengths
                                GROUP BY Room
                                ), mostRecent AS (
                                    SELECT Room, Code, Checkout,
                                            RANK() OVER (PARTITION BY Room
                                                        ORDER BY CheckOut DESC) AS NextAvailRank, length
                                                            FROM stayLengths)
                                SELECT r.RoomCode, r.RoomName, r.Beds, r.BedType, r.maxOcc, r.basePrice, r.decor, popularities.Room, popScore, Checkout AS nextAvail, length 
                                from popularities
                                    join mostRecent on popularities.Room = mostRecent.Room
                                        join lab7_rooms r on popularities.Room = r.RoomCode
                                        WHERE NextAvailRank = 1
                                        Order by popScore DESC;";
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
            String query = "";
            prep_statement = connect.prepareStatement(query);
            ResultSet results = prep_statement.executeQuery();
            // System.out.format()
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    /* FR-3: Allow a user to make changes to a current reservation. */
    public static void reservationsChange(Connection connect) {
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

    /* FR-4: Allow a user to cancel a reservation. */
    public static void reservationCancellation() {
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
        println("Enter any of the options below (check spelling, non-case sensitive):");
        println("   - Room");
        println("   - Book");
        println("   - Edit");
        println("   - Cancel");
        println("   - Details");
        println("   - Revenue");
    }

    /* Display a menu for user. */
    public static void mainMenu(Connection connect) {
        Scanner option = new Scanner(System.in);
        System.out.print("Please enter an option: ");
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
    public static void main() {
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
        }
    }
}

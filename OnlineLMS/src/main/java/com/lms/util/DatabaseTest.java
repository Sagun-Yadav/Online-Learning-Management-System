
package com.lms.util;

import java.sql.Connection;

public class DatabaseTest {

    public static void main(String[] args) {

        Connection con = DBConnection.getConnection();

        if (con != null) {

            System.out.println("================================");
            System.out.println("LMS DATABASE CONNECTION SUCCESS!");
            System.out.println("Database: lms_db");
            System.out.println("================================");

            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {

            System.out.println("DATABASE CONNECTION FAILED!");

        }
    }
}

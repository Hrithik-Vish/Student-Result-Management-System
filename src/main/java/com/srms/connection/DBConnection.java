package com.srms.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static Connection connection = null;

    public static Connection getConnection() {

        if (connection == null) {

            try {

                Class.forName("org.postgresql.Driver");

                String url = "jdbc:postgresql://localhost:5432/srms";
                String username = "postgres";
                String password = "696369";

                connection = DriverManager.getConnection(url, username, password);

                System.out.println("Database Connected Successfully");

            } catch (ClassNotFoundException e) {

                System.out.println("PostgreSQL JDBC Driver not found");
                e.printStackTrace();

            } catch (SQLException e) {

                System.out.println("Database connection failed");
                e.printStackTrace();

            }

        }

        return connection;

    }

}
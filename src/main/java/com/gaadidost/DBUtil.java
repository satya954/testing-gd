package com.gaadidost;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBUtil {

    private static String URL;
    private static String USER;
    private static String PASS;
    private static String DRIVER;

    // Path of external file inside Tomcat conf directory
    private static final String PROPERTIES_FILE =
            System.getProperty("catalina.base") + "/conf/gaadidost-db.properties";

    static {
        loadProperties();
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Failed to load DB Driver: " + DRIVER, e);
        }
    }

    private static void loadProperties() {
        Properties props = new Properties();
        try (FileInputStream fis = new FileInputStream(PROPERTIES_FILE)) {
            props.load(fis);

            URL = props.getProperty("db.url");
            USER = props.getProperty("db.username");
            PASS = props.getProperty("db.password");
            DRIVER = props.getProperty("db.driver");

        } catch (IOException e) {
            throw new RuntimeException("Failed to load DB properties file: " + PROPERTIES_FILE, e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }
}


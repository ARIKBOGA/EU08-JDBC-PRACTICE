package utilities;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Employees_Utils {

    private static Connection CONNECTION;
    private static Statement STATEMENT;
    private static ResultSet RESULTSET;

    private static final String URL = ConfigurationReader.getProperty("dbURL_mysql");
    private static final String USERNAME = ConfigurationReader.getProperty("db_username_mysql");
    private static final String PASSWORD = ConfigurationReader.getProperty("db_password_mysql");

    /**
     * Establishes a connection to the specified database.
     * This method initializes the connection and statement objects and sets the active database.
     *
     * @param DB_NAME the name of the database to connect to
     */
    public static void createConnection(String DB_NAME) {
        try {
            // Establish connection using provided URL, username, and password
            CONNECTION = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            // Create a statement with scroll-insensitive and read-only properties
            STATEMENT = CONNECTION.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            // Use the specified database
            STATEMENT.execute("USE " + DB_NAME + ";");
        } catch (SQLException e) {
            // Throw a runtime exception if a SQL error occurs
            throw new RuntimeException(e);
        }
    }

    public static void executeQuery(String query) {
        try {
            RESULTSET = STATEMENT.executeQuery(query);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Map<String, Object>> getQueryResultMap(String query) {
        List<Map<String, Object>> rowList = new ArrayList<>();
        executeQuery(query);
        try (ResultSet rs = RESULTSET) {
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            while (rs.next()) {
                Map<String, Object> rowMap = new HashMap<>(columnCount);
                for (int i = 1; i <= columnCount; i++) {
                    rowMap.put(rsmd.getColumnName(i), rs.getObject(i));
                }
                rowList.add(rowMap);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowList;
    }

    public static void destroy() {
        try {
            if (RESULTSET != null)
                RESULTSET.close();
            if (STATEMENT != null)
                STATEMENT.close();
            if (CONNECTION != null)
                CONNECTION.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

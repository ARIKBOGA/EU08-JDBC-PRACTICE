package utilities;

import java.sql.*;

public abstract class DBConnector {

    private static ResultSet resultSet;
    private static Connection connection;
    private static Statement statement;

    private static final String dbURL = ConfigurationReader.getProperty("dbURL");
    private static final String db_username = ConfigurationReader.getProperty("db_username");
    private static final String db_password = ConfigurationReader.getProperty("db_password");

    public static ResultSet getResultSet(String sql) throws SQLException {
        if (resultSet != null) {
            return resultSet;
        } else {
            connection = DriverManager.getConnection(dbURL, db_username, db_password);
            statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            return statement.executeQuery(sql);
        }
    }

    public static void closeConnections() throws SQLException {
        // close connections
        if (resultSet != null) {
            resultSet.close();
            statement.close();
            connection.close();
            resultSet = null;
        }
    }

    public static Connection getConnection(){
        return connection;
    }
}
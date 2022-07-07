package jdbctests;

import java.sql.*;

public class TestConnection {
    public static void main(String[] args) throws SQLException {
        String dbURL = "jdbc:oracle:thin:@35.172.129.95:1521:XE";
        String db_username = "hr";
        String db_password = "hr";

        Connection connection = DriverManager.getConnection(dbURL,db_username,db_password);
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from REGIONS");


        while (resultSet.next()){
            System.out.println(resultSet.getString(2));
        }

        resultSet.first();

        // move pointer to first row
        resultSet.next();

        // getting information with column name
        String dbValue = resultSet.getString("region_name");
        System.out.println("dbValue = " + dbValue);

        // getting information with column index (starts from 1)
        resultSet.next();
        dbValue = resultSet.getString(2);
        System.out.println("dbValue = " + dbValue);


        // close connections
        resultSet.close();
        statement.close();
        connection.close();
    }
}

package jdbctests;

import utilities.DBConnector;

import java.sql.*;

public class TestConnection {

    public static void main(String[] args) throws SQLException {

        ResultSet resultSet = DBConnector.getResultSet("select * from REGIONS");


        while (resultSet.next()){
            System.out.println(resultSet.getString(2));
        }

        resultSet.beforeFirst();

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
        DBConnector.closeConnections();
    }
}
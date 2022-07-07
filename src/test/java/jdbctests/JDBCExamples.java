package jdbctests;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import utilities.DBConnector;

import java.sql.*;

public class JDBCExamples {

    @Test
    public void test1() throws SQLException {


        ResultSet resultSet = DBConnector.getResultSet("SELECT * FROM DEPARTMENTS");

        while (resultSet.next()) {
            System.out.println(resultSet.getString(1) + " - " +
                    resultSet.getString(2) + " - " +
                    resultSet.getString(3) + " - " +
                    resultSet.getString(4));
        }

        resultSet = DBConnector.getResultSet("SELECT * FROM regions");
        while (resultSet.next()) {

            System.out.println(resultSet.getInt(1) + " - " + resultSet.getString(2));

        }

        DBConnector.closeConnections();
    }

    @DisplayName("ResultSet Methods")
    @Test
    public void test2() throws SQLException {


        ResultSet resultSet = DBConnector.getResultSet("SELECT * FROM DEPARTMENTS");

        // how to find how many rows we have
        resultSet.last();
        System.out.println("resultSet.getRow() = " + resultSet.getRow());


        // print all second column
        resultSet.beforeFirst();
        while (resultSet.next())
            System.out.println(resultSet.getString(2));

        DBConnector.closeConnections();
    }

    @Test
    public void test3() throws SQLException {

        ResultSet resultSet = DBConnector.getResultSet("SELECT * FROM DEPARTMENTS");

        //get the database related data inside the dbMetedata object
        DatabaseMetaData dbMetadata = DBConnector.getConnection().getMetaData();

        System.out.println("dbMetadata.getUserName() = " + dbMetadata.getUserName());
        System.out.println("dbMetadata.getDatabaseProductName() = " + dbMetadata.getDatabaseProductName());
        System.out.println("dbMetadata.getDatabaseProductVersion() = " + dbMetadata.getDatabaseProductVersion());
        System.out.println("dbMetadata.getDriverName() = " + dbMetadata.getDriverName());
        System.out.println("dbMetadata.getDriverVersion() = " + dbMetadata.getDriverVersion());

        // get the resultSetMetaData
        ResultSetMetaData rsmd = resultSet.getMetaData();

        // how many columns we have
        int colCount = rsmd.getColumnCount();
        System.out.println("colCount = " + colCount);


        // print all column names dynamically
        for (int i = 0; i < colCount; i++) {
            System.out.println(rsmd.getColumnName(i + 1));
        }

        DBConnector.closeConnections();
    }
}
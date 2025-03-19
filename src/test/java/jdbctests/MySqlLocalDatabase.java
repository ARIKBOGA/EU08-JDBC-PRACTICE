package jdbctests;

import utilities.Employees_Utils;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class MySqlLocalDatabase {


    /**
     * Demonstrates how to use a local MySQL database
     *
     * @param args
     * @throws SQLException
     */
    public static void main(String[] args) throws SQLException {

        // connect to the database
        Employees_Utils.createConnection("employees");

        // get the results of a SQL query
        List<Map<String, Object>> mapList = Employees_Utils.getQueryResultMap(
                        "select title, count(title) " +
                        "from titles " +
                        "group by title " +
                        "order by count(title) desc");

        // print the results
        for (Map<String, Object> eachRow : mapList) {
            System.out.println(eachRow.entrySet());
        }

        // close the connections
        Employees_Utils.destroy();
    }
}
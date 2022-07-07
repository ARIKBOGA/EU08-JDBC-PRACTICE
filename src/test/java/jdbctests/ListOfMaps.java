package jdbctests;

import org.junit.jupiter.api.Test;
import utilities.DBConnector;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class ListOfMaps {

    @Test
    public void test1() throws SQLException {

        String query = "SELECT FIRST_NAME,LAST_NAME,SALARY,JOB_ID FROM EMPLOYEES WHERE ROWNUM < 6";
        ResultSet resultSet = DBConnector.getResultSet(query);

        int colCount = resultSet.getMetaData().getColumnCount();

        List<Map<String, Object>> queryData = new ArrayList<>();

        while (resultSet.next()) {
            Map<String, Object> row = new HashMap<>();
            for (int i = 1; i <= colCount; i++) {
                row.put(resultSet.getMetaData().getColumnName(i), resultSet.getString(i));
            }
            queryData.add(row);
        }

        // print Steven's last name and salary
        for (Map<String, Object> eachRow : queryData) {
            if ("Steven".equals(eachRow.get(resultSet.getMetaData().getColumnName(1)))) {
                System.out.println(eachRow.get(resultSet.getMetaData().getColumnName(2)) + ", " +
                        eachRow.get(resultSet.getMetaData().getColumnName(3)));
                break;
            }
        }
    }
}

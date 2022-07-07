package jdbctests;

import org.junit.jupiter.api.Test;
import utilities.DBUtils;

import java.util.List;
import java.util.Map;

public class DBUtilPractice {

    @Test
    public void test1(){

        DBUtils.createConnection();

        String query = "SELECT FIRST_NAME,LAST_NAME,SALARY,JOB_ID FROM EMPLOYEES WHERE ROWNUM < 6";
        String query1 = "SELECT FIRST_NAME,LAST_NAME,SALARY,JOB_ID FROM EMPLOYEES WHERE ROWNUM < 2";

        List<Map<String, Object>> queryResultMap = DBUtils.getQueryResultMap(query);
        // print the results
        for (Map<String, Object> eachRow : queryResultMap) {
            System.out.println(eachRow);
        }


        // single row returned example
        Map<String, Object> rowMap = DBUtils.getRowMap(query1);
        System.out.println("rowMap = " + rowMap);


        DBUtils.destroy();
    }
}

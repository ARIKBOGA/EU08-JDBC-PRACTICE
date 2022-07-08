package jdbctests;

import org.junit.jupiter.api.Test;
import utilities.ConfigurationReader;
import utilities.DBUtils;

import java.util.List;
import java.util.Map;


public class LibraryConnectTest {
    private static final String dbURL = ConfigurationReader.getProperty("dbURL_mysql");
    private static final String db_username = ConfigurationReader.getProperty("db_username_mysql");
    private static final String db_password = ConfigurationReader.getProperty("db_password_mysql");

    @Test
    public void test1() {
        DBUtils.createConnection(dbURL, db_username, db_password);
        List<Map<String, Object>> queryResultMap = DBUtils.getQueryResultMap("Select * from books");

        System.out.println(queryResultMap.size());

        DBUtils.destroy();
    }
}
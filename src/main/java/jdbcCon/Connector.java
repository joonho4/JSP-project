package jdbcCon;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connector {
	public static Connection genConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "1234");
		
		return con;
	}
}

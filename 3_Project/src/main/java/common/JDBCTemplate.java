package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {
	private static Connection conn = null;
	
	private JDBCTemplate() {}
	
	//Connection 객체 가져오기
	public static Connection getConnection() {
		if(conn == null) {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SCOTT","SCOTT");
				conn.setAutoCommit(false);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} return conn;
	}
	
	//commit
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	//rollback
	public static void rollback(Connection conn) {
		try {
			if(conn != null && conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//Statement 자원 close
	public static void close(Statement stmt) {
		try {
			if(stmt != null && stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
	}
	//ResultSet close
	public static void close(ResultSet rset) {
		try {
			if(rset != null && rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

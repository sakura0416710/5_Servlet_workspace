package employee.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import employee.model.vo.Employee;

public class EmployeeDAO {

		//1.쿼리짜기 :나는 selectAll할거니까 select,완성형 구문( statement.executeQuery();)
		//SQL에서 view객체 만들고 쿼리 간단하게 해주면 됨..
	public Employee login(Connection conn, Employee e) {
		PreparedStatement psmt = null;
		ResultSet rset = null;
		Employee login = null;
		
		
		String query="select * from v_selectemp where empno = ? and pwd = ? and status='Y'";
		
		try {
			
			psmt = conn.prepareStatement(query);
			psmt.setInt(1,e.getEmpNo());
			psmt.setString(2, e.getPwd());
			
			rset = psmt.executeQuery();
			if(rset.next()) { //employee 생성자 보고 순서 따라해야댐, 컬럼명X (ResultSet명)
				login = new Employee(rset.getInt("empno"),
									 rset.getString("pwd"),
									 rset.getString("사원이름"),
									 rset.getString("job"),
									 rset.getInt("mgrno"),
									 rset.getString("매니저이름"),
									 rset.getDate("hiredate"),
									 rset.getInt("sal"),
									 rset.getInt("comm"),
									 rset.getInt("deptno"),
									 rset.getString("dname"),
									 rset.getString("is_admin"),
									 rset.getString("status"));
			}
		} catch (SQLException e1) {
			
			e1.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
	
		return login;
	
	}
}

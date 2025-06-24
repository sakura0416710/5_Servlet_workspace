package employee.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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
	
	
	public ArrayList<Employee> selectAll(Connection conn) {
		//쿼리작성
		//<사원정보추출:3.DB에서 정보 추출해온거 DAO로 받아오기>
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Employee> list = new ArrayList<Employee>();
		
		String query="select * from v_selectemp";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				list.add(new Employee(rset.getInt("empno"),
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
						 rset.getString("status")));
					}
				
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}


	public int insertEmployee(Connection conn, Employee e) {
		//쿼리 생각하기
		PreparedStatement psmt = null;
		int result = 0;       //insert는 컬럼 순서대로 해야댐(추가하는거니까)
		String query = "INSERT INTO emp VALUES (?, ?, ?, ?, SYSDATE, ?, ?, ?, DEFAULT, ?, DEFAULT)";

		
		try {
			psmt = conn.prepareStatement(query);
			psmt.setInt(1, e.getEmpNo());
			psmt.setString(2, e.getName());
			psmt.setString(3, e.getJob());

			// mgr 번호 null처리
			if (e.getMgrNo() == null) {
			    psmt.setNull(4, java.sql.Types.INTEGER);
			} else {
			    psmt.setInt(4, e.getMgrNo());
			}

			psmt.setInt(5, e.getSal());
			psmt.setInt(6, e.getComm());
			psmt.setInt(7, e.getDeptNo());
			psmt.setString(8, e.getIsAdmin());

			
			result = psmt.executeUpdate();
	
		} catch (SQLException e1) {
			e1.printStackTrace();
		}finally {
			close(psmt);
		}
		return result;
	}


	public int updateEmployee(Connection conn, Employee e) {
		//쿼리 : update emp set pwd =?, name=?, job=?,sal=?,comm=?, deptno=? 	where empno=?
		//불완전 쿼리이므로 prepared Statement, int result반환(업뎃한 행 개수)
		
		PreparedStatement psmt = null;
		int result = 0;
		String query = "update emp set pwd =?, ename=?, job=?, sal=?,comm=?, deptno=? where empno=?";
		
		
		try {
			psmt = conn.prepareStatement(query);
			
			psmt.setString(1,e.getPwd());
			psmt.setString(2,e.getName());
			psmt.setString(3, e.getJob());
			psmt.setInt(4,e.getSal());
			psmt.setInt(5, e.getComm());
			psmt.setInt(6, e.getDeptNo());
			psmt.setInt(7, e.getEmpNo());
			
			result = psmt.executeUpdate();
			 
		} catch (SQLException e1) {
	
			e1.printStackTrace();
		} finally {
			close(psmt);
		}
		
		
		return result;
	}


	public int checkEmpNo(Connection conn, int empNo) {
		//불완전 쿼리 : select count(*) from emp where empNo=?
		//PreparedStatement 
		PreparedStatement psmt = null;
		ResultSet rest = null;
		int result = 0;
		String query = "select count(*) from emp where empNo=?";
		
		try {
			psmt = conn.prepareStatement(query);
			psmt.setInt(1,empNo);
			rest = psmt.executeQuery();
			
			if(rest.next()) {       //여긴 컬럼명쓰는건데 1로 받을거니까 1이라고 써도 됨
				result = rest.getInt("count(*)");
			}
		} catch (SQLException e1) {
			
			e1.printStackTrace();
		}finally {
			close(rest);
			close(psmt);
			
		}
		return result;
	}


	public int updateState(Connection conn, int id, String column, String value) {
		//쿼리
		    PreparedStatement pstmt = null;
		    int result = 0;

		    //?는 sql에서 '?'로 넘어가니까 'is_Admin'으로 되면 인식X
		    // 그래서 걍 써주면댐
		    String query = "UPDATE emp SET " + column + " = ? WHERE empNo = ?";

		    try {
		        pstmt = conn.prepareStatement(query);
		        pstmt.setString(1, value);
		        pstmt.setInt(2, id);

		        result = pstmt.executeUpdate();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        close(pstmt);
		    }

		    return result;
		

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

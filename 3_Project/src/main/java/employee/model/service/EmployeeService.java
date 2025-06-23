package employee.model.service;

import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import employee.model.dao.EmployeeDAO;
import employee.model.vo.Employee;


public class EmployeeService {

	//DAO랑 연결
	private EmployeeDAO eDAO = new EmployeeDAO();
	
	//Connection 객체 받아오기
	public Employee login(Employee e){
		Connection conn = getConnection();
		Employee login = eDAO.login(conn,e);
		
		return login;
		
	}
	
	//사원정보 조회
	
	public ArrayList<Employee> selectAll () {
		Connection conn = getConnection();
		ArrayList<Employee> list = eDAO.selectAll(conn);
		return list;
	}
	
	//사원등록하기
	public int insertEmployee(Employee e) {
		Connection conn = getConnection();
		int result = eDAO.insertEmployee(conn,e);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	//사원 정보 수정
	public int updateEmployee(Employee e) {
		Connection conn = getConnection();
		int result = eDAO.updateEmployee(conn, e);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}

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
	
	//<사원정보추출:2.service -> DAO랑 연결해주기>
	
	public ArrayList<Employee> selectAll () {
		Connection conn = getConnection();
		ArrayList<Employee> list = eDAO.selectAll(conn);
		return list;
	}

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
	
	
}

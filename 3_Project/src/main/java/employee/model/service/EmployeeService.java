package employee.model.service;

import static common.JDBCTemplate.getConnection;


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

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

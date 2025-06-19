package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TestServlet1 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//변수타입이 오버라이딩 조건 중 하나이므로 변수명은 변경해도 상관없다.
	//자바 파일의 내용 등 수정이 일어나면 재컴파일이 필요하다. 
	//	System.out.println("잘 들어왓는지 확인");
	//parameter (input name=""부분)
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String city = request.getParameter("city");
		String height = request.getParameter("height");
//		String food = request.getParameter("food");
		String[] food = request.getParameterValues("food"); //이러면 관련된 모든 food 파라미터를 불러옴
	
		System.out.println(name);
		System.out.println(Arrays.toString(food));
		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<style>");
		out.println("<h2{color: red;}>");
		out.println("span{font-weight : bold;}");
		out.println(".name{color : orange;}");
		out.println(".gender{color : yellow; background: black;}");
		out.println(".age{color: green;}");
		out.println(".height{color : navy;}");
		out.println(".city{color : blue;}");
		out.println(".food{color : purple;}");
		out.println("</style>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>개인취향 테스트 결과 - GET</h2>");
		out.println("<span class='name'>" + name + "</span> 님은 ");
		out.printf("<span class='age'>%s</span>이시며, ", age);
		out.printf("<span class= 'city'>%s</span>에 사는 키 <span class='height'>%s</span>cm인 ", city, height);
		out.printf("<span class='gender'>%s</span>입니다. 좋아하는 음식은 <span class='food'>", gender);
		if(food != null) {
			for(int i = 0; i <food.length; i++) {
				if(i==0) {
					out.printf("%s", food[i]);
				} else {
					out.printf(", %s", food[i]);
				}
			}
		}
		out.println("</span>입니다.");
		out.println("</body>");
		out.println("</html>");
		
	}
}

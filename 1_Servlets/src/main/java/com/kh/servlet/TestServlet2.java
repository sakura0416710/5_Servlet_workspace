package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TestServlet2 extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name=request.getParameter("name");
		String gender = request.getParameter("gender");
		String[] food = request.getParameterValues("food");
		String age = request.getParameter("age");
		String city = request.getParameter("city");
		String height = request.getParameter("height");
	
		System.out.println(name);
		System.out.println(age);
		System.out.println(city);
		System.out.println(height);
		System.out.println(Arrays.toString(food));
		System.out.println(gender);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<style>");
		out.println("h2{color: red;}");
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

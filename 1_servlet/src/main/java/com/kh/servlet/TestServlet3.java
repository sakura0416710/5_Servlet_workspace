package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TestServlet3 extends HttpServlet {
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      String name=request.getParameter("name");
      String gender = request.getParameter("gender");
      String age = request.getParameter("age");
      String city = request.getParameter("city");
      String height = request.getParameter("height");
      String[] food = request.getParameterValues("food");
   
      System.out.println(name);
      System.out.println(age);
      System.out.println(city);
      System.out.println(height);
      System.out.println(gender);
      System.out.println(Arrays.toString(food));
      
      //나이를 기준으로 선물추천하기 (데이터를 jsp쪽으로 넘기기)
      String recommendation = null;
      switch(age) {
      case "10대 미만" :recommendation = "사탕"; break;
      case "10대" : recommendation ="문화상품권"; break;
      case "20대" : recommendation = "향수"; break;
      case "30대" : recommendation = "지갑"; break;
      case "40대" : recommendation = "양주";break;
      case "50대" : recommendation = "트로트 가수 콘서트 티켓";break;
      }
      //jsp에 데이터 출력하는 요청을 보내야 함 ->request사용
      //test.html =>request(1) => servlet =>request에 데이터를 세팅해서(2)=> end.jsp
       //1. name속성에 name데이터 담기
      request.setAttribute("name", name);
      request.setAttribute("age", age);
      request.setAttribute("gender", gender);
      request.setAttribute("city", city);
      request.setAttribute("height", height);
      request.setAttribute("foods", String.join(",", food)); //배열에 있는 애를 기준점(여기선,)으로 나눠서 보여줌
      request.setAttribute("recomm", recommendation);
      
      //2. 리퀘스트 디스패쳐를 반환하므로. 요청을 어디서 받을건지 경로를 적어주면 됨
      RequestDispatcher view = request.getRequestDispatcher("servlet/testServlet3End.jsp"); 
   
      //3. 전달하기(포워딩 작업)
      view.forward(request, response);
      
   }
}

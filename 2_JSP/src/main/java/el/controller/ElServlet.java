package el.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import person.model.vo.Person;

public class ElServlet extends HttpServlet {
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      //값 받아오기
      String name = request.getParameter("name");
      char gender = request.getParameter("gender").charAt(0);
      int age = Integer.parseInt(request.getParameter("age"));
      Person p = new Person(name, gender, age);
      String[] products = request.getParameterValues("product");
      String book = request.getParameter("book");
      String movie = request.getParameter("movie");
      String beverage = request.getParameter("beverage");
      
      //request : 1회성 요청수행
      request.setAttribute("person", p);
      request.setAttribute("beverage", beverage);
      request.setAttribute("year", 2025);
      request.setAttribute("products", products);
      
      //세션
      HttpSession session = request.getSession();
      session.setAttribute("book", book);
      
      //application영역
      ServletContext application = request.getServletContext();
      application.setAttribute("movie", movie);
      
      //값을 다 담았으면 이제 정보를 보내야하므로 경로 잡아주고(getRequestDispatcher) 전송(forward)
      RequestDispatcher view = request.getRequestDispatcher("el/01_2_elEnd.jsp");
      view.forward(request, response);
      
   }

}

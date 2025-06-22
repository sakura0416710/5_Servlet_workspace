<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
   String[] nameArr={"신형만","봉미선","신짱구","신짱아"};
   request.setAttribute("family",nameArr);

   //향상된 for문 => foreach(액션태그)
   for(String f : nameArr){
      System.out.println(f);
   }
%>
   <!-- foreach로 반복문 돌리기
      객체 : 변수 -->
   <c:forEach items="${ family }" var = "f">
      ${f}
   </c:forEach>
   









</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <%
      Date now = new Date();
      String today = String.format("%tY년 %tm월 %td일 %tA", now, now, now, now);
   
   %>
   <%= today %>
   <!-- include 방식 : 하나를 만들어두고 여러 곳에서 끌어다 쓰기 (써야할 곳이 많은 경우) -->
</body>
</html>
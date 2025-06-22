<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   Error.page Not Found.
   <%= exception %> <%-- isErrorPage : exception사용 유무일 뿐 다른 역할은 없다. --%>
   <%= exception.getMessage()%> <br/>
   <%= exception.getClass().getName() %> <br/>
   
   
   <hr/>
   <h2>
      에러가 발생한 날짜는
      <span style="color:yellowgreen">
         <%@ include file="../today.jsp" %>
      </span>입니다.
   </h2>
   
   <%
   //String today="JSP수업";
   %>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
</body>
</html>
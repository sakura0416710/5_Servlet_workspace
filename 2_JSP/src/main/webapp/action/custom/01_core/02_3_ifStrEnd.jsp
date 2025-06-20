<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
 
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${ param.str1 == param.str2}">
		두 문자열은 같습니다.
	</c:if>
	<c:if test="${ param.str1 ne param.str2}">
		두 문자열은 같지 않음.
	</c:if>
	
	
	
	
	
</body>
</html>
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
<!-- integer.ParseInt안쓰면 문자열로 인지함; 컴터 진짜 개멍천한거아님?;;;; -->
	<c:if test="${Integer.parseInt(param.num1) > Integer.ParseInt(param.num2) }">
		${param.num1 }큽니다, ${param.num2 }보다
	</c:if>
	<c:if test="${Integer.parseInt(param.num1) < Integer.ParseInt(param.num2) }">
		${param.num2 }큽니다, ${param.num1 }보다
	</c:if>
	
	
	
	
	
</body>
</html>
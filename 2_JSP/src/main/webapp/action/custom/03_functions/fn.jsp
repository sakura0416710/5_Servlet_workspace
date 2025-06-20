<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 문자열에 대한 기능을 가지고 있음 -->
	<c:set var="str" value="How are you?"/>
	<h1>${str}</h1>
	
	${fn:toUpperCase(str) }<br/>
	${fn:toLowerCase(str) }<br/>
	${fn:indexOf(str,'are') }<br/> <!-- 4 -->
	${fn:replace(str,'are',"were") }<br/> <!-- ''나 ""나 노상관임 -->
	<!-- replace:원본에 영향X -->
	${fn:length(Str) }<br/>
	
	
	
	
	
	
	
	
	
</body>
</html>
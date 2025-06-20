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
	<h2>c:set태그</h2> <!-- 변수를 선언해주는 태그, scope도 지정가능하나 생략될 경우 page로 지정된다(현재 페이지에서만 쓸 수 있단 뜻). -->
	<p>https://mvnrepository.com/ <br/>
		core : 반복문 변수 조건 로직 등
		format : 형식에 관련됨(숫자, 날짜 등)
		functions : 문자열에 대한 기능(length, toUpperCase..)
	</p>
	
	<c:set var="no1" value="${ param.num1 }"/>
	<c:set var="no2" value="${ param.num2 }"></c:set>
	<c:set var="result" value="${ no1 * no2 }"/>	<!-- 여기선scope="page" -->
	<p>${no1 }곱하기 ${no2 } 값은 ${result }입니다. </p>
	
	<hr/>
	<h2>c:remove태그</h2>
	<p>지정한 변수를 모든 scope에서 검색해 삭제하거나 지정한 scope에서만 삭제</p>
	<c:set var="result" value="9999" scope="request"/>
	삭제 전 result : ${result } <br/> 	<!--(num1:10, num2 : 3) 30-->
	삭제 전 requestScope.reuslt : ${requestScope.result } <br/> <!--9999 -->
	
	<br/>
	
	<c:remove var="result"/>
	삭제 후 result : ${result } <br/> <!--페이지부터appli까지 reuslt들어간 건 다 지우므로 공백임-->
	<c:remove var="result" Scope="request"/>
	삭제 후 requestScope.result : ${requestScope.result }<br/> <!-- 30 -->
	
	
	<c:remove var="result" Scope="page"/>
	삭제 후 result : ${result } <br/> <!-- 9999 -->
	삭제 후 requestScope.result : ${requestScope.result }<br/> <!-- 9999 -->
	
	
	
</body>
</html>
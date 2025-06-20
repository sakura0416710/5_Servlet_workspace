<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.io.File"
	errorPage="error/errorPage.jsp"




%>
<%@ page import="java.sql.Connection"  %>
<%--
	page지시어 : JSP페이지를 처리하는데 필요한 각종 속성을 기술하는 부분
		<필수>
		language :사용할 스크립트 언어
		content Type : 웹 브라우저가 받아볼 페이지 인코딩 방식
		pageEncoding : JSP파일에 쓰이는 소스코드 자체 인코딩 방식
		<선택>
		import : 자바에서의 import
		errorPage : 현재 페이지에서 오류가 났을 때 어떤 페이지를 호출할건지 지정
		isErrorPage : 오류 처리 파일로 사용할 때 이용, true일 땐 exception 객체 사용가능
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--html 주석 : 개발자 도구에서 보임-->
	<%--JSP 주석 : 개발자 도구에서 안 보임--%>
	
	<%
		int total=0;
		for(int i = 1; i <= 10; i++) {
	%>
		<h3>h3태그 10번 반복입니다. (html요소)</h3>
	<%	

		total += i;
		}

		ArrayList<String>list = new ArrayList<String>();
		File f = null;
		Connection conn = null;
		list.add(null);
		list.get(0).charAt(0);
		
		
		
		
	%>
	expression출력 : 1부터 10까지의 합은<%=total %>입니다. <br/>
	scriptlet출력 : 1부터 10까지의 합은 <%out.println(total); %> <%--이건 자바코드이므로 ; 필수임 --%>
	

	
	
	
	
	
	
	
	
</body>
</html>
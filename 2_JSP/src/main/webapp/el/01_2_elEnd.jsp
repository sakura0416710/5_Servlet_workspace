<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="person.model.vo.Person"%>
<%
	Person p = (Person)request.getAttribute("person");
	String beverage = (String)request.getAttribute("beverage");
	int year = (int)request.getAttribute("year");
	String[] products = (String[])request.getAttribute("products");
	
	//session과 application으로 보냈는데 request로 받아서 출력하면 null뜸.
	//String book = (String)request.getAttribute("book");
	//String movie = (String)request.getAttribute("movie");
	
	String book = (String)session.getAttribute("book");
	String movie = (String)application.getAttribute("movie");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- ELServlet에서 보낸 정보를 받아오기 : setAttribute()로 보냈으니 getAttribute()로 받아주면 됨. 
	오브젝트 클래스에서 받은거(상위 클래스)쓰려고 하는거니까 형변환 (다운그레이드)해주기 -->
	
	<h2>scriptlet을 통해 request객체에 저장된 데이터 출력하기</h2>
	<h4>개인정보(<%= year %>)</h4>
	이름 : <%= p.getName() %> <br/>
	성별 : <%= p.getGender() %><br/>
	나이 : <%= p.getAge() %>
	
	<h4>취향정보</h4>
	가장 좋아하는 음료 : <%= beverage %> <br/>
	가장 좋아하는 물건 : <%= products[0] %>, <%= products[1] %>, <%= products[2] %><br/>
	가장 좋아하는 도서 : <%= book %>		<br/>
	가장 좋아하는 영화 : <%= movie %>	<br/>

	<hr/>
	
	EL : getAttribute, <%= %>로 받아오기 안 해도됨.......
	<h2> el의 내장객체 XXXScope를 통해 저장된 데이터 출력하기 </h2>
	<h4>개인정보(${ requestScope.year })</h4>
	이름 :${ requestScope.person.name } <br/>
	성별 :${ requestScope.person.gender }<br/>
	나이 :${ requestScope.person.age }
	
	<h4>취향정보</h4>
	가장 좋아하는 음료 : ${ requestScope.beverage }<br/>
	가장 좋아하는 물건 : ${ requestScope.products[0]},${requestScope.products[1]},${requestScope.products[2]}<br/>
	가장 좋아하는 도서 : ${ sessionScope.book }	   <br/>
	가장 좋아하는 영화 : ${ applicationScope.movie }  

	<hr/>
	
	<h2> scope는 생략 가능하다 </h2>
	<p>
		el 내장 객체 pageScope, requestScope, sessionScope, applicationScope는 생략가능<br/>
		el은 scope가 생략되면 pageScope ->requestScope->sessionScope->applicationScope순으로 찾음 <br/>
		여러 스코프에 동일한 속성을 기록하고 이름충돌이 발생하면 명시적으로 스코프를 지정해야 한다.
	</p>
	<h4>개인정보(${ year })</h4>
	이름 :${ person.name } <br/>
	성별 :${ person.gender }<br/>
	나이 :${ person.age }
	
	<h4>취향정보</h4>
	가장 좋아하는 음료 : ${ beverage }<br/>
	가장 좋아하는 물건 : ${ products[0]},${products[1]},${products[2]}<br/>
	가장 좋아하는 도서 : ${ book }<br/>
	가장 좋아하는 영화 : ${ movie } 
	
	<hr/>
	<hr/>
	<h1>parameter로 넘기기 : getParameter()와 같다고 생각하자(여러개 입력 시 제일 첫번째꺼만 받으므로 다수는 Values붙여주기)</h1>	
	<h2>주문 내역</h2>
	상품 명 :${ param.name } <br/>
	수량 :${param.count }	<br/>
	옵션1  : ${paramValues.option[0] }<br/>
	옵션2 ${paramValues.option[1] }:










</body>
</html>
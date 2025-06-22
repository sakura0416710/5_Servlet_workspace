<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <fmt:formatNumber value="123456789"/> <br/> <!-- 123,456,789 -->
   <fmt:formatNumber value="123456789" groupingUsed="false"/> <br/> <!-- 123456789 -->
   <fmt:formatNumber value="1.234567"></fmt:formatNumber> <!-- 1.235(소수점셋째자리까지 나오고 반올림돼서 나옴) -->
   <fmt:formatNumber value="1.234567" pattern="#.##"/><br/> <!-- 둘째자리까지 나옴 -->
   <fmt:formatNumber value="1.2" pattern="#.##"/><br/><!--1.2 -->
   <fmt:formatNumber value="1.2" pattern="#.00"/><br/> <!--1.20(빈공간에 0을 넣겠다)-->
   <fmt:formatNumber value="123456789" type="currency"/><br/> <!---->
   <fmt:formatNumber value="0.12" type="currency"  currencySymbol="$"/><br/> <!--12$?-->







</body>
</html>
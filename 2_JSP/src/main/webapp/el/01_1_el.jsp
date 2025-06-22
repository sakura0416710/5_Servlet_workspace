<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- request.getContextPath():context root의 이름을 가져옴 --%>
   <form action="<%= request.getContextPath() %>/myEL.do" method="post">
      <h2>개인정보 입력</h2>
      이름 : <input type="text" name="name" id="name"> <br/>
      성별 : <input type="radio" name="gender" value="남"/>남자
           <input type="radio" nama="gender" value="여"/>여자
      나이 : <input type="number" nama="age"/>
      <hr/>
      
      <h2>당신이 가장 좋아하는 ____는? </h2>
      당신이 가장 좋아하는 음료는? <input type="text" name="baverage"/> <br/>
      당신이 가장 좋아하는 물건1은? <input type="text" name="product"/> <br/>
      당신이 가장 좋아하는 물건2은? <input type="text" name="product"/> <br/>
      당신이 가장 좋아하는 물건3은? <input type="text" name="product"/> <br/>
      당신이 가장 좋아하는 책은? <input type="text" name="book"/> <br/>
      당신이 가장 좋아하는 영화는? <input type="text" name="movie"/> <br/>
      
      <br/>
      
      <input type="submit" value="전송"/>
   
   </form>
   
   
   
   
   
   
   
   
   
   
   
   
   
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="person.model.vo.Person, java.util.ArrayList "%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <%
      String str1 = "안녕";
      String str2 = new String("안녕");
      
      int big=10;
      int small=3;
      Person p1 = new Person("강건강",'남',20);
      Person p2 = new Person("강건강",'남',20);
      
      ArrayList<String> list1 = new ArrayList<String>();
      list1.add(str1);
      ArrayList<String> list2 = new ArrayList<String>();
      ArrayList<String> list3 = null;
      
      pageContext.setAttribute("str1",str1);
      pageContext.setAttribute("str2",str2);
      pageContext.setAttribute("big",big);
      pageContext.setAttribute("small",small);
      pageContext.setAttribute("p1",p1);
      pageContext.setAttribute("p2",p2);
      pageContext.setAttribute("list1",list1);
      pageContext.setAttribute("list2",list2);
      pageContext.setAttribute("list3", list3);
   %>
   ${10*7 }<br/>
   ${25%3 } = ${25 mod 3 } <br/>
   
   <br/>
   <%= str1 == str2 %> <br/> <!-- false -->
   ${str ==str2 } = ${str1 eq str2}= ${str.equals(str2) } <br/> <!-- true -->
   ${str != str2}= ${str1 ne str2 }= ${!str1.equals(str2)}
   
   <br/>
   
   ${big>small } = ${big gt small }<br/>
   ${big < small } = ${ big lt small } <br/>
   
   <br/>
   <%=p1 == p2 %> <br/><!-- false -->
   ${p1 == p2 } <!-- false(무조건 같다고 ==이 다 true가 나오진 않는다. -->
   
   <br/>
   <h3>list3의 내용물 확인</h3>
   <h3>empty 객체 : 내용물이 없는 것 + 객체가 null인지 확인해줌</h3>
   ${list1 == null} / ${empty list1 } <!-- false -->
   ${list2 == null }   <!-- false (객체만 만들어진 상태) -->
   ${empty list2 }    <!-- true  내용물은 없음-->
   ${list3 == null } / ${empty list3 }
   
   <br/>
   <h3> && 연산자 </h3>
   ${true && true } = ${true and true}<br/>
   ${!false } = ${not false } <br/>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
</body>
</html>
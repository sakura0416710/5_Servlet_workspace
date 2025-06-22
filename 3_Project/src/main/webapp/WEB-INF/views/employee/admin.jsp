<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자계정으로 로그인한 경우</title>
<style>
	html, body{width: 99%; height: 98%;}
	#container{width: 99%; height: 75%; display: flex;}
 	#adminDiv{height: 100%; width: 15%; background: #111; display: inline-block;}
	.adminMenu{
		width: 95%; height: 60px; background: #888; text-align: center; margin: auto; 
		line-height: 60px; font-size: 20px; color: #eee;
	}
	.adminMenu:hover{font-weight: bold; cursor: pointer;}
	
	.menuContent{margin-left: 10px; width: 85%; height: 100%; display:none;}
	
	#enrollDiv{margin: auto; padding: 130px;}
	#enrollDiv td{text-align: right;} 
	.enrollInput{height: 30px; width: 200px;}
	.enrollInput.select{width: 208px;}
	#enrollButton{border: 1px solid black; width: 300px; padding: 15px; border-radius: 15px; background: white;}
	#enrollButton:hover{background: black; color: white; cursor: pointer;}

	#adminDiv+div{height: 92%; width: 80%; padding: 30px; overflow: scroll;}
	#adminDiv+div>table{width: 100%; text-align: center;}
	th{border-bottom: 1px solid black;}
	#adminDiv+div>table td{height: 35px;}
</style>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	<jsp:include page="../common/loginbar.jsp"/>

	<hr>
	
	<div id="container">
		<div id="adminDiv">
			<h2 style="margin-left: 5px;">
				<a href="${ contextPath }" style="color: white;">
					JSP&amp;Servlet<br>
					JDBC Project
				</a>
			</h2>
			<div class="adminMenu">사원 전체 보기</div>
			<br>
			<div class="adminMenu">사원 등록 하기</div>
		</div>
		
		<div class="menuContent">
			<table id="empList">
				<tr>
					<th width="6%">사번</th>
					<th width="10%">이름</th>
					<th width="10%">직업</th>
					<th width="10%">매니저</th>
					<th width="10%">입사일</th>
					<th width="10%">급여</th>
					<th width="10%">커미션</th>
					<th width="10%">부서</th>
					<th width="12%">관리자</th>
					<th width="12%">활동여부</th>
				</tr>
			
			<!--사원이 없는데 찾는 경우 대비 -->
				<c:if test="${empty empList}">
					<tr>
						<td colspan="10">조회된 리스트가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty empList }">
					<c:forEach items="${empList }" var="e"> 
					<!-- e에 employee객체가 들어가있을것임.따라서 Employee에 잇는기본 
					getter의 생성자를가져옴컬럼이나 result Set이름이 아니라  -->
					<tr>
					<td>${e.empNo}</td>
					<td>${e.name }</td>
					<td>${e.job}</td>
					<td>${empty e.mgr? '-' : e.mgr }</td>
					<td>${e.hireDate }</td>
					<td>${e.sal}</td>
					<td>${e.comm}</td>
					<td>${e.dept }</td>
					<td>${e.isAdmin}</td>
					<td>${e.status}</td>
					</tr>
					
					</c:forEach>
				</c:if>
			</table>
			
		
		</div>
		<!-- 부서를 필수선택하도록 하기 (안고르면 알럿) --> 
		<div class="menuContent">
			<form action="${ contextPath }/insertEmp.me" method="post" id="enrollForm" name="enrollFrm">
				<div align="center" id="enrollDiv">
					<table>
						<tr>
							<td><label for="id">사원번호</label></td>
							<td><input type="text" name="id" id="id" class="enrollInput" required autofocus></td>
						</tr>
						<tr>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td><label for="name">이름</label></td>
							<td><input type="text" name="name" id="name" class="enrollInput" size="25" required></td>
						</tr>
						<tr>
							<td><label for="job">직업</label></td>
							<td><input type="text" name="job" id="job" class="enrollInput" size="25" required></td>
						</tr>
						<tr>
							<td><label for="mgr">매니저</label></td>
							<td>
								<select name="mgr" class="enrollInput select">
									<option>---------------------------------------</option>
									<!-- 매니저에 대한 선택부분 : forEach로 자동추가되도록 함(아님 넘 길어지니까):아까 썻던 empList를 가져옴 -->
									<c:forEach items="${empList }" var="e">
										<option value="${e.empNo}">${e.name }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td><label for="sal">급여</label></td>
							<td><input type="number" name="sal" class="enrollInput" id="sal" size="25" value="0"></td>
						</tr>
						<tr>
							<td><label for="comm">커미션</label></td>
							<td><input type="number" name="comm" class="enrollInput" id="comm" size="25" value="0"></td>
						</tr>
						<tr>
							<td><label for="dept">부서</label></td>
							<td>
								<select name="dept" class="enrollInput select">
									<option>---------------------------------------</option>
									<!-- DB에 사원등록을 하기 위해-dept랑 Join했을 때 deptNo, dept로 이어줬기 때문  -->
									<option value="10">ACCOUNTING</option>
									<option value="20">RESEARCH</option>
									<option value="30">SALES</option>
									<option value="40">OPERATIONS</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><label for="isAdmin">관리자 여부</label></td>
							<td>
								<input type="checkbox" name='isAdmin' id="isAdmin" value="Y">
							</td>
						</tr>
					</table>
					<br>
					<button id="enrollButton">사원등록</button>
				</div>
			</form>			
		
		
		</div>
	</div>
	<script>
	window.onload =()=>{
		const adminMenus = document.getElementsByClassName('adminMenu');
		const menuContents = document.getElementsByClassName('menuContent');
		adminMenus[0].addEventListener('click',()=>{
			menuContents[0].style.display='block';
			menuContents[1].style.display='none';
		});
		adminMenus[1].addEventListener('click',() => {
			menuContents[0].style.display='none';
			menuContents[1].style.display='block';
		});
		//부서 선택 안하고 등록 누르면 필수라는 알럿창을 띄우기 위해서 js로 이동, button과 dept에 접근
		document.getElementById('enrollButton').onclick =(e)=>{
			const dept = document.getElementsByName('dept')[0] //elements는 다 찾아서 배열로 반환을 함
			if(dept.value.indexOf('-')== 0){    //선택을 안 할 경우에 0. 있으면 1 반환함
				alert('부서는 필수 선택항목입니다.'); //form태그 안의 버튼=전송을 눌렀음에도 알럿창만 뜨고 데이터 안 넘어가게 하기(onSubmit=false, onClick=false)말고
				e.preventDefault(); //이벤트 객체 안의 데이터 전송을 막는 이벤트 실행하기.
			
			}
		}
		//afterEnroll=Y가져오기 <-파라미터에 저장된 것이므로 param. 으로 찾아주기
		const afterEnroll = "${param.afterEnroll}"; // =Y에 에러 뜸. Y라는 변수를 나타낸 거나 다름없기때문이다. (우리가 원하는 건 'Y')
		if(afterEnroll == 'Y'){
			menuContents[0].style.display='block'; //이러면 사원추가등록했을 때 사원전체가 보이게 됨
			menuContents[1].style.display='none'; 
		}
		
		
		
		
		
		
		
		
		
		
	}
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>
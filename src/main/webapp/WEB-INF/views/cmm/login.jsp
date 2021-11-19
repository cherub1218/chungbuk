<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
<title>Home</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<br />
 <script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="member/logout";
		})
		$("#registerBtn").on("click", function(){
			location.href="member/Agreement";
		})
		$("#memberDeleteBtn").on("click", function(){
			location.href="member/memberDeleteView";
		})
		
		
		$("#memberUpdateBtn").on("click", function(){
			location.href="member/memberUpdateView";
		})
		
	})
</script>
<style>
body {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
		
		margin :0 35%;
}

.login-text {
	margin: 90px 0px 50px 0px;
	text-align: center;
	font-size: 35px;
	font-weight: 5px;
	
}

.loginForm {
	display: flex;
	flex-direction: column;
	margin: 0px 30px;
}

.loginForm input {
	border: none;
	padding: 10px 0px;
	font-size: 18px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.2);
	transition: border-color 0.3s ease-in-out;
	margin-bottom: 25px;

	
}
#login{
	color : #ffffff;
	background-color: #dd4132;
}
	
.loginForm input::placeholder {
	color: rgba(0, 0, 0, 0.4);
}

.loginForm input:focus {
	border-color: #11b20d;
}

.loginform-checkbox{
	text-align : right;
}

.register{
	text-align : center; 
}
.register input{
	 width : 49%;
	 background-color: #dd4132;
	 color : #ffffff;
}
</style>

<body>
	<div class="login-text">LOGIN</div>
		
	<form name='loginForm' method="post" action="/member/login">
		<c:if test="${member == null}">
			 <div class="loginForm">
				<input type="text"  placeholder="아이디" id="userId" name="userId" maxlength="20">
				<input type="password" placeholder="비밀번호" id="userPass" name="userPass" maxlength="20">
				 <div class="loginform-checkbox">
				 	
			 </div>
			 	<input id="login" type="submit" value="로그인">	 
			
		</c:if>
		<%-- <c:if test="${member != null }">
			<div>
				<p>${member.userId}님 환영 합니다.</p>
				<button id="memberUpdateBtn" type="button">회원정보수정</button>
				<button id="logoutBtn" type="button">로그아웃</button>
				<button id="memberDeleteBtn" type="button">회원탈퇴</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if> --%>
	</form>
	
	<div class ="register">
			<a id="registerBtn"href ="#" type="submit" value="회원가입">회원가입 &nbsp&nbsp&nbsp</a>
			 <!-- | 
			<a href ="#" type="button" value="ID/PW 찾기">&nbsp&nbsp&nbsp ID/PW 찾기</a> -->
	</div>

</body> 
</html>
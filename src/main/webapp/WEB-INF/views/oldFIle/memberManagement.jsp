<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>

<style>

.body {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
		
		margin :0 32%;
}
.memberUpdate-Btn {
	border: 0px;
	background-color: #dd4132;
	color: #ffffff;
	width: 100px;
	height: 5%;
}
.memberUpdate {
	display: flex;
	flex-direction: column;
	margin: 0px 30px;
}
.memberUpdate input {
	border: none;
	padding: 10px 0px;
	font-size: 18px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.2);
	transition: border-color 0.3s ease-in-out;
	margin-bottom: 25px;	
}
.memberUpdate-text {
	margin: 90px 0px 50px 0px;
	text-align: center;
	font-size: 35px;
	font-weight: 5px;	
}

</style>

</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				$.ajax({
					url : "/member/passChk",
					type : "POST",
					dateType : "json",
					data : $("#updateForm").serializeArray(),
					success: function(data){
						
						if(data==true){
							if(confirm("회원수정하시겠습니까?")){
								$("#updateForm").submit();
							}
							
						}else{
							alert("패스워드가 틀렸습니다.");
							return;
							
						}
					}
				})
			});
		})
	</script>
	<body>
	
	<div style="float: right;">
		<%@include file="nav.jsp"%>
	</div>
  <div class="body">
	<div class="memberUpdate-text">회원정보 수정</div>
		<section id="container">
			<form id="updateForm" action="/member/memberUpdate" method="post">
	
			<div class="memberUpdate">
				<input class="text" type="text" id="userName" name="userName" readonly="readonly" placeholder="로그인을 해주세요." value="${member.userName}"/>
				<input type="password" placeholder="비밀번호" id="userPass" name="userPass" maxlength="20">
			</div>
			</form>
				<div class="form-group has-feedback" style="text-align: center;">
					<button class="memberUpdate-Btn" type="button" id="submit">회원정보수정</button>
					<button class="memberUpdate-Btn" type="button">취소</button>
				</div>
		</section>
		</div>
	</body>
	
</html>
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
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				location.href = "/";
			})
			
			$("#submit").on("click", function(){
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
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
				var idChkVal = $("#idChk").val();
				var registerForm = $("#regForm");
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
				}else{
					
					return true;
				}
	
			});
			$("input:radio[name=user_auth]").click(function(){
				
		        if($("input:radio[name=user_auth]:checked").val() == "1"){
		        	 alert("1")
		           	$('#businessMemberDiv').css('display','none')
		            // radio 버튼의 value 값이 1이라면 활성화
		 
		        }else if($("input:radio[name=user_auth]:checked").val() == "0"){
		        	 alert("2")
		            $('#businessMemberDiv').css('display','block')
		            // radio 버튼의 value 값이 0이라면 비활성화
		        }
		    });

		})
		
		function fn_idChk(){
			$.ajax({
				url : "/cmm/idChk",
				type : "post",
				dataType : "json",
				data : {"user_id" : $("#user_id").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
	</script>
	<style>
	body {
		font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
			margin :0 35%;
	}
	.registerText{
		margin: 90px 0px 50px 0px;
		text-align: center;
		font-size: 3.235rem;
		font-weight: 5px;

	}
	form input{
		border: none;
		padding: 10px 0px;
		font-size: 18px;
		border-bottom: 1px solid rgba(0, 0, 0, 0.2);
		transition: border-color 0.3s ease-in-out;
		margin-bottom: 25px;			
		width :75%;
		height: 5%;
	}
	form button{
		border : 0px;
		background-color: #dd4132;
		color : #ffffff;
		width : 20%;
		height: 5%;
		margin-left: 10px;
	}
	
	.register-Btn{
		border : 0px;
		background-color: #dd4132;
		color : #ffffff;
		width : 100%;
		height: 8%;
		
	}
	.user_auth{
		width : 20%;
		height: 20px;
	}
	
	
</style>
	<body>
	<div class ="registerText">회원가입</div>
			<form action="/cmm/postregister" method="POST" id="regForm" name="regForm" >
				<div>
					<label class="control-label" for="user_auth">회원가입 유형</label><br>
					<input type="radio" class="user_auth" name="user_auth" value ="1">평가위원
					<input type="radio" class="user_auth" name="user_auth" value ="0">사업자
				</div>
				<div>
					<label class="control-label" for="user_id">아이디</label><br>
					<input type="text" id="user_id" name="user_id" />
					<button id="idChk" onclick="fn_idChk(); return false;" value="중복확인">중복확인</button>
				</div>
				<div>
					<label class="control-label" for="user_pwd">비밀번호</label><br>
					<input type="password" id="user_pwd" name="user_pwd" />
				</div>
				<div>
					<label class="control-label" for="user_name">이름(담당자)</label><br>
					<input type="text" id="user_name" name="user_name" />
				</div>
				<div id="businessMemberDiv" style="display: none">
					<div>
						<label class="control-label" for="user_name">회사명</label><br>
						<input type="text" id="" name="user_Bname" />
					</div>
					<div>
						<label class="control-label" for="user_name">사업자등록번호</label><br>
						<input type="text" id="" name="user_crcode" />
					</div>
				</div>
				<div>
					<label class="control-label" for="hp_num">휴대폰 번호</label><br>
					<input type="text" id="hp_num" name="hp_num" placeholder="전화번호 입력" />
				</div>
				<div>
					<label class="control-label" for="user_email">이메일 주소</label><br>
					<input type="text" id="user_email" name="user_email" placeholder="이메일 주소 입력" />
				</div>		
				<div>
					<button class="register-Btn" type="submit" id="submit">회원가입</button>
				</div>
			</form>
			
			
				
				
	</body>
	
</html>
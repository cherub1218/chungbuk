<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,user-scalable=no,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" name="Viewport" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/sub.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/board.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/jquery-ui.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/sub.js"></script>

    <title>충북대 산학협력단 평가관리프로그램</title>
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
	if($("input:radio[name=user_auth]:checked").attr("id") == "type2"){
		if($("#userBName").val()==""){
			alert("회사명을 입력해주세요.");
			$("#userName").focus();
			return false;
		}
		if($("#userCRcode").val()==""){
			alert("사업자등록번호를 입력해주세요.");
			$("#userName").focus();
			return false;
		}
	}
		
		
		var idChkVal = $(".id_checkbtn").val();
		var registerForm = $("#regForm");
		
		if(idChkVal == "N" || !idChkVal){
			alert("중복확인 버튼을 눌러주세요.");
			return false;
		}else{
			
			return true;
		}

		var crcodeChkVal = $(".crcode_checkbtn").val();
		var registerForm = $("#regForm");
		
		if(crcodeChkVal == "N" || !crcodeChkVal){
			alert("중복확인 버튼을 눌러주세요.");
			return false;
		}else{
			
			return true;
		}
		
	});
	
	
	$("input:radio[name=user_auth]").click(function(){
		
        if($("input:radio[name=user_auth]:checked").attr("id") == "type1"){
           	$('#businessMemberDiv').css('display','none')
            // radio 버튼의 value 값이 1이라면 활성화
            $("#userId").on("keyup",function(){
				$(this).val($(this).val().replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, ''))
           	});
        
        }else if($("input:radio[name=user_auth]:checked").attr("id") == "type2"){
        	
            $('#businessMemberDiv').css('display','block')
            // radio 버튼의 value 값이 0이라면 비활성화
        }
    });

})

function fn_idChk(){
	if($("#userId").val() == "")
		alert("아이디를 입력해주세요");
	else {
		$.ajax({
			url : "/cmm/idChk",
			type : "post",
			dataType : "json",
			data : {"user_id" : $("#userId").val()},
			success : function(data){
				if(data == 1){
					alert("중복된 아이디입니다.");
					$("#userId").val("")
					$(".id_checkbtn").attr("value", "N");
				}else if(data == 0){
					$(".id_checkbtn").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	
}
}

function fn_crcodeChk(){
	if($("#userCrcode").val() == "")
		alert("사업자등록번호를 입력해주세요");
	else {
	$.ajax({
		url : "/cmm/crcodeChk",
		type : "post",
		dataType : "json",
		data : {"user_crcode" : $("#userCrcode").val()},
		success : function(data){
			if(data == 1){
				alert("중복된 사업자등록번호입니다.");
				$("#userCrcode").val("")
				$(".crcode_checkbtn").attr("value", "N");
			}else if(data == 0){
				$(".crcode_checkbtn").attr("value", "Y");
				alert("사용가능한 사업자등록번호입니다.");
			}
		}
	})

}
}
</script>
<body>
    <div class="wrap">
        <dl id="skip_nav">
            <dt>메뉴 건너띄기</dt>
            <dd>
                <a href="#contents">본문 바로가기</a>
                <a href="#gnb">대메뉴 바로가기</a>
            </dd>
        </dl>
        <header>
            <%@include file="../cmm/topmenu.jsp"%>
        </header>
        <div class="content">
            <span id="contents"></span>
            <div class="row content_outer">
                <section class="location sect1">
                    <ul class="insideArea row">
                        <li>사용자</li>
                        <li>회원가입</li>
                    </ul>
                </section>
                <section class="sect2">
                    <div  class="insideArea row">
                        <div class="lnb">
                            <p class="tit">사용자</p>
                            <ul>
                                <li>
                                    <a href="#">회원가입</a>
                                </li>
                            </ul>
                        </div>
                        <div class="cont">
                            <h2>회원가입</h2>
                            <div class="inner">
                                <div class="join_wrap "> 
                                    <p>회원가입유형</p>

                                    <form action="/cmm/postregister" method="POST" id="regForm" name="regForm" >
                                        <label class="radio_container ap" for="type1">
                                            <input type="radio" name="user_auth" id="type1" value="1"><span class="checkmark radio" title="클릭 평가위원 선택"></span>
                                            평가위원
                                        </label>
                                        <label class="radio_container ap" for="type2">
                                            <input type="radio" name="user_auth" id="type2" value="0"><span class="checkmark radio" title="클릭 사업자 선택"></span>
                                            사업자
                                        </label>
                                    <p class="mt15">아이디</p>
                                    <input type="text" id="userId" name="user_id" title="입력 아이디"> <button class="id_checkbtn" type="button"onclick="fn_idChk() ">중복확인</button>

                                    <p class="mt15">비밀번호</p>
                                    <input type="password" id="userPass" name="user_pwd"  title="입력 비밀번호">

                                    <p class="mt15">이름</p>
                                    <input type="text" id="userName" name="user_name"title="입력 이름">
                                    
                                    <div id="businessMemberDiv" style="display: none">
										<p class="mt15">회사명</p>
											<input type="text" id="userBName" name="user_Bname" />
											
										<p class="mt15">사업자등록번호</p>
											<input type="text" id="userCrcode" name="user_crcode" /> <button class = "crcode_checkbtn" type="button" onclick="fn_crcodeChk()">중복확인</button>
									</div>

                                    <p class="mt15">휴대폰 번호</p>
                                    <input type="text" name ="hp_num"placeholder="전화번호 입력" title="입력 휴대폰 번호">

                                    <p class="mt15">이메일 주소</p>
                                    <input type="text" name="user_email"placeholder="이메일 주소 입력" title="입력 이메일">


                                    <button type="submit" id="submit">회원가입</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        
        <footer></footer>
        <script>
                $(function() {
                    $("#datepicker").datepicker({
                    	
                    });
                });

        </script>
    </div>
</body>
</html>
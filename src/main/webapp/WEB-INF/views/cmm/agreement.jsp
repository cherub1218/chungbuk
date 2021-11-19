<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
		<script>
        $(document).ready(function(){
            
 			$(".red").click(function (){
 				
  				if(checkForm()){
  					location.href="<c:url value="/register"/>";
	            	
 				}else{
	            	return false;
 				}
             });
            
//             $("#group").click(function (){
            	
//             	if(checkForm()){
// 	            	$("#GRP_SE_CD").val("02");
// 	            	$("#postform").submit();
//             	}else{
// 	            	return false;
//             	}
//             });
            
//             $("#family").click(function (){
            	
//             	if(checkForm()){
// 	            	$("#GRP_SE_CD").val("03");
// 	            	$("#postform").submit();
//             	}else{
//             		return false;
//            		}
//         	});
            
        });
        
		function form_submit(grpSeCd){
			
			var f = document.postform;
			
			if(checkForm()){
				$("#GRP_SE_CD").val(grpSeCd);
				f.submit();
			}else{
        		return false;
       		}
		} 		
		
		function checkForm() {
			
			var f = document.postform;
			var error_msg = [];
			
			if ($('input[name="u_agree"]').is(':checked') == false) {
				alert("개인정보 취급방침에 동의해주십시오.");
				$('#u_agree').focus();
				return false;
			}
			
			return true;
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
		                        <li>개인정보 수집동의</li>
		                    </ul>
		                </section>
		                <section class="sect2">
		                    <div  class="insideArea row">
		                        <div class="lnb">
		                            <p class="tit">사용자</p>
		                            <ul>
		                                <li>
		                                    <a href="#">개인정보 수집동의</a>
		                                </li>
		                            </ul>
		                        </div>
		                        <div class="cont">
		                            <h2>개인정보 수집동의</h2>
		                            <div class="inner">
		                                <div class="admit">
		                                    <p>개인정보의 수집, 이용 목적</p>
		                                    평가관리 시스템은 별도의 개인정보 입력 없이도 대부분의 콘텐츠에 자유롭게 접근할 수 있으나, 승선신고 서비스를 이용하고자 할 경우 별도의 정보입력절차를 거쳐야 합니다.
		                                    <p>수집하려는 개인정보의 항목</p>
		                                    평가관리 시스템 서비스 제공을 위해 아래와 같은 최소한의 개인정보를 필수 항목으로 수집하고 있습니다.
		                                    (성명, 생년월일, 성별, 휴대전화번호)
		                                    <p>개인정보의 보유 및 이용 기간</p>
		                                    수집된 개인정보는 3개월(90일)까지 보유하며 그 이후에는 바로 삭제 처리됩니다.
		                                    <p>개인정보 동의 거부에 따른 불이익</p>
		                                    평가관리시스템 이용자는 개인정보 수집 및 이용에 대한 동의를 거부할 권리가 있으나, 동의 거부 시 승선신고 서비스를 이용할 수 없습니다.
		                                </div>

		                                <form class="checkbox" action="/action_page.php">
		                                    <input type="checkbox" id="info" name="u_agree" value="agree">
		                                    <label for="info">개인정보 취급방침에 동의합니다.</label>
		                                </form>

		                                <div class="board_btn_wrap btn2">
		                                    <div class="btn_wrap">
		                                        <button type="button" class="gray" onclick="window.location.href=''">취소</button>
		                                        <button type="button" class="red" onclick="window.location.href=''">확인</button>
		                                    </div>
		                                </div>
		                
		                            </div>  
		                        </div>
		                    </div>
		                </section>
		            </div>
		        </div>
		        <footer></footer>
		    </div>
		</body>
		</html>
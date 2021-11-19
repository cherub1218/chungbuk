<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 		<link rel="stylesheet" href="<c:url value="/resource/css/reset.css"/>">
    <link rel="stylesheet" href="<c:url value="/resource/css/common.css"/>">
    <link rel="stylesheet" href="<c:url value="/resource/css/sub.css"/>">
    <link rel="stylesheet" href="<c:url value="/resource/css/board.css"/>">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="insideArea">
                <h1 class="logo">
                	<c:choose>
                		<c:when test ="${member.user_auth == null}">
                   			<a href="<c:url value="/"/>"><img src="<c:url value="/resource/image/logo.jpg"/>" alt="충북대학교"></a>
                    	</c:when>
                    	<c:when test ="${member.user_auth != null}">
                    		<a href="<c:url value="/bam/businessAnnouncementList"/>"><img src="<c:url value="/resource/image/logo.jpg"/>" alt="충북대학교"></a>
                    	</c:when>
                    	</c:choose>
                    <span>산학협력단 평가관리프로그램</span>
                </h1>
                <c:if test="${member != null}">
				<div class="gnb clearfix">
					<ul>
						<li class="">
							<a href="<c:url value="/bam/businessAnnouncementList"/>">사업공고</a>
							<div class="sub_menu">
								<a href="<c:url value="/bam/businessAnnouncementList"/>">사업공고조회</a>
								<a href="javascript:void(0)">2번 메뉴</a>
							</div>
						</li>
						<c:if test="${member.user_auth == 0}">
				 		<li class="">
							<a href="<c:url value="/bpm/businessPlanApplyMyList"/>">사업계획서</a>
							<div class="sub_menu">
								<a href="javascript:void(0)">사업공고일정</a>
								<a href="javascript:void(0)">사업공지</a>
							</div>
						</li>
						</c:if>
						<c:if test="${member.user_auth != 0}">
						<li class="">
							<a href="<c:url value="/bem/businessEvaluationMyList"/>">사업평가</a>
							<div class="sub_menu">
								<a href="javascript:void(0)">사업공고일정</a>
								<a href="javascript:void(0)">사업공지</a>
							</div>
						</li>
						</c:if>
					</ul> 
					</c:if>
				</div>
			<div class="log row">
				<c:if test="${member != null}">
			 		<p>[<span>${member.user_id}</span>]님, 안녕하세요!</p>
               		<p><img src="" alt=""></p>
               		<a href="<c:url value="/cmm/memberDetailView"/>?member_idx=${member.member_idx}">마이페이지</a>
                	
                	<a href="<c:url value="/cmm/logout"/>">로그아웃</a>
                	<c:if test="${member.user_auth == 2}">
                	<a href="<c:url value="/cmm/admin"/>">회원관리</a>
                	</c:if>
				</c:if>		
				<c:if test="${member == null}">
			 		<a href="<c:url value="/"/>">로그인</a>
				</c:if>
			</div>
</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,user-scalable=no,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" name="Viewport" />
    <link rel="stylesheet" href="<c:url value="/resource/css/reset.css"/>">
    <link rel="stylesheet" href="<c:url value="/resource/css/common.css"/>">
    <link rel="stylesheet" href="<c:url value="/resource/css/sub.css"/>">

	<script type="text/javascript" src="<c:url value="/resource/js/jquery-1.12.4.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resource/js/jquery-ui.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resource/js/sub.js"/>"></script>
    <title>충북대 산학협력단 평가관리프로그램</title>
</head>
 <script type="text/javascript">
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
          	<%@include file="cmm/topmenu.jsp"%>
        </header>
        <c:if test="${member == null}">
        <div class="content">
            <span id="contents"></span>
            <div class="row content_outer">
                 <section class="location sect1">
                    <ul class="insideArea row">
                    <li>사용자</li>
                    <li>로그인</li>
                </ul>
                </section>
                <section class="sect2">
                    <div  class="insideArea row">
                		<div class="lnb">
                    	<p class="tit">사용자</p>
                    <ul>
                        <li>
                            <a href="">로그인</a>
                        </li>
                    </ul>
                </div>
                <div class="cont">
                    <h2>로그인</h2>
                    
                    <div class="inner box">
                        <form class="login" action="<c:url value="/cmm/login"/>" method="post">
                            <div class="row"> 
                                <img src="<c:url value="/resource/image/icon_person.jpg"/>" alt="">
                                <input type="text" name="user_id" placeholder="아이디를 입력해 주세요" title="입력 아이디">
                            </div>
                            <div class="row"> 
                                <img src="<c:url value="/resource/image/icon_locker.jpg"/>" alt="">
                                <input type="password" name="user_pwd" placeholder="비밀번호를 입력해 주세요" title="입력 비밀번호">
                            </div>
                            
                            <button id="login" type="submit" class="btn">로그인</button>
                            <c:if test="${msg == false}">
								<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
							</c:if>
                        </form>
                        <div class="find_link">
                            <ul class="row">
                                <li><a href="<c:url value="/cmm/agreement"/>">회원가입</a></li>
                                <li><a href="#">아이디,비밀번호 찾기(평가위원)</a></li>
                                <li><a href="#">아이디/비밀번호 찾기(사업자)</a></li>
                            </ul>
                        </div>
                      
                    </div>
                    <div class="box_login">
                        <div class="method">
                            <p>회원가입 방법</p>
                            <ul class="lists bar">
                                <li>사업자 : 회원가입 링크 클릭 후 회원가입 유형에서 기업/사업자를 체크하신 후 가입 (사업자 등록증 필요)</li>
                                <li>평가위원: 회원가입 링크 클릭 후 회원가입 유형에서 평가위원을 체크하신 후 가입(추후 관리자 승인필요)</li>
                            </ul>
                        </div>
                    </div>    
                </div>
            </div>
        </div>
        </section>
        </div>
        </c:if>
        <footer></footer>
    </div>
</body>
</html>
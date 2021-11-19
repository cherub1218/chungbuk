<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
				
				location.href = "/bam/businessAnnouncementList";
						    
			})
		
			$("#submit").on("click", function(){
				$("#updateForm").submit();
		})
		})
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
                    <c:choose>
                    	<c:when test="${member.user_auth == 1}">
                    		<li>평가위원</li>
                    	</c:when>
                    	<c:when test="${member.user_auth == 2}">
                    		<li>관리자</li>
                    	</c:when>
                    	<c:when test="${member.user_auth == 0}">
                    		<li>사용자</li>
                    	</c:when>
                    	<c:when test="${member.user_auth == null}">
                    		<li>비로그인</li>
                    	</c:when>
                    </c:choose>         
                        <li>사업평가리스트</li>
                    </ul>
                </section>
                <section class="sect2">
                    <div  class="insideArea row">
        <div class="lnb">
        	<c:choose>
                   	<c:when test="${member.user_auth == 1}">
                   		<p class="tit">평가위원</p>
                   	</c:when>
                   	<c:when test="${member.user_auth == 2}">
                   		<p class="tit">관리자</p>
                   	</c:when>
                   	<c:when test="${member.user_auth == 0}">
                   		<p class="tit">사용자</p>
                   	</c:when>
                   	<c:when test="${member.user_auth == null}">
                   		<p class="tit">비로그인</p>
                   	</c:when>
            </c:choose>
                    <ul>
                        <li class="on">
                            <a href="/bam/businessAnnouncementList">회원관리</a>
                            <ul class="second_menu">
                                <li class=""><a href="/cmm/admin">· 회원정보 조회</a></li>
                               <c:if test="${member.user_auth == 2}">
                                <li class="on"><a href="#">· 회원정보 수정</a></li>
                               </c:if>
                            </ul>
                      
                    </ul>
                </div>
                <div class="cont">
                    <h2>회원정보 수정</h2>
                    	<div class="inner box mt15">
                                	회원정보 수정 페이지 입니다.
                        </div>
                        <div class="inner">
                        <div class="board-wrap">
                        <form id="updateForm" name="updateForm" method="post" action="/cmm/memberUpdate">
                        <input type="hidden" name = "member_idx" value="${memberDetail.member_idx}">
                            <table class="board-basic type-row">
                                <caption>사업안내 | 사업공고 | 사업공지에  사업명, 작성자, 내용, 공고기간, 첨부파일을 나타낸  테이블</caption>
                                <colgroup>
                                    <col style="width:20%">
                                    <col style="width:auto">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><span></span>아이디</th>
                                        <td>
                                            <input type="text" name="user_id" id="writer" class="" value="${memberDetail.user_id}" readonly="readonly"> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><span></span>패스워드</th>
                                        <td>
                                            <input type="password" name="user_pwd" id="user_pwd" class="" value="" placeholder="비밀번호를 입력해 주세요">
                                        </td>
                                    </tr>
                                     <tr>
                                        <th scope="row"><span></span>성명</th>
                                        <td>
                              				<input type="text" name="user_name" id="user_name" class="" value="${memberDetail.user_name}" placeholder="성명을 입력해주세요">
                                        </td>
                                    </tr>
                                    <c:if test="${memberDetail.user_auth == 0 }">
	                                     <tr>
	                                        <th scope="row"><span></span>회사 명</th>
	                                        <td>
	                              				<input type="text" name="user_bname" id="user_bname" class="" value="${memberDetail.user_bname}" placeholder="회사 명을 입력해주세요">
	                                        </td>
	                                    </tr>
                                    </c:if>
                                    <tr>
                                        <th scope="row"><span></span>이메일</th>
                                        <td>
											<input type="text" name="user_email" id="user_email" class="" value="${memberDetail.user_email}" placeholder="이메일을 입력해주세요">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">휴대폰번호</th>
                                        <td>
                                        	<input type="text" name="hp_num" id="hp_num" class="" value="${memberDetail.hp_num}" placeholder="${member.user_name}">
                                        </td>
                                    </tr>
                                    <c:if test="${memberDetail.user_auth == 0 }">
                                    <tr>
                                        <th scope="row">사업자 등록번호</th>
                                        <td>
                                       		<input type="text" name="user_crcode" id="user_crcode" class="" value="${memberDetail.user_crcode}" placeholder="${member.user_crcode}">
                                        </td>
                                    </tr>
                                    </c:if>
                                </tbody>
                            </table>
                            </form>
                        </div> 
                        <br>
							<div class="btn_wrap text-left">
									<button type="button" class="normal" onclick="location.href='/cmm/memberDetailView?member_idx=${memberDetail.member_idx}'">취소</button>
								</div>
                                <div class="btn_wrap text-right">
                                	<c:if test ="${member.user_auth != 2}">
                               		<button type="button" class="normal" onclick="alert('관리자에게 문의하세요.')" retrun false;>회원탈퇴</button>
                               		</c:if>
									<button type="submit" id="submit" class="normal">수정</button>
								</div>
									
												</div>
											</div>
										</div>
									</section>
								</div>
							</div>
						</div>
					</body>
	
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                        <li class="">
                            <a href="<c:url value="/bam/businessAnnouncementList"/>">사업공고</a>
                            <ul class="second_menu">
                                <li class=""><a href="<c:url value="/bam/businessAnnouncementList"/>">· 사업공고</a></li>
                               <c:if test="${member.user_auth == 2}">
                                <li class=""><a href="<c:url value="/bam/businessFormEditList"/>">· 공고별 양식등록</a></li>
                               </c:if>
                            </ul>
                       <c:if test="${member.user_auth == 0}">
	                        <li class="">
	                            <a href="<c:url value="/bpm/businessPlanApplyMyList"/>">사업 계획서</a>
	                            <ul class="second_menu">
	                                <li class=""><a href="<c:url value="/bpm/businessPlanApplyMyList"/>">· 접수내역 조회</a></li>
	                            </ul>
	                        </li>
                        </c:if>
                       <c:if test="${member.user_auth != 0}">
                        <li class="on">
                            <a href="<c:url value="/bpm/businessEvaluationMyList"/>">사업 평가</a>
                            <ul class="second_menu">
                                <li class="on"><a href="<c:url value="/bem/businessEvaluationMyList"/>">· 평가내역 조회</a></li>
                            </ul>
                            </li>
                      </c:if>
                    </ul>
                </div>
                        <div class="cont">
                            <h2>사업평가리스트</h2>
                            <div class="inner box search_box">
                                <form method="get" action="?">
                                    <div class="board_search row">
                                        <div class="search_box">
                                            <div class="search2">
                                                <div class="s_select">
                                                    <label for="srSearchKey">검색분류</label>
                    
                                                    <select for="" name="srSearchKey" id="srSearchKey" title="분류값 제목, 내용, 연구책임자 선택">
                                                        <option value="">전체</option>
                                                        <option value="article_title">제목</option>
                                                        <option value="article_text">내용</option>
                                                    </select>
                    
                                                </div>
                                                <div class="s_search">
                                                    <input type="text" class="form-control" title="검색어 입력" id="search_val" name="srSearchVal" value="" placeholder="검색어를 입력해 주세요" aria-label="" aria-describedby="basic-addon1">
                                                    <input type="submit" title="검색" value="" class="btn_finder_s search_btn" onclick="javascript: document.search_form.submit();">
                                                </div>
                    
                                            </div>
                                        </div>
                                    </div>
                                    <!-- //board_search -->
                                </form>
                            </div>
                            <div class="inner box mt15">
                                사업평가리스트 게시판입니다.
                            </div>

                            <div class="inner">
                                <div class="total">총 12570건</div>
                                <div class="board-wrap respon notscroll manage">			
                                <input type="hidden" name="bam_anc_idx" value ="${param.bam_anc_idx}">
                                    <table summary="사업안내 | 사업공고 | 사업공지" class="board-basic horizon notice list dataroom notscroll ">
                                            
                                            <caption>사업안내 | 사업공고 | 사업공지에 순번, 사업명, 작성자, 등록일을 나타낸  테이블</caption>				
                                            <colgroup>
                                                <col style="width:10%">
                                                <col style="width:10%">
                                                <col style="width:15%">
                                                <col style="width:30%">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th scope="col">평가 작성자</th>
                                                    <th scope="col">총점</th>
                                                    <th scope="col">작성일자</th>
                                                    <th scope="col">평가상태</th>
                                                </tr>
                                            </thead>
                                            <tbody>
								
								 <c:forEach items="${businessEvaluationList}" var = "businessEvaluationList">
										<tr>
									
											<td style="text-align: center">
												<a href="<c:url value="/bem/businessEvaluationDetail"/>?bem_beval_idx=${businessEvaluationList.bem_beval_idx}&bpm_bplan_idx=${businessEvaluationList.bpm_bplan_idx}&bam_anc_idx=${businessEvaluationList.businessPlanVO.bam_anc_idx}"><c:out value="${businessEvaluationList.eval_writer}" /></a>
											</td>
											<td style="text-align: center">${businessEvaluationList.eval_totalscore}</td>
											<td style="text-align: center"><fmt:formatDate value="${businessEvaluationList.reg_date}" pattern="yyyy-MM-dd"/></td>
											<td style="text-align: center">점수등록 완료</td>
										</tr>
								</c:forEach> 
                                            </tbody>
                                    </table>
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
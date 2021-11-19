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

function fn_fileDownload(fileidx){
	var formObj = $("form[name='download']");
	$("#FILE_IDX").attr("value", fileidx);
	formObj.attr("action", "<c:url value="/bam/fileDown"/>");
	formObj.submit();
}

function Fn_boardDel(Sbam_anc_idx){

	var delConfirm = confirm("정말로 삭제하시겠습니까?")
	var param = {
		"Sbam_anc_idx" : Sbam_anc_idx
	}
	
	 if(delConfirm){
		
		$.ajax({
				type: "POST",
				url : '<c:url value="/bam/businessAnnouncementDelete"/>',
				dataType :"text",
				data: param,
				success : function(data) {
					alert("삭제되었습니다.");
					window.location.href='<c:url value="/bam/businessAnnouncementList"/>'
		        },
		       	error : function(error){
		       		alert(error);
				}
			});
	 }else 
		alert("취소 되었습니다.")
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
                   		<p class="tit">평가위원장</p>
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
                            <a href="<c:url value="/bam/businessAnnouncementList"/>">사업공고</a>
                            <ul class="second_menu">
                                <li class="on"><a href="<c:url value="/bam/businessAnnouncementList"/>">· 사업공고</a></li>
                               <c:if test="${member.user_auth == 2}">
                                <li class=""><a href="<c:url value="/bam/businessFormEditList"/>">· 공고별 양식등록</a></li>
                               </c:if>
                            </ul>
                       <c:if test="${member.user_auth == 0}">
	                        <li class=" ">
	                            <a href="<c:url value="/bpm/businessPlanApplyMyList"/>">사업 계획서</a>
	                            <ul class="second_menu">
	                                <li class=""><a href="<c:url value="/bpm/businessPlanApplyMyList"/>">· 접수내역 조회</a></li>
	                            </ul>
	                        </li>
                        </c:if>
                       <c:if test="${member.user_auth != 0}">
                        <li class=" ">
                            <a href="<c:url value="/bpm/businessEvaluationMyList"/>">사업 평가</a>
                            <ul class="second_menu">
                                <li class=""><a href="<c:url value="/bem/businessEvaluationMyList"/>">· 평가내역 조회</a></li>
                            </ul>
                            </li>
                      </c:if>
                    </ul>
                </div>
                <div class="cont">
                    <div class="inner">
                        <div class="board-wrap respon notscroll manage mt_0 view">			
                            <div class="m-board" id="printDiv">
                                <div class="view">
                                    <div class="view-head">
                                        <div class="title">
                                            <div class="txt">${read.anc_title}</div>
                                        </div>
                                        <div class="infos">
                                            <div class="info"><span class="title">담당자</span> <span class="content">${read.writer}</span></div>
                                            <div class="info"><span class="title">등록일</span> <span class="content">${read.reg_date}</span></div>
                                            <div class="info">
                                                <span class="title">조회수</span> <span class="content">0</span>
                                            </div>
                                        </div>	
                                        <div class="attach">
                                            <div class="title">첨부파일</div>
                                            <div class="contents">
                                                <form name="download" method="post" action="<c:url value="/bam/fileDown"/>">
                                                    <input type="hidden" name="FILE_IDX" id="FILE_IDX" value="">
                                                    <input type="hidden" name="no" value="">
                                                    <input type="hidden" name="sno" value="">
                                                
						                           <c:forEach var="file" items="${file}">
						                           <span class="file">
														<a href="#" onclick="fn_fileDownload('${file.FILE_IDX}');">${file.FILE_FNAME}</a>(${file.FILE_SIZE}kb)<br>
												   </span>
												   </c:forEach>
												   </form>
                                                </div>
                                        </div>
                                        <button type="button" class="print" id="printBtn">게시물 프린트</button>
                                    </div>
                    
                                    <div class="view-body" style="margin-bottom: 10px;"><p>${read.anc_remark}</p>
                    				<p>&nbsp;</p>
                    				</div>
                                </div>
                    			<c:if test="${member.user_auth == 2}">
	                    			<div class="btn_wrap text-left">
										<button type="button" class="normal" onclick="window.location.href='<c:url value="/bam/businessAnnouncementUpdate"/>?bam_anc_idx=${read.bam_anc_idx}'">수정</button>
										<button type="button" class="normal" onclick="Fn_boardDel(${read.bam_anc_idx})">삭제</button>
									</div>
								</c:if>
	                                <div class="btn_wrap text-right">
										<button type="button" class="normal" onclick="window.location.href='<c:url value="/bam/businessAnnouncementList"/>'" return false;>목록</button>
									</div>

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
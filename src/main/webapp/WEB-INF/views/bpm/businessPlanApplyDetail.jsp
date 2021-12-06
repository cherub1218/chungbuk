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
    <title>충북대 산학협력단 평가관리프로그램</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/sub.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/board.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/jquery-ui.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/sub.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function(){
	$('#evalBtn').click(function(){
		var bam_anc_idx = ${param.bam_anc_idx}
		var bpm_bplan_idx = ${read.bpm_bplan_idx}
		var param = {"bam_anc_idx" : bam_anc_idx ,
					 "bpm_bplan_idx" : bpm_bplan_idx 
					}	
		
		
		$.ajax({
		    type: "post",
		    url: "/bpm/evalCheck", 
		    data: param,
		    datatype : "json",
		    success: function(e){
		    
		    	if(e == "Success")
		    		location.href='<c:url value="/bem/businessEvaluation"/>?bpm_bplan_idx=${read.bpm_bplan_idx}&bam_anc_idx=${param.bam_anc_idx}';
		    	else if(e == "overLab")
		    		alert("해당위원은 이미 평가를 완료하였습니다.")
		    	else
		    		alert("해당공고의 평가위원이 아닙니다.")
		    },
		    err: function(err){
		      console.log("err:", err)
		    }
		    
		  })
	
		
	})
	
})
function fn_fileDownload(fileidx){
	var formObj = $("form[name='download']");
	$("#FILE_IDX").attr("value", fileidx);
	formObj.attr("action", "<c:url value="/bpm/fileDown"/>");
	formObj.submit();
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
	                        <li class="on">
	                            <a href="<c:url value="/bpm/businessPlanApplyMyList"/>">사업 계획서</a>
	                            <ul class="second_menu">
	                                <li class="on"><a href="<c:url value="/bpm/businessPlanApplyMyList"/>">· 접수내역 조회</a></li>
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
                    <h2>사업계획서 상세</h2>
					<ul class="tab d-flex">
						<li data-tab="tab1" class="on"><a href="javascript:void(0)">${form.BPLAN_FORM_TITLE1}</a></li>
						<li data-tab="tab2" class=""><a href="javascript:void(0)">${form.BPLAN_FORM_TITLE2}</a></li>
						<li data-tab="tab3" class=""><a href="javascript:void(0)">${form.BPLAN_FORM_TITLE3}</a></li>
						<li data-tab="tab4" ><a href="javascript:void(0)">${form.BPLAN_FORM_TITLE4}</a></li>
					</ul>
					<div class="p_15">
						<div class="tabcontent current" id="tab1">
							<h2>${form.BPLAN_FORM_TITLE1}</h2>
							<textarea name="" id="" cols="30" rows="10" readonly="readonly">${read.title_remark1}</textarea>
						</div><!--//#tab1-->
						<div class="tabcontent" id="tab2">
							<h2>${form.BPLAN_FORM_TITLE2}</h2>
						<textarea name="" id="" cols="30" rows="10" readonly="readonly">${read.title_remark2}</textarea>
						</div><!--//#tab1-->
						<div class="tabcontent" id="tab3">
							<h2>${form.BPLAN_FORM_TITLE3}</h2>
						<textarea name="" id="" cols="30" rows="10" readonly="readonly">${read.title_remark3}</textarea>
						</div><!--//#tab1-->
						<div class="tabcontent" id="tab4">
							<h2>${form.BPLAN_FORM_TITLE4}</h2>
						<div class="tablebox">
							<!-- <textarea name="title_remark4" id="" cols="30" rows="10"> -->
							 <table class="thead_gray">
                                    <colgroup>
                                        <col style="width:2%">
                                        <col style="width:3%">
                                        <col style="width:5%">
                                        <col style="width:5%">
                                        <col style="width:7%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th class="boldtext" scope="col">비목</th>
                                            <th class="boldtext" colspan="3"scope="col">세목</th>	
                                            <th class="boldtext" scope="col">금액 (단위 : 천원)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<tr>
                                    		<th class="boldtext" rowspan="18">직접비</th>
                                    		<th class="boldtext" rowspan="6">인건비</th>
                                    		<th class="boldtext" rowspan="3">내부인건비</th>
                                    		<th class="boldtext">미지급</th>
                                    		<th class="value">${cost.bplan_cost_value1} </th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext">현금</th>
                                    		<th class="value">${cost.bplan_cost_value2}</th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext">현물</th>
                                    		<th class="value">${cost.bplan_cost_value3}</th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext" rowspan="3">외부인건비</th>
                                    		<th class="boldtext">미지급</th>
                                    		<th class="value">${cost.bplan_cost_value4}</th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext">현금</th>
                                    		<th class="value">${cost.bplan_cost_value5}</th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext">현물</th>
                                    		<th class="value">${cost.bplan_cost_value6}</th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext" colspan="3">학생인건비</th>
                                    		<th class="value">${cost.bplan_cost_value7}</th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext" colspan="3"_>인건비 소계</th>
                                    		<th class="value">${cost.bplan_cost_value8}</th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext" colspan="2">연구시설</th>
                                    		<th class="boldtext">현금_일반</th>
                                    		<th class="value">${cost.bplan_cost_value9}</th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext" rowspan="2" colspan="2">장비비</th>
                                    		<th class="boldtext">현금통합관리</th>
                                    		<th class="value">${cost.bplan_cost_value10}</th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext">현물</th>
                                    		<th class="value">${cost.bplan_cost_value11}</th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext" rowspan="2" colspan="2" >연구활동비</th>
                                    		<th class="boldtext">현금</th>
                                    		<th class="value">${cost.bplan_cost_value12}</th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext">현물</th>
                                    		<th class="value">${cost.bplan_cost_value13}</th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext" rowspan="2" colspan="2" >연구재료비</th>
                                    		<th class="boldtext">현금</th>
                                    		<th class="value">${cost.bplan_cost_value14}</th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext">현물</th>
                                    		<th class="value">${cost.bplan_cost_value15}</th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext" colspan="3">연구수당</th>
                                    		<th class="value">${cost.bplan_cost_value16}</th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext" colspan="3">위탁연구개발비</th>
                                    		<th class="value">${cost.bplan_cost_value17}</th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext" colspan="3">직접비 소계</th>
                                    		<th class="value">${cost.bplan_cost_value18}</th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext" colspan="4">간접비</th>
                                    		<th class="value">${cost.bplan_cost_value19}</th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext" colspan="4">연구개발비 총액</th>
                                    		<th class="value">${cost.bplan_cost_value20}</th>
                                    	</tr>
                                   	</tbody>
                                 </table>
                              </div>
                                    
						</div><!--//#tab4-->
						<div class="filelist form-group file_hwp mb-0">
							 <form name="download" method="post" action="/bpm/fileDown">
							 <input type="hidden" name ="FILE_IDX" id="FILE_IDX">
								<p>파일 목록</p>
								<ul>
									<c:forEach var="file" items="${file}">
										<span>첨부파일 : </span><a href="#" onclick="fn_fileDownload('${file.FILE_IDX}');">${file.FILE_FNAME}</a>(${file.FILE_SIZE}kb)<br>	
									</c:forEach>
								</ul>
								</form>
							</div>
							<div class="btn_wrap text-right">
								<c:if test="${member.user_auth != 0}">
									<button type="button" class="normal" onclick="location.href='<c:url value="/bem/businessEvaluationList"/>?bpm_bplan_idx=${read.bpm_bplan_idx}&bam_anc_idx=${param.bam_anc_idx}'">평가리스트</button>
								</c:if>
								<c:if test="${member.user_auth == 2}">
									<button type="button" class="normal" onclick="location.href='<c:url value="/bem/businessEvaluationOpinion"/>?bpm_bplan_idx=${read.bpm_bplan_idx}&bam_anc_idx=${param.bam_anc_idx}'">종합의견</button>
								</c:if>
								<c:if test="${member.user_auth == 1}">
									<button type="button" class="normal" id="evalBtn" onclick="location.href='../bem/businessEvaluation?bpm_bplan_idx=${read.bpm_bplan_idx}&bam_anc_idx=${param.bam_anc_idx}'">평가하기</button>
									<!-- onclick="location.href='../bem/businessEvaluation?bpm_bplan_idx=${read.bpm_bplan_idx}&bam_anc_idx=${param.bam_anc_idx}'" -->
							 	</c:if>
								 <c:if test="${member.user_auth == 0}">
								 	<c:if test="${read.status == 0 || read.status == 1}">
										<button type="button" class="normal" onclick="location.href='<c:url value="/bpm/businessPlanApplyUpdate"/>?bpm_bplan_idx=${read.bpm_bplan_idx}&bam_anc_idx=${param.bam_anc_idx}'">수정</button>
									 </c:if>
								 </c:if>
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

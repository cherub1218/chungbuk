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
<script>
$(document).ready(function(){
	
	fn_addFile();
	
	var laborCost = 0;
	var directCost = 0;
	var indirectCost = 0;
	 $('.laborCost').on('keyup',function(){
			 var Sum = 0;
        $('.laborCost').each(function(idx,value){ 
            if(!isNaN(this.value)&&this.value.length!=0){
                	Sum+=Number($(value).val());
                    	$('.laborCostSum').val(Sum);
        				$('.directCostSum').val(Sum);
        				if($('.RDCostSum').val() == 0 ){
        			
        					$('.RDCostSum').val(Sum);
        					}
        				else{
        					$('.RDCostSum').val(Number(directCost) + Number(indirectCost))
        					}
        					
        				
        				laborCost = $('.laborCostSum').val();
        				
        		}	
        });
	 });
	 
	 $('.directCost').on('keyup',function(){
		 var Sum = 0;
    $('.directCost').each(function(idx,value){ 
        if(!isNaN(this.value)&&this.value.length!=0){
            	Sum+=Number($(value).val());
                	$('.directCostSum').val(Sum+Number(laborCost));
                	$('.RDCostSum').val(Number(directCost) + Number(indirectCost));
                	directCost = $('.directCostSum').val();
    		}	
   		});
	 });
	 
    $('.indirectCostSum').on('keyup',function(){
    	 var Sum = 0;
    	 $('.indirectCostSum').each(function(idx,value){
    	if(!isNaN(this.value)&&this.value.length!=0){
    		Sum += Number($(value).val());
        	$('.indirectCostSum').val(Sum);
        	indirectCost = $('.indirectCostSum').val();
        	$('.RDCostSum').val(Number(directCost) + Number(indirectCost));
        	
    	}
    })
  }); 
        
	  $('#write_btn').click(function(){
	  	 
		   var form = $("form")[0];        
	       var formData = new FormData(form);
		 
		  $.ajax({
				type: "POST",
				url : '<c:url value="/bpm/businessPlanApplyUpdate"/>',
				dataType :"text",
				data: formData,
				processData: false,
	            contentType: false,
				success : function(data) {
					window.location.replace('<c:url value="/bpm/businessPlanApplyMyList"/>')	
				},
				error : function(request, status, error){
					alert("공백이 들어있습니다. 비용이 없으실 경우 0을 입력해주세요.")
				}
			});
	

	 })
})	
function fn_addFile(){
	var fileIndex = 1;
	//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
	$("#fileAdd_btn").on("click", function(){
		$("#fileIndex").append("<div id='fileAddDiv'><input type='file' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
	});
	$(document).on("click","#fileDelBtn", function(){
		$(this).parent().remove();
		
	});
	
}

	
	function fn_del(value, name){
		var fileNoArry = new Array();
		var fileNameArry = new Array();
		
		fileNoArry.push(value);
		fileNameArry.push(name);
		$("#fileNoDel").attr("value", fileNoArry);
		$("#fileNameDel").attr("value", fileNameArry);
		
		var form = $("form")[0];        
		var formData = new FormData(form);
		
		$.ajax({
			type: "POST",
			url : '<c:url value="/bpm/businessPlanApplyUpdate"/>',
			dataType :"text",
			data: formData,
			processData: false,
            contentType: false,
			success : function(data) {
				var div = document.getElementById(value);
				div.remove();
			},
			error : function(request, status, error){
				alert("파일삭제 실패.");
			}
		});
	}
	
	


</script>
<body>
 <c:if test ="${member.user_auth == 0}">
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
                    <h2>사업계획서 수정</h2>
                    <input type="hidden" value="${member.user_name}">
					<ul class="tab d-flex">
						<li data-tab="tab1" class="on"><a href="javascript:void(0)">${form.BPLAN_FORM_TITLE1}</a></li>
						<li data-tab="tab2" class=""><a href="javascript:void(0)">${form.BPLAN_FORM_TITLE2}</a></li>
						<li data-tab="tab3" class=""><a href="javascript:void(0)">${form.BPLAN_FORM_TITLE3}</a></li>
						<li data-tab="tab4" ><a href="javascript:void(0)">${form.BPLAN_FORM_TITLE4}</a></li>
					</ul>
					<form action="<c:url value="/bpm/businessPlanApplyUpdate"/>" method="post" enctype="multipart/form-data">
					<input type="hidden" name="bam_anc_idx" value="${param.bam_anc_idx}">
					<input type="hidden" name="bpm_bplan_idx" value="${read.bpm_bplan_idx}">
					<div class="p_15">
						<div class="tabcontent current" id="tab1">
							<h2 id="title1">${form.BPLAN_FORM_TITLE1}</h2>
							<textarea name="title_remark1" id="" cols="30" rows="10">${read.title_remark1}</textarea>
						</div><!--//#tab1-->
						<div class="tabcontent" id="tab2">
							<h2 id="title2" >${form.BPLAN_FORM_TITLE2}</h2>
							<textarea name="title_remark2" id="" cols="30" rows="10">${read.title_remark2}</textarea>
						</div><!--//#tab1-->
						<div class="tabcontent" id="tab3">
							<h2 id="title3">${form.BPLAN_FORM_TITLE3}</h2>
							<textarea name="title_remark3" id="" cols="30" rows="10">${read.title_remark3}</textarea>					 
						</div><!--//#tab1-->
						<div class="tabcontent" id="tab4">
							<h2 id="title4" >${form.BPLAN_FORM_TITLE4}</h2>
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
                                    		<th ><input type="number" class="laborCost" name="bplan_cost_value1" value="${cost.bplan_cost_value1}"></th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext">현금</th>
                                    		<th ><input type="number" class="laborCost" name="bplan_cost_value2" value="${cost.bplan_cost_value2}"></th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext">현물</th>
                                    		<th ><input type="number" class="laborCost" name="bplan_cost_value3" value="${cost.bplan_cost_value3}"></th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext" rowspan="3">외부인건비</th>
                                    		<th class="boldtext">미지급</th>
                                    		<th ><input type="number" class="laborCost" name="bplan_cost_value4" value="${cost.bplan_cost_value4}"></th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext">현금</th>
                                    		<th ><input type="number" class="laborCost" name="bplan_cost_value5" value="${cost.bplan_cost_value5}"></th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext">현물</th>
                                    		<th ><input type="number" class="laborCost" name="bplan_cost_value6" value="${cost.bplan_cost_value6}"></th>
                                    	<tr>
                                    		<th class="boldtext"  colspan="3"_>학생인건비</th>
                                    		<th ><input type="number" class="laborCost" name="bplan_cost_value7" value="${cost.bplan_cost_value7}"></th>
                                    	</tr>
                                    	<tr>
                                    		
                                    		<th class="boldtext"  colspan="3"_>인건비 소계</th>
                                    		<th ><input type="number" class="laborCostSum" name="bplan_cost_value8" value="${cost.bplan_cost_value8}" readonly="readonly"></th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext" colspan="2">연구시설</th>
                                    		<th class="boldtext">현금_일반</th>
                                    		<th ><input type="number" class="directCost" name="bplan_cost_value9" value="${cost.bplan_cost_value8}"></th>
                                    	</tr>
                                    	<tr>
                                    	
                                    		<th class="boldtext" rowspan="2" colspan="2" style="vertical-align: middle;">장비비</th>
                                    		<th class="boldtext">현금통합관리</th>
                                    		<th ><input type="number" class="directCost" name="bplan_cost_value10" value="${cost.bplan_cost_value10}"></th>
                                    	</tr>
                                    	<tr>
                                    	
                                    		<th class="boldtext">현물</th>
                                    		<th ><input type="number" class="directCost" name="bplan_cost_value11" value="${cost.bplan_cost_value11}"></th>
                                    	</tr>
                                    	<tr>
                                    		
                                    		<th class="boldtext" rowspan="2" colspan="2" style="vertical-align: middle;">연구활동비</th>
                                    		<th class="boldtext">현금</th>
                                    		<th ><input type="number" class="directCost" name="bplan_cost_value12" value="${cost.bplan_cost_value12}"></th>
                                    	</tr>
                                    	<tr>
                                    	
                                    		<th class="boldtext">현물</th>
                                    		<th ><input type="number" class="directCost" name="bplan_cost_value13" value="${cost.bplan_cost_value13}"></th>
                                    	</tr>
                                    	<tr>
                                    		
                                    		<th class="boldtext" rowspan="2" colspan="2" style="vertical-align: middle;">연구재료비</th>
                                    		<th class="boldtext">현금</th>
                                    		<th ><input type="number" class="directCost" name="bplan_cost_value14" value="${cost.bplan_cost_value14}"></th>
                                    	</tr>
                                    	<tr>
                                    		
                                    		<th class="boldtext">현물</th>
                                    		<th ><input type="number" class="directCost" name="bplan_cost_value15" value="${cost.bplan_cost_value15}"></th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext" colspan="3">연구수당</th>
                                    		<th ><input type="number" class="directCost" name="bplan_cost_value16" value="${cost.bplan_cost_value16}"></th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext" colspan="3">위탁연구개발비</th>
                                    		<th ><input type="number" class="directCost" name="bplan_cost_value17" value="${cost.bplan_cost_value17}"></th>
                                    	</tr>
                                    	<tr>
                                    	
                                    		<th class="boldtext" colspan="3">직접비 소계(A)</th>
                                    		<th ><input type="number" class="directCostSum"name="bplan_cost_value18" value="${cost.bplan_cost_value18}" readonly="readonly"></th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext" colspan="4">간접비 소계(B)</th>
                                    		<th ><input type="number" class="indirectCostSum"name="bplan_cost_value19" value="${cost.bplan_cost_value19}"></th>
                                    	</tr>
                                    	<tr>
                                    		<th class="boldtext" colspan="4">연구개발비 총액 (A + B)</th>
                                    		<th ><input type="number" class="RDCostSum" name="bplan_cost_value20" value="${cost.bplan_cost_value20}" readonly="readonly"></th>
                                    	</tr>
                                    
                                    </tbody>
                                  
                                </table>
								</div> <!-- table box -->
							
						</div><!--//#tab1-->
						
						<div class="btn_wrap">
							<div id="fileIndex">	
								<input type="file" id="input-file" style="display: none" />	
								<button class="addFile" id="fileAdd_btn"  type="button">파일추가</button>
							<div class="filelist form-group file_hwp mb-0">
								<p>파일 목록</p>
								<ul>
									<c:forEach var="file" items="${file}" varStatus="var">
										<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_IDX}">
										<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
										<div id="${file.FILE_IDX}"><span>첨부파일 : </span>${file.FILE_FNAME}(${file.FILE_SIZE}kb)
										<!-- <button type='button'style="margin-left: 80%" id='fileDelBtn'>삭제</button></div>  -->
										<button id="fileDel" onclick="fn_del('${file.FILE_IDX}','FILE_NO_${var.index}');" type="button">삭제</button><br>
										</div>
									</c:forEach>
								</ul>
							</div>
						</div>
						</div>
			 			 <div class="btn_wrap text-right">
								<button id="write_btn" type="button" class="normal">저장</button>
							 </div>	
						<input type="hidden" name="writer" value="${member.user_name}">
						<input type="hidden" name="writer_id" value="${member.user_id}">
						<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
						<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
						</form>
					</div>
					
                </div>
            </div>
        </div>
        </section>
        </div>
        <footer></footer>
    </div>
	</c:if>
	<c:if test="${member.user_auth != 0}">
		<p>사업자 전용 페이지 입니다. </p>
	</c:if>
</body>
</html>

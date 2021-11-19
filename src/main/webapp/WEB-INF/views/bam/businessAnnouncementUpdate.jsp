<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	%>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>

    <title>충북대 산학협력단 평가관리프로그램</title>
</head>
<script type="text/javascript">
$(document).ready(function(){

	$('#submit_Btn').click(function(){
		
		if($('#anc_title').val() == ""){
			alert("제목을 입력해 주세요")
			return 0;
		}else if($('#anc_remark').val() == ""){
			alert("내용을 입력해주세요")
			return 0;
		} else if($('#datepicker').val() == ""){
			alert("공고시작일을 선택해주세요")
			return 0;
		}else if($('#datepicker2').val() == ""){
			alert("공고종료일 선택해주세요")
			return 0;
		}else
			$('#updateForm').submit();
	})
	var memberInfo = new Array();
	fn_addFile();
	$('input[type=checkbox]').click(function(){
		
		var rowData = new Array();
		var memberArr = new Array();
		var arrId = new Array();
		var arrName= new Array();
		var checkbox = $("input[name=checkedUserId]:checked");
		// 체크된 체크박스 값을 가져온다
			
			
			$('#check_Btn').click(function(){
				checkbox.each(function(i) {
					 arrId = new Array();
					 arrName= new Array();
					 memberArr = new Array();
					
					
					// checkbox.parent() : checkbox의 부모는 <td>이다.
					// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
					var tr = checkbox.parent().parent().eq(i);
					var td = tr.children();
					
					// 체크된 row의 모든 값을 배열에 담는다.
					rowData.push(tr.text());
					
					// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
					var user_id = td.eq(2).text()+"";
					var user_name= td.eq(1).text()+"";
					
					// 가져온 값을 배열에 담는다.
				
					memberArr.push(user_id); 
					arrId.push(user_id);
					arrName.push(user_name);
					
				});
			
					
				$.each(memberArr, function(index,item){
					$('#evaluatorList').append("<div class='box'><div class='evalrator'>"+memberArr[index]+'</div>'+"<button class='filedel'type='button' style='float:right;' id='evalDelBtn'>"+"삭제"+"</button></div>");
				});
				
				if(arrId.length > 1){
				$.each(arrId, function(index,item){
					$('#evaluatorList').append("<input type='hidden' name='anc_member_id' value='"+arrId[index]+"'>");
				});
				}else
					$('#evaluatorList').append("<input type='hidden' name='anc_member_id' value='"+arrId[0]+"'>");
				
				if(arrId.length > 1){
				$.each(arrName, function(index,item){
					$('#evaluatorList').append("<input type='hidden'name='anc_member_name' value='"+arrName[index]+"'>") ;
				});
				}else
					$('#evaluatorList').append("<input type='hidden' name='anc_member_name' value='"+arrName[0]+"'>") ;
				close_pop();
			})
			
	})
	 //<div id='del_idx"+index+"'>
	/* var formdata = $('#writeForm')[0]; */

});

function open_pop(flag){
	$('#selectEvaluator').show();
};
function close_pop(flag) {
    $('#selectEvaluator').hide();
    
};
	
function fn_addFile(){
	var fileIndex = 1;
	//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
	$("#fileAdd_btn").on("click", function(){
		$("#fileIndex").append("<div id='fileAddDiv'><input class='file' style='padding-bottom:5px' data-show-preview='false' type='file' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button class='filedel'type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
	});
	
	$(document).on("click","#fileDelBtn", function(){
		$(this).parent("").remove();
		
	});
	
	$(document).on("click","#evalDelBtn", function(){
		$(this).parent().remove();
		
	});
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
                        <li class="">
                            <a href="<c:url value="/bpm/businessEvaluationMyList"/>">사업 평가</a>
                            <ul class="second_menu">
                                <li class=""><a href="<c:url value="/bem/businessEvaluationMyList"/>">· 평가내역 조회</a></li>
                            </ul>
                            </li>
                      </c:if>
                    </ul>
                </div>
                <div class="cont">
                    <h2>사업공고</h2>
                    	<div class="inner box mt15">
                                	사업공고 수정페이지 입니다.
                        </div>
                    <div class="inner">
                        <div class="board-wrap">
                         
                        <form id="updateForm" name="updateForm" method="post" action="${pageContext.request.contextPath}/bam/businessAnnouncementUpdateProc?bam_anc_idx=${update.bam_anc_idx}" enctype="multipart/form-data">
                            <table class="board-basic type-row">
                                <caption>사업안내 | 사업공고 | 사업공지에  사업명, 작성자, 내용, 공고기간, 첨부파일을 나타낸  테이블</caption>
                                <colgroup>
                                    <col style="width:20%">
                                    <col style="width:auto">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><span>* </span>사업명</th>
                                        <td>
                                            <input type="text" name="anc_title" id="anc_title" value="${update.anc_title}" placeholder="제목을 입력하세요.">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><span>* </span>작성자</th>
                                        <td>
                                            <input type="text" name="writer" id="writer" class="" value="${update.writer}" placeholder="${update.writer}">
                                        </td>
                                    </tr>
                                     <tr>
                                        <th scope="row"><span>* </span>평가원선택</th>
                                        <td>
                                        	<div class="box">
	                                            <button class="select_Evaluator" type="button" onClick="">평가원선택</button></div>
	                                            <div id="evaluatorList">
	                                          <table style="width:70%; margin-left: auto; margin-right: auto;">
	                                           <tr>
	                                           		<td>ID</td>
	                                           		<td>이름</td>
	                                           </tr> 
	                                           
	                                          <c:forEach items="${evalList}" var="evalList">
		                                       <tr>	
		                                           <td class="evaltd"><input class="evalListData" type="text" value="${evalList.anc_member_id}"></td>
		                                           <td><input class="evalListData" type="text" value="${evalList.anc_member_name}"></td>
	                                           </tr>
	                                           </c:forEach>	  
	                                           </table>
	                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><span>* </span>내용</th>
                                        <td>
                                            <textarea style="height: 300px" name="anc_remark" id="anc_remark">${update.anc_remark}</textarea>
                                            <script>
                                           		CKEDITOR.replace('anc_remark',{
                                           			height : 400
                                           		});
                                           	</script>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">공고기간</th>
                                        <td>
                                        	<fmt:formatDate value="${update.anc_begin_dt}" var="anc_begin_dt" pattern="yyyy-MM-dd" />
                                        	<fmt:formatDate value="${update.anc_end_dt}" var="anc_end_dt" pattern="yyyy-MM-dd" />
                                            <input  name="anc_begin_dt" class="date" type="text" id="datepicker"  title="입력 시작날짜" value="${anc_begin_dt}" readonly="readonly">
                                            <input  name="anc_end_dt" class="date" type="text" id="datepicker2"  title="입력 마감날짜" value="${anc_end_dt}"  readonly="readonly">
                                        <td>
                                    </tr>
                                    <tr>
                                        <th scope="row">첨부파일</th>
                                        <td>
                                        	<div class="btn_wrap">
												<div id="fileIndex">	
														<input type="file" id="input-file" style="display: none" />	
														<button class="addFile" id="fileAdd_btn"  type="button">파일추가</button>
												</div>
											</div>
											 <form name="download" method="post" action="/bam/fileDown">
                                                    <input type="hidden" name="FILE_IDX" id="FILE_IDX" value="">
                                                
						                           <c:forEach var="file" items="${file}">
						                           <span class="file">
														<a href="#" onclick="fn_fileDownload('${file.FILE_IDX}');">${file.FILE_FNAME}</a>(${file.FILE_SIZE}kb)<br>
												   </span>
												   </c:forEach>
												   </form>
                                            <!-- <input type="file" name="bf_file[]" id="bf_file_2" class="file-loadingz" style="padding-bottom:5px" data-show-preview="false" onchange="checkFile(this)"> -->
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            </form>
                        </div> 
                        
                        <div class="board_btn_wrap btn2 right">
                            <div class="btn_wrap">
                            	 <button id="submit_Btn" type="submit" class="red">수정</button>
                            	 <button type="button" class="gray" onclick="window.location.href='<c:url value="/bam/businessAnnouncementList"/>'">목록보기</button>
                            </div>
                        </div>
                    </div>    
                </div>
            </div>
            	</section>
        	</div>
        </div>
         <div id="selectEvaluator" class="modal">
              <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt; margin-bottom: 10px;">평가원 선택</span></b></span></p>
               	<table class="table table-hover">
						<thead>
							<tr>
								<th style="width: 60px; text-align: center;">선택</th>
								<th style="width: 60px; text-align: center;">평가원 성명</th>
								<th style="width: 60px; text-align: center;">아이디</th>
							</tr>
						</thead>
							<tr>
								<td style="text-align: center;"><input type="checkbox" name="checkedUserId"/></td>
								<td style="text-align: center;"id="user_name"><c:out value="선택안함" /></td>
								<td style="text-align: center;"id="user_id"><c:out value="선택안함" /> </td>
							</tr>
						<c:forEach items="${memberList}" var = "memberList">
							<tr>
								<td style="text-align: center;"><input type="checkbox" name="checkedUserId"/></td>
								<td style="text-align: center;"id="user_name"><c:out value="${memberList.user_name}" /></td>
								<td style="text-align: center;"id="user_id"><c:out value="${memberList.user_id}" /> </td>
							</tr>
						</c:forEach>
					</table>
               
             <div>
		            <div style="float:left; color:#000; width: 48%; pointer; background-color:#e6e6e6; text-align: center;padding-bottom: 10px;padding-top: 10px; margin-right: 10px;" onClick="close_pop();">
		                <span class="pop_bt" style="font-size: 13pt;">
		                   	 취소
		                </span>
		            </div>
		            
					<div id="check_Btn" style="float:left; color:#FFFFFF; width: 48%; pointer;background-color:#952940;text-align: center;padding-bottom: 10px;padding-top: 10px;">
		                <span class="pop_bt" style="font-size: 13pt;">
		                   	 확인
		                </span>
		            </div>		            
			</div>
			</div>
			</div>
        <footer></footer>
        <script>
            $(function() {
            	var anc_begin_dt = new Date('${update.anc_begin_dt}');
            	
                $("#datepicker").datepicker({
                	dateFormat: 'yy-mm-dd',
                	prevText: '이전 달',	// 마우스 오버시 이전달 텍스트
                    nextText: '다음 달',	// 마우스 오버시 다음달 텍스트
                    closeText: '닫기', // 닫기 버튼 텍스트 변경
                    currentText: '오늘', // 오늘 텍스트 변경
                    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더중 월 표시를 위한 부분
                    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더 중 월 표시를 위한 부분
                    dayNames: ['일', '월', '화', '수', '목', '금', '토'],	//한글 캘린더 요일 표시 부분
                    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	//한글 요일 표시 부분
                    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	// 한글 요일 표시 부분
                    showMonthAfterYear: true,	// true : 년 월  false : 월 년 순으로 보여줌
                    yearSuffix: '년',	//
                    showButtonPanel: true,	// 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
                });
                
                $("#datepicker2").datepicker({
                	dateFormat: 'yy-mm-dd',
                	prevText: '이전 달',	// 마우스 오버시 이전달 텍스트
                    nextText: '다음 달',	// 마우스 오버시 다음달 텍스트
                    closeText: '닫기', // 닫기 버튼 텍스트 변경
                    currentText: '오늘', // 오늘 텍스트 변경
                    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더중 월 표시를 위한 부분
                    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더 중 월 표시를 위한 부분
                    dayNames: ['일', '월', '화', '수', '목', '금', '토'],	//한글 캘린더 요일 표시 부분
                    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	//한글 요일 표시 부분
                    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	// 한글 요일 표시 부분
                    showMonthAfterYear: true,	// true : 년 월  false : 월 년 순으로 보여줌
                    yearSuffix: '년',	//
                    showButtonPanel: true,	// 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
                });
            });

    </script>
    </div>
</body>
</html>
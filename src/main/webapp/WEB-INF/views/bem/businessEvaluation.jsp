<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Calendar" %>
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
 		 var checkData = "";
 		 var formObj = $("form[name='writeForm']");
 		$(".write_btn").on("click", function(){
 			 $('.score').each(function(idx,value){ 
 				if(!this.value){
 					if(checkData != '')
 						checkData = checkData+','+Number(idx+1);
 					else
 						checkData = idx+1;
 				}
 				
 			 });
 			 if(checkData != ""){
 			 	alert(checkData+'번째 입력값이 입력되지 않았습니다.')
 			 	checkData = "";
 			 }else{
 				formObj.attr("action", "<c:url value="/bem/businessEvaluation"/>");
	 			formObj.attr("method", "post");
	 			formObj.submit(); 
 				}
 		});
 		
 		 $('.score').on('keyup',function(){
 			 var Sum = 0;
            $('.score').each(function(idx,value){ 
                if(!isNaN(this.value) && this.value.length!=0){
	                	Sum+=Number($(value).val());
	                	if(Sum <= 100)
	                    	$('#eval_totalscore').val(Sum);
	                	else if(Sum > 100){
            				$('#eval_totalscore').val(Sum-Number($(value).val()));
            				this.value=null;
            				this.focus();
            				return ;
	                	}
            			
            		}	
            });
            if(Sum > 100) 
            	alert("배점이 100점을 넘을수 없습니다.")
         }); 		
 		 
 		//총점 
		   var Sum=0;
           $('.point').each(function(idx,value){ 
	                	Sum += Number($(value).text());
	                	$('#MaxScore').text(Sum);
           })
        })

  	</script>
  	
<body>
	<% Calendar cal = Calendar.getInstance(); %>
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
                                <li class=""><a href="<c:url value="/bem/businessEvaluationMyList"/>">· 평가내역 조회</a></li>
                            </ul>
                            </li>
                      </c:if>
                    </ul>
                </div>
                        <div class="cont">
                            <h2>사업 평가</h2>
                            <h3>충북청주 강소연구개발특구 특화기업 성장지원 사업 평가지표</h3>
                            <div class="table_wrap">
                                <table>
                                    <colgroup>
                                        <col style="width:10%">
                                        <col style="width:auto">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th scope="col">구분</th>
                                            <th scope="col">제목</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="ta_c">사업명</td>
                                            <td class="ta_c">${bamnotice.anc_title}</td>
                                        </tr>
                                    </tbody>
                                </table>
							<form action="<c:url value="/bem/businessEvaluation"/>" method="post">
							<input type="hidden" name ="bpm_bplan_idx" value="${param.bpm_bplan_idx}">
							<input type="hidden" name ="bam_anc_idx" value="${param.bam_anc_idx}">  
							<input type="hidden" name ="write_id" value="${member.user_id}"> 
                                <table class="thead_gray mt_10" >
                                    <colgroup>
                                        <col style="width:7%">
                                        <col style="width:11%">
                                        <col style="width:auto">
                                        <col style="width:7%">
                                        <col style="width:7%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th scope="col">분류</th>
                                            <th scope="col">구분</th>
                                            <th scope="col">평가항목</th>
                                            <th scope="col">배점</th>
                                            <th scope="col">평점</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	 <tr>
                                    	 <th rowspan="8" class="f_bold">신청기업</th>
                                   <c:forEach items="${ancInfo}" var="ancInfo" varStatus="status"> 
	                                            <td class="type">${ancInfo.EVAL_FORM_TITLE}</td>
	                                            <td >${ancInfo.EVAL_FORM_ITEM}</td>
	                                            <td style="text-align: center;" class="point" >${ancInfo.EVAL_FORM_SCORE}</td>
	                                            <td><input class="score"id="eval_score" type="number" name="eval_score${status.index+1}" value="0"></td>   
                                       </tr>
                                        </c:forEach>	
                                    	</tbody>
	                                    	<tr class="total">
	                                            <td colspan="3">합계</td>
	                                            <td class="MaxScore" id="MaxScore"></td>
	                                            <td ><input type="text" name="eval_totalscore" class="totalscore" id="eval_totalscore" readonly="readonly"></td>
	                                       	</tr>
                                </table>
                                <table>
                                    <colgroup>
                                        <col style="width:12%">
                                        <col style="width:auto">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>평가의견</th>
                                            <td colspan="3">
                                                <div class="opi">
                                                    <textarea name="eval_opinion" id="" cols="30" rows="10"></textarea>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>일자</th>
                                            <td class="ta_c f_bold"><%= cal.get(Calendar.YEAR) %>.<%= cal.get(Calendar.MONTH)+1 %>.<%= cal.get(Calendar.DATE) %>.</td>
											<td class="ta_c f_bold">평가위원 성명</td>
											<td class="ta_c f_bold" style="text-align: right;"><input type="text" name="eval_writer" value ="${member.user_name}">(서명)</td>
                                        </tr>
                                        
                                    </tbody>

                                </table>
                            </div>

                            <div class="btn_wrap text-right same mt_20">
                                <button type="button" class="cancel">취소</button>
                                <button type="submit" class="normal">평가완료</button>
                            </div>
                          </form>


                        </div>
                    </div>
                </section>
            </div>
        </div>
        <footer></footer>
    </div>

	
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Calendar" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>

  body{
  		font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
		margin :0 30%;
  }
  
  table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  
  th, td {
    border: 1px solid #444444;
  }
  textarea{
  	
  	width: 97%;
  	height: 90%;
  	border: 0px;
  	resize: none;
  	outline: none;
	display : flex;
  	margin-right: 5px;
  }
  p{
  	font-size: 1.5rem;
  	text-align: center;
  }
  tr th input {
  	border : 0px;
  	width : 75%;
  	min-height: 30px;
  	text-align: center;
  	margin-left: 13px;
  }
  
  .evaluationTableHeader{
  	background-color: #EAEAEA;
  }
  
  .evaluationTableSum{
  	background-color: #EAEAEA;
  }
  
  .rating{
 	clear: both;
 	color: #FA5858;
  }
  
  .subjecttable{
  	margin-bottom: 10px;
  }
  
  
  .remark{
  	height: 300px;
  }
  
  .sign{
  	width: 70%;
  }
  
  .submitForm{
  	display : flex;
  	margin-top : 30px;
  	float: right;
  }
  
  .cancle_btn{
 	border : 0px;
	background-color: #B4B4B4;
	color : #ffffff;
	width : 100px;
	height: 50px;
	margin-right: 10px;
	font-size: 15px;
		
	}
	
  .write_btn{
  	border : 0px;
	background-color: #862640;
	color : #ffffff;
	width : 100px;
	height: 50px;
  	font-size: 15px;
  }
  
  .scoreSum{
  	clear: both;
  }
  
  #eval_totalscore{
  	margin-right : 10px;
  	width : 50%;
  	background-color: #EAEAEA;
  	text-align: center;
  	color : #FA5858;
  	font-weight: bold;
  	font-size: 15px;
  }
  
  
  
</style>
  <script type="text/javascript">
  
  $(document).ready(function(){
		  
	  $('.write_btn').click(function(){
			
		  var len = 8;
		  var arrBem_beval_form_idx =[];
		  var arrEval_form_title =[];
		  var arrEval_form_item = [];
		  var arrEval_form_score = [];
		  var Sbam_anc_idx=${param.bam_anc_idx}
		 
		   for(var i =0; i < len;i++){
			  arrBem_beval_form_idx.push(document.getElementsByName("bem_beval_form_idx")[i].value);
			  arrEval_form_title.push(document.getElementsByName("eval_form_title")[i].value);
			  arrEval_form_item.push(document.getElementsByName("eval_form_item")[i].value);
			  arrEval_form_score.push(document.getElementsByName("eval_form_score")[i].value);
 				
			 
		  } 
		  
		  var objParams = {
				  	"arrBem_beval_form_idx" : arrBem_beval_form_idx,
				    "arrEval_form_title" : arrEval_form_title, 
					"arrEval_form_item" : arrEval_form_item ,
					"arrEval_form_score" : arrEval_form_score,
					"Sbam_anc_idx" : Sbam_anc_idx,
				};

		 
		  $.ajax({
				type: "POST",
				url : '<c:url value="/bam/businessEvaluationEditUpdate"/>',
				dataType :"text",
				data: objParams,
				success : function(data) {
									
					window.location.replace('<c:url value="/bam/businessFormEditList"/>');

				}, beforeSend: function () {
		              var width = 0;
		              var height = 0;
		              var left = 0;
		              var top = 0;

		              width = 50;
		              height = 50;


		              top = ( $(window).height() - height ) / 2 + $(window).scrollTop();
		              left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();

		 

		              if($("#div_ajax_load_image").length != 0) {
		                     $("#div_ajax_load_image").css({
		                            "top": top+"px",
		                            "left": left+"px"
		                     });
		                     $("#div_ajax_load_image").show();
		              }
		              else {
		                     $('body').append('<div id="div_ajax_load_image" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="../../resource/image/loading.gif" style="width:50px; height:50px;"></div>');
		              }

		       }
		       , complete: function () {
		                     $("#div_ajax_load_image").hide();
		       },
				error : function(request, status, error){
					alert(error);
				}
			});
 	 })
  })
  
  </script>
      <title>사업계획서 평가지표 양식 설정</title>
  </head>
  <body>
  <form name="writeForm" action="#">
  	<input type="hidden" name="bam_anc_idx" value="${param.bam_anc_idx}"/>
  	
  	<h1 style="text-align: center;"> 평가지표 설정 </h1>
    <table class="evaluationboard">
    	  <colgroup>
    		<col style="width:10%">
 			<col style="width:15%">
 			<col style="width:55%">
 			<col style="width:10%">
    	  </colgroup>
      <thead>
	        <tr class="evaluationTableHeader">
	          <th rowspan="6" scope="col">분류</th>
	          <th scope="col">구분</th>
	          <th scope="col">평가항목</th>
	          <th scope="col">배점</th>
	        </tr>
	  </thead>
	  	<c:forEach items="${ancInfo}" var="ancInfo" varStatus="status">
	  		<input type="hidden" name="bem_beval_form_idx" value="${ancInfo.BEM_BEVAL_FORM_IDX}">
	  	</c:forEach>
		  	<tbody>
	          <tr>
	             <th rowspan="8" class="f_bold">신청기업</th>
	           		<c:forEach items="${ancInfo}" var="ancInfo" varStatus="status">
	     	      	   <th scope="col"><textarea name="eval_form_title">${ancInfo.EVAL_FORM_TITLE}</textarea></th> 
		               <th scope="col"><textarea name="eval_form_item">${ancInfo.EVAL_FORM_ITEM}</textarea></th>
		               <th scope="col"><input name="eval_form_score" class="maxScore" type="number" value="${ancInfo.EVAL_FORM_SCORE}"></th>	
		            </c:forEach> 
	         </tr>	
	         </tbody>
	 <!--  <tbody>
	        <tr>
	          <th rowspan="8" class="f_bold">신청기업</th>
	          <th scope="col"><textarea name="eval_form_title">{}</textarea></th>
	         
	          
	        </tr>
	        <tr>
	          <th scope="col"><textarea name="eval_form_title"></textarea></th>
	          <th scope="col"><textarea name="eval_form_item"></textarea></th>
	          <th scope="col"><input name="eval_form_score" class="maxScore" type="number" value="20"></th>	
	        </tr>
	        <tr>
	          <th scope="col"><textarea name="eval_form_title"></textarea></th>
	          <th scope="col"><textarea name="eval_form_item"></textarea></th>
	          <th scope="col"><input name="eval_form_score" class="maxScore" type="number" value="20"></th>	
	        </tr>
	        <tr>
	          <th scope="col"><textarea name="eval_form_title"></textarea></th>
	          <th scope="col"><textarea name="eval_form_item"></textarea></th>
	          <th scope="col"><input name="eval_form_score" class="maxScore" type="number" value="20"></th>	
	        </tr>
	        <tr>
	          <th scope="col"><textarea name="eval_form_title"></textarea></th>
	          <th scope="col"><textarea name="eval_form_item"></textarea></th>
	          <th scope="col"><input name="eval_form_score" class="maxScore" type="number" value="20"></th>	
	        </tr>
	        <tr>
	          <th scope="col"><textarea name="eval_form_title"></textarea></th>
	          <th scope="col"><textarea name="eval_form_item"></textarea></th>
	          <th scope="col"><input name="eval_form_score" class="maxScore" type="number" value="20"></th>	
	        </tr>
	        <tr>
	          <th scope="col"><textarea name="eval_form_title"></textarea></th>
	          <th scope="col"><textarea name="eval_form_item"></textarea></th>
	          <th scope="col"><input name="eval_form_score" class="maxScore" type="number" value="20"></th>	
	        </tr>
	        <tr>
	          <th scope="col"><textarea name="eval_form_title"></textarea></th>
	          <th scope="col"><textarea name="eval_form_item"></textarea></th>
	          <th scope="col"><input name="eval_form_score" class="maxScore" type="number" value="20"></th>	
	        </tr>
	  </tbody>   -->
	 </table>
		 <div class="submitForm">
			    <input class ="cancle_btn" type="button" onclick="location.href='<c:url value="/bpm/businessPlanApplyList"/>?bam_anc_idx=${param.bam_anc_idx}'" value="취소"> 
			    <input class ="write_btn" type="button" value="등록완료">
		</div>
    </form>
  </body>
</html>
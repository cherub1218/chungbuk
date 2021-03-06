<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Calendar" %>
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
 			 	alert(checkData+'?????? ???????????? ???????????? ???????????????.')
 			 	checkData = "";
 			 }else{
 				formObj.attr("action", "/bem/businessEvaluation");
	 			formObj.attr("method", "post");
	 			formObj.submit(); 
 				}
 		});
 		
 		
 		 $('.score').on('keyup',function(){
 			 var Sum = 0;
            $('.score').each(function(idx,value){ 
                if(!isNaN(this.value)&&this.value.length!=0){
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
            	alert("????????? 100?????? ????????? ????????????.")
         });
 		 
 		$('.maxScore').on('keyup',function(){
			 var Sum = 0;
           $('.maxScore').each(function(idx,value){ 
               if(!isNaN(this.value)&&this.value.length!=0){
            	   
	                	Sum+=Number($(value).val());
	                	if(Sum <= 100)
	                    	$('#MaxScoreSum').text(Sum);
	                	else if(Sum > 100){
	           				$('#MaxScoreSum').text(Sum-Number($(value).val()));
	           				this.value=null;
	           				
	                	}
           			
           		}	
           });
           if(Sum > 100) alert("????????? 100?????? ????????? ????????????.")
        });
 		
 		
  	})
  	
  	
  
  </script>
      <title>??????????????? ??????</title>
  </head>
  <body>
  	<% Calendar cal = Calendar.getInstance(); %>
  <form name="writeForm" action="#">
    <table>
    	<p>???????????? ???????????????????????? ???????????? ???????????? ?????? ????????????</p>
    	<input type="hidden" value="${param.bam_anc_idx}"/>
    	<input type="hidden" name="bpm_bplan_idx"value="${param.bpm_bplan_idx}"/>
    	<colgroup>
    		<col style="width:15%">
 			<col style="width:75%">
    	</colgroup>
      <thead>
        <tr>
          <th scope="col">??????</th>
          <th scope="col">${ancInfo.anc_title}</th>
        </tr>
      </thead>
      <tbody>
        <tr style ="text-align : center; height: 50px;">
          <td>?????????</td><td>${ancInfo.anc_title}</td>
        </tr>
      </tbody>
    </table>
    <table class="evaluationboard">
    	  <colgroup>
    		<col style="width:10%">
 			<col style="width:15%">
 			<col style="width:55%">
 			<col style="width:10%">
 			<col style="width:10%">
    	  </colgroup>
      <thead>
	        <tr class="evaluationTableHeader">
	          <th rowspan="6" scope="col">??????</th>
	          <th scope="col">??????</th>
	          <th scope="col">????????????</th>
	          <th scope="col">??????</th>
	          <th scope="col">??????</th>
	        </tr>
	  </thead>
	  <tbody>
	        <tr>
	        <th rowspan="6" scope="col">????????????</th>
	          <th rowspan="2" scope="col"><textarea >?????????????????????</textarea></th>
	          <th scope="col"><textarea>??????????????? ??? ??????????????? ?????????</textarea></th>
	          <th rowspan="2" scope="col"><input class="maxScore" type="number" value="20"></th>	
	          <th rowspan="2" scope="col"><input name="eval_score1" class="score" type="number"></th>
	        </tr>
	        <tr>
	          <th scope="col"><textarea>?????? ??????????????? ?????????</textarea></th>
	        </tr>
	        
	        
	        <tr>
	          <th rowspan="2" scope="col"><textarea>?????? ????????? ??? ????????????</textarea></th>
	          <th scope="col"><textarea>????????? ????????? ??? ???????????? ????????? ?????????</textarea></th>
	          <th rowspan="2" scope="col"><input class="maxScore" type="number" value="20"></th>
	          <th rowspan="2" scope="col"><input name="eval_score2" class="score" type="number"></th>
	        </tr>
	         <tr>
	          <th scope="col"><textarea>?????????????????? ??? ??????</textarea></th>
	        </tr>
	        
	        
	         <tr>
	          <th rowspan="2" scope="col"><textarea>?????? ????????? ??? ????????? ?????????</textarea></th>
	          <th scope="col"><textarea>??????????????? ????????????</textarea></th>
	          <th  scope="col"><input class="maxScore" type="number" value="15"></th>
	          <th  scope="col"><input name="eval_score3" class="score" type="number"></th>
	        </tr>
	         <tr>
	          <th scope="col"><textarea>????????? ????????? ????????? ??? ?????????</textarea></th>
	          <th scope="col"><input class="maxScore" type="number" value="15"></th>
	          <th scope="col"><input name="eval_score4" class="score"type="number"></th>
	        </tr>
	        
	        
	         <tr>
	          <th rowspan="2" scope="col">????????????</th>
	          <th rowspan="2" scope="col"><textarea name="EVAL_TITLE4">?????? ?????? ????????? ??? ??????</textarea></th>
	          <th scope="col"><textarea>??????????????? ???????????? ?????? ????????? ??? ?????? ??????</textarea></th>
	          <th scope="col"><input class="maxScore" type="number" value="15"></th>
	          <th scope="col"><input name="eval_score5" class="score" type="number"></th>
	        </tr>
	         <tr>
	          <th scope="col"><textarea>??????????????? ???????????? ?????? ??? ??????</textarea></th>
	          <th scope="col"><input class="maxScore" type="number" value="15"></th>
	          <th scope="col"><input name="eval_score6" class="score" type="number"></th>
	        </tr>
	        
	        <tr class="evaluationTableSum">
	 			<!-- ?????? -->
	        	<th  colspan="3">??????</th>
		        <th id="MaxScoreSum">100</th>
		        <th><input type="text" name="eval_totalscore" id="eval_totalscore" readonly="readonly" /></th>
		    </tr>
	  </tbody>  
	 </table>
	 
	  <table>
	  	<tbody>
	   		<tr style="height: 300px;">
				<th style="width: 20%;">????????????</th>
				<th colspan="3"><textarea name="eval_opinion" class="remark"></textarea></th>
		    </tr>
		    <tr style="height: 50px;">
				<th style="width: 20%;">??????</div></th>
				
				<th name="reg_date"><%= cal.get(Calendar.YEAR) %>.<%= cal.get(Calendar.MONTH)+1 %>.<%= cal.get(Calendar.DATE) %>.</th>
				<th>???????????? ??????</th>
				<th style="text-align: right;"><input type="text" name="eval_writer" value ="">(??????)</th>
		    </tr>
	 	 </tbody>
	  </table>
		 
		 <div class="submitForm">
			    <input class ="cancle_btn" type="button" onclick="location.href='/bpm/businessPlanApplyList?bam_anc_idx=${param.bam_anc_idx}'" value="??????"> 
			    <input class ="write_btn" type="button" value="????????????">
		</div>
    </form>
    </table>
  </body>
</html>
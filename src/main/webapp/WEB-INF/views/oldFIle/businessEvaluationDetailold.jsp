<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>CSS</title>
<link rel="stylesheet" href="../../../resources/CSS/businessEvaluationDetail.css">
 <script type="text/javascript">
 
 	function printFn(print){
 		
 		 var sw=screen.width;
 	     var sh=screen.height;
 	     var w=800;//팝업창 가로길이
 	     var h=600;//세로길이
 	     var xpos=(sw-w)/2; 
 	     var ypos=(sh-h)/2; 
 	     var pHeader="<html><head><link rel='stylesheet' type='text/css' href='../../../resources/CSS/businessEvaluationDetail.css'><title>" + print + "</title></head><body>";
 	     var pgetContent=document.getElementById("printArea").innerHTML + "<br>";
 	     //innerHTML을 이용하여 Div로 묶어준 부분을 가져옵니다.
 	     var pFooter="</body></html>";
 	     pContent=pHeader + pgetContent + pFooter; 
 	      
 	     pWin=window.open("","print","width=" + w +",height="+ h +",top=" + ypos + ",left="+ xpos +",status=yes,scrollbars=yes"); //동적인 새창을 띄웁니다.
 	     pWin.document.open(); //팝업창 오픈
 	     pWin.document.write(pContent); //새롭게 만든 html소스를 씁니다.
 	     pWin.document.close(); //클로즈
 	     pWin.print(); //윈도우 인쇄 창 띄우고
 	     pWin.close(); //인쇄가  되던가 취소가 되면 팝업창을 닫습니다.
   
 	}
 
 
 </script>
  </head>
  <style>
  
  body{font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif; margin :5% 30%;}
  
  </style>
  <body>
  	
  <form action="#">
  <div id=printArea>
  	<input type="hidden"value="${param.bam_anc_idx}"/>
  	<input type="hidden"value="${param.bem_beval_idx}"/>
  	<input type="hidden"value="${param.bpm_bplan_idx}"/>
    <table class="subjecttable">
    	<p>충북청주 강소연구개발특구 특화기업 성장지원 사업 평가지표</p>
    	<colgroup>
    		<col style="width:15%">
 			<col style="width:75%">
    	</colgroup>
      <thead>
        <tr>
          <th scope="col">구분</th>
          <th scope="col">미래기술융합혁신제품지원</th>
        </tr>
      </thead>
      <tbody>
        <tr style ="text-align : center; height: 50px;">
          <td>사업명</td><td>낙상감지기술 기반의 노약자용 변좌 자동 리프트 시스템</td>
        </tr>
      </tbody>
    </table>
    <table class="evaluationtable">
    	  <colgroup>
    		<col style="width:10%">
 			<col style="width:15%">
 			<col style="width:55%;">
 			<col style="width:10%">
 			<col style="width:10%">
    	  </colgroup>
      <thead>
	        <tr class ="evaluationTableHeader">
	          <th rowspan="6" scope="col">분류</th>
	          <th scope="col">구분</th>
	          <td scope="col">평가항목</th>
	          <th scope="col">배점</th>
	          <th scope="col">평점</th>
	        </tr>
	  </thead>
	  <tbody>
	        <tr>
	        <th rowspan="6" scope="col">신청기업</th>
	          <th rowspan="2" scope="col">추진계획 타당성</th>
	          <td scope="col">사전준비도 및 사업목표의 명확성</th>
	          <th rowspan="2" scope="col">20</th>	
	          <th rowspan="2" scope="col">${read.eval_score1}</th>
	        </tr>
	        <tr>
	          <td scope="col">사업 추진방안의 타당성</th>
	        </tr>
	        <tr>
	          <th rowspan="2" scope="col">지원 필요성 및 추진역량</th>
	          <td scope="col">지원의 필요성 및 신청지원 분야의 적합성</th>
	          <th rowspan="2" scope="col">20</th>
	          <th rowspan="2" scope="col">${read.eval_score2}</th>
	        </tr>
	         <tr>
	          <td scope="col">사업추진역량 및 의지</th>
	        </tr>
	         <tr>
	          
	          <th rowspan="2" scope="col">지원 효과성 및 사업비 적정성</th>
	          <td scope="col">사업지원의 기대효과</th>
	          <th scope="col">15</th>
	          <th scope="col">${read.eval_score3}</th>
	        </tr>
	         <tr>

	          <td scope="col">사업비 구성의 적정성 및 합리성</th>
	          <th scope="col">15</th>
	          <th scope="col">${read.eval_score4}</th>
	        </tr>
	         <tr>
	          <th rowspan="2" scope="col">수행기관</th>
	          <th rowspan="2" scope="col">관련 분야 전문성 및 역량</th>
	          <td scope="col">지원분야의 수행기관 매칭 적합성 및 관련 실적</th>
	          <th scope="col">15</th>
	          <th scope="col">${read.eval_score5}</th>
	        </tr>
	         <tr>
	          <td scope="col">참여인력의 업무수행 능력 및 역량</th>
	          <th scope="col">15</th>
	          <th scope="col">${read.eval_score6}</th>
	        </tr>
	        <tr class ="evaluationTableSum">
	 			<!-- 합계 -->
	        	<th colspan="3">합계</th>
		        <th>100</th>
		        <th class="rating">${read.eval_totalscore}</th>
		    </tr>
	  </tbody>  
	 </table>
	 
	  <table>
	  	<tbody>
	   		<tr style="height: 300px;">
				<th style="width: 20%;">평가의견</th>
				<th colspan="3">${read.eval_opinion}</th>
		    </tr>
		    <tr style="height: 50px;">
				<th style="width: 20%;">일자</div></th>
				<th>2021.03.02</th>
				<th>평가위원 성명</th>
				<th style="text-align: right">${read.eval_writer}　　(서명)</th>
		    </tr>
	 	 </tbody>
	  </table>
	  </div>
		 
		 <div class="submitForm">
			    <input class ="listbtn" type="button" value="목록" onclick="location.href='/bem/businessEvaluationList?bpm_bplan_idx=${param.bpm_bplan_idx}&bpm_bplan_idx=${param.bpm_bplan_idx}'">
			    <input class ="printbtn" type="button" value="수정" onclick="location.href='/bem/businessEvaluationUpdate?bem_beval_idx=${read.bem_beval_idx}&bpm_bplan_idx=${param.bpm_bplan_idx}'">
			    <input class ="printbtn" type="button" value="인쇄" onclick="printFn(print)">  
		</div>
    </form>
    </table>
  </body>
</html>
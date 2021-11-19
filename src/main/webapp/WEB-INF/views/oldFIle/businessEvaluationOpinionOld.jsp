<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>종합의견</title>
<style>
table {
	width: 100%;
	border: 1px solid #444444;
	border-collapse: collapse;
}

form p {
	font-size: 2.5rem;
	font-weight: bolder;
	font-family: '돋움';
	float: center;
	text-align: center;
	"
}

th, td {
	border: 1px solid #444444;
}

body {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
	margin: 0 20%;
}

.user {
	text-align: center;
	height: 50px;
}

.backslash {
	background:
		url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><line x1="0" y1="0" x2="100%" y2="100%" stroke="gray" /></svg>');
}

thead tr td {
	font-weight: bold;
	text-align: center;
}

tfoot tr {
	font-weight: bold;
	text-align: center;
	background-color: #EAEAEA;
}

.opinion {
	border: 0px;
	background-color: #862640;
	color: #ffffff;
	width: 80%;
	height: 40px;
	border-radius: 5px;
}

.opiniondiv {
	border: 2px solid;
	width: 100%;
	height: 40%;
}

.toptable {
	height: 50px;
	background-color: #EAEAEA;
}

.middletable {
	height: 100px;
	background-color: #EAEAEA;
}

.listbtn {
	float: left;
	border: 0px;
	background-color: #EAEAEA;
	color: #000000;
	width: 10%;
	height: 40px;
	border-radius: 5px;
	margin-top: 10px;
}

.ybtn {
	float: right;
	border: 0px;
	background-color: #862640;
	color: #ffffff;
	width: 10%;
	height: 40px;
	border-radius: 5px;
	margin-top: 10px;
	margin-left: 5px;
}

.nbtn {
	float: right;
	border: 0px;
	background-color: #862640;
	color: #ffffff;
	width: 10%;
	height: 40px;
	border-radius: 5px;
	margin-top: 10px;
	margin-left: 5px;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
}
</style>
<script type="text/javascript">
$("span[name='toggle-control']").click(function() { 

    $('#target').toggle();

    $("span[name='toggle-control']").toggle();
});
</script>

<script>
	 $(document).ready(function(){
		 var checkData = "";
		 var Sum =0;
		 var Max =0;
		 var Min =0;
		 var average = 0;
		 var convertedaverage = 0;
        $('.totalscore').each(function(idx,value){
        			if(idx == 0){
        				Max = $(value).text()
        				Min = $(value).text()
        			} 
         			if($(value).text() > Max){
         				
         				Max = Number($(value).text())
         			}else if($(value).text() < Min){
         				
         				Min = Number($(value).text())
         			}
                	Sum = Sum + Number($(value).text());
                	average = (Sum/(idx+1)).toFixed(2);
                	convertedaverage = (Sum-(Number(Max+Min))) / (idx-1)
                	 $('#average').text(average)
                     $('#convertedaverage').text(convertedaverage);
                   
        });
        
   
     });
    
    function open_pop(context){
    	$('#opinionText').text(context);
		$('#opinionmodal').show();
	};
	function close_pop(flag) {
        $('#opinionmodal').hide();
   };
</script>

</head>

<body>
	<c:out value="${Bplan.writer}"></c:out>
	<form style="margin-bottom: 30px;">
		<table border="3">
			<p>충북청주 강소연구개발특구 특화기업 성장지원 사업 평가지표</p>
			<colgroup>
				<col style="width: 400px;">
				<col style="width: 200px;">
				<col style="width: 200px;">
				<col style="width: 200px;">
				<col style="width: 200px;">
				<col style="width: 200px;">
				<col style="width: 200px;">
				<col style="width: 100px;">
				<col style="width: 200px;">
			</colgroup>
			<thead>
				<tr class="toptable">
					<td class="backslash"></td>
					<td colspan="6" scope="col">평가 항목별 점수</td>
					<td colspan="2" scope="col">종합</td>
				</tr>

				<tr class="middletable">
					<td>평가위원</td>
					<td>추진 계획 타당성</td>
					<td>지원 필요성 및 추진 역량</td>
					<td>사업 지원의 기대 효과</td>
					<td>사업비 구성의 적정성 및 합리성</td>
					<td>지원 분야의 수행기관 매칭 적합성 및 관련 실적</td>
					<td>참여 인력의 업무수행 능력 및 역량</td>
					<td>총점</td>
					<td>평가의견</td>
				</tr>
			</thead>
			<c:forEach items="${businessEvaluationList}"
				var="businessEvaluationList">
				<tr class="user">
					<td style="text-align: center">${businessEvaluationList.eval_writer}</td>
					<td style="text-align: center">${businessEvaluationList.eval_score1}</td>
					<td style="text-align: center">${businessEvaluationList.eval_score2}</td>
					<td style="text-align: center">${businessEvaluationList.eval_score3}</td>
					<td style="text-align: center">${businessEvaluationList.eval_score4}</td>
					<td style="text-align: center">${businessEvaluationList.eval_score5}</td>
					<td style="text-align: center">${businessEvaluationList.eval_score6}</td>
					<td class="totalscore" style="text-align: center">${businessEvaluationList.eval_totalscore}</td>
					<td><button class="opinion" type="button" onclick="open_pop('${businessEvaluationList.eval_opinion}')">평가의견</button></td>
				</tr>
			</c:forEach>
			<tfoot>
				<tr>
					<td colspan="7">평균</td>
					<td colspan="2" id="average"></td>

				</tr>
				<tr>
					<td colspan="7">환산평균</td>
					<td colspan="2" id="convertedaverage"></td>
				
				</tr>
				
			</tfoot>
		</table>
			<span>*환산평균 : 총점 - (최고점+최저점) / 평가위원 수 </span>
			<!-- The Modal -->
			<div id="opinionmodal" class="modal">

				<!-- Modal content -->
				<div class="modal-content">
					<p style="text-align: center;">
						<span style="font-size: 14pt;"><b><span
								style="font-size: 24pt;">평가의견</span></b></span>
					</p>
					<p id="opinionText"></p>
						<br />
					</p>
					<div
						style="color: #ffffff; pointer; background-color: #862640; text-align: center; padding-bottom: 10px; padding-top: 10px;"
						onClick="close_pop();">
						<span class="pop_bt" style="font-size: 13pt;"> 닫기 </span>
					</div>
				</div>
			<!--End Modal-->
		</div>
		<div class="btnDiv">
			<button type="button" class="listbtn"
				onclick="location.href='/bem/businessEvaluationList?bpm_bplan_idx=${param.bpm_bplan_idx}'">목록</button>
			<button type="button" class="ybtn" onclick="location.href=''">선정</button>
		</div>
	</form>
</body>
</html>
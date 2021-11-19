<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<style type="text/css">
	.searchrow{
		float : right;
		margin-bottom: 20px;
		
	}
	
	#searchdiv{
		width : 350px;
		display: flex;
	}
	#searchbox{
	
		margin-right: -30px;
	}
	.searchBtn{
	
		border : 0px;
		background-color: #862640;
		color : #ffffff;
		width : 25%;
		margin-right: -52px;
		border-radius: 5px;
	}
	
	.opinionBtn{
  	border : 0px;
	background-color: #862640;
	color : #ffffff;
	width : 100px;
	height: 50px;
	margin-right: 10px;
	font-size: 15px;
	float: right;
  }
</style>

<title>평가가위원 화면</title>
</head>
<body>
	<div style="float: right;">
		<%@include file="../cmm/topmenu.jsp"%>
	</div>
	<div class="container">
		<header>
			<h1>평가 사업 리스트</h1>
		</header>
		<hr />

			<section id="container">
				<form role="form" method="get">
				<input type="hidden"value="${param.bpm_bplan_idx}"/>
				<div class="searchrow">
					<div id="searchbox"class="col-sm-3">
						<select name="searchType" class="form-control">
							<option value="n"
								<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
							<option value="t"
								<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>평가 작성자</option>
						</select>
					</div>
					<div id="searchdiv" class="col-xs-7 col-sm-7">
						<input type="text" name="keyword" id="keywordInput"value="${scri.keyword}" class="form-control"> 
						<button id="searchBtn" type="button" class="searchBtn">검색</button>
					</div>

					<script>
						 $(function(){
							 $('#searchBtn').click(function() {
								 self.location = "businessEvaluationList" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
							 });
						 });   
					</script>
				</div>
				
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="text-align: center">평가 작성자</th>
							<th style="text-align: center">총점</th>
							<th style="text-align: center">작성일자</th>
							<th style="text-align: center">평가상태</th>
						</tr>
					</thead>
					 <c:forEach items="${businessEvaluationList}" var = "businessEvaluationList">
							<tr>
								<td style="text-align: center">
									<a href="/bem/businessEvaluationDetail?bem_beval_idx=${businessEvaluationList.bem_beval_idx}&bpm_bplan_idx=${param.bpm_bplan_idx}"><c:out value="${businessEvaluationList.eval_writer}" /></a>
								</td>
								<td style="text-align: center">${businessEvaluationList.eval_totalscore}</td>
								<td style="text-align: center"><fmt:formatDate value="${businessEvaluationList.reg_date}" pattern="yyyy-MM-dd"/></td>
								<td style="text-align: center">점수등록 완료</td>
							</tr>
						</c:forEach> 
	
				</table>
					<input class ="opinionBtn" type="button" value="종합의견" onclick="location.href='/bem/businessEvaluationOpinion?bpm_bplan_idx=${param.bpm_bplan_idx}'">
	
	
			</form>
		</section>
		</div>
</body>
</html>
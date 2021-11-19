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
		background-color: #dd4132;
		color : #ffffff;
		width : 25%;
		margin-right: -52px;
		border-radius: 5px;
	}
</style>

<title>사업 계획서 리스트</title>
</head>
<body>

	<div class="container">
		<header>
			<h1>사업 계획서 리스트</h1>
		</header>
		<hr />

			<section id="container">
				<form role="form" method="get">
				<input type="hidden" value="${param.bam_anc_idx}">
				<div class="searchrow">
					<div id="searchbox"class="col-sm-3">
						<select name="searchType" class="form-control">
							<option value="n"
								<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
							
							<option value="w"
								<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					
						</select>
					</div>
					<div id="searchdiv" class="col-xs-7 col-sm-7">
						<input type="text" name="keyword" id="keywordInput"value="${scri.keyword}" class="form-control"> 
						<button id="searchBtn" type="button" class="searchBtn">검색</button>
					</div>

					<script>	
						 $(function(){
							 $('#searchBtn').click(function() {
								 self.location = "list2" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
							 });
						 });   
					</script>
				</div>

					<table class="table table-hover">
						<thead>
							<tr>
								<th style="width: 60px; text-align: center;">번호</th>
								<th style="width: 350px; text-align: center;">연구목표</th>
								<th style="width: 350px; text-align: center;">사업자</th>
								<th style="width: 320px; text-align: center;">접수완료일자</th>
								<th style="width: 200px; text-align: center;">접수상태</th>
							</tr>
						</thead>
						<c:forEach items="${list}" var = "list" varStatus="status">
								
								<c:if test = "${list.writer == member.user_id}">
									<tr>
										<td style="text-align: center;"><c:out value="${status.index+1}" /></td>
										<td style="text-align: center;">
											<a href="/bpm/businessPlanApplyDetail?bpm_bplan_idx=${list.bpm_bplan_idx}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}&bam_anc_idx=${param.bam_anc_idx}"><c:out value="${list.research_obj}"/></a>
										</td>
										<td style="text-align: center;"><c:out value="${list.writer}" /></td>
										<td style="text-align: center;"><fmt:formatDate value="${list.reg_date}" pattern="MM/dd H시mm분"/></td>
										<td style="text-align: center;">
										<c:choose>
											<c:when test="${list.status == 0}">
												평가 진행중
											</c:when>
											<c:when test="${list.status == 1}">
												평가 완료
											</c:when>
											<c:when test="${list.status == 2}">
												선정 완료
											</c:when>
										</c:choose>
										</td>
									</tr>
								</c:if>	
						</c:forEach>
					</table>
																						

			</form>
		</section>
		</div>
</body>
</html>
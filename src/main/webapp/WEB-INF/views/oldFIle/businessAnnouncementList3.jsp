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

<title>사업공지</title>
</head>
<script>
	$(function() {
		$('#searchBtn').click(
				function() {
					self.location = "businessAnnouncementList"
							+ '${pageMaker.makeQuery(1)}' + "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
				});
	});
</script>
<style>
body {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
	margin: 0 20%;
}

.searchrow {
	
	width: 100%;
	height: 10%;
	border: 1px solid #cccccc;
	background-color : #f5f5f5;
	margin-bottom: 20px;

}

#searchdiv {
	width: 100%;
	display: flex;
}

#searchbox {
	display: flex;
	width: 50%;
	margin: 2% auto;
}

#searchSel {
	display: flex;	
	width: 30%;
	height: 50px;
}

#keywordInput {
	width : 80%;
	display: flex;
	height: 50px;
}

.searchBtn {
	border: 0px;
	background-color: #dd4132;
	color: #ffffff;
	width: 25%;
	border-radius: 5px;
}

.writebtn {
	float: right;
	border: 0px;
	background-color: #dd4132;
	color: #ffffff;
	width: 8%;
	height: 5%;
	border-radius: 5px;
	margin-top: 10px;
}

.pasingDiv {
	margin-top: 25px;
}

 th{
 	background-color: #f5f5f5;
 	border-top : 2px solid #333;
 }
 
 table{
 	border-top : 2px solid #333;
 
 }
</style>
<body>
	<div style="float: right;">

	</div>
	<header>
		<h1  style="text-align: center;">사업공지</h1>
	</header>
	<hr />

	<section id="container">
		<form role="form" method="get">
			<div class="searchrow">
				<div id="searchbox">
					<select id="searchSel" name="searchType" class="form-control">
						<option value="n"
							<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
						<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>사업명</option>
						<option value="c"
							<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
						<option value="w"
							<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
						<option value="tc"
							<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>사업명+내용</option>
					</select>

					<div id="searchdiv">
						<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control">
						<button id="searchBtn" type="button" class="searchBtn">검색</button>
					</div>
				</div>

			</div>

			<table class="table table-hover">
				<thead>
					<tr>
						<th style="width: 60px; text-align: center;">번호</th>
						<th style="width: 430px; text-align: center;">사업명</th>
						<th style="width: 100px; text-align: center;">작성자</th>
						<th style="width: 120px; text-align: center;">공고시작일자</th>
						<th style="width: 120px; text-align: center;">공고종료일자</th>
						<th style="width: 120px; text-align: center;">바로가기</th>
					</tr>
				</thead>

				<c:forEach items="${list}" var="list">
					<tr>
						<td style="text-align: center;"><c:out
								value="${list.bam_anc_idx}" /></td>
						<td style="text-align: center;"><a
							href="/bam/businessAnnouncementDetail?bam_anc_idx=${list.bam_anc_idx}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out
									value="${list.anc_title}" /></a></td>
						<td style="text-align: center;"><c:out value="${list.writer}" /></td>
						<td style="text-align: center;"><fmt:formatDate
								value="${list.anc_begin_dt}" pattern="yyyy-MM-dd" /></td>
						<td style="text-align: center;"><fmt:formatDate
								value="${list.anc_end_dt}" pattern="yyyy-MM-dd" />
					<c:choose>
						<c:when test="${member.user_auth == '1'}">
							<td style="text-align: center;"><a href="/bpm/businessPlanApplyList?bam_anc_idx=${list.bam_anc_idx}">접수목록보기</a></td>
						</c:when>
						<c:otherwise>
							<td style="text-align: center;"><a href="/bpm/businessPlanApply?bam_anc_idx=${list.bam_anc_idx}">접수하기</a></td>
						</c:otherwise>
					</c:choose>	
						</tr>
				</c:forEach>
			</table>
			<c:if test="${member.user_auth == '1'}">
				<button type="button" class="writebtn"
					onclick="location.href='businessAnnouncementInput'">사업등록</button>
			</c:if>
			<div class="pasingDiv" style="width: 100%; text-align: center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li><a
							href="businessAnnouncementList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li
							<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
							<a href="businessAnnouncementList${pageMaker.makeSearch(idx)}">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="businessAnnouncementList{pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>
		</form>
	</section>
</body>
</html>
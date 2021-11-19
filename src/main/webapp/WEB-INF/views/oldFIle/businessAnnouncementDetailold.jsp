<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	
	 	<title>사업공고</title>
	</head>
	
<style type="text/css">

	body{
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
			margin :0 20%;
	}
	.writebtn {
		float: right;
		border: 0px;
		background-color: #dd4132;
		color: #ffffff;
		width: 10%;
		height: 5%;
		border-radius: 5px;
		margin-top: 10px;
	}
	
	.filebtn {
		border: 0px;
		background-color: #dd4132;
		color: #ffffff;
		width: 10%;
		height: 5%;
		border-radius: 5px;
		margin-top: 10px;
	}
	
	.evaluator-check {
		border: 0px;
		background-color: #dd4132;
		color: #ffffff;
		width: 10%;
		height: 4%;
		margin-left: 5px;
		border-radius: 5px;
	}
	
	#anc_remark{
		height: 30%;
	}
	
	 .manageBtn{
		
		border : 0px;
		background-color: #86E57F;
		text-align : center;
		color : #ffffff;
		width : 5%;
		height : 50px;
		margin-right : 5px;
		border-radius: 5px;
		float: left;
	}
	.functionBtn{
	
		border : 0px;
		background-color: #dd4132;
		text-align : center;
		color : #ffffff;
		width : 10%;
		height : 50px;
		margin-right : 5px;
		border-radius: 5px;
		float: right;
	}
</style>
	
	<script type="text/javascript">
		
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){
					
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			})
			
			// 목록
			$(".list_btn").on("click", function(){
				
				location.href = "/board/list?page=${scri.page}"
						      +"&perPageNum=${scri.perPageNum}"
						      +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
			
			$("#businessPlanApplyBtn").on("click", function(){
				
				var form = $("form[name='readForm']");
				formObj.attr("action", "/bpm/businessPlanApply");
				form.attr("method","get");
				form.submit();
			})
			
		})
		function fn_fileDown(fileNo){
			var formObj = $("form[name='readForm']");
			$("#FILE_NO").attr("value", fileNo);
			formObj.attr("action", "/board/fileDown");
			formObj.submit();
		}
	</script>
	
	<body>
		<c:if test="${member != null }">
			<div style ="float: right">	</div>
			<header>
				<h1>사업공고</h1>
			</header>
			<hr />
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="bam_anc_idx" name="bam_anc_idx" value="${read.bam_anc_idx}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<input type="hidden" id="FILE_NO" name="FILE_NO" value=""> 
				</form>
				
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">사업 명</label>
					<input type="text" id="anc_title" name="anc_title" class="form-control" value="${read.anc_title}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">작성자</label>
					<input type="text" id="writer" name="writer" class="form-control" value="${read.writer}"  readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">사업 내용</label>
					<input type="text" id="anc_remark" name="anc_remark" class="form-control" readonly="readonly" value="<c:out value="${read.anc_remark}" />"/>
				</div>
				
				<div class="form-group">
					<label for="regdate" class="col-sm-2 control-label">공고 시작일자</label>
					<fmt:formatDate value="${read.anc_begin_dt}" pattern="yyyy-MM-dd" />	
				</div>
				
				<div class="form-group">
					<label for="regdate" class="col-sm-2 control-label">공고 종료일자</label>
					<fmt:formatDate value="${read.anc_end_dt}" pattern="yyyy-MM-dd" />	
				</div>

				 <span>파일 목록</span>
				<div class="form-group" style="border: 1px solid #dbdbdb;">
					
					<c:forEach var="file" items="${file}">
						<a href="#" onclick="fn_fileDown('${file.file_idx}'); return false;">${file.file_sname}</a>(${file.FILE_SIZE})<br>
					</c:forEach>
				</div>
				<hr/>
				<div>
					<!-- <button type="button" class="manageBtn">수정</button>
					<button type="button" class="manageBtn">삭제</button>
					<button type="button" class="manageBtn">목록</button>	 -->
						<button type="button" class="functionBtn" onclick="location.href='../bpm/businessPlanApplyList?bam_anc_idx=${read.bam_anc_idx}'">접수(사업) 목록</button>
					</c:if>
					<c:if test="${member.user_auth == '0'}">
						<button type="button" id="businessPlanApplyBtn" class="functionBtn" onclick="location.href='../bpm/businessPlanApply'">사업계획서 접수</button>
					</c:if>
				</div>
			</section>
	</body>
</html>

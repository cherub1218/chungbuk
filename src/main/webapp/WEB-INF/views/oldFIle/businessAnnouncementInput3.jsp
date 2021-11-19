<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- datepicker 는 jquery 1.7.1 이상 bootstrap 2.0.4 이상 버전이 필요함 -->
<!-- jQuery가 먼저 로드 된 후 datepicker가 로드 되어야함.-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>


<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style type="text/css">
body{
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
			margin :0 20%;
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
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
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

.fileAdd_btn{
	border: 0px;
	background-color: #dd4132;
	color: #ffffff;
	width: 10%;
	height: 5%;
	border-radius: 5px;
	margin-top: 10px;
	margin-bottom: 10px;

}

#fileAddDiv{
	margin-bottom: 10px; 
	
}

#fileDelBtn{
	border: 0px;
	background-color: #dd4132;
	color: #ffffff;
	border-radius: 5px;
	margin-bottom: 10px;	
	margin-right: 50%;
}
</style>

<title>게시판</title>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/bam/businessAnnouncementInputWrite");
				formObj.attr("method", "post");
				formObj.submit();
			});
			fn_addFile();
			
			
		
   
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		function fn_addFile(){
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div id='fileAddDiv'><input type='file' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
			
			
		}
		function open_pop(flag){
			$('#selectEvaluator').show();
		};
		function close_pop(flag) {
            $('#selectEvaluator').hide();
       };
	</script>

<script>
</script>

<body>
	<div class="container" id="root" style="margin-top: 30px;">
		<div style="float: right;">
			<%@include file="../board/nav.jsp"%>
		</div>
		<header>
			<h1>사업 리스트 등록</h1>
		</header>
		<hr />


		<section id="container">
			<form name="writeForm" method="post" action="/bam/businessAnnouncementInputWrite" enctype="multipart/form-data">
				<table>
					<tbody>
						<div class="from-group" style="margin-top: 30px;">
							<label for="title">사업명</label> 
							<input type="text" id="anc_title" name="anc_title" style="margin-left: 47px; padding: 10px; width: 41%; height: 4%;" />
						</div>

					 	<div class="from-group" style="margin-top: 30px;"><label for="date">공고일자</label> 
							<input type="date" name="anc_begin_dt"id="anc_begin_dt" style="margin-left: 30px; width: 20%; height: 4%;"> ~ <input type="date" name ="anc_end_dt" id="anc_end_dt" style="width: 20%; height: 4%;">
							<button class="evaluator-check" type="button" onclick="open_pop()">평가원선택</button>
						</div>

						<div class="from-group" style="margin-top: 30px;">
							<label for="content">내용</label>
							<textarea id="anc_remark" name="anc_remark" class="form-control" title="내용"style="height: 100px;"></textarea>
						</div>
						<div id="fileIndex">	
								<input type="file" id="input-file" style="display: none" />	
								<button class="fileAdd_btn" type="button">파일추가</button>
						</div>
						
						<div class="form-group" style="margin-top: 30px; width: 100%">
							<label for="writer"  style="width: 380px;">작성자</label>
							<input type="text" id="writer"name="writer" class="form-control" value="" style="width: 100px" />
						</div>
						<hr />
					</tbody>
				</table>
						<div>
							<button class="writebtn" type="submit">등록</button>
						</div>
			</form>
			
		</section>
		 <!-- The Modal -->
    <div id="selectEvaluator" class="modal">

      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">평가원 선택</span></b></span></p>
               	<table class="table table-hover">
						<thead>
							<tr>
								<th style="width: 60px; text-align: center;">선택</th>
								<th style="width: 60px; text-align: center;">평가원 서명</th>
								<th style="width: 60px; text-align: center;">아이디</th>
							</tr>
						</thead>
						
						<c:forEach items="${memberList}" var = "memberList">
							<tr>
								<td style="text-align: center;"><input type="checkbox" name="checkedUserId"/></td>
								<td style="text-align: center;"><c:out value="${memberList.user_name}" /></td>
								<td style="text-align: center;"><c:out value="${memberList.user_id}" /> </td>
							</tr>
						</c:forEach>
					</table>
                <p><br /></p>
            <div style="color:#ffffff; pointer;background-color:#dd4132;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                   	 닫기
                </span>
            </div>
      </div>
 
    </div>
        <!--End Modal-->
		
	</div>
</body>
</html>
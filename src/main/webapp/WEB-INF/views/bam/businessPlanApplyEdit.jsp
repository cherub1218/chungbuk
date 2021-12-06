<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<script>

$(document).ready(function(){
	
	$('#bplan_form_title1').keyup(function(){
		
		$('#title1').text(this.value);
		
	})
	
	$('#bplan_form_title2').keyup(function(){
		
		$('#title2').text(this.value);
		
	})
	
	$('#bplan_form_title3').keyup(function(){
		
		$('#title3').text(this.value);
		
	})
	
	$('#bplan_form_title4').keyup(function(){
		
		$('#title4').text(this.value);
		
	})
	
	$('#writeBtn').click(function(){
		$('form').submit();
	})
})
</script>
<body>
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
                        <li>사용자</li>
                        <li>사업공고</li>
                    </ul>
                </section>
                <section class="sect2">
                    <div  class="insideArea row">
     
                <div class="cont">
                    <h2>사업평가리스트</h2>
                    <form name="writeForm" action="<c:url value="/bam/businessPlanApplyEdit"/>" method="post">
                    	<input type="hidden" name="Sbam_anc_idx" value="${param.bam_anc_idx}">
						<ul class="tab d-flex">
							<li data-tab="tab1" class="on"><a href="javascript:void(0)"><input type="text" id="bplan_form_title1" name="bplan_form_title1" placeholder="항목명 입력 ex)연구목표" value=""></a></li>
							<li data-tab="tab2" class=""><a href="javascript:void(0)"><input type="text" id="bplan_form_title2" name="bplan_form_title2" placeholder="항목명 입력 ex)연구내용" value=""></a></li>
							<li data-tab="tab3" class=""><a href="javascript:void(0)"><input type="text" id="bplan_form_title3" name="bplan_form_title3" placeholder="항목명 입력 ex)기대효과"value=""></a></li>
							<li data-tab="tab4" ><a href="javascript:void(0)"><input type="text" id="bplan_form_title4" name="bplan_form_title4" placeholder="항목명 입력 ex)연구 개발비"value=""></a></li>
						</ul>
					</form>
					<div class="p_15">
						<div class="tabcontent current" id="tab1">
							<h2 id="title1">연구목표</h2>
							<div class="btn_wrap text-right">
								<button type="button" class="normal" id="title1Bnt">작성</button>
							</div>
						</div><!--//#tab1-->
						<div class="tabcontent" id="tab2">
							<h2 id="title2">연구내용</h2>
								<div class="btn_wrap text-right">
									<button type="button" class="normal" id="title2Bnt">작성</button>
								</div>
						</div><!--//#tab2-->
						<div class="tabcontent" id="tab3">
							<h2 id="title3">기대효과</h2>
								<div class="btn_wrap text-right">
									<button type="button" class="normal" id="title3Bnt">작성</button>
								</div>
						</div><!--//#tab3-->
						<div class="tabcontent" id="tab4">
							<h2 id="title4">연구 개발비</h2>

								<div class="btn_wrap text-right">
									<button type="button" class="normal" id="title4Bnt">작성</button>
								</div>
						</div><!--//#tab4-->
					</div>
				
                </div>
            </div>
        </section>	
        </div>
        
        </div>
        <footer></footer>
    </div>

	
</body>
</html>

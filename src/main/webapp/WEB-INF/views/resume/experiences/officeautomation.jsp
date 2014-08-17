<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
 <link href="${pageContext.request.contextPath}/resources/resume/css/custom.css" rel="stylesheet">    
 <style>
  
.video-container { 
	position: relative; /* keeps the aspect ratio */ 
	padding-bottom: 56.25%; /* fine tunes the video positioning */ 
	padding-top: 60px; overflow: hidden;
 }
  
.video-container iframe,
.video-container object,
.video-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }
  
.description
{
	margin-bottom: 50px;
}

img
{
	margin-bottom:20px;
}

.align_center
{
	text-align: center;
	font-weight: 800;
}

h2 small
{
	font-size: medium;
}

p
{
	font-size: small;
	font-family: 'Nanum Gothic', sans-serif;
}

table
{
	font-size: small;
	font-family: 'Nanum Gothic', sans-serif;
}

.page_header  
{
	font-family: 'Nanum Gothic', sans-serif;
}
</style>  
    
 <div class="page-header">
 	<h2>Office Automation <br/><small>규칙적인 업무는 프로그램에게 양보하세요</small></h2>
 </div>

<div class="video-container">
	<iframe src="//www.youtube.com/embed/JzlPI2CQCXQ?autoplay=0&amp;wmode=transparent" frameborder="0" ></iframe>	
</div>

<p style="margin-top: 30px;">	
	
		MFC 나 .NET 을 다룰 줄 안다는 것은 오피스를 프로그램으로 제어할 수 있는 능력을 손에 넣은 것입니다.<br><br>
		그렇다면 루틴성 업무를 자동화 하세요! 루틴성 업무란, 매일매일 같은 작업을 반복해야 하는 업무들입니다. 위 영상의 업무는 다음의 순서를 거칩니다.
		<br/>
		<br/>
		1. 인터넷에서 특정 정보를 데이터베이스로 입력.<br/>	
		2. 비지니스 로직을 수행.<br/>
		3. 결과 데이터를 출력하여 엑셀파일로 저장.<br/>
		4. 해당 엑셀파일을 고객 이메일로 첨부하여 전송.<br/><br/>
</p>
		
<div class="table-responsive"">		
	<table class="table">		
		<tr>
			<td>기존 업무 소요 시간</td><td class="align_center">30분</td>
		</tr>
		<tr>
			<td>자동화</td><td class="align_center">1분</td>
		</tr>
		<tr>
			<td>매일 절약 되는 시간</td><td class="align_center">29분</td>
		</tr>		
		<tr>
			<td>한달 절약 되는 시간</td><td class="align_center">580분</td>
		</tr>
		<tr>
			<td>일년 절약 되는 시간</td><td class="align_center">7308분</td>
		</tr>					
	</table>
 </div>
 <p><strong>연 122시간이 공짜로 생겼습니다!</strong></p>
 <p>웹, 엑셀파일, 노가다가, DB가 연관된 업무라면 자동화하세요!<br/>업무자동화와 관련된 상의를 아래 주소로 보내주시면 도움을 드리고 싶습니다.</p>
 <p class="text-muted credit"><a href="mailto:reinitiate@gmail.com">메일 보내기 reinitiate@gmail.com</a></p>

<script type="text/javascript">
	$(function() {
		$("#description").hide();
		$("#more").click(function(){
						$("#description").slideToggle(1000);
		});
		
		var timer = setInterval(function () {
			$("#description").slideDown(1000);
	        clearInterval(timer);
	        }, 5000);
	});
</script>

<script type="text/javascript">
	$(function(){		
		$("li").removeClass("active");
		$("#li_automation").addClass("active");
	});
</script>
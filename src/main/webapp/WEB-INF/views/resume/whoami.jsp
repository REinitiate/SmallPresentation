<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
 <style>
 
 .whoami
 {
 	font-family: 'Nanum Gothic', sans-serif; 	
 	margin-top: 30px; 	
 	font-size: 12px;
 }
 
 .whoami h4
 {
 	font-family: 'Nanum Gothic', sans-serif;
 	font-size:13px; 	
 }
 
 p
 {
 	font-size:small;
 	font-family: 'Nanum Gothic', sans-serif;
 }
 
 </style>
 	<div style="height: 30px;"></div>
 	
 	
 	<div class="whoami">
 		
 		<div class="page-header">
 			<h3><img alt="" src="${pageContext.request.contextPath}/resources/resume/img/whoami/profile2.jpg" width="180px" style="margin-bottom: 20px;"><br/>
 			<p>김 대현<br/>
 			DaeHyun Kim<br/>
 			1987.06.08 출생 (만 27세)
 			</p>
 			</h3>
 		</div>
 		 		
 		<div class="page-header">
 			<p>- 學生 -</p>			
			<p>수능을 두번을 보고 대학을 갔습니다.</p>			
			<p>학부는 산업공학을 전공했습니다.</p>
			<p>석사는 금융공학을 공부했습니다.</p>
			<p>공부를 위한 공부를 싫어합니다.</p>
			<p>이론을 구현하는 것을 좋아합니다.</p>			
		</div>		
 		
 		<div class="page-header">
			<p>- 開發者 -</p>
			<p>개발의 90%가 구글링이라는 사실을 알고 있습니다.</p>
			<p>프로그래밍 전공수업을 들은적은 없습니다</p>
			<p>윈도우 프로그래밍은 C#.NET을, 웹과 서버프로그래밍은 JAVA를 선호합니다.</p>
			<p>실용적인 것을 만드는걸 좋아합니다.</p>
			<p>주(<span style="font-family: serif;">主</span>)가 아닌 수단으로써의 프로그래밍을 지향합니다.</p>
			<p>그러나 개발을 위한 개발은 지양합니다.</p>
			<p>매 순간 두개 이상의 개인프로젝트가 진행되고 있습니다.</p>
			<p>업무를 자동화 하는 것을 좋아합니다.</p><br/>			
		</div>
 	
</div> 

<script>
	$(function(){
		$("li").removeClass("active");
		$("#li_whoami").addClass("active");		
	});
</script>
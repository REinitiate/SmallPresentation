<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<style>
  
  .video-container { 
   position: relative; /* keeps the aspect ratio */ 
   padding-bottom: 56.25%; /* fine tunes the video positioning */ 
   padding-top: 60px; overflow: hidden;
   }
   
	.video-container iframe,
	.video-container object,
	.video-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }
	
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
	
</style>

<div class="page-header">
 	<h3>애니팡 자동화 플레이<br/> <small>4주간 1위 했다는 소문이 있습니다.</small></h3>
 </div>

<div class="video-container" >
	<iframe src="//www.youtube.com/embed/TP-la2j-NPU?autoplay=1&amp;wmode=transparent"" frameborder="0" ></iframe>
</div>
 
 <p style="margin-top: 30px;">프로그래밍을 공부하려면 '목적'을 먼저 정의하고 그것을 달성하기 위한 '기능'을 리스트업 하고 기능구현을 위한 '기술 키워드'를 매칭시킵니다. 그리고 그 기술키워드를 집중적으로 공부하면 됩니다. 그래야 재미있고 성취감 폭발하는 코딩이 됩니다.
	<br/><br/>목적 : "애니팡을 1위 하고 싶다. 애니팡을 PC에서 제어하여 알고리즘으로 플레이."
	<br/><br/>
</p>

<table class="table">
	<thead>
		<tr><th>기능</th><th>기술키워드</th></tr>
	</thead>
	<tr>
		<td>안드로이드 게임을 PC에서 제어할 수 있어야 함.</td><td>MOBIZEN(시중프로그램)</td>
	</tr>
	<tr>
		<td>윈도우의 화면을 RGB pixel 로 RAM 위에 올려놓음.</td><td>.NET Window와 Bitmap 관련 Class</td>
	</tr>
	<tr>
		<td>매 초마다 실시간으로 변화를 감지.</td><td>.NET Timer</td>
	</tr>		
	<tr>
		<td>PC에서 마우스로 원하는 위치에 클릭과 드래그를 할 수 있어야 함.</td><td>Win32 API</td>
	</tr>			
</table>

<script type="text/javascript">
	$(function(){		
		$("li").removeClass("active");
		$("#li_anipang").addClass("active");
	});
</script>
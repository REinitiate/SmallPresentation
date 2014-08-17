<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

.img_container
    {
    	margin-top: 20px;
    	margin-bottom: 20px;
    }
    
    /* Large desktop */
	@media (min-width: 1200px) {
		img
		{
			width: 100%;
		}
		#last_img
		{
			width: 100%;
		}
	}
	
	/* Portrait tablet to landscape and desktop */
	@media (min-width: 768px) and (max-width: 979px) {
		img
		{
			width: 100%;
		}
		#last_img
		{
			width: 100%;
		}
	}
	
	/* Landscape phone to portrait tablet */
	@media (max-width: 767px) {
		img
		{
			width: 100%;
		}
		#last_img
		{
			width: 100%;
		}
	}
	
	/* Landscape phones and down */
	@media (max-width: 480px) {
		img
		{
			width: 100%;
		}
	}
	
	.description
	{
		margin-bottom: 50px;
	}
	
	img
	{
		margin-bottom:20px;
	}
	
</style>


<script type="text/javascript">
	$(function(){
		//$(".description").hide();
		var timer = setInterval(function () {
			//$(".description").slideDown(1000);
	        //clearInterval(timer);
	        }, 1500);
	});
	
	
</script>

<div class="page-header">
 	<h2>Finance &amp; MFC<br/><small>프로그래밍은 두꺼운 책이 아니라, 매뉴얼 없는 레고조립이다.</small></h2>
 </div>
    
    
<div class="mfcpractice"  align="center">
	
	<div id="description" style="margin-top: 0px; margin-bottom: 40px;">
			2009년 06월
			<br/><br/>학부 3학년에 '투자공학연구실' 을 들어가서<br/>
			이스트소프트에서 병특을 마친 프로그래밍 선생님을 만나 MFC를 만남. 			
	 </div>
	 <img class="mg-rounded" alt="" src="/RSM/experiences/img/mfc1.jpg" >
	 <div id="description" class="description">	 				
			<p><em>"형! 프로그램으로 어떻게 그림 그려요?" 라는 질문에 최선생님은 DC(device context)를 찾아보라고 하셨다.</em></p>
	 </div>	 
	 <img alt="" src="/RSM/experiences/img/mfc2.jpg">
	 <div id="description" class="description">
			<p><em>접하게 된 프로그래밍은 내 하드디스크만으로는 비좁았다. 당연한 수순으로 네트워크와 API를 찾게됨.</em></p>	
	 </div>
	 <img alt="" src="/RSM/experiences/img/mfc3.jpg">
	 <div id="description" class="description">	 				
			<p><em>네트워크를 배우니 어디서 굴러떨어지는 데이터들이 생겼고 데이터를 예전에 접했던 device context 를 통해서 보기 좋게 표현하고 싶어짐.</em></p> 			
	 </div>
	 <img alt="" src="/RSM/experiences/img/mfc4.jpg">
	 <div id="description" class="description">
	 		<p>KIRUDA Algorithm Trading Practice	<br>	
			<em>MFC가 익숙해지니 시스템 트레이딩이 손가락 사이로 미끄러져 나가는 것을 느낌.</em></p> 			
	 </div>
	 <img alt="" src="/RSM/experiences/img/mfc5.jpg">
	 <div id="description" class="description">		
			<p><em>에라 모르겠다 3D가 뭐 별거냐.</em></p> 			
	 </div>
	 <img alt="" src="/RSM/experiences/img/mfc6.jpg">
	 <div id="description" class="description">		
			<p><em>처음으로 제대로 된 시스템 트레이딩을 경험함. 	직관을 제공해주신 장연식 선배의 사진을 프로그램 전면에.</em></p> 			
	 </div>
	 <img id = "last_img" alt="" src="/RESUME/experiences/img/mfc7.jpg">
	 <div id="description" class="description">		
	 		2010년 1월
			<br/><br/>			
			두꺼운 책에서 나온 것이 아닌 <br/>
			나의 필요와 흥미에서 나온 프로그래밍을 경험함.			
	 </div>
	 <p>
	 다시한번 느끼지만, 내 옆자리에 있는 사람이 나에게 얼마나 중요한지...
	 </p>
	 <div align="right">
	 updated 2013.01
	 </div>
 </div>
 
 <script type="text/javascript">
	$(function(){		
		$("li").removeClass("active");
		$("#li_mfc").addClass("active");
	});
</script>

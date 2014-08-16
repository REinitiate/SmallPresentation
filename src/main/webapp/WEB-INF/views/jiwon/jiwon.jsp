<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<%
	String contentsType = (String)request.getAttribute("type"); // url, str
	String contents = (String)request.getAttribute("contents"); // 위 타입이 url 일 경우에는 위와 같겠다.
%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
    <title>To Jiwon</title>

    <!-- Core CSS - Include with every page -->
    <!--  <link href="resources/css/bootstrap.min.css" rel="stylesheet"> -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">    
    <link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Dashboard -->
    <link href="${pageContext.request.contextPath}/resources/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/plugins/timeline/timeline.css" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    
    <link href="${pageContext.request.contextPath}/resources/fonts/NanumPenScript/stylesheet.css" rel="stylesheet">    
    <link href="${pageContext.request.contextPath}/resources/css/jenny.css" rel="stylesheet">
    
    <script>
	if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
		  var msViewportStyle = document.createElement("style")
		  msViewportStyle.appendChild(
		    document.createTextNode(
		      "@-ms-viewport{width:auto!important}" )
		  )
		  document.getElementsByTagName("head")[0].appendChild(msViewportStyle)
		}
	</script>
	
	<!-- font-family: 'Nanum Brush Script', cursive; -->
	<style>
		h2
		{	
			font-family: 'NanumPen',sans-serif;
			font-size: xx-large;
			line-height: normal;
		}
		h3
		{	
			font-family: 'NanumPen',sans-serif;
			font-size: large;
			line-height: normal;
		}
		h4
		{			
			font-family: 'NanumPen',sans-serif;
			font-size: large;
			line-height: normal;
		}
	</style>
</head>
<body>

<div class="container">

	<div class="row" align="center" style="margin-top: 50px;">
		<div id="page_0" class="col-md-6 col-md-offset-3" role="main">						
			<h2>최지원에게 주는 편지</h2>			
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_0" type="button" class="btn btn-primary">입장</button>			  		  
			</div>
		</div>
		
		<div id="page_1" class="col-md-6 col-md-offset-3" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_jiwon/angry.jpg' width="70%"/>			
			<h4>어떻게 이럴수가 있어?</h4>
			<h4>꼴랑 이틀을 못기다려서.. 딴 남자한테 가버리냐?</h4>		
			<h4>미친거 아니야? 정신나갔어?</h4>			
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_1" type="button" class="btn btn-primary">미안해</button>
			  <button id="btn_rj_1" type="button" class="btn btn-default">어쩌라고 꺼져</button>		  
			</div>
		</div>
		
		<div id="page_2" class="col-md-6 col-md-offset-3" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_jiwon/melona.jpg' width="50%">			
			<h4>...</h4>
			<h4>너무 편했던 동생이 갑자기 여자로 보인게</h4>
			<h4>그게 언제였냐하면..</h4>					
			<h4>그 놈의 딸기맛 메로나가 뭔지.. 그걸 먹는게 아니었는데..</h4>
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_2" type="button" class="btn btn-primary">다음</button>			  		  
			</div>
		</div>
		
		<div id="page_3" class="col-md-6 col-md-offset-3" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_jiwon/rose.png' width="50%">
			<h4>당장이라도 151번 타고</h4>
			<h4>장미꽃이라도 사들고 가서 진지하게 고백하고 싶지만</h4>
			<h4>지금 내가 너무 약해져 있는데</h4>
			<h4>더 이상 찌질해지면 나 정말 가루가 되버릴 것 같아서</h4>					
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_3" type="button" class="btn btn-primary">다음</button>			  		  
			</div>
		</div>
		
		<div id="page_4" class="col-md-6 col-md-offset-3" role="main">		
			<img src='${pageContext.request.contextPath}/resources/img_jiwon/dream.jpg' width="50%">
			<h4>먼저, 오빠는 니가 꼭</h4>
			<h4>하고 싶은 일 찾았으면 좋겠어.</h4>					
			<h4>회사라는게 하루에 보내는 시간의 대부분인데</h4>
			<h4>이왕이면 보람차고 재밌다고 느낄 수 있는 그런 일이 어딘가 꼭 있을꺼야!</h4>
			<h4>아직 넌 어리니까 꼭 도전하길 바래.</h4>
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_4" type="button" class="btn btn-primary">다음</button>			  		  
			</div>
		</div>
		
		<div id="page_5" class="col-md-6 col-md-offset-3" role="main">		
			<img src='${pageContext.request.contextPath}/resources/img_jiwon/phone.jpg' width="50%">
			<h4>그리고 그 동안..</h4>
			<h4>갑자기 대뜸 전화해서</h4>
			<h4>퉁명스럽고, 시비걸고</h4>
			<h4>정말 어이없었을 텐데..</h4>
			<h4>그래도 전화 받아줘서 너무 고마워.</h4>
			<h4>잠시였지만 너한테 의지했던 것 같네..</h4>
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_5" type="button" class="btn btn-primary">다음</button>			  		  
			</div>
		</div>
		
		<div id="page_6" class="col-md-6 col-md-offset-3" role="main">		
			<img src='${pageContext.request.contextPath}/resources/img_jiwon/sad.jpg' width="30%">								
			<h4>상황이 이렇게 되서</h4>			
			<h4>상처 위에 상처가 난 것 같아서 쓰리고 아파.</h4>
			<h4>엄청 외롭고..</h4>
			<h4>나 홀로 남겨진 기분이 들어..</h4>
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_6" type="button" class="btn btn-primary">다음</button>			  		  
			</div>
		</div>
		
		<div id="page_7" class="col-md-6 col-md-offset-3" role="main">		
			<img src='${pageContext.request.contextPath}/resources/img_jiwon/meet.jpg' width="50%">			
			<h4>이렇게 내 마음을 스스로 알아버려서</h4>
			<h4>당분간은 연락 못하겠지만</h4>
			<h4>3년만에 우리 이렇게 다시 연락한것 처럼</h4>
			<h4>어느날 갑자기 또 아무렇지 않게 연락하게 될지도 모르겠지.</h4>
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_7" type="button" class="btn btn-primary">다음</button>			  		  
			</div>
		</div>
		
		<div id="page_8" class="col-md-6 col-md-offset-3" role="main">		
			<!-- <img src='${pageContext.request.contextPath}/resources/img_jiwon/meet.jpg' width="50%">  -->
			<h4>하지만. 지금은,</h4>			
			<h4>진심으로, 진심으로 너의 새 출발을 응원해.</h4>
			<h4>그리고 꼭 행복했으면 좋겠어.</h4>
			<h4>새로 만나는 그분이 진짜 멋진 분이었으면 좋겠다.</h4>
			<h4></h4>
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_8" type="button" class="btn btn-primary">다음</button>			  		  
			</div>
		</div>
		
		<div id="page_9" class="col-md-6 col-md-offset-3" role="main">
		
			<h4>PS..</h4>			
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_9" type="button" class="btn btn-primary">다음</button>			  		  
			</div>
			
		</div>
		
		<div id="page_10" class="col-md-6 col-md-offset-3" role="main">
		
			<img src='${pageContext.request.contextPath}/resources/img_jiwon/jiwon2.jpg' width="50%">
				<h4>넌 이 사진이 제일 이쁘니까</h4>
				<h4>이 사진 카톡사진으로 해..</h4>			
				<div class="btn-group" style="margin-top: 50px;">
				  <button id="btn_ok_10" type="button" class="btn btn-primary">다음</button>			  		  
				</div>
		</div>
		
		<div id="page_11" class="col-md-6 col-md-offset-3" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_jiwon/jiwon1.jpg' width="50%">
			<h4>룸메랑 같이 찍은 사진도 이뻐</h4>
			<h4>나 오지랍 또 작렬한다..</h4>			
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_11" type="button" class="btn btn-primary">다음</button>			  		  
			</div>
		</div>
		
		<div id="page_12" class="col-md-6 col-md-offset-3" role="main">						
			<h4>너가 엄청 좋은 애라는걸</h4>			
			<h4>스스로 알았으면 좋겠네..</h4>
			<h4>..</h4>
			<h4>안녕.</h4>
			<h4><br/></h4>
			<h4>-대현</h4>
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_12" type="button" class="btn btn-primary">닫기</button>			  		  
			</div>
		</div>
		
		<div id="page_2_1" class="col-md-6 col-md-offset-3" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_jiwon/forgive.jpg'/ width="50%">			
			<h4>잘못했어요.. 제발요..</h4>
			<h4>뒤로가기를 눌러주세요</h4>
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_2_1" type="button" class="btn btn-primary">송윤아를 닮은 지원님의 뒤로가기</button>			  		  
			</div>
		</div>
		
	</div>
	
	</div>
	 
	<audio class="audio_player" autoplay="autoplay" loop="loop" controls>
		<source src="${pageContext.request.contextPath}/resources/audio/SleepAway.wav" type="audio/wav">
		<source src="${pageContext.request.contextPath}/resources/audio/SleepAway.oog" type="audio/ogg">
		<source src="${pageContext.request.contextPath}/resources/audio/SleepAway.mp3" type="audio/mpeg">	
	</audio>
		
	
	<script>
	$(function(){
		
		var trans_itv = ["slide", {direction :"right"}, "slow"];
		
		$('#page_1').hide();
		$('#page_2').hide();
		$('#page_2_1').hide();
		$('#page_3').hide();
		$('#page_4').hide();
		$('#page_5').hide();
		$('#page_6').hide();
		$('#page_7').hide();
		$('#page_8').hide();
		$('#page_9').hide();
		$('#page_10').hide();
		$('#page_11').hide();
		$('#page_12').hide();
		
		$('#btn_ok_2_1').bind('click', function(){
			$('#page_1').show(trans_itv);
			$('#page_2_1').hide(trans_itv);
		});
		
		$('#btn_ok_0').bind('click', function(){			
			$('#page_0').hide(trans_itv);
			$('#page_1').show(trans_itv);
		});
		
		$('#btn_ok_1').bind('click', function(){			
			$('#page_1').hide(trans_itv);
			$('#page_2').show(trans_itv);
		});
		
		$('#btn_rj_1').bind('click', function(){
			$('#page_1').hide(trans_itv);
			$('#page_2_1').show(trans_itv);
		});
		
		$('#btn_ok_2').bind('click', function(){
			$('#page_3').show(trans_itv);
			$('#page_2').hide(trans_itv);
		});
		
		$('#btn_ok_3').bind('click', function(){
			$('#page_4').show(trans_itv);
			$('#page_3').hide(trans_itv);
		});
		
		$('#btn_ok_4').bind('click', function(){
			$('#page_5').show(trans_itv);
			$('#page_4').hide(trans_itv);
		});
		
		$('#btn_ok_5').bind('click', function(){
			$('#page_6').show(trans_itv);
			$('#page_5').hide(trans_itv);
		});
		
		$('#btn_ok_6').bind('click', function(){
			$('#page_7').show(trans_itv);
			$('#page_6').hide(trans_itv);
		});
		
		$('#btn_ok_7').bind('click', function(){
			$('#page_8').show(trans_itv);
			$('#page_7').hide(trans_itv);
		});
		
		$('#btn_ok_8').bind('click', function(){
			$('#page_9').show(trans_itv);
			$('#page_8').hide(trans_itv);
		});
		
		$('#btn_ok_9').bind('click', function(){
			$('#page_10').show(trans_itv);
			$('#page_9').hide(trans_itv);
		});
		
		$('#btn_ok_10').bind('click', function(){
			$('#page_11').show(trans_itv);
			$('#page_10').hide(trans_itv);
		});
		
		$('#btn_ok_11').bind('click', function(){
			$('#page_12').show(trans_itv);
			$('#page_11').hide(trans_itv);
		});
		
		$('#btn_ok_12').bind('click', function(){
			$('#page_12').hide(trans_itv);
			$('#page_11').hide(trans_itv);
		});
		
	});
	
	</script>   

    <!-- Core Scripts - Include with every page -->    
    
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>

    <!-- Page-Level Plugin Scripts - Dashboard -->
    <script src="${pageContext.request.contextPath}/resources/js/plugins/morris/raphael-2.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/morris/morris.js"></script>

    <!-- SB Admin Scripts - Include with every page -->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin.js"></script>
</body>

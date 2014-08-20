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
	
    <title>Happy BirthDay!</title>

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
			<h2>정혜영의 생일을 축하하며..</h2>
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_0" type="button" class="btn btn-primary">입장</button>			  		  
			</div>
		</div>
		
		<div id="page_1" class="col-md-6 col-md-offset-3" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_letters/hyeyoung/god1.jpg' width="50%"/>			
			<h4>혜영아 계상오빠야</h4>
			<h4>우리 혜영이 콘서트할때 오빠가 지켜봤어...</h4>		
			<h4>키좀 더 커야 겠더라... 잘 안보여...</h4>
			<h4>생일 축하한다!</h4>			
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_1" type="button" class="btn btn-primary">오빠사랑해요</button>
			  <button id="btn_rj_1" type="button" class="btn btn-default">시비걸지마라</button>		  
			</div>
		</div>
		
		<div id="page_2" class="col-md-6 col-md-offset-3" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_letters/hyeyoung/god2.jpg' width="50%">
			<h4>나도 왔다 혜영아.</h4>			
			<h4>나는 우리 혜영이 위해서</h4>
			<h4>생일 노래를 불러주려구..</h4>
			<h4>어머님은 짜장면이 실타고 하셧어~</h4>					
			<h4><small>엇.. 이노래가 아닌가..</small></h4>
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_2" type="button" class="btn btn-primary">고마워요 오빠</button>			  		  
			</div>
		</div>
		
		<div id="page_3" class="col-md-6 col-md-offset-3" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_letters/hyeyoung/god3.jpg' width="50%">
			<h4>Whatsup yo~</h4>
			<h4>Hiphop yo~</h4>
			<h4>나 니 아빠뻘 yo~</h4>
			<h4>Happy birthday Hyeyoung yo~</h4>								
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_3" type="button" class="btn btn-primary">아빠 사랑해요</button>			  		  
			</div>
		</div>
		
		<div id="page_4" class="col-md-6 col-md-offset-3" role="main">		
			<img src='${pageContext.request.contextPath}/resources/img_letters/hyeyoung/god4.jpg' width="50%">
			<h4>생일 축하해 혜영아</h4>
			<h4>나 요즘 너무 돼지인 거 같아</h4>					
			<h4>용서해 주겠니?</h4>			
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_4" type="button" class="btn btn-primary">괜찮아요 오빠 돼지여도 사랑해요</button>			  		  
			</div>
		</div>
		
		<div id="page_5" class="col-md-6 col-md-offset-3" role="main">		
			<img src='${pageContext.request.contextPath}/resources/img_letters/hyeyoung/god5.jpg' width="50%">
			<h4>...</h4>
			<h4>......</h4>
			<h4>오빠랑 결혼해주겠니?</h4>			
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_5" type="button" class="btn btn-primary">네!</button>			  		  
			</div>
		</div>
		
		<div id="page_6" class="col-md-6 col-md-offset-3" role="main">		
			<img src='${pageContext.request.contextPath}/resources/img_letters/angry.jpg' width="70%">								
			<h4>어떻게 이럴 수가 있어?</h4>			
			<h4>어떻게 딴 오빠들 말고 지오디 때문에 귀국할 수 있어?</h4>
			<h4>미친거 아니야 이 기지배야?</h4>
			<h4>대현오빠는 왜 쩌리취급해?</h4>			
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_6" type="button" class="btn btn-primary">다음</button>			  		  
			</div>
		</div>
		
		<div id="page_7" class="col-md-6 col-md-offset-3" role="main">		
			<img src='${pageContext.request.contextPath}/resources/img_letters/hyeyoung/god_total.jpg' width="50%">			
			<h4>god가 혜영이의 생일을</h4>
			<h4><small>(GOD아닙니다 god입니다.)</small></h4>
			<h4><strong>축하합니다!</strong></h4>
			<br/>
			<br/>
			<h4>어서 혜영이가 귀국하는 겨울이 오길!</h4>
			<h4>-대현</h4>			
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_7" type="button" class="btn btn-primary">나가기</button>			  		  
			</div>
		</div>		
		
		<div id="page_2_1" class="col-md-6 col-md-offset-3" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_letters/forgive.jpg'/ width="50%">			
			<h4>잘못했어요.. 제발요..</h4>
			<h4>뒤로가기를 눌러주세요</h4>
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_2_1" type="button" class="btn btn-primary">뒤로가기</button>			  		  
			</div>
		</div>
		
	</div>
	
	</div>	
	
	<script>
	$(function(){
		
		if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {		
			// some code..		
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
		}
		else{
			$('#page_0').hide();
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
			alert('모바일로 접속하세요');
		}
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

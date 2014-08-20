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
	
    <title>Suggestion</title>

    <!-- Core CSS - Include with every page -->
    <!--  <link href="resources/css/bootstrap.min.css" rel="stylesheet"> -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">    
    <link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
    
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
	<script src="js/jquery-1.10.2.js"></script>
	
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

	<div class="row" align="center" style="margin-top: 50px;">
	
		<div id="page_1" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_letters/concern.jpg'/>			
			<h4>언니..아프시다면서요...</h4>
			<h4>걱정되서 찾아왔어요</h4>
			<h4>빈손으로 온건 아니고..</h4>
			<h4><strong>힘내시라고 잘생긴 남자들좀 데리고 왔어요</strong></h4>		
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_1" type="button" class="btn btn-default">누가 찾아왔는지 보죠?</button>			  		  
			</div>
		</div>
		
		<div id="page_2" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_letters/prince1.jpg' width="50%">			
			<h4>제니 아프다면서 빨리 나아야지..</h4>					
			<h4>다 나으면 오빠랑 독사과 한잔 하지 않으련?</h4>
			<h4>-백설공주 왕자(이름모름)</h4>			
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_2" type="button" class="btn btn-default">다음왕자 만나기</button>			  		  
			</div>
		</div>
		
		<div id="page_3" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_letters/prince2.jpg' width="50%">			
			<h4>걱정되서 라푼젤도 버리고 왔어!</h4>					
			<h4>혼나기 전에 빨리 돌아가야겠다 빨리 나아!</h4>
			<h4>-라푼젤 왕자(이름모름)</h4>			
			<h4><small>디즈니 왕자들은 이름도 원래 없어?</small></h4>
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_3" type="button" class="btn btn-default">다음왕자 만나기</button>			  		  
			</div>
		</div>
		
		<div id="page_4" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_letters/prince3.jpg' width="50%">			
			<h4>빨리 나아서 같이 놀자!</h4>
			<h4><small>나는 보물을 찾아야되서 바쁘겠지만 김대현이 놀아줄지도..</small></h4>
			<h4>-알라딘</h4>			
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_4" type="button" class="btn btn-default">다음왕자 만나기</button>			  		  
			</div>
		</div>
		
		<div id="page_5" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_letters/prince4.jpg' width="50%">			
			<h4>나는 어디서 나오는지 왕자인지 알수가 없어..</h4>
			<h4>다만 나는 성룡이랑 좀 닮은거 같아..</h4>
			<h4>뭐 어찌되었건.. 기운내자</h4>
			<h4>-나는 누구?</h4>			
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_5" type="button" class="btn btn-default">많이도 찾아왔네요!</button>			  		  
			</div>
		</div>
		
		<div id="page_6" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_letters/prince_multi.jpg' width="100%">			
			<h4><strong>디즈니 왕자님들이 Jenny의 쾌유를 기원합니다!</strong></h4>						
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_6" type="button" class="btn btn-default">마지막 손님</button>			  		  
			</div>
		</div>
		
		<div id="page_7" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_letters/sgt.jpg' width="50%">			
			<h3>언니 저도 있어요...</h3>						
			<h3><small>항상 기다릴게요...</small></h3>
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_7" type="button" class="btn btn-default">처음으로</button>			  		  
			</div>
		</div>
		
		
	</div>
		
	 
	<div>
		
	</div>
	
	<script>
	$(function(){
		
		var trans_itv = ["pop", {direction :"right"}, "slow"];
		
		$('#page_2').hide();
		$('#page_3').hide();
		$('#page_4').hide();
		$('#page_5').hide();
		$('#page_6').hide();
		$('#page_7').hide();
		
		$('#btn_ok_1').bind('click', function(){			
			$('#page_1').hide(trans_itv);
			$('#page_2').show(trans_itv);
		});
		
		$('#btn_ok_2').bind('click', function(){
			$('#page_2').hide(trans_itv);
			$('#page_3').show(trans_itv);
		});
		
		$('#btn_ok_3').bind('click', function(){
			$('#page_3').hide(trans_itv);
			$('#page_4').show(trans_itv);
		});
		
		$('#btn_ok_4').bind('click', function(){
			$('#page_4').hide(trans_itv);
			$('#page_5').show(trans_itv);
		});
		
		$('#btn_ok_5').bind('click', function(){
			$('#page_5').hide(trans_itv);
			$('#page_6').show(trans_itv);
		});
		
		$('#btn_ok_6').bind('click', function(){
			$('#page_6').hide(trans_itv);
			$('#page_7').show(trans_itv);
		});
		
		$('#btn_ok_7').bind('click', function(){
			$('#page_7').hide(trans_itv);
			$('#page_1').show(trans_itv);
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

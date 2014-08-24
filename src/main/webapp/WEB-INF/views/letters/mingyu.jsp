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
	
	var trans_itv = ["slide", {direction :"right"}, "slow"];
	
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

	<div class="row" align="center" style="margin-top: 50px; text-align: center;">
		
		
		<div id="page_1" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_letters/hyunji/kitty1.jpg' width="40%">			
			<h4>앙뇽하세요? 저는 키티에용</h4>
			<h4>요즘 밍규 많이 못봐서 아쉽죠?<br/>그런 의미에서 제가 좋은거 하나를 준비했어요.</h4>
			<h4><small>들어 주실거죠?</small></h4>								
			<div class="btn-group" style="margin-top: 50px;">
			  <button type="button" class="btn btn-primary" onclick="$('#page_1').hide(trans_itv); $('#page_2').show(trans_itv);">수락한다</button>			  		  
			  <button type="button" class="btn btn-default" onclick="$('#page_1').hide(trans_itv); $('#page_2_1').show(trans_itv);">거절한다</button>
			</div>
		</div>
		
		<div id="page_2_1" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_letters/hyunji/kitty_rj.jpg'  width="40%">			
			<h4><strong>키티는 맹수야. 어흥~</strong></h4>					
			<h4><small>어서 다시 뒤로 가~</small></h4>
			<div class="btn-group" style="margin-top: 50px;">
			  <button type="button" class="btn btn-primary" onclick="$('#page_2_1').hide(trans_itv); $('#page_1').show(trans_itv);">아름다운 현지님의 뒤로가기</button>			  		  
			</div>
		</div>
		
		<div id="page_2" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_letters/hyunji/kitty3.jpg' width="40%">			
			<h4>뭐냐면.. 바로 에바항공 키티비행기 자유이용권이에요!!</h4>
			<h4>밍규와 함께하는 여행 좋죠?</h4>		
			<div class="btn-group" style="margin-top: 50px;">
			  <button type="button" class="btn btn-primary" onclick="$('#page_2').hide(trans_itv); $('#page_3').show(trans_itv);">좋아!</button>
			  <button type="button" class="btn btn-default" onclick="$('#page_2').hide(trans_itv); $('#page_2_2').show(trans_itv);">흥!</button>		  
			</div>
		</div>
		
		
		<div id="page_2_2" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_letters/hyunji/kitty_rj_2.jpg' width="80%">			
			<h4>동심파괴해버린다. 나 36살이다.</h4>
			<h4>어서 뒤로 돌아가</h4>
			<div class="btn-group" style="margin-top: 50px;">
			  <button type="button" class="btn btn-primary" onclick="$('#page_2_2').hide(trans_itv); $('#page_2').show(trans_itv);">아름다운 현지님의 뒤로가기</button>			  		  
			</div>
		</div>
		
		
		<div id="page_3" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_letters/hyunji/kitty5.jpg' width="40%">			
			<h4 class="success"><strong>수락해서 고마워용!</strong></h4>
			<h4>제가 요런 방도 준비해놓을게요♥</h4>
			<h4></br></h4>
			<h4><a class="fa fa-phone" href="tel:01026367963"></a></h4>
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_first" type="button" class="btn btn-primary"  onclick="$('#page_3').hide(trans_itv); $('#page_1').show(trans_itv);">처음으로</button>			  		  
			</div>
		</div>
	</div>
		
	 
	<div>
		
	</div>
	
	<script>
	$(function(){
		
		if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
		//if(true) {
			var trans_itv = ["slide", {direction :"right"}, "slow"];			
			$('#page_2').hide();
			$('#page_2_1').hide();
			$('#page_2_2').hide();
			$('#page_3').hide();
			$('#page_4').hide();			
		}
		else{
			$('#page_1').hide();
			$('#page_2').hide();
			$('#page_2_1').hide();
			$('#page_2_2').hide();
			$('#page_3').hide();			
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
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
			<img src='${pageContext.request.contextPath}/resources/img_letters/wonhee/pooh.jpg'/>			
			<h4>안녕하세요 원희 누나?</h4>
			<h4>좋은 주말 보내고 있어요?</h4>
			<h4>진모가 다음주 수요일에 밥 같이 먹을 수 있냐고 물어봐 달라던데..</h4>
			<h4><small>어떠세요..?</small></h4>					
			<div class="btn-group" style="margin-top: 50px;">
			  <button type="button" class="btn btn-primary" onclick="$('#page_1').hide(trans_itv); $('#page_2').show(trans_itv);">수락한다</button>			  		  
			  <button type="button" class="btn btn-default" onclick="$('#page_1').hide(trans_itv); $('#page_2_1').show(trans_itv);">거절한다</button>
			</div>
		</div>
		
		<div id="page_2_1" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_letters/wonhee/failure.jpg'/ width="50%">			
			<h4>제발 거절하지 말아주세요..</h4>					
			<h4><small>진모가 삐뚤어진대요..</small></h4>
			<div class="btn-group" style="margin-top: 50px;">
			  <button type="button" class="btn btn-primary" onclick="$('#page_2_1').hide(trans_itv); $('#page_1').show(trans_itv);">아름다운 원희님의 뒤로가기</button>			  		  
			</div>
		</div>
		
		<div id="page_2" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_letters/cat.jpg'/ width="50%">			
			<h4>그나저나.. 진모가 아침에 기다리게해서</h4>
			<h4>너무 죄송하대요.. 용서해 주실꺼죠?</h4>		
			<div class="btn-group" style="margin-top: 50px;">
			  <button type="button" class="btn btn-primary" onclick="$('#page_2').hide(trans_itv); $('#page_3').show(trans_itv);">그래</button>
			  <button type="button" class="btn btn-default" onclick="$('#page_2').hide(trans_itv); $('#page_2_2').show(trans_itv);">흥!</button>		  
			</div>
		</div>
		
		
		<div id="page_2_2" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_letters/die.jpg' width="50%">			
			<h4>부디 자비를...</h4>
			<div class="btn-group" style="margin-top: 50px;">
			  <button type="button" class="btn btn-primary" onclick="$('#page_2_2').hide(trans_itv); $('#page_2').show(trans_itv);">아름다운 원희님의 뒤로가기</button>			  		  
			</div>
		</div>
		
		
		<div id="page_3" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_letters/wonhee/success.jpg'/ width="40%">			
			<h3 class="success"><strong>데이트 신청이 수락되었습니다!</strong></h3>					
			<h4>자세한 내용은 카톡으로..</h4>
			<h4></br></h4>
			<h4><a class="fa fa-phone" href="tel:01082566068"></a></h4>
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
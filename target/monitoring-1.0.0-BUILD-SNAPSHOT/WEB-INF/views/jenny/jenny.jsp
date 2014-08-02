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

    <!-- Page-Level Plugin CSS - Dashboard -->
    <link href="${pageContext.request.contextPath}/resources/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/plugins/timeline/timeline.css" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet">
    
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>            
    
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
		h3
		{
			font-family: 'Nanum Brush Script', cursive;
		}
		h4
		{
			font-family: 'Nanum Brush Script', cursive;
		}
	</style>
</head>
<body>

	<div class="row" align="center" style="margin-top: 50px;">
		<div id="page_1" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_jenny/pig.jpg'/>			
			<h4>안녕하세요 제니 언니?</h4>
			<h4>대현이가 같이 밥 먹을 수 있냐고 물어봐 달라던데? 어떠세요?</h4>		
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_1" type="button" class="btn btn-primary">수락한다</button>
			  <button id="btn_rj_1" type="button" class="btn btn-default">거절한다</button>		  
			</div>
		</div>
		
		<div id="page_2" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_jenny/sad-mickey.jpg'/ width="50%">			
			<h4>근데 건방진 대현이가 이번 주중에 꼭 해야할 일이 있다면서..</h4>
			<h4>혹시 주말에 볼 수 있냐고 물어봐 달라네요? 이놈자식!</h4>		
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_2" type="button" class="btn btn-primary">그래도 수락한다 난 자애로우니까</button>
			  <button id="btn_rj_2" type="button" class="btn btn-default">거절한다 건방진놈</button>		  
			</div>
		</div>
		
		<div id="page_2_1" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_jenny/die.jpg'/ width="50%">			
			<h4>뒤로가기를 눌러주세요.. 제발요..</h4>					
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_3_1" type="button" class="btn btn-primary">려원을 닮은 지은님의 뒤로가기</button>			  		  
			</div>
		</div>
		
		<div id="page_3" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_jenny/die.jpg'/ width="50%">			
			<h4>뒤로가기를 눌러주세요.. 제발요..</h4>					
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_ok_3" type="button" class="btn btn-primary">려원을 닮은 지은님의 뒤로가기</button>			  		  
			</div>
		</div>
		
		<div id="page_4" class="col-md-6" role="main">
			<img src='${pageContext.request.contextPath}/resources/img_jenny/two-lion.jpg'/ width="60%">			
			<h3 class="success"><strong>에프터신청이 수락되었습니다!</strong></h3>					
			<h4>자세한 내용은 카톡으로..</h4>
			<div class="btn-group" style="margin-top: 50px;">
			  <button id="btn_first" type="button" class="btn btn-primary">처음으로</button>			  		  
			</div>
		</div>
		
	</div>
		
	 
	<div>
		
	</div>
	
	<script>
	$(function(){
		
		var trans_itv = ["slide", {direction :"right"}, "slow"];
		
		$('#page_2').hide();
		$('#page_2_1').hide();
		$('#page_3').hide();
		$('#page_4').hide();
		
		$('#btn_ok_1').bind('click', function(){
			alert('좋은 선택이에요!');
			$('#page_1').hide(trans_itv);
			$('#page_2').show(trans_itv);
		});
		
		$('#btn_rj_1').bind('click', function(){
			$('#page_1').hide(trans_itv);
			$('#page_2_1').show(trans_itv);
		});
		
		$('#btn_rj_2').bind('click', function(){
			$('#page_2').hide(trans_itv);
			$('#page_3').show(trans_itv);
		});
		
		$('#btn_ok_3').bind('click', function(){
			$('#page_2').show(trans_itv);
			$('#page_3').hide(trans_itv);
		});
		
		$('#btn_ok_3_1').bind('click', function(){
			$('#page_1').show(trans_itv);
			$('#page_2_1').hide(trans_itv);
		});
		
		$('#btn_ok_2').bind('click', function(){
			$('#page_4').show(trans_itv);
			$('#page_2').hide(trans_itv);
		});
		
		$('#btn_first').bind('click', function(){
			$('#page_1').show(trans_itv);
			$('#page_2').hide(trans_itv);
			$('#page_3').hide(trans_itv);
			$('#page_4').hide(trans_itv);
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

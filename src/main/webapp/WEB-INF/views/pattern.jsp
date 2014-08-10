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
	
    <title>Smart Financial Monitoring</title>

    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Dashboard -->
    <link href="${pageContext.request.contextPath}/resources/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/plugins/timeline/timeline.css" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <!-- <link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet"> -->
    
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.ui.touch-punch.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jqcloud/jqcloud-1.0.4.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/jqcloud/jqcloud.css">        
    
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
	
 <style>
	  #resizable { width: 150px; height: 150px; padding: 0.5em; }
	  #resizable h3 { text-align: center; margin: 0; }
	  .candle {width:60px; left:150px; top:150px; background-color: transparent; position: absolute;}
	  .candle .div_candle{background-color:#3A3A9A;}
	  .candle .bull{background-color:#990000;}	  
	  .candle_canvas{width:100%; height:400px; background-color: transparent; border-style: groove;}	  
	  .stick_high{height:30px; width:15px; background-color: wight; left:32.5px; border-top: solid; border-right: solid; border-left: solid; border-width: 1px;}
	  .stick_low{height:30px; width:15px; background-color: wight; left:32.5px; border-bottom: solid; border-right: solid; border-left: solid; border-width: 1px;}
	  .ui-resizable-helper { border: 2px dotted #00F; }
	  .delete_area{height:70px; background-color: transparent; width: 50%; float: left; text-align: center;}
	  .toggle_area{height:70px; background-color: transparent; width: 50%; float: left; text-align: center;}
	  .area_selected{border-style: solid; border-width: 3px;}	  
  </style>
	
</head>
<body>
	
	<div id="candle_canvas" class="candle_canvas" style="width:100%; height: 400px; background-color: white;">
		<div style="display: inline-block; width: 100%">			
			<div class="delete_area"><h1><span class="glyphicon glyphicon-globe"></h1></span></div>
			<div class="toggle_area"><h1><span class="glyphicon glyphicon-refresh"></h1></div>
		</div>
		
		<div id="candle_repo" style="visibility: hidden;">
			<div class="candle"">
				<div class="stick stick_high"></div>			
				<div class="div_candle bull" style="height:100px"></div>
				<div class="stick stick_low"></div>
			</div>
		</div>
	
	</div>

    <div id="row">
    	<button id="btn_add_candle" type="button" class="btn btn-default">Add Candle</button>
    </div>
    
    <script>
        
        $(function(){
        	EventRefresh();
        	
        	$('#btn_add_candle').click(function(){
        		var candleSample = $("#candle_repo").clone();
        		candleSample.addClass("visibility", "visible");
        		console.log(candleSample);
        		$("#candle_canvas").append(candleSample.html());
        		console.log('캔들추가');
        	});
        });
        
        function EventRefresh(){
        	        	
        	candleWidth = $("#candle_repo > .candle").width();        	
        	stickWidth = $("#candle_repo > .candle > .stick").width();
        	
        	$(".div_candle").resizable({
        		animate: true,
        		helper: "ui-resizable-helper",
        	    maxWidth: candleWidth,
        	    minWidth: candleWidth,
        	    minHeight: 0
        	});
        	
        	$(".stick_low").resizable({        		
        		maxWidth:15,
        		minWidth:15,
        		minHeight:0
        	});
        	
        	$(".stick_high").resizable({        		
        		maxWidth:15,
        		minWidth:15,
        		minHeight:0
        	});
        	
        	$(".candle").draggable({        		
        		start: function() {
        			console.log('start');
	              },
	              drag: function() {
	            	$(this).children(".stick_high").offset({top:$(this).position().top, left:$(this).position().left + 40-15/2});
	            	$(this).children(".stick_low").offset({top:$(this).position().top + $(this).width, left:$(this).position().left + 40-15/2});	            	
	            	var topBarHeight = $('.delete_area').position().top + $('.delete_area').height();
	            	var topBarWidth = $('.delete_area').width();	            	
	            	var x = $(this).position().left + $(this).width()/2;
	            	var y = $(this).position().top;
	            	console.log(x + " " + y + " " + topBarWidth);	            	
	            	if(y <= topBarHeight){
	            		if (x <= topBarWidth){
	            			// 삭제	
	            			$('.delete_area').addClass('area_selected');
	            			$('.toggle_area').removeClass('area_selected');
	            		}
	            		else{
	            			// 캔들변경
	            			$('.toggle_area').addClass('area_selected');
	            			$('.delete_area').removeClass('area_selected');
	            		}
	            	}
	            	else{
	            		$('.toggle_area').removeClass('area_selected');
            			$('.delete_area').removeClass('area_selected');
	            	}
	            	
	              },
	              stop: function() {
	            	  $(this).children(".stick_high").offset({top:$(this).position().top, left:$(this).position().left + 40-15/2});
		            	$(this).children(".stick_low").offset({top:$(this).position().top + $(this).width, left:$(this).position().left + 40-15/2});	            	
		            	var topBarHeight = $('.delete_area').position().top + $('.delete_area').height();
		            	var topBarWidth = $('.delete_area').width();	            	
		            	var x = $(this).position().left + $(this).width()/2;
		            	var y = $(this).position().top;
		            	console.log(x + " " + y + " " + topBarWidth);	            	
		            	if(y <= topBarHeight){
		            		if (x <= topBarWidth){
		            			// 삭제	
		            			alert('캔들이 삭제됩니다.');
		            			$(this).remove();
		            		}
		            		else{
		            			// 캔들변경
		            			var div = $(this).children(".div_candle");
		                		var bc = div.css("background-color");
		                		console.log(bc);
		                		div.toggleClass('bull');
		                		return;
		            		}
		            	}
		            	else{
		            		$('.toggle_area').removeClass('area_selected');
	            			$('.delete_area').removeClass('area_selected');
		            	}
	            	  	console.log('stop');  
	              },
	              containment:"parent"	              
	              });
        }
    	
    </script>
    
    
    <!-- /#wrapper -->

    <!-- Core Scripts - Include with every page -->    
    
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>

    <!-- Page-Level Plugin Scripts - Dashboard -->
    <script src="${pageContext.request.contextPath}/resources/js/plugins/morris/raphael-2.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/morris/morris.js"></script>

    <!-- SB Admin Scripts - Include with every page -->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin.js"></script>

    <!-- Page-Level Demo Scripts - Dashboard - Use for reference -->
    <!-- <script src="/js/demo/dashboard-demo.js"></script>-->
    
    <script src="${pageContext.request.contextPath}/resources/js/highstock.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/modules/exporting.js"></script>
    
    </body>

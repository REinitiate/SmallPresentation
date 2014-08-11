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
<%@ include file="include.jsp"%>
<style>
	  #candle_repo{width:60px; left:150px; top:150px; background-color: transparent; position: absolute;}	  
	  .candle {width:60px; left:150px; top:150px; background-color: transparent; position: absolute;}	  
	  .candle .div_candle{background-color:#3A3A9A; border-width: 1px; border-style: solid;}
	  .candle .bull{background-color:#990000;}	  
	  .candle_canvas{width:100%; height:400px; background-color: transparent; border-style: groove;}	  	  
	  .stick_high{height:30px; width:15px; background-color: wight; left:22.5px; border-top: solid; border-right: solid; border-left: solid; border-width: 1px;}
	  .stick_low{height:30px; width:15px; background-color: wight; left:22.5px; border-bottom: solid; border-right: solid; border-left: solid; border-width: 1px;}	  
	  .ui-resizable-helper { border: 2px dotted #00F; }	  
	  .modify_area{border-style:outset; border-width: 5px;}
	  .delete_area{height:70px; background-color: transparent; width: 50%; float: left; text-align: center; border-right-style: inset;}
	  .toggle_area{height:70px; background-color: transparent; width: 50%; float: left; text-align: center;}
	  
	  .area_selected{border-style: inset; border-width: 5px;}	
	    
  </style>
	
</head>
<body>

	<div id="wrapper">
        <jsp:include page="nav/nav_top.jsp"/>    <!-- 상단 탑 메뉴 -->
    </div>    
	
	<div id="candle_canvas" class="candle_canvas" style="width:100%; height: 400px; background-color: white;">
		
		<div class="modify_area" style="display: inline-block; width: 100%; border-bottom-style: inset;">			
			<div class="toggle_area"><h1><span class="glyphicon glyphicon-refresh"/></h1></div>
			<div class="delete_area"><h1><span class="glyphicon glyphicon-remove-circle"></span></h1></div>
		</div>
		
		<button id="btn_run" type="button" class="btn btn-success"><span class="fa fa-refresh"></span> 분석</button>
		<button id="btn_add_candle" type="button" class="btn btn-default"><span class="fa fa-plus"></span> 캔들추가</button>
		
		<div id="candle_repo" style="visibility: hidden">
			<div class="stick stick_high"></div>
			<div class="div_candle bull" style="height:100px"></div>
			<div class="stick stick_low"></div>
		</div>
		
	</div>

    <div id="row">
    	
    </div>
    
    <div id="row">
    </div>
    
    <script>
        
        $(function(){        	
        	// 초기화
        	
        	// 캔들 추가 버튼
        	$('#btn_add_candle').click(function(){
        		var candleSample = $("#candle_repo").clone();
        		candleSample.addClass("candle");
        		console.log(candleSample);
        		$("#candle_canvas").append(candleSample);
        		EventRefresh(candleSample);
        		candleSample.css("visibility", "visible");
        		candleSample.hide();
        		candleSample.show(1000);
        	});
        	
        	// RUN 버튼
        	$('#btn_run').click(function(){
        		
        		$("#btn_run > span").addClass("fa-spin");
        		var candleList = $(".candle");
        		var size = candleList.length;
        		console.log(candleList.length);
        		
        		var candleArray = [];        		
        		
        		if(size == 0){
        			alert('캔들형식의 주가정보가 없습니다.');
        		}
        		else{
        			var jsonResult = {};        			
        			for(i=0; i<size; i++){
        				
        				var canvas_height = $("#candle_canvas").height();
        				console.log("전체높이" + canvas_height);
        				
        				var candle = $(candleList.get(i));
        				var div_candle = $(candleList.get(i)).children(".div_candle");
        				var stick_high = $(candleList.get(i)).children(".stick_high");
        				var stick_low = $(candleList.get(i)).children(".stick_low");
        				var type = null;
        				
        				if(div_candle.hasClass("bull")){        					
        					type = "bull";
        				}else{
        					type = "bear";
        				}
        				
        				var origin_top = candle.position().top;
        				var origin_left = candle.position().left;
        				
        				var open = null;
        				var close = null;        				
        				if(type == "bull"){
        					var open = canvas_height - (origin_top + div_candle.position().top + div_candle.height());// + div_candle.height();
        					var close = canvas_height - (origin_top + div_candle.position().top);
        				}else{
        					var open = canvas_height - (origin_top + div_candle.position().top);
        					var close = canvas_height - (origin_top + div_candle.position().top + div_candle.height());// + div_candle.height();
        				}        					
        				var high = canvas_height - origin_top;
        				var low = canvas_height - (origin_top + candle.height());
        				
        				console.log("open:" + open + " high:" + high + " low:" + low + " close:" + close + " origin_top:" + origin_top + " canvas_height:" + canvas_height + " origin_left:" + origin_left);
        				
        				var candleJSON = {};
        				candleJSON.open = open;
        				candleJSON.high = high;
        				candleJSON.low = low;
        				candleJSON.close = close;
        				candleJSON.x = origin_left;        				
        				console.log(candleJSON);
        				
        				candleArray.push(candleJSON);
        				console.log(candleArray);
        			}
        		}
        	});
        });
        
        function EventRefresh(candle){
        	
        	// 캔들 위치 선택
        	var canvas_width = $("#candle_canvas").width();
        	var canvas_height = $("#candle_canvas").height();
            var canvas_left = $("#candle_canvas").position().left;
            
            candle.offset({top:canvas_height/2, left:(canvas_width/2) + canvas_left - 30});
        	        	
        	candleWidth = $("#candle_repo").width();        	
        	stickWidth = $("#candle_repo").width();
        	
        	console.log(candle);
        	
        	var div_candle = candle.children(".div_candle");
        	var stick_low = candle.children(".stick_low");
        	var stick_high = candle.children(".stick_high");
        	
        	console.log(candleWidth);
        	
        	div_candle.resizable({
        	    maxWidth: candleWidth,
        	    minWidth: candleWidth,
        	    minHeight: 0
        	});
        	
        	stick_low.resizable({        		
        		maxWidth:15,
        		minWidth:15,
        		minHeight:0
        	});
        	
        	stick_high.resizable({        		
        		maxWidth:15,
        		minWidth:15,
        		minHeight:0
        	});
        	
        	candle.draggable({        		
        		start: function() {
        			console.log('start');
	              },
	              drag: function() {
	            	
	            	$(this).children(".stick_high").offset({top:$(this).position().top, left:$(this).position().left + 30-15/2});
	            	$(this).children(".stick_low").offset({top:$(this).position().top + $(this).width, left:$(this).position().left + 30-15/2});	            	
	            	
	            	var topBarHeight = $('.delete_area').position().top + $('.delete_area').height();
	            	var topBarWidth = $('.delete_area').width();	            	
	            	var x = $(this).position().left + $(this).width()/2;
	            	var y = $(this).position().top;
	            	console.log(x + " " + y + " " + topBarWidth);
	            	
	            	if(y <= topBarHeight){
	            		if (x >= topBarWidth){
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
	            	    $(this).children(".stick_high").offset({top:$(this).position().top, left:$(this).position().left + 30-15/2});
		            	$(this).children(".stick_low").offset({top:$(this).position().top + $(this).width, left:$(this).position().left + 30-15/2});	            	
		            	var topBarHeight = $('.delete_area').position().top + $('.delete_area').height();
		            	var topBarWidth = $('.delete_area').width();
		            	
		            	var x = $(this).position().left + $(this).width()/2;
		            	var y = $(this).position().top;
		            	
		            	console.log(x + " " + y + " " + topBarWidth);	            	
		            	if(y <= topBarHeight){
		            		if (x >= topBarWidth){
		            			// 삭제	
		            			alert('캔들이 삭제됩니다.');
		            			$(this).remove();
		            			$('.delete_area').removeClass('area_selected');
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
		            	
		            	console.log($(this).children(".div_candle"));
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

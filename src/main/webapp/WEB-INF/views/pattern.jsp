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
  </style>
	
</head>
<body>

	<div style="width:100%; height: 400px; background-color: white">	

		<div class="resizable" style="width:60px; height:100px; background-color: white; padding: 5px">
			<div class="stick_high" style="position:absolute; height:30px; width:30px; background-color: black"></div>
			<div class="up" style="background-color: red; height:50%">
			</div>
			<div class="down" style="background-color: blue; height:50%">
			</div>
			<div class="stick_row" style="position:absolute; left:27px; height:30px; width:30px; background-color: black"></div>
		</div>
	
	</div>

    <div id="row">
    
    	
			
    	<div id="editor" style="background-color: green;">    		
    		<div id="candleControl">
    		
    			<div id="row">
    				<div class="col-md-6">
			    		<div class="input-group input-group-sm">
			    			<p>
							  <label for="spinner">Select a value:</label>
							  <input id="spinner" name="value">
							</p>
			    		</div>
				    </div>
			   </div>
		    
		    </div>
    	</div>
    </div>
    
    <script>
        
        $(function(){
        	var spinner = $( "#spinner" ).spinner();
        	
        	$(".resizable").resizable({
        	    maxWidth: 60,
        	    minHeight: 0,
        	    minWidth: 60
        	});
        	
        	$(".stick_row").resizable();
        	
        	$(".resizable").draggable({start: function() {
        			console.log('start');
	              },
	              drag: function() {
	            	console.log('drag left' + $(this).position().left);
	            	console.log('drag width' + $(this).width());
	            	console.log('drag height' + $(this).height());
	            	
	            	$(this).children(".stick_low").width(10);
	            	$(this).children(".stick_low").height(10);
	            	//$(this).children(".stick_low").css({left : $(this).width() / 2, top : 100});
	            	
	              },
	              stop: function() {
	            	  console.log('stop');  
	              }});
        	$(".resizable" ).selectable();
        	
        	
        	$(".down").bind("click", function(){
        		var div = $(this).parent();        		
        		console.log('left :' + div.position().left + 'top :' + div.position().top);
        		
        		console.log($(this).parent().children(".stick_row").width());
        		$(this).parent().children(".stick_low").height(100);
        		$(this).parent().children(".stick_low").width(20);
        		console.log($(this).parent().children(".stick_row").width());
        		
        		return;
        	});
        });
    	
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

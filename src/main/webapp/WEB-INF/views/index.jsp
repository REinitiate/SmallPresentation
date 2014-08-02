<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
    <title>창의적 금융 FnBlackSmith</title>

    <!-- Core CSS - Include with every page -->
    <!--  <link href="resources/css/bootstrap.min.css" rel="stylesheet"> -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Dashboard -->
    <link href="${pageContext.request.contextPath}/resources/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/plugins/timeline/timeline.css" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <!-- <link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet"> -->
    
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>   
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
	
</head>
<body>	
	<div id="div_cloud" style="text-align: center;">	
		<div class="btn-group btn-group-sm">
		  <button id="btn_b" type="submit" class="btn btn-default" onclick="$('#type_input').val('b');">유난히 튀는</button>
		  <button id="btn_a" type="submit" class="btn btn-success" onclick="$('#type_input').val('a');">비중이 높은</button>
		  <!-- <button id="btn_c" type="submit" class="btn btn-default" onclick="$('#type_input').val('c');">공시 관련</button> -->
		</div>
	
		<p>
			<input name="dt" type="text" id="datepicker">
			<button type="submit" class="btn btn-default">Refresh</button>		
		</p>
		 
	<div id="div_cloud" class="jqcloud" style="width: 100%; height: 500px; border: 0px solid #ccc; margin-top: 30px;"></div>
		
	</div>
	
	
	<div class="row"></div>
	<div class="row"></div>
	<div class="footer">fnblacksmith.com</div>
</body>

<script type="text/javascript">
	      var word_list = ${cloud};	      
	      $(function() {
	    	 $("#div_cloud").jQCloud(word_list);
	         $("#datepicker").datepicker(
	        		 	{
	        		 		dateFormat: 'yymmdd',
	        		 		onSelect: function(){
	        		 			$("form").submit();
	        		 		}
	        			 }
	        		 );
	         $("#datepicker").val("<%=request.getAttribute("dt")%>");
	         
	         var type = $("#type_input").val();
	         
	         $("button[class='btn btn-success']").attr("class", "btn btn-default");
	         
	         if(type == "a") {
	        	 $("#btn_a").attr("class", "btn btn-success");
	        } else if(type == "b") {
	        	 $("#btn_b").attr("class", "btn btn-success");
	        };
	        
	        $("#btn_back").bind('click', function(){
	        	
	        	
	            var effect = 'slide';
	            var options = { direction: 'left'};
	            var duration = 1000;
	            
	        	$("#div_news").hide();
	        	$("#div_cloud").toggle(effect, options, duration);
	        });
	        
	       });
	      
	      $(function(){		
	  		$("li").removeClass("active");
	  		$("#li_snc").addClass("active");
	  		$("#div_news").hide();
	  	});	      
	 </script>
	 
	 
	 
</html>
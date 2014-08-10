<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
    <title>똑똑한 금융공학 FnBlackSmith</title>

    <!-- Core CSS - Include with every page -->
    <!--  <link href="resources/css/bootstrap.min.css" rel="stylesheet"> -->
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
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>   
    <script src="${pageContext.request.contextPath}/resources/js/jqcloud/jqcloud-1.0.4.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/jqcloud/jqcloud.css">
    
    <style>
    	.footer
    	{
    		text-align: center;
    	}
    	.footer
    	{
		  position: absolute;
		  bottom: 0;
		  width: 100%;
		  /* Set the fixed height of the footer here */
		  height: 60px;
		  background-color: #f5f5f5;
		}
		.container .text-muted {
			margin: 20px 0;
		}		
		table thead th
		{
			text-align: center;
		}
		
		table tbody tr td:first-child
		{
			
		}
		
		table tbody tr td
		{
			text-align: left;
			font-size: 12px;
		}
		.video-container {
		    position: relative;
		    padding-bottom: 56.25%;
		    padding-top: 30px; height: 0; overflow: hidden;
		}
		 
		.video-container iframe,
		.video-container object,
		.video-container embed {
		    position: absolute;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		}
				    	
    </style>
    
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
		<div class="row" style="text-align: center; margin-top: 30px">
			<div align="center">
				<div id="div_cloud" style="max-width: 600px; height: 450px; text-align: center"></div>
				<div id="div_table" style="max-width: 550px; height: 450px; overflow:auto; text-align: center">
				<p style="width: 100px;"><a id="btn_back" class="btn btn-warning" role="button"><span class="fa fa-reply"></span>  Back to the cloud</a></p>
				<table class="table table-striped">
					<thead>
						<th>뉴스시각</th>
						<th>뉴스제목</th>
						<th>제공처</th>
					</thead>
					<tbody id="table_contents">
					</tbody>
				</table>						
				</div>
			</div>
		</div>
		<div align="center">
			<!-- <div class="row" style="text-align: center; max-width: 600px; border-top-style: solid; border-top-width: 1px"> -->
			<div>
				<img width="100px" alt="" src="${pageContext.request.contextPath}/resources/img/anvil.jpg">
			</div>
		</div>
		<div class="row" style="text-align: center">
			<div class="jumbotron" style="padding-top: 10px; padding-bottom: 10px">
			  <h1>BlackSmith</h1>
			  <h3>SMART Finance</h3>
			  <p><a href="${pageContext.request.contextPath}/pattern" class="btn btn-primary btn-lg" role="button">ENTER</a></p>
			  <p class="text-muted credit" style="font-size: small;">Daehyun kim <a href="mailto:reinitiate@gmail.com">reinitiate@gmail.com</a></p>			  
			</div>		
		</div> 
		
		<div class="jumbotron">
		  <h1><a href="${pageContext.request.contextPath}/pattern">Smart Candle chart</a></h1>
		  <p>현재 주가의 상황을 캔들차트의 시선으로 바라봅니다. 원하는 패턴을 찾고, 패턴의 유용함을 파악합니다.</p>
		  <div class="row">
		  	<div class="col-md-6">
			  <div class="video-container">
			  	<iframe height="400" src="//www.youtube.com/embed/TP-la2j-NPU" frameborder="0" allowfullscreen></iframe>
			  </div>
			</div>
		  </div>
		  <!-- <p><a href="${pageContext.request.contextPath}/pattern" class="btn btn-primary btn-lg" role="button">Enter</a></p> -->
		</div>
		
		<div id="loading" style="position:absolute; top:50%; left :0; width:100%; margin-top: -10px; line_height:20px; text-align:center;">
			<p><img src='${pageContext.request.contextPath}/resources/img/ajax-loader.gif'/>
		</div>
		
		<input id="t0" type="hidden" value="${t0}"/>
		<input id="t1" type="hidden" value="${t1}"/>   	
</body>

<script type="text/javascript">
	      var word_list = ${cloud};	      
	      $(function() {
	    	  
	    	 // 초기화
	    	 $("#loading").hide(); 
	    	 $("#div_table").hide();
	    	 $("#div_cloud").jQCloud(word_list, {shape: 'rectangular'});
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
	            var options = { direction: 'down'};
	            var duration = 1000;
	            
	        	$("#div_table").hide();
	        	$("#div_cloud").toggle(effect, options, duration);
	        });
	        
	       });
	      
	      $(function(){		
	  		$("li").removeClass("active");
	  		$("#li_snc").addClass("active");
	  		$("#div_news").hide();
	  	});
	      
	    function loadData(gicode){
	    	$.ajax({
				type: 'post',				
				url: '${pageContext.request.contextPath}/news/json',
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",				
				dataType: "json",
				beforeSend: function(){
				     $("#loading").show();
				},
				complete: function(){
				     $("#loading").hide();
				},
				data: {gicode : gicode, t0 : $('#t0').val(), t1 : $('#t1').val()},				
				success: function(data){
					
					var effect = 'slide';
		            var options = { direction: 'up'};
		            var duration = 1000;
			            
			        $("#div_table").toggle(effect, options, duration);
			        $("#div_cloud").hide();
			        
			        var html = '';
			        
			        for(i=0; i<data.length; i++){
			        	html = html + '<tr>';
			        	html = html + '<td>' + data[i].pub_dt + '</td>';
			        	html = html + "<td><a target='_blank' href='" + data[i].url + "'>" + data[i].title + '</a></td>';
			        	html = html + '<td>' + data[i].provider + '</td>';			        	
			        	html = html + '</tr>';
			        }
					$('#table_contents').html(html);
					
	            },
	            error: function(XMLHttpRequest, textStatus, errorThrown) {	            	  
	              alert("Status: " + textStatus); alert("Error: " + errorThrown); 
	            }
			});
	    	
	    	return ;
	    }
	 </script>
</html>
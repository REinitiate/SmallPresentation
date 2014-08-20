<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
    <title>BLACK SMITH</title>

    <!-- Core CSS - Include with every page -->
    <!--  <link href="resources/css/bootstrap.min.css" rel="stylesheet"> -->
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/NanumPenScript/stylesheet.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/jqcloud/jqcloud.css">
    
    
    <style>
        
    	html,
	    body {
	      height: 100%;
	       /* The html and body elements cannot have any padding or margin. */
	    }
	
	    /* Wrapper for page content to push down footer */
	    #wrap {
	      min-height: 100%;
	      height: auto !important;
	      height: 100%;
	      /* Negative indent footer by it's height */
	      margin: 0 auto -60px;
	    }
	
	    /* Set the fixed height of the footer here */
	    #push,
	    #footer {
	      height: 60px;
	    }
	    #footer {
	    	padding-top: 30px;
	    	text-align: center;	      
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
				
		.jumbotron{
			text-align: center;			
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
	<div id="wrap">
	<div class="container">
		<div class="row" style="text-align: center; margin-top: 30px">
			<div align="center">				
				<div id="div_cloud" style="max-width: 800px; height: 450px; text-align: center"></div>
				<div id="div_table" style="max-width: 550px; height: 450px; overflow:auto; text-align: center">
				<div>				
				<p style="width: 100%; text-align: center;"><a id="btn_back" class="btn btn-warning" role="button" style="width: 200px;"><span class="fa fa-reply"></span>  Back to the cloud</a></p>
				<div id="new_link" style="text-align: left; text-align: center; margin-bottom: 20px; border-bottom-style:double; border-bottom-width:1px;"></div>
				</div>				
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
		
		<div class="row">
			<div align="center">
				<!-- <div class="row" style="text-align: center; max-width: 600px; border-top-style: solid; border-top-width: 1px"> -->
				<div>
					<img id="img_anvil" width="200px" alt="" src="${pageContext.request.contextPath}/resources/img/anvil.jpg"/>
					<span class="fa fa-question-circle fa-5" title="최근시점으로 화제가 되고 있는 종목들입니다. 오른종목은 빨간색, 내린종목은 파란색이며, 글씨 크기가 클 수록 더 화제가 되고 있는 종목입니다."></span>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="jumbotron">
			  <h1>BLACK SMITH</h1>			  
			  <p><a href="${pageContext.request.contextPath}/pattern" class="btn btn-default btn-lg" role="button" title="Daehyun 이 만든, 여러가지 금융적 도구를 이용하실 수 있습니다.">Anonymous Login</a></p>
			  <!-- <p class="text-muted credit" style="font-size: small;">Daehyun kim <a href="mailto:reinitiate@gmail.com">reinitiate@gmail.com</a></p> -->			  
			</div>		
		</div>
		
		
		<!-- 
		<div class="row">
			<div class="jumbotron">
				<div class="page-header">
					<h2>Candle Chart Monitoring<br/><small>요즘 잘나가는 주가패턴</small></h2>
				</div>					  
			  	<div class="embed-responsive embed-responsive-4by3"">
			  		<iframe height="300" src="//www.youtube.com/embed/TP-la2j-NPU" allowfullscreen></iframe>
			  	</div>	
			</div>
		</div>
		 -->
		 
			 		 
		</div>
		<div id="push"></div>
	    
	</div>
	
	<%@ include file="footer.jsp"%>
    
	<input id="t0" type="hidden" value="${t0}"/>
	<input id="t1" type="hidden" value="${t1}"/>
	<div class="container">
		<div id="loading" style="position:absolute; top:50%; left :0; width:100%; margin-top: -10px; line_height:20px; text-align:center;">
			<p><img src='${pageContext.request.contextPath}/resources/img/ajax-loader.gif'/>
		</div>
	</div>   	
</body>


<script type="text/javascript">
	      var word_list = ${cloud};	      
	      $(function() {
	    	  
	    	 // 툴팁초기화
	    	 $(document).tooltip();
	    	  
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
					var gicode2 = gicode.substring(1, 7);
					$('#new_link').html('');
					$('#new_link').append('<a target="_blank" class="btn btn-link" role="button" href="http://finance.naver.com/item/main.nhn?code=' + gicode2 + '"></span>네이버</a>');
					$('#new_link').append('<a target="_blank" class="btn btn-link" role="button" href="http://stock.daum.net/item/main.daum?code=' + gicode2 + '"></span>다음</a>');
					$('#new_link').append('<a target="_blank" class="btn btn-link" role="button" href="http://paxnet.asiae.co.kr/asiae/stockIntro/indCurrent.jsp?code=' + gicode2 + '"></span>팍스넷</a>');
					
	            },
	            error: function(XMLHttpRequest, textStatus, errorThrown) {	            	  
	              alert("Status: " + textStatus); alert("Error: " + errorThrown); 
	            }
			});
	    	
	    	return ;
	    }
	 </script>
</html>
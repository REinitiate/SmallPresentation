<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Cherish Message</title>

	<!-- Core CSS - Include with every page -->
    <!--  <link href="resources/css/bootstrap.min.css" rel="stylesheet"> -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Dashboard -->
    <link href="${pageContext.request.contextPath}/resources/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/plugins/timeline/timeline.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/NanumPenScript/stylesheet.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    
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
		
		h1{font-family: 'Hanna', serif;  line-height: normal}
    	h2{font-family: 'Hanna', serif;  line-height: normal}
    	
		/*   	
    	h1{font-family: 'Jeju Gothic', serif;  line-height: normal; font-size: xx-large;}
    	h2{font-family: 'Jeju Gothic', serif;  line-height: normal; font-size: x-large;}
    	*/
    	    	
    	.rotate90 {
		    -webkit-transform: rotate(90deg);
		    -moz-transform: rotate(90deg);
		    -o-transform: rotate(90deg);
		    -ms-transform: rotate(90deg);
		    transform: rotate(90deg);
		}
		
		.div_img{width: 100%; text-align: center;}
		.div_contents{text-align: center; font-family: 'NanumPen',sans-serif; line-height: normal; font-size: x-large;}
		.div_btn{text-align: center; margin-top: 15px;}
		.page_repo{display: none;}
		.page{margin-top: 40px;}
		
		img{margin-bottom: 20px; max-width: 200px; max-height:200px;}
		
		
    </style>

</head>
<body>	

	<div id="wrap">
		<div class="container">			
		</div>
	</div>
	
	<div class="page_repo">
		<div class="div_img">
		</div>
		<div class="div_contents">
		</div>
		<div class="div_btn">
			<button type='button' class="btn btn-default">다음</button>
		</div>
	</div>

</body>

<script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.iframe-transport.js"></script>	
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>	
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui-touch-punch.min.js"></script>	
<script src="${pageContext.request.contextPath}/resources/upload/js/jquery.fileupload.js"></script>

<script>
	$(function(){
		var page_list = JSON.parse('${page_list}').page_list;
		for(i=0; i<page_list.length; i++){
			var page = $('.page_repo').clone()
						.removeClass('page_repo')
						.addClass('page');
			
			// 이미지 추가
			var div_img = page.children('.div_img');
			if(page_list[i].img_url != null){
				div_img.append('<img src="' + page_list[i].img_url + '"/>')
			}else{
				div_img.append('<div style="height:100px;"/>')
			}
			var div_contents = page.children('.div_contents');
			var contents = page_list[i].contents;
			var sentense_list = contents.split('|');
			
			var button = page.find('button');
			button.attr('index', i);
			button.attr('max', page_list.length);
			
			for(j=0; j<sentense_list.length; j++){
				div_contents.append('<p>' + sentense_list[j] + "</p>")
			}			
			page.appendTo('.container');
		}
		
		// 첫번째 페이지만 놔두고 전부 hide();
		$('.page:not(:first)').hide();
				
		// 버튼 이벤트 바인드
		$('button').bind('click', function(){
			var index = parseInt($(this).attr('index'));
			var max = parseInt($(this).attr('max'));
			console.log(index);
			console.log(max);
			console.log($('.page'));
			if(index != max-1){
				$($('.page')[index]).hide();
				$($('.page')[index+1]).show(500);
			}
			else{				
				$('.page').hide(1000);
			}
		});
	});
	
	
</script>

</html>
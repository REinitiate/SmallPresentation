<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이미지 업로드</title>

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
	<style>    
    	h1{font-family: 'NanumPen',sans-serif;  line-height: normal; font-size: xx-large;}
    	h2{font-family: 'NanumPen',sans-serif;  line-height: normal; font-size: x-large;}
    	    	
    	.rotate90 {
		    -webkit-transform: rotate(90deg);
		    -moz-transform: rotate(90deg);
		    -o-transform: rotate(90deg);
		    -ms-transform: rotate(90deg);
		    transform: rotate(90deg);
		}
    </style>

</head>
<body>

	
	<div id="wrap">		
		<div class="container">
			<h1>작은 모바일 프레젠테이션을 선물하세요<br/><small>그림과 글조각들로 마음을 전하세요</small></h1>		    
		    <blockquote>		        
		    </blockquote>
		    
		    <div class="panel panel-default">
		  		<div class="panel-heading">페이지 1</div>
		  		<div class="panel-body">		  		
					<div>
						<form action="${pageContext.request.contextPath}/upload" method="post" enctype="multipart/form-data">
							<input id="fileupload" class="fileupload" type="file" name="imageFile"><br>
						</form>
						<div id="uploaded-files" style="text-align: center;"></div>
						<div id="progress" class="bar" style="background: green; height: 10px;"></div>		
						<div id="result"></div>
					</div>
					<div>
						<textarea class="form-control" rows="3">간단한 멘트를 입력하세요</textarea>
					</div>
				</div>
			</div>
			
			<div class="panel panel-default">
		  		<div class="panel-heading">페이지 1</div>
		  		<div class="panel-body">		  		
					<div>
						<form action="${pageContext.request.contextPath}/upload" method="post" enctype="multipart/form-data">
							<input id="fileupload" class="fileupload" type="file" name="imageFile"><br>
						</form>
						<div id="uploaded-files" style="text-align: center;"></div>
						<div id="progress" class="bar" style="background: green; height: 10px;"></div>		
						<div id="result"></div>
					</div>
					<div>
						<textarea class="form-control" rows="3">간단한 멘트를 입력하세요</textarea>
					</div>
				</div>
			</div>
		</div>
		</div>
	<%@ include file="footer.jsp"%>
	
</body>


<script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.iframe-transport.js"></script>	
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>	
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui-touch-punch.min.js"></script>	
<script src="${pageContext.request.contextPath}/resources/upload/js/jquery.fileupload.js"></script>

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
	
<script type="text/javascript">
$('.fileupload').fileupload({
	    dataType: 'json',
	    send: function (e, data) {
	        $('#loading').show();
	    },
	    done: function (e, data) {
	    	$('#uploaded-files').hide();
	        $.each(data.result.files, function (index, file) {
	        	console.log(file);
	            $('<p/>').text(file.name).appendTo(document.body);
	            var img = "<img src='${pageContext.request.contextPath}/image/$id' style='width:50%'/>";
	            img = img.replace('$id', file.id);
	            console.log(img);
	            $('#uploaded-files').append(img);
	            $('#uploaded-files').show(500);
	        });
	        $('#loading').hide();
	    },
	    /* ... */
	    progressall: function (e, data) {
	        var progress = parseInt(data.loaded / data.total * 100, 10);
	        console.log(progress);
	        $('#progress').css(
	            'width',
	            progress + '%'
	        );
	    }
	});
</script>
		
</html>
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
			<h1>작은 프레젠테이션을 선물하세요</h1>
		    <h2 class="lead"><small>그림과 글조각들로 마음을 전하세요</small></h2>
		    <blockquote>
		        <p>File Upload widget with multiple file selection, drag&amp;drop support, progress bars, validation and preview images, audio and video for jQuery.<br>
		        Supports cross-domain, chunked and resumable file uploads and client-side image resizing.<br>
		        Works with any server-side platform (PHP, Python, Ruby on Rails, Java, Node.js, Go etc.) that supports standard HTML form file uploads.</p>
		    </blockquote>    
		</div>
		
		<div style="width:500px;padding:20px">
			<form action="${pageContext.request.contextPath}/upload" method="post" enctype="multipart/form-data">
				<input id="fileupload" type="file" name="imageFile"><br>				
			</form>
			<div id="uploaded-files"></div>
			<div id="progress" class="bar" style="background: green; height: 10px;"></div>		
			<div id="result"></div>			
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
$('#fileupload').fileupload({
	    dataType: 'json',
	    send: function (e, data) {
	        $('#loading').show();
	    },
	    done: function (e, data) {
	        $.each(data.result.files, function (index, file) {
	        	console.log(file);
	            $('<p/>').text(file.name).appendTo(document.body);
	            var img = "<img src='${pageContext.request.contextPath}/$src' class='rotate90'/>"
	            img = img.replace('$src', file.url);
	            console.log(img);
	            $('#uploaded-files').append(img);
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
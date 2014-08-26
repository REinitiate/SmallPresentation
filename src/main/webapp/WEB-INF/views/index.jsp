<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	
	<script>
	if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
	  var msViewportStyle = document.createElement('style')
	  msViewportStyle.appendChild(
	    document.createTextNode(
	      '@-ms-viewport{width:auto!important}'
	    )
	  )
	  document.querySelector('head').appendChild(msViewportStyle)
	}
	</script>
	
	
    <title>작은 프레젠테이션을 선물하세요</title>

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
    
    	h1{font-family: 'NanumPen',sans-serif;  line-height: normal}
    	h2{font-family: 'NanumPen',sans-serif;  line-height: normal}
    	
    	#dropzone {
		    background: #ccccc;
		    width: 150px;
		    height: 50px;
		    line-height: 50px;
		    text-align: center;
		    font-weight: bold;
		}
		#dropzone.in {
		    width: 600px;
		    height: 200px;
		    line-height: 200px;
		    font-size: larger;
		}
		#dropzone.hover {
		    background: lawngreen;
		}
		#dropzone.fade {
		    -webkit-transition: all 0.3s ease-out;
		    -moz-transition: all 0.3s ease-out;
		    -ms-transition: all 0.3s ease-out;
		    -o-transition: all 0.3s ease-out;
		    transition: all 0.3s ease-out;
		    opacity: 1;
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
				
		<div class="page-header">
			<h1>작은 프레젠테이션을 선물하세요</h1>
		    <h2 class="lead"><small>그림과 글조각들로 마음을 전하세요</small></h2>
		    <blockquote>
		        <p>File Upload widget with multiple file selection, drag&amp;drop support, progress bars, validation and preview images, audio and video for jQuery.<br>
		        Supports cross-domain, chunked and resumable file uploads and client-side image resizing.<br>
		        Works with any server-side platform (PHP, Python, Ruby on Rails, Java, Node.js, Go etc.) that supports standard HTML form file uploads.</p>
		    </blockquote>    
		</div>
		
		<div style="width:500px;padding:20px">
 
		    <input id="fileupload" type="file" name="files[]" data-url="rest/controller/upload" multiple/>
		 
		    <div id="dropzone">Drop files here</div>
		 
		    <div id="progress">
		        <div style="width: 0%;"></div>
		    </div>
		 
		    <table id="uploaded-files">
		        <tr>
		            <th>File Name</th>
		            <th>File Size</th>
		            <th>File Type</th>
		            <th>Download</th>
		        </tr>
		    </table>
 
		</div>	
	
	<%@ include file="footer.jsp"%>
</body>
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.iframe-transport.js"></script>	
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>	
	<script src="${pageContext.request.contextPath}/resources/js/jquery-ui-touch-punch.min.js"></script>	
	<script src="${pageContext.request.contextPath}/resources/upload/js/jquery.fileupload.js"></script>

	<script type="text/javascript">
		$('#fileupload').fileupload({			
			dataType: 'json',
			add: function (e, data) {
				console.log('add');
	            $('#loading').show();
	        },
	        done: function (e, data) {
	        	console.log('done');
	        	$('#loading').hide();
	            $("tr:has(td)").remove();
	            $.each(data.result, function (index, file) {	 
	                $("#uploaded-files").append(
	                        $('<tr/>')
	                        .append($('<td/>').text(file.fileName))
	                        .append($('<td/>').text(file.fileSize))
	                        .append($('<td/>').text(file.fileType))
	                        .append($('<td/>').html("<a href='rest/controller/get/"+index+"'>Click</a>"))
	                        )//end $("#uploaded-files").append()
	            }); 
	        },
	 
	        progressall: function (e, data) {
	            var progress = parseInt(data.loaded / data.total * 100, 10);
	            $('#progress .bar').css(
	                'width',
	                progress + '%'
	            );
	        },
	 
	        dropZone: $('#dropzone')
	    });   
	</script>

	<!-- The template to display files available for upload -->
	<!-- The Templates plugin is included to render the upload/download listings -->
	<script src="http://blueimp.github.io/JavaScript-Templates/js/tmpl.min.js"></script>
	<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
	<script src="http://blueimp.github.io/JavaScript-Load-Image/js/load-image.min.js"></script>
	<!-- The Canvas to Blob plugin is included for image resizing functionality -->
	<script src="http://blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>
		

</html>
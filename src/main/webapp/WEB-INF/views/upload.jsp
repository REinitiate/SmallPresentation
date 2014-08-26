<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
		@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
		@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
		
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
		
		.page-header{text-align: center;}		
		#control_box{text-align: center;}		
		.page_repo{display: none;}		
		#page_list{margin-top: 30px;}
		
    </style>

</head>
<body>	
	
	<div id="wrap">
				
		<div class="container">
		
			<div class="page-header">
			  <h1>소중한 사람에게<br/>작은 모바일 프레젠테이션을 선물하세요<br/><small>그림과 글조각들로 마음을 전하세요</small></h1>
			</div>
		    
		    <div id="control_box" class="row">
		    	<div class="btn-group">		    		
					<button id="btn_page_add" type="button" class="btn btn-default">페이지추가</button>
					<button id="btn_image_add" type="button" class="btn btn-default">이미지추가</button>
				</div>				  					
		    </div>
		    
		    <div id="page_list">
		    
		    </div>
		    <div style="height: 30px;">
		    </div>
		    
		    <div id="page_repo" class="panel panel-default page_repo">
		  		<div class="panel-heading">페이지 1</div>
		  		<div class="panel-body">		  		
					<div>
						<form action="${pageContext.request.contextPath}/upload" method="post" enctype="multipart/form-data">
							<input id="fileupload" type="file" name="imageFile"><br>
						</form>
						<div id="uploaded_files" style="text-align: center;"></div>
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

	function addPage(){
		var page = $(".page_repo")
					.clone()
					.removeClass("page_repo")
					.hide()
					.appendTo('#page_list')
					.show(1000);
		fileUploadBind(page);
	}
	
	$(function(){
		$('#btn_page_add').bind('click', function(){addPage();});
	});
	
	
	function fileUploadBind(div){
		console.log(div);
		var fileupload = div.children('#fileupload');	
		var uploaded_files = div.children('#uploaded_files');
			
		fileupload.fileupload({
		    dataType: 'json',
		    send: function (e, data) {
		        $('#loading').show();
		    },
		    done: function (e, data) {
		    	console.log('image upload done');
		    	$('#uploaded-files').hide();
		        $.each(data.result.files, function (index, file) {
		        	console.log(file);
		            $('<p/>').text(file.name).appendTo(document.body);
		            var img = "<img src='${pageContext.request.contextPath}/image/$id' style='width:50%'/>";
		            img = img.replace('$id', file.id);
		            console.log(img);
		            uploaded_files.append(img);
		            uploaded_files.show(500);
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
	}
	
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
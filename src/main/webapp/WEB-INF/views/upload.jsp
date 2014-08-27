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
    	
    	img{margin-bottom: 20px; width: 80%;}
    	    	
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
		#page_list{margin-top: 30px; text-align: center;}
		
		#page_list{}

		.fileinput-button {
		  position: relative;
		  overflow: hidden;
		}
		.fileinput-button input {
		  position: absolute;
		  top: 0;
		  right: 0;
		  margin: 0;
		  opacity: 0;
		  -ms-filter: 'alpha(opacity=0)';
		  font-size: 200px;
		  direction: ltr;
		  cursor: pointer;
		}
		
		/* Fixes for IE < 8 */
		@media screen\9 {
		  .fileinput-button input {
		    filter: alpha(opacity=0);
		    font-size: 100%;
		    height: 100%;
		  }
}
		
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
					<button id="btn_page_add" type="button" class="btn btn-default">페이지 추가</button>
					<button id="btn_post" type="button" class="btn btn-success">완성본 보기</button>
				</div>				  					
		    </div>
		    
		    <div id="page_list">
		    	
			</div>
			
			<div class="row page_repo">
		    	<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12">
				    <div class="panel panel-default">
				  		<div class="panel-heading" style="text-align: left;">
				  			<span class="btn btn-success fileinput-button">							        
							        <span class="fa fa-picture-o"></span>
									<input id="fileupload" type="file" name="imageFile" data-url="${pageContext.request.contextPath}/upload" multiple style="">
							</span>
				  			<button type="button" class="btn btn-default"><span class="fa fa-repeat"></span></button>
				  			<button type="button" class="btn btn-warning" onclick="deletePage(this)"><span class="fa fa-trash-o"></span></button>
				  		</div>
				  		<div class="panel-body">		  		
							<div>
								
								<div id="result"></div>
								<div id="uploaded_files" class="uploaded_files" style="text-align: center;"></div>
								<div style="text-align: left">
									
								</div>
								<small><textarea class="form-control text-muted" rows="2" onclick="$(this).html('');">간단한 멘트를 입력하세요. 3줄 이내가 좋습니다.</textarea></small>
							</div>
						</div>
					</div>
				</div>
			</div>
		
		
		<div style="height: 30px;"></div> <!-- 푸터가 지워지지 않게 하는 간격 -->
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

	function deletePage(div){
		console.log(div);
		var target = $(div).parent("div").parent("div").parent("div").parent("div").remove();
		console.log(target);
	}
	
	function addPage(){
		var page = $(".page_repo")
					.clone()
					.removeClass("page_repo")
					.hide()
					.appendTo('#page_list')
					.show(1000);
		fileUploadBind(page.children("div").children("div"));
	}
	
	function postData(){
		
		
		//Json 형태의 데이터로 추출..		
		var post_data = {};
		post_data.page_list = [];
		var page_list = $('#page_list').children("div");
		
		page_cnt = page_list.length;
		
		var uploaded_files = $('#page_list .uploaded_files');
		var text_areas = $('#page_list textarea');
		
		for(i=0; i<page_cnt; i++){
			var page = {};			
			var img = $(uploaded_files[i]).children('img');
			console.log(img);
			if(img.length == 0){
				page.img_url = '';
			}
			else{
				console.log(img.attr('src'));
				page.img_url = img.attr('src');
				// 이미지 존재
			}
			//console.log(text_areas[i]);
			console.log($(text_areas[i]).text());
			
			var page = {}
			page.contents = $(text_areas[i]).text();
			page.img_url = img.attr('src');
			post_data.page_list.push(page);
		}
		
		
		
		$.ajax({			
			type: 'post',				
			url: '${pageContext.request.contextPath}/post',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",				
			dataType: "json",
			beforeSend: function(){
			     $("#loading").show();
			},
			complete: function(){
			     $("#loading").hide();
			},
			data: {page_list : JSON.stringify(post_data)},				
			success: function(data){
				//console.log(data);
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {	            	  
              alert("Status: " + textStatus); alert("Error: " + errorThrown); 
            }
		});
		
	}
	
	function fileUploadBind(page){		
		//console.log(page);		 
		var fileuploaddiv = page.children('.panel-heading').children('span').children('#fileupload');
		var uploaded_files = page.children('.panel-body').children('div').children('#uploaded_files');
		console.log(uploaded_files);
		
		fileuploaddiv.fileupload({
		    dataType: 'json',
		    send: function (e, data) {
		    	var image = page.children('.panel-body').children('.div').children('img'); // 이미지 버튼
		    	image.remove();
		        $('#loading').show();
		    },
		    done: function (e, data) {
		    	//console.log($(this).parent("#uploaded-files"));		    			    	
		    	$('#uploaded-files').hide();
		        $.each(data.result.files, function (index, file) {		        	
		        	$('img').hide();		            
		            var img = "<img src='${pageContext.request.contextPath}/image/$id'/>";		            
		            img = img.replace('$id', file.id);		            
		            uploaded_files.append(img);		            
		            $('img').show();
		        });
		        $('#loading').hide();
		    },
		    /* ... */
		    progressall: function (e, data) {
		        /* var progress = parseInt(data.loaded / data.total * 100, 10);		        
		        $('#progress').css(
		            'width',
		            progress + '%'
		        ); */
		    }
		});
	}
	
	
	$(function(){
		$('#btn_page_add').bind('click', function(){addPage();});		
		$('#btn_post').bind('click', function(){postData();})
		$('#btn_page_add').click();
		
	});
</script>
		
</html>
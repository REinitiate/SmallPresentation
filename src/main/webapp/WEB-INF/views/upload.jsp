<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
		@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
		@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
		
		/*
		h1{font-family: 'Hanna', serif;  line-height: normal}
    	h2{font-family: 'Hanna', serif;  line-height: normal}
    	*/
    	
    	h1{font-family: 'NanumPen',sans-serif;  line-height: normal}
    	h2{font-family: 'NanumPen',sans-serif;  line-height: normal}
    	
		/*   	
    	h1{font-family: 'Jeju Gothic', serif;  line-height: normal; font-size: xx-large;}
    	h2{font-family: 'Jeju Gothic', serif;  line-height: normal; font-size: x-large;}
    	*/
    	
    	img{margin-bottom: 20px; max-height: 300px; max-width: 300px;}
    	    	
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
		
		textarea{text-align: center;}
		
		/* Fixes for IE < 8 */
		@media screen\9 {
		  .fileinput-button input {
		    filter: alpha(opacity=0);
		    font-size: 100%;
		    height: 100%;
		  }
		}
		
		#wrap
		{
			background-image: url('${pageContext.request.contextPath}/resources/img/background.jpg');
			background-size: 100%;
			background-repeat: no-repeat;    		    		
		}
		
		.table
		{
			font-family: 'NanumPen',sans-serif;  line-height: normal;
			font-size: x-large;			
		}
		
		th{text-align: center;}
		
		.img-responsive {
		    margin: 0 auto;
		}
		
    </style>

</head>
<body>
	<div class='background'></div>
	<div id="wrap">
		<div id="make">
			<div class="container" style="text-align: center;">		
				<div class="page-header">
				  <a href="${pageContext.request.contextPath}/" style="text-align: center;"><img src="${pageContext.request.contextPath}/resources/img/title.png" class="img-responsive" alt="Responsive image"/></a>				
				</div>
			    
			    <div class="row" style="text-align: center; margin-bottom: 15px;">
			    	<button id="envelope" class="btn btn-default" onclick="$('#pre_pages').slideToggle(500); $('#envelope').toggleClass('btn-primary'); $('#folder_icon').toggleClass('fa-folder-open-o');"><span id="folder_icon" class="fa fa-folder"></span> 편지함</button>
			    	<button id="new" class="btn btn-default" onclick="newPage();"><span class="fa fa-pencil"></span> 새편지</button>
			    </div>
			    
			    <div class="row" style="text-align: center; margin-bottom: 15px;">
			    	<div id="pre_pages" class="btn-group" style="display: none;">
			    		<table class="table table-hover">
			    			<tr><th>작성 시각</th><th>메시지 이름</th></tr>
					        <c:forEach var="letter" items="${letter_list}">
					        	<tr>
					        	  <td><fmt:formatDate value="${letter['update_dt']}" pattern="MM/dd KK:mm"/></td>
					              <td>
					              <div class="btn-group" style="width: 100%;">
									  <button type="button" class="btn btn-large dropdown-toggle" data-toggle="dropdown" style="width: 100%; font-size: x-large;">
									    ${letter['title']} <span class="caret"></span>
									  </button>
									  <ul class="dropdown-menu" role="menu">
									    <!-- <li><button class="btn btn-default btn-page-load" onclick="loadPage(this)" json=' ${letter["json"]}'>로드</button></li> -->
									    <li><a class="btn-page-load" onclick="loadPage(this); $('#envelope').toggleClass('btn-primary');" json=' ${letter["json"]}' page_id='${letter["page_id"]}' style="font-size: x-large;">로드</a></li>
									    <li><a onclick="giveLetter(this)" style="font-size: x-large;" page_id='${letter["page_id"]}'>편지주기</a></li>
									    <li class="divider"></li>									    
									    <li><a href="#"><span class="fa fa-trash-o"></span></a></li>
									  </ul>
									</div>
					              </td>
					              <%-- <td><button class="btn btn-success" onclick="loadPage(this)" json=' ${letter["json"]}'>로드</button></td>
					              <td><button class="btn btn-default" onclick="loadPage(this)" json=' ${letter["json"]}'>삭제</button></td>
					              <td><button class="btn btn-default" onclick="loadPage(this)" json=' ${letter["json"]}'>편지주기</button></td> --%>
					            </tr>
					        </c:forEach>
				        </table>
			        </div>
		        </div>
		        
			    	
			    <div id="control_box" class="row">
			    	<div class="btn-group">
			    		<input id="input_title" type="text" class="form-control" placeholder="편지 이름을 입력하세요" style="margin-bottom: 15px; text-align: center;"/>		    		
						<button id="btn_page_add" type="button" class="btn btn-default">페이지 추가</button>
						<button id="btn_post" type="button" class="btn btn-success">저장 & 보기</button>												
					</div>									  					
			    </div>			    
			    
			    <div id="letter_list" class="row">
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
					  			<button type="button" class="btn btn-default" onclick="moveUp(this)"><span class="fa fa-arrow-up"></span></button>
					  			<button type="button" class="btn btn-default" onclick="moveDown(this)"><span class="fa fa-arrow-down"></span></button>
					  			<button type="button" class="btn btn-warning" onclick="deletePage(this)"><span class="fa fa-trash-o"></span></button>
					  		</div>
					  		<div class="panel-body">		  		
								<div>
									
									<div id="result"></div>
									<div id="uploaded_files" class="uploaded_files" style="text-align: center;"></div>
									<div style="text-align: left">
										
									</div>
									<small><textarea class="form-control text-muted" rows="2" placeholder="간결한 메시지를 입력하세요. 3줄 이내가 좋습니다." ></textarea></small>
								</div>
							</div>
						</div>
					</div>
				</div>				
			</div>
		</div><!-- make -->
		<div id="letter" class="container">
			<div class = "row" style="margin-top: 50px;">
				<div class="letter_page col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-3 col-sm-12">				
				</div>
			</div>
			<div class = "row" style="text-align: center;">
				<div class="letter_contents" style="font-family: 'NanumPen',sans-serif;  line-height: normal; font-size:large; text-align: center;">				
				</div>
			</div>			
		</div>
		
		<!-- <form id="form_letter" method="post" action="${pageContext.request.contextPath}/letter" accept-charset="ISO-8859-1">  -->
		<form id="form_letter" method="post" action="${pageContext.request.contextPath}/letter">			
			<input name="page_list" id="page_letter_input" type="hidden"/>
			<input name="page_list2" value="김대현" type="hidden"/>
			<input id="page_id_input" name="page_id" type="hidden" value=""/>
			<input id="title_original" type="hidden"/>			
		</form>
						
	</div>	
	<%@ include file="footer.jsp"%>	
</body>


<script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.iframe-transport.js"></script>	
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>	
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui-touch-punch.min.js"></script>	
<script src="${pageContext.request.contextPath}/resources/upload/js/jquery.fileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js_custom/sp.js"></script>
	
		
</html>
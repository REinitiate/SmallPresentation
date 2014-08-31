<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		
		
    </style>

</head>
<body>
	<div class='background'></div>
	<div id="wrap">
			
		<div class="container">		
			<div class="page-header">
			  <h1>소중한 사람에게<br/>작은 모바일 프레젠테이션을 선물하세요<br/><small>그림과 글조각들로 마음을 전하세요</small></h1>
			</div>
			
			<div class="row" align="center" style="margin-top: 90px;">
				<div class="col-xs-10 col-xs-offset-1 col-md-4 col-md-offset-4">			
					<form role="form" method="post" action="${pageContext.request.contextPath}/login">			  
					  <div class="form-group">
					    <div class="input-group">
					      <div class="input-group-addon">@</div>
					      <input class="form-control" name="email" type="email" placeholder="이메일">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="sr-only" for="exampleInputPassword2">Password</label>
					    <input type="password" name="pass" class="form-control" id="exampleInputPassword2" placeholder="비밀번호">
					  </div>					  
					  
					  <div class="form-group">
						  <button type="submit" class="btn btn-default btn-success">로그인</button>
						  <button type="submit" class="btn btn-default">설정</button>
					  </div>
					</form>	
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
<script src="${pageContext.request.contextPath}/resources/js_custom/sp.js"></script>
	
		
</html>
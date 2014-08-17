<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:fb="http://ogp.me/ns/fb#">
<head>

	<title> R E S U M E </title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	    
    <link href="${pageContext.request.contextPath}/resources/resume/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/resume/css/style.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/resume/experiences/js/jqcloud/jqcloud.css" />
    
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>    
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/resume/experiences/js/jqcloud/jqcloud-1.0.4.js"></script>
    <script src="${pageContext.request.contextPath}/resources/resume/js/bootstrap.min.js"></script>    
    
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">    
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>    
    
	<% if(request.getParameter("contents_path") == null){ %>
		<meta property="og:title" content="DaeHyeon Kim's RESUME"/>
		<meta property="og:type" content="website"/>
		<meta property="og:description" content="Theory & Realization"/>
	<%} else if(request.getParameter("contents_path").compareTo("experiences/officeautomation.jsp") == 0){ %>
		<meta property="og:title" content="Office Automation"/>
		<meta property="og:type" content="website"/>
		<meta property="og:description" content="MFC 나 .NET 을 다룰 줄 안다는 것은 오피스를 프로그램으로 제어할 수 있는 능력을 손에 넣은 것입니다...그렇다면 루틴성 업무를 자동화 하세요!...루틴성 업무란, 매일매일 같은 작업을 반복해야 하는 업무들입니다."/>
	<%} else if(request.getParameter("contents_path").compareTo("experiences/snc.jsp") == 0){ %>
		<meta property="og:title" content="Stock News WordCloud"/>
		<meta property="og:type" content="website"/>
		<meta property="og:description" content="주식 뉴스를 보는 새로운 방법. 약 1700개의 상장 종목중에서 화제가 되는 종목만을 골라서 보세요."/>
	<%} %>
	
	<style>
	 @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	</style>
	
  
</head>

<body>

<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/all.js#xfbml=1&appId=413908872070361";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

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
		
	<div id='wrap'>

	<!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}/"><strong>DaehyunKim.com</strong></a>          
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">          	
            
            <li id="li_whoami" class="active"><a href="${pageContext.request.contextPath}/resume?contents_path=whoami.jsp">About</a></li>       
            <li id="li_educations"><a href="${pageContext.request.contextPath}/resume?contents_path=education.jsp">Educations &amp; Skills</a></li>
            
                    
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Experiences <b class="caret"></b></a>
              <ul class="dropdown-menu">
              
              	<li role="presentation" class="dropdown-header">JOB</li>
                <li class="disabled" id="li_shinhan"><a href="${pageContext.request.contextPath}/resume?contents_path=experiences/shinhan.jsp"><small>2013/02</small><br>신한은행 프로젝트</a></li>
                <li><a href="${pageContext.request.contextPath}/resume?contents_path=experiences/fnguide.jsp"><small>2013/11</small><br/><strong>FnGuide</strong><small>(current)</small></a></li>                
                <li class="disabled"><a href="#"><small>2012/07</small><br/>Solomon Strategic Consulting</a></li>                
                <li class="divider"></li>                
                
                <li role="presentation" class="dropdown-header">PERSONAL PROJECT</li>
                <li class="disabled" id="li_snr"><a href="${pageContext.request.contextPath}/resume?contents_path=experiences/snr.jsp"><small>2014/08</small><br/>BLACK SMITH</a></li>
                <li id="li_automation"><a href="${pageContext.request.contextPath}/resume?contents_path=experiences/officeautomation.jsp"><small>2013/04</small><br>Office Automation</a></li>
                <li id="li_turtle"><a href="${pageContext.request.contextPath}/resume?contents_path=experiences/turtle.jsp"><small>2012/12</small><br/>System Trading Engine : Turtle</a></li>
                <li id="li_anipang"><a href="${pageContext.request.contextPath}/resume?contents_path=experiences/anipangauto.jsp"><small>2012/08</small><br/>Anipang Automation</a></li>
                <li class="disabled" id="li_mfc"><a href="${pageContext.request.contextPath}/resume?contents_path=experiences/mfcpractice.jsp"><small>2011/09</small><br/>Finance &amp; MFC</a></li>
                
                <li class="divider"></li>    
                                
              </ul>
            </li>            
            <li id="li_contact"><a href="${pageContext.request.contextPath}/resume?contents_path=contact.jsp">Contact</a></li>
          </ul> 
        </div><!--/.nav-collapse -->
      </div>
    </div>

	<div class="container">
		
		<div class='margin_top' style="margin-top: 0px;"></div>		
			
		<% if(request.getParameter("contents_path") == null){ %>
			<jsp:include page="education.jsp" />						
		<%}else{ %>	
			<jsp:include page="${param.contents_path}" />		
		<%} %>
		
		<% if(request.getParameter("img_path") == null){ %>
			<!-- <img alt="" src="/RSM/img/keyboard.jpg" width='100%'> -->
		<%}else{
			%>
			<img alt="" src="<%=request.getParameter("img_path")%>">
		<%} %>		
	</div>		
</div>


<div id="footer">
	<div class="container">
		<p class="text-muted credit">Daehyun Kim <a href="mailto:reinitiate@gmail.com">reinitiate@gmail.com</a></p>
	</div>
</div>

</body>
	
</html>


<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0; background-color: black;">            
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>               
                <a class="navbar-brand" href="${pageContext.request.contextPath}/index" style="color: white;"><strong>BlackSmith</strong>&nbsp;<small>Smart Finance</small></a>
            </div>
            <!-- /.navbar-header -->
            
            
            <ul class="nav navbar-top-links navbar-right">            	
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-folder-open fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                    	 <li><a href="pattern"><i class="fa fa-gavel fa-fw"></i> Candle Chart Pattern</a>               
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                <li class="dropdown disabled">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">                        
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> 개발자</a>
                        </li>
                        <li><a href="#"><i class="fa fa-phone fa-fw"></i> 연락처</a>
                        </li>
                        <!-- 
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                         -->
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->
                       
 </nav>
 <!-- /.navbar-static-top -->
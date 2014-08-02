<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
 <form id="form_target" action="" method="post">

<input id="service" type="hidden" value="${service}">
    
 <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                
                	<li style="text-align: center;">
                		<a><input name="dt" type="text" id="datepicker"></a>
                	</li>
                	
                	<li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="주식코드 검색...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>                        
                        <!-- /input-group -->
                    </li>
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="채권코드 검색...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>                        
                        <!-- /input-group -->
                    </li>
                	                                    
                    <li class="disabled">
                        <a href="javascript:action_menu('/dashboard')"><i class="fa fa-dashboard fa-fw"></i>Dash Board</a>
                    </li>
                                        
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>채권지수<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="javascript:action_menu('/bond/ktb')">국고채</a>
                            </li>
                            <li>
                                <a href="javascript:action_menu('/bond/cash')">KRW CASH</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>주식지수<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="flot.html">지수 기초정보 출력</a>
                            </li>
                            <li>
                                <a href="morris.html">개편 상황</a>
                            </li>                           
                            <li>
                                <a href="morris.html">지수별 보유비중</a>
                            </li>                            
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    
                </ul>
                <!-- /#side-menu -->
            </div>
            <!-- /.sidebar-collapse -->
        </nav>
        <!-- /.navbar-static-side -->
</form>

        <script type="text/javascript">
        $(function(){
        	$('#datepicker').datepicker(
        				{
	        				dateFormat: 'yymmdd',
	        				onSelect: function(){
	        					if($('#service').val() == "")
        						{
	        						action_menu($('/home').val());
        						}
	        					else
        						{
	        						action_menu($('#service').val());
        						}	        					
	        				}
        				}
        			);
        	
        	$('#datepicker').val(${dt});
        });
        
        function action_menu(service){        	
        	$('#service').val(service);
        	$('#form_target').attr('action', '${pageContext.request.contextPath}' + service);
        	$('#form_target').submit();
        };
        
        </script>
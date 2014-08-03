<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
 <form id="form_target" action="" method="post">

<input id="service" type="hidden" value="${service}">
    
 <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">	
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
                	                                    
                    <li class="disabled">
                        <a href="javascript:action_menu('/dashboard')"><i class="fa fa-dashboard fa-fw"></i>Dash Board</a>
                    </li>
                                        
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>주식전략 테스트<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="javascript:action_menu('/bond/ktb')">이동평균선 전략</a>
                            </li>
                            <li>
                                <a href="javascript:action_menu('/bond/cash')">페어트레이딩 모니터링</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>급등주 탐색<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="flot.html">룰 1</a>
                            </li>
                            <li>
                                <a href="morris.html">룰 2</a>
                            </li>                           
                            <li>
                                <a href="morris.html">룰 3</a>
                            </li>                            
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>금융공학<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="flot.html">Black Scholes</a>
                            </li>
                            <li>
                                <a href="morris.html">Volatility Pumpin</a>
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
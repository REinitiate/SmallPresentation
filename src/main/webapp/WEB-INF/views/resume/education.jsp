<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
 <style>
 
 .last_td
 {
 	text-align: left;
 }
 
 td
 {
 	width: auto;
 }
 
 </style>

<div style="height: 40px;"></div>

<div class="panel panel-default">
	<div class="panel-heading"><h4><span class="glyphicon glyphicon-book"> Education</span></h4></div>	
		<table class="table">	
			<tr>
			<td><img src="${pageContext.request.contextPath}/resources/resume/img/whoami/snu.png" style="height: 30px;"></td>
			<td>2011.03-2013.02<br/>Graduate school of Industry Engineering Lab. of investment engineering Seoul National University, Seoul, Korea <br/><small>- 외국인 투자 확대와 한국 시장의 효율성 : KOSPI200과 기술적 분석을 통한 검증.</small></td>			
			</tr>
			<tr>
			<td><img src="${pageContext.request.contextPath}/resources/resume/img/whoami/snu.png" style="height: 30px;"></td>
			<td>2007.03-2011.02<br/> Seoul National University, Industrial Engineering </td>
			</tr>
			<tr><td  style="text-align: center; width: 50px;"></td>
			<td>2002.03-2006.02<br/>Dongsung High School</td>
		</table>
</div>

<div class="panel panel-default">
	<div class="panel-heading"><h4><span class="glyphicon glyphicon-pencil"> Academic</span></h4></div>
	<table class="table">			
		<tr>	
		<td style="width: 50px;"></td>
		<td> Financial Engineering<br/>portfolio, derivative, index, risk model
		</tr>
		<tr>
		<td style="width: 50px;"></td>	
		<td>Industrial Engineering<br/>statistics, optimization</td>
		</tr>
	</table>
</div>


<div class="panel panel-default">
	<div class="panel-heading"><h4><span class="glyphicon glyphicon-wrench"> Realization</span></h4></div>
	<table class="table">		
		<tr><td style="width: 50px;"></td><td><strong>C# .NET</strong></td><td>Windows Program, Data Handling, Web(aspx), Automation</td></tr>	
		<tr><td style="width: 50px;"></td><td><strong>Java</strong></td><td>	Web(jsp, servlet), Android, Spring Framework</td></tr>
		<tr><td></td><td>C++</td><td>Windows Program(MFC, Win32 Api)	</td></tr>		
		<tr><td></td><td><strong>Matlab</strong>, R</td><td>Mathmatical Analysis</td></tr>		
		<tr><td></td><td>VBA</td><td>Excel Macro, Data Handling</td></tr>
		<tr><td></td><td><strong>Web</strong></td><td>	HTML5, javascript, jQuery, CSS</td></tr>		
		<tr><td></td><td>Database</td><td>Oracle, MySQL, SQL-SERVER</td></tr>	
		<tr><td></td><td>OS</td><td>Windows, Linux server buildup</td></tr>
	</table>
</div>

<script type="text/javascript">
	$(function(){		
		$("li").removeClass("active");
		$("#li_educations").addClass("active");
	});
</script>
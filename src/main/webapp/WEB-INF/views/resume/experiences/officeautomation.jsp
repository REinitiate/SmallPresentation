<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
 <link href="${pageContext.request.contextPath}/resources/resume/css/custom.css" rel="stylesheet">    
 <style>
  
.video-container { 
	position: relative; /* keeps the aspect ratio */ 
	padding-bottom: 56.25%; /* fine tunes the video positioning */ 
	padding-top: 60px; overflow: hidden;
 }
  
.video-container iframe,
.video-container object,
.video-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }
  
.description
{
	margin-bottom: 50px;
}

img
{
	margin-bottom:20px;
}

.align_center
{
	text-align: center;
	font-weight: 800;
}

h2 small
{
	font-size: medium;
}

p
{
	font-size: small;
	font-family: 'Nanum Gothic', sans-serif;
}

table
{
	font-size: small;
	font-family: 'Nanum Gothic', sans-serif;
}

.page_header  
{
	font-family: 'Nanum Gothic', sans-serif;
}
</style>  
    
 <div class="page-header">
 	<h2>Office Automation <br/><small>��Ģ���� ������ ���α׷����� �纸�ϼ���</small></h2>
 </div>

<div class="video-container">
	<iframe src="//www.youtube.com/embed/JzlPI2CQCXQ?autoplay=0&amp;wmode=transparent" frameborder="0" ></iframe>	
</div>

<p style="margin-top: 30px;">	
	
		MFC �� .NET �� �ٷ� �� �ȴٴ� ���� ���ǽ��� ���α׷����� ������ �� �ִ� �ɷ��� �տ� ���� ���Դϴ�.<br><br>
		�׷��ٸ� ��ƾ�� ������ �ڵ�ȭ �ϼ���! ��ƾ�� ������, ���ϸ��� ���� �۾��� �ݺ��ؾ� �ϴ� �������Դϴ�. �� ������ ������ ������ ������ ��Ĩ�ϴ�.
		<br/>
		<br/>
		1. ���ͳݿ��� Ư�� ������ �����ͺ��̽��� �Է�.<br/>	
		2. �����Ͻ� ������ ����.<br/>
		3. ��� �����͸� ����Ͽ� �������Ϸ� ����.<br/>
		4. �ش� ���������� �� �̸��Ϸ� ÷���Ͽ� ����.<br/><br/>
</p>
		
<div class="table-responsive"">		
	<table class="table">		
		<tr>
			<td>���� ���� �ҿ� �ð�</td><td class="align_center">30��</td>
		</tr>
		<tr>
			<td>�ڵ�ȭ</td><td class="align_center">1��</td>
		</tr>
		<tr>
			<td>���� ���� �Ǵ� �ð�</td><td class="align_center">29��</td>
		</tr>		
		<tr>
			<td>�Ѵ� ���� �Ǵ� �ð�</td><td class="align_center">580��</td>
		</tr>
		<tr>
			<td>�ϳ� ���� �Ǵ� �ð�</td><td class="align_center">7308��</td>
		</tr>					
	</table>
 </div>
 <p><strong>�� 122�ð��� ��¥�� ������ϴ�!</strong></p>
 <p>��, ��������, �밡�ٰ�, DB�� ������ ������� �ڵ�ȭ�ϼ���!<br/>�����ڵ�ȭ�� ���õ� ���Ǹ� �Ʒ� �ּҷ� �����ֽø� ������ �帮�� �ͽ��ϴ�.</p>
 <p class="text-muted credit"><a href="mailto:reinitiate@gmail.com">���� ������ reinitiate@gmail.com</a></p>

<script type="text/javascript">
	$(function() {
		$("#description").hide();
		$("#more").click(function(){
						$("#description").slideToggle(1000);
		});
		
		var timer = setInterval(function () {
			$("#description").slideDown(1000);
	        clearInterval(timer);
	        }, 5000);
	});
</script>

<script type="text/javascript">
	$(function(){		
		$("li").removeClass("active");
		$("#li_automation").addClass("active");
	});
</script>
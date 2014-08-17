<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<style>
  
  .video-container { 
   position: relative; /* keeps the aspect ratio */ 
   padding-bottom: 56.25%; /* fine tunes the video positioning */ 
   padding-top: 60px; overflow: hidden;
   }
   
	.video-container iframe,
	.video-container object,
	.video-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }
	
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
	
</style>

<div class="page-header">
 	<h3>�ִ��� �ڵ�ȭ �÷���<br/> <small>4�ְ� 1�� �ߴٴ� �ҹ��� �ֽ��ϴ�.</small></h3>
 </div>

<div class="video-container" >
	<iframe src="//www.youtube.com/embed/TP-la2j-NPU?autoplay=1&amp;wmode=transparent"" frameborder="0" ></iframe>
</div>
 
 <p style="margin-top: 30px;">���α׷����� �����Ϸ��� '����'�� ���� �����ϰ� �װ��� �޼��ϱ� ���� '���'�� ����Ʈ�� �ϰ� ��ɱ����� ���� '��� Ű����'�� ��Ī��ŵ�ϴ�. �׸��� �� ���Ű���带 ���������� �����ϸ� �˴ϴ�. �׷��� ����ְ� ���밨 �����ϴ� �ڵ��� �˴ϴ�.
	<br/><br/>���� : "�ִ����� 1�� �ϰ� �ʹ�. �ִ����� PC���� �����Ͽ� �˰������� �÷���."
	<br/><br/>
</p>

<table class="table">
	<thead>
		<tr><th>���</th><th>���Ű����</th></tr>
	</thead>
	<tr>
		<td>�ȵ���̵� ������ PC���� ������ �� �־�� ��.</td><td>MOBIZEN(�������α׷�)</td>
	</tr>
	<tr>
		<td>�������� ȭ���� RGB pixel �� RAM ���� �÷�����.</td><td>.NET Window�� Bitmap ���� Class</td>
	</tr>
	<tr>
		<td>�� �ʸ��� �ǽð����� ��ȭ�� ����.</td><td>.NET Timer</td>
	</tr>		
	<tr>
		<td>PC���� ���콺�� ���ϴ� ��ġ�� Ŭ���� �巡�׸� �� �� �־�� ��.</td><td>Win32 API</td>
	</tr>			
</table>

<script type="text/javascript">
	$(function(){		
		$("li").removeClass("active");
		$("#li_anipang").addClass("active");
	});
</script>
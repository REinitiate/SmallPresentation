<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
 <style>
 
 .whoami
 {
 	font-family: 'Nanum Gothic', sans-serif; 	
 	margin-top: 30px; 	
 	font-size: 12px;
 }
 
 .whoami h4
 {
 	font-family: 'Nanum Gothic', sans-serif;
 	font-size:13px; 	
 }
 
 p
 {
 	font-size:small;
 	font-family: 'Nanum Gothic', sans-serif;
 }
 
 </style>
 	<div style="height: 30px;"></div>
 	
 	
 	<div class="whoami">
 		
 		<div class="page-header">
 			<h3><img alt="" src="${pageContext.request.contextPath}/resources/resume/img/whoami/profile2.jpg" width="180px" style="margin-bottom: 20px;"><br/>
 			<p>�� ����<br/>
 			DaeHyun Kim<br/>
 			1987.06.08 ��� (�� 27��)
 			</p>
 			</h3>
 		</div>
 		 		
 		<div class="page-header">
 			<p>- ���� -</p>			
			<p>������ �ι��� ���� ������ �����ϴ�.</p>			
			<p>�кδ� ��������� �����߽��ϴ�.</p>
			<p>����� ���������� �����߽��ϴ�.</p>
			<p>���θ� ���� ���θ� �Ⱦ��մϴ�.</p>
			<p>�̷��� �����ϴ� ���� �����մϴ�.</p>			
		</div>		
 		
 		<div class="page-header">
			<p>- ��ۡ� -</p>
			<p>������ 90%�� ���۸��̶�� ����� �˰� �ֽ��ϴ�.</p>
			<p>���α׷��� ���������� �������� �����ϴ�</p>
			<p>������ ���α׷����� C#.NET��, ���� �������α׷����� JAVA�� ��ȣ�մϴ�.</p>
			<p>�ǿ����� ���� ����°� �����մϴ�.</p>
			<p>��(<span style="font-family: serif;">�</span>)�� �ƴ� �������ν��� ���α׷����� �����մϴ�.</p>
			<p>�׷��� ������ ���� ������ �����մϴ�.</p>
			<p>�� ���� �ΰ� �̻��� ����������Ʈ�� ����ǰ� �ֽ��ϴ�.</p>
			<p>������ �ڵ�ȭ �ϴ� ���� �����մϴ�.</p><br/>			
		</div>
 	
</div> 

<script>
	$(function(){
		$("li").removeClass("active");
		$("#li_whoami").addClass("active");		
	});
</script>
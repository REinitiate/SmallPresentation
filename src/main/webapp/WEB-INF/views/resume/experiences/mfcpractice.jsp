<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

.img_container
    {
    	margin-top: 20px;
    	margin-bottom: 20px;
    }
    
    /* Large desktop */
	@media (min-width: 1200px) {
		img
		{
			width: 100%;
		}
		#last_img
		{
			width: 100%;
		}
	}
	
	/* Portrait tablet to landscape and desktop */
	@media (min-width: 768px) and (max-width: 979px) {
		img
		{
			width: 100%;
		}
		#last_img
		{
			width: 100%;
		}
	}
	
	/* Landscape phone to portrait tablet */
	@media (max-width: 767px) {
		img
		{
			width: 100%;
		}
		#last_img
		{
			width: 100%;
		}
	}
	
	/* Landscape phones and down */
	@media (max-width: 480px) {
		img
		{
			width: 100%;
		}
	}
	
	.description
	{
		margin-bottom: 50px;
	}
	
	img
	{
		margin-bottom:20px;
	}
	
</style>


<script type="text/javascript">
	$(function(){
		//$(".description").hide();
		var timer = setInterval(function () {
			//$(".description").slideDown(1000);
	        //clearInterval(timer);
	        }, 1500);
	});
	
	
</script>

<div class="page-header">
 	<h2>Finance &amp; MFC<br/><small>���α׷����� �β��� å�� �ƴ϶�, �Ŵ��� ���� ���������̴�.</small></h2>
 </div>
    
    
<div class="mfcpractice"  align="center">
	
	<div id="description" style="margin-top: 0px; margin-bottom: 40px;">
			2009�� 06��
			<br/><br/>�к� 3�г⿡ '���ڰ��п�����' �� ����<br/>
			�̽�Ʈ����Ʈ���� ��Ư�� ��ģ ���α׷��� �������� ���� MFC�� ����. 			
	 </div>
	 <img class="mg-rounded" alt="" src="/RSM/experiences/img/mfc1.jpg" >
	 <div id="description" class="description">	 				
			<p><em>"��! ���α׷����� ��� �׸� �׷���?" ��� ������ �ּ������� DC(device context)�� ã�ƺ���� �ϼ̴�.</em></p>
	 </div>	 
	 <img alt="" src="/RSM/experiences/img/mfc2.jpg">
	 <div id="description" class="description">
			<p><em>���ϰ� �� ���α׷����� �� �ϵ��ũ�����δ� �����Ҵ�. �翬�� �������� ��Ʈ��ũ�� API�� ã�Ե�.</em></p>	
	 </div>
	 <img alt="" src="/RSM/experiences/img/mfc3.jpg">
	 <div id="description" class="description">	 				
			<p><em>��Ʈ��ũ�� ���� ��� ������������ �����͵��� ����� �����͸� ������ ���ߴ� device context �� ���ؼ� ���� ���� ǥ���ϰ� �;���.</em></p> 			
	 </div>
	 <img alt="" src="/RSM/experiences/img/mfc4.jpg">
	 <div id="description" class="description">
	 		<p>KIRUDA Algorithm Trading Practice	<br>	
			<em>MFC�� �ͼ������� �ý��� Ʈ���̵��� �հ��� ���̷� �̲����� ������ ���� ����.</em></p> 			
	 </div>
	 <img alt="" src="/RSM/experiences/img/mfc5.jpg">
	 <div id="description" class="description">		
			<p><em>���� �𸣰ڴ� 3D�� �� ���ų�.</em></p> 			
	 </div>
	 <img alt="" src="/RSM/experiences/img/mfc6.jpg">
	 <div id="description" class="description">		
			<p><em>ó������ ����� �� �ý��� Ʈ���̵��� ������. 	������ �������ֽ� �忬�� ������ ������ ���α׷� ���鿡.</em></p> 			
	 </div>
	 <img id = "last_img" alt="" src="/RESUME/experiences/img/mfc7.jpg">
	 <div id="description" class="description">		
	 		2010�� 1��
			<br/><br/>			
			�β��� å���� ���� ���� �ƴ� <br/>
			���� �ʿ�� ��̿��� ���� ���α׷����� ������.			
	 </div>
	 <p>
	 �ٽ��ѹ� ��������, �� ���ڸ��� �ִ� ����� ������ �󸶳� �߿�����...
	 </p>
	 <div align="right">
	 updated 2013.01
	 </div>
 </div>
 
 <script type="text/javascript">
	$(function(){		
		$("li").removeClass("active");
		$("#li_mfc").addClass("active");
	});
</script>

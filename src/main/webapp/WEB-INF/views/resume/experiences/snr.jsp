<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<style>

.align_center
{
	text-align: center;
	margin-left: 30px;
	padding-left: 30px;
	font-size: 12px;
}

#slideshow {
    position:relative;
    height:900px;
    z-index: -40;
}

#slideshow IMG {
    position:absolute;
    top:20px;
    left:0;
    z-index:-30;
}

#slideshow IMG.active {
    z-index:-10;
}

#slideshow IMG.last-active {
    z-index:-20;
}

#description
{
	 position:absolute;
     top:70px;
     left:610px;
     width: 350px;
}

#content
{
	height:900px;
}


.description
{
	width: 350px;
}
</style>

<div class="page-header">
 	<h2>Stock News Realtime<br/><small>�ȵ���̵� ���ø����̼�</small></h2>
 </div>
	
<div id = 'slideshow'>
		<img src="/RSM/experiences/img/snr1.png" width="250px">
		<img src="/RSM/experiences/img/snr2.png" width="250px">
		<img src="/RSM/experiences/img/snr3.png" width="250px">
		<img src="/RSM/experiences/img/snr4.png" width="250px">
		<img src="/RSM/experiences/img/snr5.png" width="250px">
		<img src="/RSM/experiences/img/snr6.png" width="250px">
		<img src="/RSM/experiences/img/snr7.png" width="250px">
		<img src="/RSM/experiences/img/snr8.png" width="250px">
		<img src="/RSM/experiences/img/snr9.png" width="250px">
		<img src="/RSM/experiences/img/snr10.png" width="250px">
		<img src="/RSM/experiences/img/snr11.png" width="250px">		
</div>
	
<h3 style="margin-top: -250px;">	���ø����̼��� �ǵ�.</h3>
<ul>
	<li>�ֽ��� ������ ������� �ڽ��� ���������� ����Ͽ� �׻� ���� ������ ����Ǿ� �ְ� ��.</li>
	<li>���� �����߿� �߿��� ������ ��ũ���ϸ� �ش� ������ �̸��Ϸ� ����Ʈ �������� �� �� �ְ� ��.</li>
	<li>���� �������� My Screener �� ���� �κп� ���� ���� ������Ʈ.</li>
</ul>
<h3>���ø����̼��� ���.</h3>
<ul>
	<li>����� �� ���� ��� ����(�ڵ��ϼ�)</li>
	<li>�����ǵ带 refresh �ϸ� ���� �ֽ� ������ ���ŵ�.</li>
	<li>�����ǵ��� ������ Ŭ���ϸ� �ش� ��ũ�� ����Ǿ� ���� ���� Ȯ�� ����.</li>
	<li>��ũ���Ͽ��� ������ ȣ�� Ȥ�� ����� �з� ����.</li>
	<li>������ ������ ��ϵ� �̸��Ϸ� ����Ʈ �������� ����.</li>
</ul>
<h3>������ ���ؼ� ���� ��.</h3>
<ul>
	<li>�ȵ���̵� ���� ����.</li>
	<li>����� ������ ���� ũ�Ѹ� ��ġ���α׷�.</li>
	<li>Html ���ø� ���� ������ ���.</li>
	<li>���� ���� ���� ���.</li>
	<li>�ȵ���̵� ����ȭ ���� ü��.</li>
</ul>

<p>
���� ���� ������ ���α׷��� �н� ����� �׳� ���� �ϳ� ������ ���ΰ� �����ϴ�.
C# Window Application ���߰����� �ִٸ� �ȵ���̵�� �׳� �� �ϳ��� ���۸��Դϴ�.
</p>
<p>
�̹� ������Ʈ�� ���ؼ� ����Ǿ� �ִ� ��� ������ �ǽð� ������ �� DB�� �������� �Ǿ����ϴ�.
������ �󵵿� �ְ��� � �����ϱ��? ���� �������� �ӽŷ����� �˾ƺ���� �Ͻó׿�.
���� �� ���� ����ġ�� �ʿ��� �� �����ϴ�.
</p>

<script type="text/javascript">
	$(function() {
				
		var timer = setInterval(function () {
			$("#description").slideDown(2000);
	        clearInterval(timer);
	        }, 2000);
		
		$('img').hide();
		
		slideSwitch();
		setInterval( "slideSwitch()", 2000);
	});
	
	
	
	function slideSwitch() {
	    var $active = $('#slideshow IMG.active');

	    if ( $active.length == 0 ) $active = $('#slideshow IMG:last');
	    // �ʱ��Ȳ

	    var $next =  $active.next().length ? $active.next()
	        : $('#slideshow IMG:first');
	    
	    $($next).show(1000);

	    $active.addClass('last-active');
	        
	    $next.css({opacity: 0.0})
	        .addClass('active')
	        .animate({opacity: 100.0}, 0, function() {
	        	// ����� ��
	            $active.removeClass('active last-active');
	        	$($active).hide();
	        });
	}
</script>


<script type="text/javascript">
	$(function(){		
		$("li").removeClass("active");
		$("#li_snr").addClass("active");
	});
</script>
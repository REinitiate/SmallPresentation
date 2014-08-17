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
 	<h2>Stock News Realtime<br/><small>안드로이드 어플리케이션</small></h2>
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
	
<h3 style="margin-top: -250px;">	어플리케이션의 의도.</h3>
<ul>
	<li>주식을 보유한 사람들이 자신의 관심종목을 등록하여 항상 관련 뉴스에 노출되어 있게 함.</li>
	<li>접한 뉴스중에 중요한 뉴스를 스크랩하며 해당 뉴스를 이메일로 레포트 형식으로 볼 수 있게 함.</li>
	<li>현재 개발중인 My Screener 의 뉴스 부분에 대한 서브 프로젝트.</li>
</ul>
<h3>어플리케이션의 기능.</h3>
<ul>
	<li>상장된 전 종목 등록 가능(자동완성)</li>
	<li>뉴스피드를 refresh 하면 가장 최신 뉴스로 갱신됨.</li>
	<li>뉴스피드의 뉴스를 클릭하면 해당 링크로 연결되어 뉴스 원본 확인 가능.</li>
	<li>스크랩북에서 뉴스를 호재 혹은 악재로 분류 가능.</li>
	<li>보관된 뉴스를 등록된 이메일로 레포트 형식으로 전송.</li>
</ul>
<h3>개발을 통해서 얻은 것.</h3>
<ul>
	<li>안드로이드 개발 경험.</li>
	<li>기상장 전종목 뉴스 크롤링 배치프로그램.</li>
	<li>Html 템플릿 메일 보내는 방법.</li>
	<li>유저 정보 관리 방법.</li>
	<li>안드로이드 파편화 몸소 체험.</li>
</ul>

<p>
역시 가장 유익한 프로그래밍 학습 방법은 그냥 뭐든 하나 만들어보는 것인거 같습니다.
C# Window Application 개발경험이 있다면 안드로이드는 그냥 또 하나의 구글링입니다.
</p>
<p>
이번 프로젝트를 통해서 상장되어 있는 모든 종목의 실시간 뉴스를 제 DB로 가져오게 되었습니다.
뉴스의 빈도와 주가는 어떤 관계일까요? 저의 선생님은 머신러닝을 알아보라고 하시네요.
조금 더 깊은 리서치가 필요할 것 같습니다.
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
	    // 초기상황

	    var $next =  $active.next().length ? $active.next()
	        : $('#slideshow IMG:first');
	    
	    $($next).show(1000);

	    $active.addClass('last-active');
	        
	    $next.css({opacity: 0.0})
	        .addClass('active')
	        .animate({opacity: 100.0}, 0, function() {
	        	// 지우는 것
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
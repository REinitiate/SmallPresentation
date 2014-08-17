<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <link href="${pageContext.request.contextPath}/resources/resume/css/custom.css" rel="stylesheet">
    
    <style>
    
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
	}
	
	/* Portrait tablet to landscape and desktop */
	@media (min-width: 768px) and (max-width: 1200px) {
		img
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
	}
	
	/* Landscape phones and down */
	@media (max-width: 480px) {
		img
		{
			width: 100%;
		}
	}
    	
    </style>
	
	<div class="page-header">
 	<h2>감정이 메마른 거래방식 <br/><small>시스템 트레이딩 모듈 개발 : Turtle</small></h2>
 	</div>		
	<p>처음부터 감정적으로 투자하고자 하는 사람은 아무도 없습니다. 누구나 스스로 이성적인 판단을 할 수 있을 것이라 생각합니다.
	그러나 사람은 손실을 보기 시작할 때부터 달라집니다. 원금에 대한 근거 없는 희망, 초조함, 불안함이 눈을 가리고 이성적인 판단을 할 수 없게 만듭니다.
	그래서 저는 학부 3학년 때 옵션 매수 증거금이 없었던 시절<small>(2010.11 매수전용계좌 폐지)</small> 과외로 힘들게 한푼 두푼 모았던 돈을 전부 잃게 되었습니다.  
	</p>
	<p>
	그로부터 지금까지 관심을 가져온 시스템 트레이딩입니다. 시스템 트레이딩이란, 언제, 무엇을 얼마나 사고 팔것인가에 대한 규칙이 정해지면 컴퓨터가 그대로
	거래하는 투자방식입니다. 따라서 인간의 감정적인 부분을 배제하고 거래를 할 수 있습니다. 운 좋게도 저는 구현할 수 있는 기술이 있었고 지금까지 여러가지의 전략을 시험해 보고 있습니다. 현재까지는 석사 때 공부했던 파생상품 위주로 연구했으나 앞으로는, 현재 직장에서 연구하는 주식부분에
	도전해볼 생각입니다. 탐색해온 분야는 다음과 같습니다. 
	</p>
	
	<p>
		<ul>
			<li>각종 시계열 지표(볼린져 밴드, 이동평균선)</li>
			<li>3 주체(개인, 기관, 외인) 포지션</li>
			<li>옵션 변동성</li>
			<li>호가정보 &amp; 베이시스 트렌드</li>
		</ul>
	</p>
		
	<div class="img_container" align="center">
	<img class=img-rounded src="${pageContext.request.contextPath}/resources/resume/img/turtle1.jpg" width='100%' style="margin-bottom: 0px">
	<br>
	<span class="caption">&lt; 2011년 볼린져밴드 +  Xing API + MFC 로 개발한 첫번째 시스템 트레이딩 &gt;</span>
	</div>
		
		<p>
		사실 누군가, "수익이 나는 전략이 있느냐?" 라고 물어본다면 대답은 "아니오" 가 될 것 같습니다. 전략을 연구하면서 느낀 몇 가지를 덧붙이자면
		첫 번째로 개인투자자는 선물거래에 있어서 슬리피지(Slippage)와 수수료(Commission) 의 벽을 넘어야 하는데 이것이 쉽지 않다는 것입니다.   
		</p>
		<ul>
			<li>Slippage : 원하는 가격에 거래하지 못하고 1, 2 틱의 손해를 보면서 거래되는 것.</li>
			<li>Commission : 매수, 매도시 발생하는 수수료. (최소 수수료 기준 선물 1계약 매수 매도시 약 1만원)</li>			
		</ul>
		<p>이는 마치 당구장 승률이 50%인 사람이 계속해서 당구를 치면 게임비로 인해서 점점 주머니에 있는 돈이 사라지는 것과 같습니다.		
		즉, 이미 손해를 보고 시작되는 게임이기에 장기적으로 갈 수록 손해를 보기 쉽습니다. 진정한 승자는 당구장 주인이란 있지요.		 
		</p>
		<p>두 번째로 시장 상황의 변화 입니다. 전체 시장을 꿰뚫는 하나의 설명이 다른 시점에서는 설명되지 않는 경우가 많습니다. 
		 특히 연구중에 느낀점은, 금융위기 2008년을 전후로 전략의 수익성이 바뀐다는 점입니다. 다수의 전략이 이와 같은 모습을 보입니다.		 		
		즉, 시장은 변하므로 이 전략이 지금은 수익이 날 지언정, 언제까지 수익이 날것인가에 대해서는 항상 물음표가 달릴 수 밖에 없습니다.
		</p>
		<p>전 완벽한 전략은 발견하지 못했습니다. 그러나 적어도 시스템 트레이딩을 처음부터 끝까지, 전략 기획부터 상품 개발까지의 Total Experience는 제 머릿속과 작업환경에 보관되어 있습니다.</p>
		<p>시스템 트레이딩의 요소는 다음과 같이 도식화 할 수 있습니다.</p>
		
		<div class="img_container" align="center">
		<img class=img-rounded src="${pageContext.request.contextPath}/resources/resume/img/turtle3.jpg"style="max-width:500px; margin-bottom: 0px">
		<br/>
		<span class="caption">&lt; System Trading 기능단위 &gt;</span>		
		</div>
		
		
		<strong>Logic - 거래전략</strong>
		<ul>
  			<li>어떤 종목을 어떤 시점에 얼마나 사야 하는 지에 대한 룰.</li>
  			<li>예 1 : 외국인 순 매수인 상황에서 20일 이평선을 상향 돌파할 시에 선물 최근월물을 1계약 매수하여 장 마감까지 보유.</li>
  			<li>예 2 : 오늘 정오까지의 종합적인 시장상황이 2010년부터 어제 까지 가장 유사한 거래일을 찾아서 그 상황에 맞춰서 선물 최근월물 1계약을 매수 혹은 매도.</li>
  		</ul>
		<strong>Transaction - 이행</strong>
		 <ul>
  			<li>Logic 을 실제로 이행.</li>
  			<li>투자자의 의도가 그대로 실행되는 것이 목적, 즉 당일 거래의 back testing 과 실제 손익간의 transaction error를 최소화 하는 것이 궁극적 목표.		  		
  			<li>대신증권, Etrade 증권사의 API를 이용.</li>
  			<li>거래 중 일어나는 상황에 대해서 어떻게 행동할 것인가에 대한 파라미터를 입력 받음.
  				<ul>
  					<li>상황 예시 1 : 지정가 매수 주문시 가격이 반대로 움직여서 체결되지 않았을 경우 어떻게 처리해야 하는가? 취소주문을 낼 것인가? 얼마나 기다릴 것인가?</li>
  					<li>상황 예시 2. 보유한 포트폴리오가 손실폭이 클 경우에는 어떻게 해야 하는가? 기다리는가? 손절매?</li>
  				</ul>
  			</li>
 		</ul>
 		<strong>Report - 보고 &amp; 피드백</strong>
	  	<ul>
  			<li>Transaction의 결과, PNL(Profit and loss), 포지션 보유 히스토리, 시그날 히스토리.</li>
  			<li>투자자는 Report 기능을 통해서 로직 개선에 도움이 되어야 함.</li>
  			<li>투자자는 언제 어디서든 상황을 파악할 수 있어야 하므로, web, android app 등 접근성 좋은 매개체들로 구현되어야 함.</li>		  			
  		</ul>
		
		<p>위 세 가지 기능 단위는 서로에 대한 의존성을 최소화 시킨 모듈이 되어야 합니다. 예를 들어 Report 모듈이 전략 A에 대한 레포트는 제출하지만 전략 B에 대해서는 레포트를 만들지 못한다면
		이는 유연한 설계가 아닐 것입니다. 여기에 적용될 수 있는 것이 바로 객체지향의 상속, 추상화의 개념입니다. 따라서 객체지향 프로그래밍으로 각각의 기능을 달성하는 모듈을 CybosTrader 와 C#.NET 으로 구현하였습니다.
		그것이 바로 Turtle 입니다.
		</p>	
		
		<div class="img_container" align="center">
		<img class=img-rounded src="${pageContext.request.contextPath}/resources/resume/img/turtle2.jpg" width='100%' style="margin-bottom: 0px">
		<br/>
		<span class="caption">&lt; System Trading Module Turtle &gt;</span>	
		</div>
		
		<p>
		프로그램을 계속해서 업그레이드 하려고 합니다. 또한 수학적인 도구를 이용하여 전략 탐색 기능을 개발중입니다.
		연구를 거듭할 수록 혼자하기엔 무리가 있는 분야라는 생각이 듭니다. 
		이에 대하여 많은 사람들과 시스템 트레이딩에 대해서 이야기 해보고 싶습니다. 또 계속해서 도전하고 싶습니다.		
		</p>
		
	<script type="text/javascript">
	$(function(){		
		$("li").removeClass("active");
		$("#li_turtle").addClass("active");
	});
</script>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<style>

 /* Large desktop */
	@media (min-width: 1200px) {
		img
		{
			width: 80%;
		}
	}
	
	/* Portrait tablet to landscape and desktop */
	@media (min-width: 768px) and (max-width: 1200px) {
		img
		{
			width: 80%;
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

<script type="text/javascript">
	$(function(){
		
	});
</script>
	
<div class="page-header">
	<h2>신한은행 Warning Board Project<br/><small>기획과 개발, 그 가깝고도 먼 애증의 관계 속으로</small></h2>
</div>		
		
<div align="center">
<img src="/RSM/experiences/img/shinhan1.jpg">
<br/>
<em><small>&lt; 프로젝트는 사람을 지치고 병들게 합니다. &gt;</small></em>
</div>		
<p style="margin-top: 30px;">
	2012년 7월 프로젝트에 투입되었습니다. 맡았던 주된 업무는 은행의 여신위기를 사전에 예측하고자 하는 로직을 개발하는 것이었습니다.			 
	여러 수학적 방법론을 통하여 대규모의 거시경제변수 데이터를 조작하는 것이 핵심이었습니다.
	로직의 구체적인 방법론은 회사의 지적자산이기에 공개할 수 없으나 그것 외에도 느낀점이 많았습니다.
</p>	
<ul>	
	<li>기획과 개발, 현업과 개발자 사이의 간극</li>
	<li>개발 환경적 문제</li>
</ul>
<p>
	
</p>
<h3>기획과 개발의 간극<br><small>산업공학과의 실전</small></h3>
<small>앞으로 언급하는 '기획자' 는 IT에 대한 감이 없는 기획자로 한정합니다.</small>
<br/>		
<p>
	프로젝트 발주자는 A라는 기능이 필요하지만 직접 구현하기에는 무리가 있어 다른 기업에게 의뢰합니다.
	그러나 목적 A가 100% 결과물로 생산되지 않는 경우가 많습니다. 그 이유에는 기획자와 개발자의 불편한 의사사통 때문입니다.
	기획자 입장에서 사소한 변경은 개발입장에서는 근간을 흔드는 경우가 있기 때문입니다.
	이런 경우 개발자는 이런 저런, 기술적 한계에 대해서 설명하고 어려움을 호소합니다.
	그러나 대체로 기획자(현업)의 프로젝트 내 파워가 더 세기 때문이 이와 같은 호소는 비성실성으로 간주되는 경우가 있습니다.
	이런 경우 개발자 역시 업무에 대한 의욕을 잃고, 전체적으로는 프로젝트가 생기를 잃어가는 상황이 소위 '프로젝트가 산으로 간다'가 되겠습니다.
	위와 같은 상황을 사전에 차단하고, 양 사이드의 의견을 조율하며 프로젝트의 판단적 책임을 가져가는 사람을 PM(Project manager)이라고 부릅니다.	
</p>
<p>			
	저는 기획과 개발, 크게 확장하면 문과와 이과 사이의 커뮤니케이션이 얼마나 중요한 것인지 직접 체험했습니다.
	왜냐하면 프로젝트의 로직 개발자로써, 이 로직이 어떤 것이며, 어떻게 쓰여야 하며, 개발 시 어떤 이슈가 있는지에 대해서 현업을 이해시켜야 하는 입장에 있었기 때문입니다.
	이런 역할은 내가 해당 내용을 정확히 파악하고 있는 것으로 충분하지 않았으며 다음과 같은 능력이 필요했습니다.			 		 			
</p>

<p>
	<strong>기술적인 내용을 쉽게 풀어서 설명할 수 있는 것.</strong><br>
	만약 스무살 이후로 수학이라곤 쳐다보지도 않은 사람에게 '다중공선성 때문에 PCA(Principal component analysis)를 해야합니다.' 를 설명하려면 어떻게 해야할까요?
	이럴 때는 직관적인 것에 예를 드는 것이 좋았습니다.
</p>

<p>
	<strong>기획자의 기분을 상하지 않게 하는 것.</strong><br>
	상대방이 전혀 모르는 기술적인 이슈를 설명하다 보면, 본인이 상대방보다 우월하다는 착각에 빠질 수 있지만 이는 정말 금물입니다!
	기획자가 스스로 무시당한 듯한 기분을 받으면, 이해하려고 하지 않습니다.
	매 순간 '당신이 걸어온 길은 나와 다르니까 모르시는게 당연해요' 라는 뉘양스를 가져야 합니다.  			 
</p>		
<p>
	<strong>타협하는 법.</strong><br>
	학술적 이론과 실무는 서로 불가분의 관계이나, 서로의 타당성만을 주장하다보면 교착상태에 빠지게 됩니다.
	'사용할 수 없는 전시용 탱크를 만드느니, 매일 타고다닐 수 있는 자전거를 만들자.' 가 저 스스로 정한 가이드라인이었습니다. 			 			
</p>
<p>
	제가 전공한 산업공학과는 공대의 경영, 이과의 문과를 표방하며 조율, 개선, 융합이라는 단어로 대표되는 학과입니다.
	졸업 후 이런 포지션에서 일을 하게 되어, 정작 학생 때는 느끼지 못한 산업공학과의 중요한 역할에 대해 인식할 수 있는 소중한 경험이었습니다.
	
</p>

<h3>개발 환경적 문제<br><small>언제 어디서나 이클립스나 VS가 있는 것은 아니더라고!</small></h3>
	<p>저는 전형적인 IDE 의존적인 프로그래머였고, 사실 현재도 그렇습니다. Visual studio의 Ctrl+space 없이는 개발 속도가 열배는 걸리는 것 같습니다.
	디버깅, deploying, 내부 변수 탐색이 기본이라고 생각했던 나에게, 프로젝트 첫날 반겨준건 검은 바탕화면에 하얀글씨인 CUI 그리고 VI 였습니다.
	제가 해야 했던 일은 로직을 검증하고, Matlab의 기능을 pure C(심지어 C++도 아닌)로 구현해야 했습니다. 처음에는 눈감고 테니스를 치는 기분이더군요.	
</p>
<div align="center">
<img src="/RSM/experiences/img/shinhan2.png">
<br/>
<em><span class="small">&lt; 저는 오른쪽만 해봤단 말입니다! &gt;</span></em>
</div>			

<p style="margin-top: 30px;">
그러나 여러 프로젝트의 개발환경에 대한 이야기를 접하고, 세상에 많은 개발환경이 내가 원하는 환경이 아닐 수 있다는 것을 알았습니다.
결국 지금까지는 '나를 위한 개발'을 해왔지만 반면 앞으로는 '우리를 위한 개발'을 해야 한다면 IDE에 독립적인 프로그래머가 되어야 한다고 생각했습니다.
그래서 앞으로는 리눅스와 같은 CUI 환경에 익숙해 지고, 다루지 않았던 언어들에 대해서도 관심을 기울여볼 생각입니다.
</p>
		
<div align="right">
updated 2012/05
</div>

<script type="text/javascript">
	$(function(){		
		$("li").removeClass("active");
		$("#li_shinhan").addClass("active");
	});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file = "../all/setting.jsp" %>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
</head>
<!-- <link rel="stylesheet" href="../resources/css/style.css" type="text/css"> -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700&amp;subset=korean">
<!-- <link rel="stylesheet" href="resources/css/style.css" type="text/css"> -->

<style>
.sideMenu div ul li{
	font-size: 20px;

	padding: 10px;
}

.on{
	background-color: #87827d;
}

.notice-table {
  border-collapse: collapse;
  width: 100%;
  text-align : center;
}

th, td {
  text-align: center;
  padding: 8px;
}

.notice-table tr:nth-child(even){background-color: #DCDCDC}

.notice-table tr {
	border-bottom : 1px solid black;
	height : 40px;
}

th {
  color: black;
}

.btn-primary {
  margin-right : 10px;  
  width: 80px; 
  height: 35px;
  border: none;
  background: #17366e; 
  color:#fff; 
  border-radius: 3px; 
  font-size: 14px;
  cursor : pointer;
}

.topMenu {
	display : flex;
	float : right;
}

.topMenu li {
	position : relative;
	padding: 0 100px; 
	float: left;
}

.topMenu li:hover > ul {
	display : block;
}

.topMenu li > ul {
	position : absolute;
	z-index : 1000;
	display : none;
}

.topMenu li > ul > li {
	float : none;
	padding : 0;
}

.notice-table tr {
	background-color : white;
}

.notice-table tr:hover {
	background-color : rgb(180 , 198 , 231);
}
	.ul1_menu1{
		/* padding:10px; */
		font-size: 18px;
	}
	.ul1_menu1 .on{
		background-color: #87827d;
		color:white;
	}
	.ul1_menu1 .on .ul1_menu2{
		font-size: 15px;
	}
	.ul1_menu1 .on .ul1_menu2 .on{
		background-color: #d9d9d9;
		color:#229AF6;
	}
</style>


<script type="text/javascript">
	$(function() {
		
		
	});
</script>



<body style="background-color: white;">

<%@ include file="../all/header.jsp" %>
<div style="display : flex;">
	
<!-- 	<div style="width: 12%; height: 100%; float:left;">
		<div style="width: 100%; height: 12%; background-color: #17366E; font-weight: bold; text-align: center; line-height: 40px; ">
			<p style="font-size:20px; color: #ABC927; position : absolute; margin-top : 30px; margin-left : 50px;">소개</p>
		</div>
	
		<div style="width: 100%; height: 50%;">
			<ul class="ul1_menu1" style="line-height: 30px; background-color : rgb(242 ,242 ,242);">
				<li class="on"><a href="business.do">&nbsp;> 사업설명</a></li>
				<li><a href="material.do">&nbsp;&nbsp;&nbsp;입력 자료란</a></li>
				<li><a href="modelResult.do">&nbsp;&nbsp;&nbsp;모형 결과 분석</a></li>
				<li><a href="notice.do">&nbsp;&nbsp;&nbsp;공지사항</a></li>
			</ul>
		</div>
		
		
		
	</div> -->
	<div class="sideMenu" style="width: 11%; height: 600px;">
		<div style="width: 100%; height: 20%; background-color: #17366E; font-weight: bold; text-align: center; line-height: 120px;">
			<p style="font-size:30px; color: #ABC927;">소개</p>
		</div>
		
		<div style="width: 100%; height: 100%;">
			<ul>
				<li class = "on"><a href="business.do">> 사업설명</a></li>
				<li><a href="material.do">입력 자료란</a></li>
				<li><a href="modelResult.do">모형 결과 분석</a></li>
				<li><a href="notice.do">공지사항</a></li>
			</ul>
		</div>
	</div>
	
	<div class="content"  style="width: 60%; height: 730px; background-color : white; margin-top : 30px; margin-left : 200px;">
		<div style = "border:1px solid #d3d3d3; width : 1200px; height : 90%;">
			<div style = "width : 95%; height : 5%; border-bottom : 2px solid #17366E; margin : 0 auto;">
				<h2>사업 설명</h2>
			</div>
			
			<div style = "padding : 0 3%;">
				<h2>‘ 과학적 적응 기반 ’ 기술  에 활용될 수 있는 “한국형 통합평가 모형 – MOTIVE” 개발</h2>
				<p style = "font-size : 17px;">기후변화는 21세기 인류가 직면한 가장 큰 도전입니다. 다보스 세계경제포럼은 향후 글로벌 경제를 위협할 
				   있는 10대 리스크로 기후변화를 꼽으며<br> 극단적 이상기후, 기후변화 대응 실패 등이 미래 경제에 마이너스
				   요인으로 작용할 수 있음을 경고하였습니다.기후변화로 인한 각 분야의 피해를 줄이기 위해<br>적응은 필수적
				   이며 효과적인 정책 수단입니다. 하지만 과학적 분석결과와 합리적 의사결정에 근거하지 않을 경우 자칫
				   잘못된 적응(mal-adaptation)을 통해 <br>국가적으로 더 큰 비용부담을 초래할 수도 있습니다. 기후변화는 장 ·단기적인 기후현상의 변화뿐만 아니라 자연생태계 및 사회·경제시스템에 각 부문별로 또는 <br>
				   상호 연계되어 복합적인 영향을 나타냅니다. 따라서 각 부문별, 부문 간의 융·복합적 측면에서 기후변화 영향 및 취약성을 과학적으로 파악하고, 체계적인 리스크 관리를 통해 대응능력을 제고해야 합니다. 
				   이에 필요한 핵심기술이 국가의 특성을 반영한 「부문별 기후변화 영향 및 취약성 통합평가 모형」이라고 생각합니다. 
				   통합평가 모형과 관련된 해외의 노력은 유럽(CLIMSAVE PROJECT), 영국(JULES(Joint UK Land Environment Simulator)) 및 일본(NEXUS 및 AIM)등에서 <br>활발히 진행되고 있습니다.
				  MOTIVE 연구단은 이러한 시대적 요구에 부응하여 “한국형 통합평가 모형” 개발을 위해 환경부 기후변화대응 환경기술개발사업의<br>일환으로 2014년 5월 출범하였으며 기후변화 복합영향의 선택과 집중, 
				  그리고 문제 해결의 정책 지향적인 통합평가 모형 개발을 통해 현실성 있고 현장 적용이 <br>가능한 기후변화 적응대책 수립의 지원을 목표로 하며 국가기후변화적응센터를 중심으로 서울대학교, 고려대학교, 국립생태원 등이 참여하고 있습니다.<br>또한 리스크 기반의 정량적 적응정책 수립 활용 방법을 개발하여 미래 지향적인 적응전략 설계에 기여하고자 합니다.
				</p>
			</div>
			
			<div  style = "padding : 0 3%;">
				<h2>MOTIVE-Ecosystem 일반인 대상 시스템 개발</h2>
				<p  style = "font-size : 16px;">
				국립생태원은 한국환경산업기술원의 「기후변화대응 환경기술개발 사업」의 연구개발과제(부문별 기후변화 영향 및 취약성 통합평가 모형 기반구축 및
				<br>활용기술 개발)의 세부과제(기후변화 영향 및 취약성 통합평가 모형 요소기술 개발: 생태부문)에 의해 국가기후변화 적응대책에 기여하고자 기후 변화가 
				<br>생태계에 미치는 영향과 취약성을 평가하는 생태모형(MOTIVE-Ecosystem model)을 개발하였으며 본 시스템은 개발된 생태모형(MOTIVE-Ecosystem model)과 연동한 사용자 Graphic User Interface(GUI)를 비전문가 및 일반인들도 쉽게 사용할 수 있도록 접근성과 편의성을 겸비한 Web 기반의 GUI 시스템입니다. <br>본 시스템은 MOTIVE-Ecosystem model (생태모형)로부터 도출된 전문가들의 프로젝트의 결과를 한 눈에 확인하여 보다 더 쉽게 사용할 수 있도록 개발되었습니다.
				</p>
			</div>
		</div>
	</div>
</div>

<%@ include file="../all/footer.jsp" %>
</body>
</html>
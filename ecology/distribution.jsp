<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"
   integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
   crossorigin=""/>
   
    <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"
   integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew=="
   crossorigin=""></script>

<style>
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
		/* background-color: #d9d9d9; */
		color:#229AF6;
	}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#tabMenu div").click(function() {
			var tabIndex = $("#tabMenu div").index(this);
			
			$("#tabMenu div").attr("class" , "");
			$(this).attr("class" , "tabOn");
		});
	});
</script>

<body style = "background-color : white;">

<%@ include file="../all/header.jsp" %>

<div style="display:flex;">
	
	<div class="sideMenu" style="width: 11%; height: 600px;">
		<div style="width: 100%; height: 20%; background-color: #17366E; font-weight: bold; text-align: center; line-height: 50px;">
			<p style="font-size:30px; color: #ABC927;">생태영향 및<br> 취약성 평가</p>
		</div>
		
		<div style="width: 100%; height: 100%;">
			<ul class="ul1_menu1">
				<c:if test = "${sessionScope.auth != 'U' && not empty sessionScope.id}">
					<li><a href = "projectLookUp.eco">프로젝트 조회</a></li>
				</c:if>
				<li class="on"><a href="distribution.eco">> 종분포모형</a></li>
				<li><a href="diffusion.eco">종확산모형</a></li>
				<li>
					<a href="distriButionResult.eco">기후변화 민감종</a>
				<!-- 	<ul class="ul1_menu2">
						<li class="on"><div><a href="distribution.eco">→ 종분포모형</a></div></li>
						<li><a href="diffusion.eco">&nbsp;&nbsp;&nbsp;&nbsp;종확산모형</a></li>
						<li><a href="distriButionResult.eco">&nbsp;&nbsp;&nbsp;&nbsp;분포변화 결과</a></li>
						<li><a href="vulneRabilityIndex.eco">&nbsp;&nbsp;&nbsp;&nbsp;취약성 지수 결과</a></li>
					</ul> -->
				</li>
				<li><a href="exoticSpecies.etsp">외래종</a></li>
				<li><a href="habitat.hb">취약서식지</a></li>
			</ul>
		</div>
	</div>
	
	<div class="content"  style="width: 89%; height: 750px; background-color : white;">
		<c:if test="${sessionScope.auth != 'U' && sessionScope.auth != 'null'}">
			<div style="width : 99.9%; height:5%; border : 1px solid black; display : flex;">
				<!-- <p style="text-align : left; line-height : 40px; padding-left : 1%; font-weight:bold; font-size : 20px;"></p>
				 -->
				<label  style="text-align : left; line-height : 40px; padding-left : 1%; padding-right : 11%; font-weight:bold; font-size : 20px;" for="project_choice">프로젝트 선택</label>
				<select style="width : 80%; height : 80%; margin : 0 auto; margin-top : 4px;" id="project_choice">
					<option>프로젝트 선택 및 검색창</option>
					<option>Middle_test</option>
				</select>
			</div>
		</c:if>
		
		<div style="display:flex; height:100%;">
		
		
			<div style="width: 12%; height: 80%;border:1px solid black; ">
			
				<div style = "margin-left : 10px;">
					<a style="float:left; font-size: 20px; font-weight: bold;">종분포모형</a>
					<br><br>
					
					<label style = "display : block; font-size : 18px; font-weight : bold; margin-top : 20px;" for = "species">종 선택</label>
					<select id = "species"style = "width : 105px;">
						<option>가시박</option>
					</select>
					
					<label style = "display : block; font-size : 18px; font-weight : bold; margin-top : 20px;" for = "projectModels">모형 선택</label>
					<select id = "projectModels" style = "width : 105px;">
						<option>PA1_MAXE</option>
					</select>
					
					<label style = "display : block; font-size : 18px; font-weight : bold; margin-top : 20px;" for = "climateModel">기후모델</label>
					<select id = "climateModel" style = "width : 105px;">
						<option>KMA(기상청)</option>
					</select>
					
					<label style = "display : block; font-size : 18px; font-weight : bold; margin-top : 20px;" for = "climateSec">기후시나리오</label>
					<select id = "climateSec" style = "width : 105px;">
						<option>RCP 4.5</option>
					</select>
					
					<label style = "display : block; font-size : 18px; font-weight : bold; margin-top : 20px;" for = "year">예측년도</label>
					<select id = "year" style = "width : 105px;">
						<option>2000년도</option>
					</select>
				</div>
			</div>
			
			<div style="width : 88%">
				<div id="tabMenu" style="width: 100%; height: 40px;  display : flex;">
					<div class="tabOn" style="width: 30%; height: 40px; border:1px solid black; float:left; text-align: center; line-height: 40px;  font-size: 17px; font-weight: bold; ">
						<a href="#">확률 지도</a>
					</div>
						
					<div style="width: 30%; height: 40px; border:1px solid black; float:left; text-align: center; line-height: 40px; font-size: 17px;">
						<a href="#">예측 지도</a>
					</div>
					
					<div style="width: 40%; height: 40px; border:1px solid black; float:left; text-align: center; line-height: 40px; font-size: 17px;">
						<a href="#">모형 검증 및 변수 기여도</a>
					</div>
				</div>
			
			
			
				<div id="map" class="map" style="width: 99.9%; height: 100%; border:1px solid black; ">
					<!-- 마커찍는 지도  -->
					<script src="https://unpkg.com/leaflet@1.0.3/dist/leaflet.js"></script>
				    <script src="https://unpkg.com/georaster"></script>
				    <script src="https://unpkg.com/proj4"></script>
				    <script src="https://unpkg.com/georaster-layer-for-leaflet/georaster-layer-for-leaflet.browserify.min.js"></script>
						  <script>
					       
					       /* {crs:L.CRS.EPSG4326} */
						   var mymap = L.map('map').setView([127.123123, 36.123123], 6);
			
							var request = new XMLHttpRequest();  
							 
							request.onload = function() {
								if (this.status >= 200 && this.status < 400) {
									parseGeoraster(this.response).then(function(georaster){
										var layer = new GeoRasterLayer({
											georaster: georaster,
											opacity: 0.7,
											resolution: 256
										});
										layer.addTo(mymap);
						            	 
										mymap.fitBounds(layer.getBounds()); 
									});
								}
							};
						     
							request.open("GET", 'resources/img/test1.tif', true);
							request.responseType = "arraybuffer";
							request.send();
							
							L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(mymap);
					 </script>
				</div>
			</div>
			
		</div>
	</div>
</div>

</body>
</html>
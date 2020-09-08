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
		background-color: #d9d9d9;
		color:#229AF6;
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

	.notice-table tr {
	background-color : white;
}

.notice-table tr:hover {
	background-color : rgb(180 , 198 , 231);
}
	
.lookupTable tr{
	height:30px;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type = "text/javascript">
	$(document).ready(function() {
		
		
	});
	
</script>
<body>

<%@ include file="header.jsp" %>

<div style="display:flex;">
	
	<div class="sideMenu" style="width: 11%; height: 600px;">
		<div style="width: 100%; height: 20%; background-color: #17366E; font-weight: bold; text-align: center; line-height: 120px;">
			<p style="font-size:30px; color: #ABC927;">나의 검색 내역</p>
		</div>
		
		<div style="width: 100%; height: 100%;">
			<ul class="ul1_menu">
				<li class="on"><a href="distribution.eco">> 조회 이력</a></li>
			</ul>
		</div>
	</div>
	
	<div class="content"  style="width: 60%; height: 730px; background-color : white;  margin-left : 200px;">
		<div style = "width : 1200px; height : 90%;">
		
			<div style="width:95%; height: 30px; border-bottom: 3px solid #17366E; margin: 0 auto;">
				<h2>조회 이력</h2>
			</div>
			
			<div style="width: 45%; height: 100%;float:left; border:2px solid #DCDCDC; margin-left: 30px;">
			
				<div style="width: 90%; height: 10%; margin:0 auto;">
					<br>
					<select style="height: 30px;">
						<option>분류</option>
						<option>기후변화민감종</option>
						<option>외래종</option>
						<option>취약서식지</option>
					</select>
						
					<input style="height: 27px; margin-left: 10px;" type="text" placeholder="검색어를 입력해주세요.">
				
					<button class = "btn-primary" style = " width : 50px; height : 30px; margin-left : 10px; margin-top : 5px; position : relative;"id = "noticeCho">검색</button>
				</div>
				
				
				<div style="width: 90%; height: 35%; margin:0 auto;">
					<table  class = "notice-table" style = "margin-top : 10px;'">
						<tr style = "border-bottom : 1px solid black;">
							<th style = "width : 163px; height : 40px;">번호</th>
							<th style = "width : 163px; height : 40px;">분류</th>
							<th style = "width : 163px; height : 40px;">프로젝트명</th>
							<th style = "width : 163px; height : 40px;">조회일자</th>
						</tr>
							
						<tr>
							<td>1</td>
							<td>외래종</td>
							<td>AAA</td>
							<td>0000.00.00</td>
						</tr>
						
						<tr>
							<td>2</td>
							<td>기후변화민감종</td>
							<td>BBB</td>
							<td>0000.00.00</td>
						</tr>
						
						<tr>
							<td>3</td>
							<td>외래종</td>
							<td>CCC</td>
							<td>0000.00.00</td>
						</tr>
						
						<tr>
							<td>4</td>
							<td>최약서식지</td>
							<td>EEE</td>
							<td>0000.00.00</td>
						</tr>
					</table>
				</div>
				
				<div style="width: 30px; height: 30px; margin:0 auto;">
					<img style="width: 30px; height: 30px;" src="resources/img/page_1.png">
				</div>
			</div>
		
		
			<div style="width: 40%; height: 100%; float:left; border:2px solid #DCDCDC; margin-left: 30px;">
			
				<div id="map" class="map" style="width: 90%; height: 60%; float:left; margin-left:22px;">
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
		
			
				<div style="width: 90%; height: 40%; float:left; border:1px solid black; margin-left:22px; background-color: white;">
					<br>
					<table class="lookupTable">
						<tr>
							<td>분류:</td>
							<td>외래종 - 외래종 풍부도</td>
						</tr>
						
						<tr>
							<td>항목:</td>
							<td>교란종_maxent</td>
						</tr>
						
						<tr>
							<td>종선택 :</td>
							<td>가시박</td>
						</tr>
						
						<tr>
							<td>기후모델:</td>
							<td>KMA (기상청)</td>
						</tr>
						
						<tr>
							<td>기후시나리오:</td>
							<td>RCP 4.5</td>
						</tr>
						
						<tr>
							<td>예측년도 :</td>
							<td>2000년</td>
						</tr>
						
						<tr>
							<td>지도정보:</td>
							<td>시도(행정구역)</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		
	</div>
</div>

</body>
</html>
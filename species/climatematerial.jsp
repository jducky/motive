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
	
	.select_tb{
		width: 100%;
		text-align: center;
	}
	.select_th{
		width: 90%;
		text-align: center;
	
	}
	.select_th tr th{
		background-color: gray;
		color: white;
	}
	/* .select_tb thead{
	 display:inline-table;
  	 position:absolute;
	   top:0;
	  width:12%;
	  background:#eef7ff;
	}
	.select_tb thead tr th{
		background-color: gray;
		color: white;
	} */
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://unpkg.com/leaflet@1.0.3/dist/leaflet.js"></script>
<script src="https://unpkg.com/georaster"></script>
<script src="https://unpkg.com/proj4"></script>
<script src="https://unpkg.com/georaster-layer-for-leaflet/georaster-layer-for-leaflet.browserify.min.js"></script>
<script type = "text/javascript">
	function markerDelAgain() {
		 
		for(i=0;i<test.length;i++) {
			mymap.removeLayer(test[i]);
	   	 }
	
		console.log(test.length);
		
		test.splice(0,test.length);
		arrlo_x.splice(0,arrlo_x.length);
		arrlo_y.splice(0,arrlo_y.length);
		
		
	} 
	
	
</script>
<body style = "background-color : white;">

<%@ include file="../all/header.jsp" %>

<div style="display:flex;">
	
	<div class="sideMenu" style="width: 11%; height: 600px;">
		<div style="width: 100%; height: 20%; background-color: #17366E; font-weight: bold; text-align: center; line-height: 120px;">
			<p style="font-size:30px; color: #ABC927;">입력자료 조회</p>
		</div>
		
		<div style="width: 100%; height: 100%;">
			<ul>
				<li><a href = "speciesdata.sp">생물종자료</a></li>
				<li><a href="linkedmaterial.sp">연계 자료</a></li>
				<li class="on"><a href="climatematerial.sp">> 기후 자료</a></li>
			</ul>
		</div>
	</div>
	
	<div class = "content" style="width: 89%; height: 830px; background-color : white;">
	
		
			<div style="width: 14%; height: 80%;float:left; border:1px solid #17366E;">
				
				<div style ="margin-left : 10px;">
					<a style="float:left; font-size: 20px; font-weight: bold;">기후 자료</a>
					
					<!-- <a href="#"><img style="width: 80px; height: 30px; margin-left: 60px;" onclick = "" src= resources/img/btn4.PNG></a> -->
					
					<br><br>
					
					<label  style = "display : block; font-size : 18px; font-weight : bold;" for = "model">기후 모델</label>
					<select id = "model" style="width: 130px;">
						<option value = "KMA">KMA</option>
						<option value = "KEI">KEI</option>
					</select>
					
					<label style = "display : block; font-size : 18px; font-weight : bold; margin-top : 30px;" for = "sec">기후 시나리오</label>
					<select id = "sec" style="width: 130px;">
						<option value = "RCP4.5">RCP4.5</option>
						<option value = "RCP8.5">RCP8.5</option>
					</select>
					
					<label for = "year" style = "display : block; font-size : 18px; font-weight : bold; margin-top : 30px;">예측년도</label>
					<select id = "year" style="width: 130px;">
						<option value = "2000">2000년도</option>
						<option value = "2010">2010년도</option>
						<option value = "2020">2020년도</option>
						<option value = "2030">2030년도</option>
						<option value = "2040">2040년도</option>
						<option value = "2050">2050년도</option>
						<option value = "2060">2060년도</option>
						<option value = "2070">2070년도</option>
						<option value = "2080">2080년도</option>
					</select>
					
					<label style ="display : block; font-size : 18px; font-weight :bold; margin-top : 30px;"  for = "land">연계자료</label>
					<select id = "land" style="width: 130px;">
						<option value = "bio01">bio01</option>
						<option value = "bio02">bio02</option>
						<option value = "bio03">bio03</option>
						<option value = "bio04">bio04</option>
						<option value = "bio05">bio05</option>
						<option value = "bio06">bio06</option>
						<option value = "bio07">bio07</option>
						<option value = "bio08">bio08</option>
						<option value = "bio09">bio09</option>
						<option value = "bio10">bio10</option>
						<option value = "bio11">bio11</option>
						<option value = "bio12">bio12</option>
						<option value = "bio13">bio13</option>
						<option value = "bio14">bio14</option>
						<option value = "bio15">bio15</option>
						<option value = "bio16">bio16</option>
						<option value = "bio17">bio17</option>
						<option value = "bio18">bio18</option>
						<option value = "bio19">bio19</option>
					</select>
				</div>
			
			</div>
		
			<div id="map" class="map" style="width: 85.7%; height: 100%; border:1px solid black; float:left; position : relative;">
			
				<script src="https://unpkg.com/leaflet@1.0.3/dist/leaflet.js"></script>
			    <script src="https://unpkg.com/georaster"></script>
			    <script src="https://unpkg.com/proj4"></script>
			    <script src="https://unpkg.com/georaster-layer-for-leaflet/georaster-layer-for-leaflet.browserify.min.js"></script>
					<script>
				 	
					var mymap = L.map('map').setView([127.123123, 36.123123], 6);
		
					var request = new XMLHttpRequest();  
					 
					var path = 'resources/img/bio14.tif';
					
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
				     
					request.open("GET",path , true);
					request.responseType = "arraybuffer";
					request.send();
					
					L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(mymap);
				 
			   
			    
				</script>
		</div>
		
	</div>
</div>

<input name = "species_id" id="species_id" type="hidden" value = "null">

</body>
</html>
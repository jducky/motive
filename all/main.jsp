<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MOTIVE</title>
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700&amp;subset=korean">
</head>
 <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"
   integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
   crossorigin=""/>
   
    <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"
   integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew=="
   crossorigin=""></script>
   
<style>
#mapid { width: 500px; height: 500px; margin:0 auto;}
#test{ margin:0 auto; width: 550px; height: 550px; border:1px solid black;}

.notice_tb tr{
	border-bottom: 1px solid #f5f5f5;-
}
.notice_tb tr th{
	width: 84%;
	height: 35px;
	text-align: left;
}
.notice_tb tr td{
	width: 20%;
}
</style>

<script type="text/javascript">

	function notice_detail(seq){
		
		var url = "NoticeDetailPop.do?seq=" + seq;
		var name = 'NoticeDetailPop';
		var option = 'width = 560, height = 500';
		
		window.open(url,name,option);
		
	}

</script>
<body style="background-color: #f5f5f5;"> 

<%@ include file="header.jsp" %>
	
	<div class="content">
	
	<br>
		<div style="width: 500px; height: 700px; float:left; margin-left: 28%; ">
			<div style="width: 100%; height: 50px; background-color: white;">
				<div style="width: 10%; height: 50px;  float:left; margin-top: 5px; margin-left: 10px;">
					<a href="#"><img style="width: 40px; height: 40px;" src="resources/img/btn3.PNG"></a>
				</div>
				
				<div style="width: 50%; height: 20px; margin-top:15px; float:left; margin-left: 80px;">
					행정구역별 2000년 가시박의 취약서식지
				</div>
				<div style="width: 10%; height: 50px;  float:left; margin-top: 5px; margin-left: 50px;">
					<a href="#"><img style="width: 40px; height: 40px;" src="resources/img/btn2.PNG"></a>
				</div>	
						
				<img style="width: 100%; height: 650px;" src="resources/img/mainImg.PNG">
				
			</div>
			
		</div>
		<!-- <br> -->
		
		<div style="width: 500px; height: 700px;  float:left; margin-left: 2%;">
			
			<div style="width: 500px; height: 200px;">
				
				<a href="distribution.eco"><div style="width: 32%; height: 200px; background-color: white; float:left; border-right: 1px solid #f5f5f5;">
					<img style="width:106px; height:106px; margin-left: 27px; margin-top:20px;" src="resources/img/quick1.png">
					<h3 style="margin-left: 28px;">기후변화민감종  <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 결과조회</h3>
				</div></a>
				
				<a href="#"><div style="width: 33%; height: 200px; background-color: white; float:left; border-right: 1px solid #f5f5f5;">
					<img style="margin-left: 32px; margin-top:20px; width : 106px; height : 106px;" src="resources/img/quick2.png">
					<h3 style="margin-left: 28px;">외래종 결과조회</h3>
				</div></a>
				
				<a href="#"><div style="width: 33%; height: 200px; background-color: white; float:left; border-right: 1px solid #f5f5f5;">
					<img style="width:106px; height:106px; margin-left: 32px; margin-top:20px;" src="resources/img/quick3.png">
					<h3 style="margin-left: 18px;">취약서식지 결과조회</h3>
				</div></a>
			</div>
			
			<br>
			<div style="width: 500px; height: 490px; background-color: white;">
				<div style="width: 470px; height: 50px; border-bottom:1px solid #f5f5f5; margin:0 auto;">
					<div style="width: 65px; height: 45px; border-bottom:4px solid #1F99F6; border-radius:1px; float:left;">
						<h3>공지사항</h3>
					</div> 
					
					<div style="width: 60px; height: 50px; float:right;">
						<a href="#"><img style="margin-top:7px; margin-left:15px; width: 40px; height: 40px;" src="resources/img/btn1.PNG"></a>
					</div>
				</div>
				
				<div style="width: 470px; height: 205px; margin:0 auto;">
					<table class="notice_tb">
					<c:forEach var="list" items="${vo}" begin="0" end="11">
						<tr>
							<th><a href="#" onclick="notice_detail('${list.seq}');">${list.board_name }</a></th>
							<th>${list.ins_date }</th>
						</tr>
					</c:forEach>
						
					</table>
				</div>
				
			</div>
		
		</div>
			<!-- 마커찍는 지도  -->
			  <script>
			 /*  var mapboxAccessToken = 'pk.eyJ1IjoicmxhZ3VzdG44NzA1IiwiYSI6ImNrY2VnZzhhbjA1ZTcyeW15bnZkbGg2ZTUifQ.7kjkrWAesU6JeCMV9OGi4A';
			  var map = L.map('map').setView([37.8, -96], 4);

			  L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=' + mapboxAccessToken, {
			      id: 'mapbox/light-v9',
			      attribution: ...,
			      tileSize: 512,
			      zoomOffset: -1
			  }).addTo(map);

			  L.geoJson(statesData).addTo(map); */
			  
			  
			 /*  var mymap = L.map('mapid').setView([51.505, -0.09], 13);
			 var marker = L.marker([51.5, -0.09]).addTo(mymap);
			 var marker = L.marker([51.12, -0.19]).addTo(mymap);
			 marker.bindPopup("<b>Hello world!</b><br>I am a popup.").openPopup();
			  L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
				    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
				    maxZoom: 18,
				    id: 'mapbox/streets-v11',
				    tileSize: 512,
				    zoomOffset: -1,
				    accessToken: 'pk.eyJ1IjoicmxhZ3VzdG44NzA1IiwiYSI6ImNrY2VnZzhhbjA1ZTcyeW15bnZkbGg2ZTUifQ.7kjkrWAesU6JeCMV9OGi4A'
				}).addTo(mymap);   */
			 </script>
		
	</div>
	
	<br><br><br><br>
	<%@ include file="footer.jsp" %>

</body>
</html>
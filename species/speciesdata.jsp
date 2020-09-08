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
	.btn-primary {
	  margin-right : 10px;  
	  width: 72px; 
	  height: 25px;
	  border: none;
	  background: #17366e; 
	  color:#fff; 
	  font-size: 14px;
	  float : right;
	  cursor : pointer;
	}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type = "text/javascript">

var arrlo_x = new Array();
var arrlo_y = new Array();

var test = new Array();

	$(document).ready(function() {
		$(".select_tb tbody td").click(function() {
			
		});
		
		$("#agency").change(function() {
			var agencyVal = $(this).val();
			
			var data = {'agency' : agencyVal}
			
			$.ajax({
				type : 'POST' ,
				data  : data ,
				url : 'getSpeciesTypes.sp' ,
				dataType : 'json' ,
				success : function(result) {
					
					$("#species").empty();
					$("#species").append("<option value='all'>전체</option>");
					for(var species of result) {
						$("#species").append("<option value='"+ species + "'>" + species + "</option>");
					}
				},
				error : function(err) {
					console.log(err);
				}
			});
		});
		
	});
	
	

	
	function getData(id){
		
		var data = {"id":id};
		
		$('#species_id').val(id);
		
		$.ajax({
			type : 'POST' ,
			data  : data,
			url : 'getData.sp' ,
			dataType : 'json',
			success : function(result) {
				$('#td1').text(result[0]);
				$('#td2').text(result[1]);
				$('#td3').text(result[2]);
				$('#td4').text(result[3]);
				$('#td5').text(result[4]);
				
				getImg();
				
				
				 if(test.length != 0 ){ 
				 	markerDelAgain(); 
				 }
				
				getlocation_x();
				getlocation_y();
				
				getzi(); 
			} ,
			error : function(err) {
				alert(err);
			}
		});
	}
	
	function getImg(){
		$.ajax({
			type : 'POST' ,
			url : 'getImg.sp' ,
			success : function(result) {
				$('#bigimg').attr('src',result);
			} ,
			error : function(err) {
				alert(err);
			}
		});
	}
	
	function getlocation_x(){
		
		 var id = $('#species_id').val();
		
		var data = {'id':id};
		
		$.ajax({
			type : 'POST' ,
			data : data,
			dataType: 'json',
			url : 'getlocation_x.sp' ,
			success : function(result) {
				
				for(i = 0; i<result.length; i++){
					arrlo_x[i] = result[i];
				};
				
				
			} ,
			error : function(err) {
				alert(err);
			}
		});
		
	}
	
	function getlocation_y(){
		
		
		var id = $('#species_id').val();
		
		var data = {'id':id};
		
		$.ajax({
			type : 'POST' ,
			data : data,
			dataType: 'json',
			url : 'getlocation_y.sp' ,
			success : function(result) {
				
				for(i = 0; i<result.length; i++){
					arrlo_y[i] = result[i];
				};
				
			} ,
			error : function(err) {
				alert(err);
			}
		});
	}
	
	function getzi(){
		  
		  var marker;
	  	  var marker2;	
		  for(i=0; i<arrlo_x.length; i++){
			  var LamMarker = new L.marker([arrlo_y[i], arrlo_x[i]]).bindTooltip(  arrlo_y[i] +  " , " +  + arrlo_x[i] );
			  test.push(LamMarker);
			  mymap.addLayer(test[i]);  
		  };
			
		 
	}
	
	 function markerDelAgain() {
		 
		for(i=0;i<test.length;i++) {
			mymap.removeLayer(test[i]);
	   	 }
		
		test.splice(0,test.length);
		arrlo_x.splice(0,arrlo_x.length);
		arrlo_y.splice(0,arrlo_y.length);
		
		
	} 
	 
	function getSelectData() {
		var agency = $("#agency").val();
		var speices = $("#species").val();
		var keyword =  $("#specieName").val();
		
		var data = {'agency' : agency , 'speices' : speices , 'keyword' : keyword}
		
		$.ajax({
			type : 'POST' ,
			data : data ,
			url : 'speciesSelectData.sp' ,
			dataType : 'json' ,
			success : function(result) {
				var data = result.list;
				$(".select_tb tbody").empty();
				
				if(data.length != 0) {
					for(var x = 0; x < data.length; x++) {
						var speciesId = data[x].id;
						var speciesName = data[x].k_name;
						
						$(".select_tb").append("<tbody><tr style='height: 20px;'><td style='width: 30%; cursor : pointer;'><a  onclick='getData(`" + speciesId + "`);'>" +  speciesId + " </a></td>" +
						"<td style='width: 70%; cursor : pointer;'><a  onclick='getData(`" + speciesId + "`);'>" + speciesName  + "</a></td></tr></tbody>");
					}	
				} else {
					$(".select_tb").append("<tbody><tr style='height : 20px'><td style='width : 100%'>조회 결과가 없습니다.</td></tr></tbody>");
				}
				
			},
			error : function(err) {
				console.log(err);
			}
		});
	}

</script>
<body style = "background-color : white;">

<%@ include file="../all/header.jsp" %>

<div style = "display : flex;">

	<div class="sideMenu" style="width: 11%; height: 600px;">
		<div style="width: 100%; height: 20%; background-color: #17366E; font-weight: bold; text-align: center; line-height: 120px;">
			<p style="font-size:30px; color: #ABC927;">입력자료 조회</p>
		</div>
		
		<div style="width: 100%; height: 100%;">
			<ul>
				<li class="on"><a href = "speciesdata.sp">> 생물종자료</a></li>
				<li><a href="linkedmaterial.sp">연계 자료</a></li>
				<li><a href="climatematerial.sp">기후 자료</a></li>
			</ul>
		</div>
	</div>
	
	<div class = "content" style="width: 89%; height: 830px; background-color : white;">
			
			<div style="width: 14%; height: 100%;float:left; border:1px solid #17366E;">
			
				<div style = "margin-left : 10px;">
					<a style="float:left; font-size: 20px; font-weight: bold;">생물종자료</a>
					
					<br><br>
					<label style = "display : block; font-size : 18px; font-weight : bold;" for = "agency">기관</label>
					<select id = "agency" style="width: 100px;">
						<option value="all">전체</option>
						<c:forEach var="institute" items="${institute}">
							<option value="${institute}">${institute}</option>
						</c:forEach>
					</select>
					
					<label style = "display : block; font-size : 18px; font-weight : bold; margin-top : 10px;" for = "species">종분류</label>
					<select id = "species" style="width: 100px;">
						<option value="all">전체</option>
						<c:forEach var="type" items="${type}">
							<option value="${type}">${type}</option>
						</c:forEach>	
					</select>
					
					<label style = "display : block; font-size : 18px; font-weight : bold; margin-top : 10px;" for = "specieName">종명</label>
					<input id = "specieName" type="text" placeholder="검색어를 입력하세요.">
					
					<br><br>
				<!-- 	<img style="width: 80px; height: 30px; margin-left: 120px; cursor : pointer;" onclick="getSelectData()" src= resources/img/btn4.PNG> -->
					<input type="button" class="btn-primary" onclick="getSelectData()" value="검색"/>
					
					<p style = "text-align : left; font-weight : bold; font-size : 16px; padding : 20% 0 4% 0;">조회 결과</p>
				</div>
				<table class="select_th">
					<tr style="height: 20px;">
						<th style="width: 30%;">번호</th>
						<th style="width: 70%;" >종명</th>	
					</tr>
				</table> 
				<div style="overflow:scroll; overflow-x : hidden; width:94%; height: 22%; margin : 0 auto;">
				
					<table class="select_tb">
						<c:forEach var="list" items="${list}">
							<tbody>
								<tr style="height: 20px;">
									<td style="width: 30%;"><a href="#" onclick="getData('${list.id }');">${list.id }</a></td>
									<td style="width: 70%;" ><a href="#" onclick="getData('${list.id }');">${list.k_name }</a></td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
				<div style="text-align : center; padding-top : 10%;">
						<img style="width: 215px; height: 170px;" id="bigimg" src="${img }">
					</div>
				
				
					<div style="float:left;">
						<table style="margin-left : 20px;">
							<tr>
								<td>기관 :</td>
								<td id="td1"></td>
							</tr>
							
							<tr>
								<td>종분류 :</td>
								<td id="td2"></td>
							</tr>
							
							<tr>
							
								<td>종명 :</td>
								<td id="td3"></td>
							</tr>
							
							<tr>
								<td>N_POINT : </td>
								<td id="td4"></td>
							</tr>
							
							<tr>
								<td>RUN :</td>
								<td id="td5"></td>
							</tr>
						</table>
					</div>
			</div>
			
			<div id="map" class="map" style="width: 85.7%; height: 100%; border:1px solid black; position : relative;">
			
				<script>
				var mymap = L.map('map').setView([35.891034,127.772757], 7);
				    
				 L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
						attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors' //화면 오른쪽 하단 attributors
					}).addTo(mymap);  
				 
				
				</script>
			</div>
	</div>
</div>

<input name = "species_id" id="species_id" type="hidden" value = "null">

</body>
</html>
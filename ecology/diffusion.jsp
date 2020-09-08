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
		color:#229AF6;
	}
	
	.diffusion_img {
		width  : 140px;
		height : 180px;
		bottom : 20px;
		margin-top : 0;
		border-right : 1px solid black;
		border-left : 1px solid black;
		border-bottom : 1px solid black;
	}
	
	.diffusion_text {
		border : 1px solid black;
		font-weight : bold;
		width : 140px;
		text-align : center;
	}
	
	.diffusion_bigImg {
		width : 500px;
		height : 600px;
	}
	
	#diffusion_name {
	 	font-weight : bold;
	 	font-size : 20px;
	}
	
	#diffusion_menu li {
		margin-top : 10px;
		padding-right : 3%;
	}
	
	.diffusion_textOn {
		background-color: rgb(171 , 201 , 39);
	    color: white;
	    border: 1px solid rgb(171 , 201 , 39);
	    font-weight: bold;
	}
	
	.diffusion_imgOn {
		border-right : 1px solid rgb(171 , 201 , 39);
		border-left : 1px solid rgb(171 , 201 , 39);
		border-bottom : 1px solid rgb(171 , 201 , 39);
	}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type = "text/javascript">
	
	var imgarr = new Array();
	
	function pageIn() {
		var img = $("#diffusion_menu li:eq(0)").find("img");
		var text  = $("#diffusion_menu p:eq(0)");
		
		
		$("#diffusion_menu p:eq(0)").attr("class" , "diffusion_text diffusion_textOn")
		$("#diffusion_menu li:eq(0)").find("img").attr("class" , "diffusion_img diffusion_imgOn");
		
		var textVal = text[0].textContent;
		var option = $("#diffusion_species").val();
		
		$("#diffustion_imgBox").append("<img src = '" + img[0].src + "'class = 'diffusion_bigImg'/>");
		$("#diffusion_name").text(option + " / " + textVal);
	}
	

	$("#document").ready(function() {
		pageIn();
		
		$('#diffusion_menu li').click(function(){
			var li_index = $('#diffusion_menu li').index(this);
			
			$("#diffustion_imgBox").empty();
			
			var img = $("#diffusion_menu li:eq(" + li_index +")").find("img");
			var text  = $("#diffusion_menu p:eq("+ li_index+")");
			
			
			$("#diffusion_menu p").attr("class" , "diffusion_text");
			$("#diffusion_menu p:eq("+ li_index+")").attr("class" , "diffusion_text diffusion_textOn")
			
			$("#diffusion_menu li img").attr("class" , "diffusion_img");
			$("#diffusion_menu li:eq(" + li_index +")").find("img").attr("class" , "diffusion_img diffusion_imgOn");
			
			var textVal = text[0].textContent;
			var option = $("#diffusion_species").val();
			
			$("#diffustion_imgBox").append("<img src = '" + img[0].src + "'class = 'diffusion_bigImg'/>");
			$("#diffusion_name").text(option + " / " + textVal);
		});
		
		$("#ul1_menu1 li").click(function() {
			var li_index = $('#ul1_menu1 li').index(this);
			
		});

		$("#ul1_menu2 li").click(function() {
			var li_index = $('#ul1_menu2 li').index(this);
			
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
				<li><a href="distribution.eco">종분포모형</a></li>
				<li class="on"><a href="diffusion.eco">> 종확산모형</a></li>
				<li>
					<a href="distriButionResult.eco">기후변화 민감종</a>
					<!-- <ul class="ul1_menu2">
						<li><a href="distribution.eco">&nbsp;&nbsp;&nbsp;&nbsp;종분포모형</a></li>
						<li class="on"><a href="diffusion.eco">종확산모형</a></li>
						<li><a href="distriButionResult.eco">&nbsp;&nbsp;&nbsp;&nbsp;분포변화 결과</a></li>
						<li><a href="vulneRabilityIndex.eco">&nbsp;&nbsp;&nbsp;&nbsp;취약성 지수 결과</a></li>
					</ul> -->
				</li>
				<li><a href="exoticSpecies.etsp">외래종</a></li>
				<li><a href="habitat.hb">취약서식지</a></li>
			</ul>
		</div>
	</div>
	
	<div class="content"  style="width: 89%; height: 789px; background-color : white;">
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
		<div style = "display:flex; height:100%;">
			
			<div style="width: 12%; height: 100%;border:1px solid black;">
				<div style = "margin-left : 10px;">
					<a style="float:left; font-size: 20px; font-weight: bold;">종확산모형</a>
					<br><br>
					
					
					<label style = "display : block; font-size : 18px; font-weight : bold; margin-top : 20px;" for = "distributionModel">분포모형</label>
					<select id = "distributionModel" style = "width : 105px;">
						<option>BIOMOD2</option>
					</select>
					
					<label style = "display : block; font-size : 18px; font-weight : bold; margin-top : 20px;" for = "speciesSelect">종 선택</label>
					<select id = "speciesSelect" style = "width : 105px;" >
						<option value = "가래고사리">가래고사리</option>
					</select>
					
					<label style = "display : block; font-size : 18px; font-weight : bold; margin-top : 20px;" for = "predictModel">예측모델</label>
					<select id = "predictModel" style = "width : 105px;">
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
				</div>
			</div>
			
			<div style="width : 88%;">
			
				<div style="width: 100%; height: 40px; display : flex;">
					<div style="width: 50%; height: 40px; border:1px solid black; float:left; text-align: center; line-height: 40px; background-color: #17366E; color:#ABC927; font-size: 17px; font-weight: bold; ">
						<a href="#">생물종 분포 변화</a>
					</div>
						
					<div style="width: 50%; height: 40px; border:1px solid black; float:left; text-align: center; line-height: 40px; font-size: 17px;">
						<a href="#">생물종 확산 한계</a>
					</div>
				</div>
				
				<div style = "display : flex;">
					<ul id = "diffusion_menu" style="margin : 0 auto; padding-top : 4%;" >
						<ul style="display : flex;">
							<li>
								<p class = "diffusion_text">2000년</p>
								<img id="2000" class = "diffusion_img" src="${img0 }"/>
							</li>
							
							<li>
								<p class = "diffusion_text">2010년</p>
								<img id="2010" class = "diffusion_img"  src = "${img1 }"/>
							</li>
							<li>
								<p class = "diffusion_text">2020년</p>
								<img id="2020" class = "diffusion_img"  src = "${img2 }"/>
							</li>
						</ul>
						<ul style="display : flex;">
							<li>
								<p class = "diffusion_text">2030년</p>
								<img id="2030" class = "diffusion_img"  src = "${img3 }"/>
							</li>
							
							<li>
								<p class = "diffusion_text">2040년</p>
								<img id="2040" class = "diffusion_img"  src = "${img4 }"/>
							</li>
							
							<li>
								<p class = "diffusion_text">2050년</p>
								<img id="2050" class = "diffusion_img"  src = "${img5 }"/>
							</li>
						</ul>
				
						<ul style="display : flex;">
							<li>
								<p class = "diffusion_text">2060년</p>
								<img id="2060" class = "diffusion_img"  src = "${img6 }"/>
							</li>
							
							<li>
								<p class = "diffusion_text">2070년</p>
								<img id="2070" class = "diffusion_img"  src = "${img7 }"/>
							</li>
							
							<li>
								<p class = "diffusion_text">2080년</p>
								<img id="2080" class = "diffusion_img"  src = "${img7 }"/>
							</li>
						</ul>
					
					</ul>
				
				
					<div id = "diffusion_bigImg" style="margin : 0 auto; text-align : center; padding-top : 4%;">
						<p id = "diffusion_name"></p>
						<div id = "diffustion_imgBox">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>
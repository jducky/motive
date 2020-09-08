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
	text-align : center;
	width : 140px;
}

.species_text {
	border : 1px solid black;
	font-weight : bold;
	text-align : center;
	width : 97%;
}

.diffusion_bigImg {
	width : 510px;
	height : 640px;
}

#diffusion_name {
 	font-weight : bold;
 	font-size : 20px;
 	margin : 20px 0px 20px 265px;
}

#diffusion_menu li {
	margin-top : 10px;
}

.species_textOn {
	color : white;
	border : 1px solid rgb(171 , 201 , 39);
	font-weight : bold;
	background-color : rgb(171 , 201 , 39);
}
.species {
	width : 230px;
	height : 260px;
	margin-left : 10px;
	border : 1px solid black;
	margin-bottom : 25px;
	overflow:auto;
}

.species_img {
	width : 80px;
	height : 80px;
	border-right : 1px solid black;
	border-left : 1px solid black;
	border-bottom : 1px solid black;
	opacity : 0.4;
}
.species_img:hover {
	opacity : 1.0;
}

.species_ul {
	margin-top : 8px;
	margin-right : 10px;
}

.species_ul li:nth-child(even) {
	margin-right : 35px;
}

.species_ul li:nth-child(odd) {
	margin-right : 15px;
}

.species_imgOn {
	opacity : 1.0;
	border-right : 1px solid rgb(171 , 201 , 39);
	border-left : 1px solid rgb(171 , 201 , 39);
	border-bottom : 1px solid rgb(171 , 201 , 39);
}

#option_menu li {
}

.diffusion_textOn {
	color : white;
	border : 1px solid rgb(171 , 201 , 39);
	font-weight : bold;
	background-color : rgb(171 , 201 , 39);
}

.selectBox {
	width : 105px;
}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type = "text/javascript">
	var arrimg = new Array();
	var arrsubimg = new Array();
	var startUl;
	var endUl;
	var appendLi = "";
	
	function pageIn() {
		var img = $(".species_ul li:eq(0)").find("img");
		
		img.attr("class" , "species_img species_imgOn");
		
		$(".species_ul li p:eq(0)").attr("class" , "species_text species_textOn")
		
		var liIndex = 0;
		var startYear = 2000;
		var year = 10;
		const yearIndex = 10;
		
		startUl = "<ul style='display: flex;'>";  	
		endUl = "</ul>";
		
		for(var i = 1; i < yearIndex; i++) {
			inputYear = startYear + (year *  (i - 1 ));
			
			var li =
				"<li style = 'padding-right : 3%;'>" +
					"<p class = 'diffusion_text '> " +  inputYear + "년</p>" +
					"<img id='imgli" + i  + "'class = 'diffusion_img' src = '' />" +
				"</li>";
			
			var integerBol = Number.isInteger(i / 3);	
			
			if(integerBol == false) {
				if(liIndex == 0) {
					appendLi += startUl + li;
					liIndex = 1;
				} else {
					appendLi += li;
				}
			} else {
				appendLi += li + endUl;
				$("#diffusion_menu").append(appendLi);
				appendLi = "";
				liIndex = 0;
			}
			
		}
	
		
 		$('#imgli1').attr('src',arrimg[0]);
		$('#imgli2').attr('src',arrimg[1]);
		$('#imgli3').attr('src',arrimg[2]);
		$('#imgli4').attr('src',arrimg[3]);
		$('#imgli5').attr('src',arrimg[4]);
		$('#imgli6').attr('src',arrimg[5]);
		$('#imgli7').attr('src',arrimg[6]);
		$('#imgli8').attr('src',arrimg[7]);
		$('#imgli9').attr('src',arrimg[7]);
		
		var img = $("#diffusion_menu li:eq(0)").find("img");
		
		$("#diffusion_menu li p:eq(0)").attr("class" , "diffusion_text diffusion_textOn")
		
		$("#diffusion_menu li:eq(0)").find("img").attr("class" , "diffusion_img species_imgOn");
		
		$("#diffustion_imgBox").append("<img src = '" + img[0].src + "'class = 'diffusion_bigImg'/>"); 
		
	}

	$("#document").ready(function() {
		
		arrimg.push('${img0}');
		arrimg.push('${img1}');
		arrimg.push('${img2}');
		arrimg.push('${img3}');
		arrimg.push('${img4}');
		arrimg.push('${img5}');
		arrimg.push('${img6}');
		arrimg.push('${img7}');
		arrimg.push('${img7}');
		
		arrsubimg.push('${subimg0}');
		arrsubimg.push('${subimg1}');
		arrsubimg.push('${subimg2}');
		arrsubimg.push('${subimg3}');
		arrsubimg.push('${subimg4}');
		arrsubimg.push('${subimg5}');
		
		$('#subimg1').attr('src',arrsubimg[0]);
		$('#subimg2').attr('src',arrsubimg[1]);
		$('#subimg3').attr('src',arrsubimg[2]);
		$('#subimg4').attr('src',arrsubimg[3]);
		$('#subimg5').attr('src',arrsubimg[4]);
		$('#subimg6').attr('src',arrsubimg[5]);
		
		
		pageIn();
		
		$(document).on("click" , "#diffusion_menu li" , function(){
			var li_index = $('#diffusion_menu li').index(this);
			
			$("#diffustion_imgBox").empty();
			
			var img = $("#diffusion_menu li:eq(" + li_index +")").find("img");
			
			$("#diffusion_menu li p").attr("class" , "diffusion_text");
			$("#diffusion_menu li p:eq("+ li_index+")").attr("class" , "diffusion_text diffusion_textOn")
			
			$("#diffusion_menu li img").attr("class" , "diffusion_img");
			$("#diffusion_menu li:eq(" + li_index +")").find("img").attr("class" , "diffusion_img species_imgOn");
			
			$("#diffustion_imgBox").append("<img src = '" + arrimg[li_index] + "'class = 'diffusion_bigImg'/>");
		});
		
		$(".species_ul li").click(function() {
			var li_index = $(".species_ul li").index(this);
			$("#diffusion_menu").empty();
			$("#diffustion_imgBox").empty();
			
			var img = $(".species_ul li:eq("+ li_index+ ")").find("img");
			
			$(".species_ul li img").attr("class" , "species_img");
			img.attr("class" , "species_img species_imgOn");
			
			$(".species_ul li p").attr("class" , "species_text");
			$(".species_ul li p:eq("+ li_index+")").attr("class" , "species_text species_textOn")
			
			
				
			var liIndex = 0;
			var startYear = 2000;
			var year = 10;
			const yearIndex = 10;
			
			startUl = "<ul style='display: flex;'>";  	
			endUl = "</ul>";
		
	
		
			for(var i = 1; i < yearIndex; i++) {
				inputYear = startYear + (year *  (i - 1 ));
				
				var li =
					"<li style = 'padding-right : 3%;'>" +
						"<p class = 'diffusion_text '> " +  inputYear + "년</p>" +
						"<img id='imgli" + i  + "'class = 'diffusion_img' src = '' />" +
					"</li>";
				
				var integerBol = Number.isInteger(i / 3);	
				
				if(integerBol == false) {
					if(liIndex == 0) {
						appendLi += startUl + li;
						liIndex = 1;
					} else {
						appendLi += li;
					}
				} else {
					appendLi += li + endUl;
					$("#diffusion_menu").append(appendLi);
					appendLi = "";
					liIndex = 0;
				}
				
			}
			
			$.ajax({
				type : 'POST' ,
				/* data  : , */
				url : 'getImage.eco' ,
				dataType : 'json',
				success : function(result) {
					
					$('#imgli1').attr('src',result[0]);
					$('#imgli2').attr('src',result[1]);
					$('#imgli3').attr('src',result[2]);
					$('#imgli4').attr('src',result[3]);
					$('#imgli5').attr('src',result[4]);
					$('#imgli6').attr('src',result[5]);
					$('#imgli7').attr('src',result[6]);
					$('#imgli8').attr('src',result[7]);
					$('#imgli9').attr('src',result[7]);
				} ,
				error : function(err) {
					alert(err);
				}
			});
			
			$("#diffusion_menu li:eq(0)").click();
			
		});

		
		
	});

	function imgName(imgSrc) {
		var imgName = imgSrc.lastIndexOf(".");
		var sub = imgSrc.substring(0 , imgName);
		var first = imgSrc.lastIndexOf("/");
		var name = sub.substring(first + 1 , sub.length);
		
		return name;
	}
	
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
				<li><a href="diffusion.eco">종확산모형</a></li>
				<li class="on">
					<a href="distriButionResult.eco">> 기후변화 민감종</a>
					<ul class="ul1_menu2">
						<li class="on"><a href="distriButionResult.eco">→ 분포변화 결과</a></li>
						<li><a href="vulneRabilityIndex.eco">&nbsp;&nbsp;&nbsp;&nbsp;취약성 지수 결과</a></li>
					</ul>
				</li>
				<li><a href="exoticSpecies.etsp">외래종</a></li>
				<li><a href="habitat.hb">취약서식지</a></li>
			</ul>
		</div>
	</div>
	
	<div class="content"  style="width: 89%; height: 790px; background-color : white;">
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
			
			<div style="width: 15%; height: 99.8%; border:1px solid black;">
				<div style = "margin-left : 15px;">
					
					<a style="float:left; font-size: 20px; font-weight: bold;">분포변화 결과</a>
					<br><br>
					
					<ul id = "option_menu">
					
						<li>
							<label style = "display : block; font-size : 18px; font-weight : bold; margin-top : 20px;" for = "distributionModel">분포모형</label>
							<select id = "distributionModel" style = "width : 105px;">
								<option>BIOMOD2</option>
							</select>
						</li>
						
						<li>
							<label style = "display : block; font-size : 18px; font-weight : bold; margin-top : 20px;" for = "predictModel">예측모델</label>
							<select class = "selectBox" id = "predictModel">
								<option>PA1_MAXE</option>
							</select>
						</li>
							
						<li>
							<label style = "display : block; font-size : 18px; font-weight : bold; margin-top : 20px;" for = "climateModel">기후모델</label>
							<select class = "selectBox" id = "climateModel">
								<option>KMA(기상청)</option>
							</select>
						</li>
						
						<li>
							<label style = "display : block; font-size : 18px; font-weight : bold; margin-top : 20px;" for = "climateSec">기후시나리오</label>
							<select class = "selectBox" id = "climateSec">
								<option>RCP 4.5</option>
							</select>
						</li>
				
					</ul>
				</div>
					<div style = "display : flex; margin : 10px 0px 10px 0px;">
						<p style = "color : rgb(171 , 201 , 39); margin-left : 10px; font-size : 20px;">◆ </p>
						&nbsp;
						<p style = "font-weight : bold; font-size : 20px; ">종선택</p>
					</div>
					
				<div class = "species">
					<div style = "margin-left : 20px;">
						<ul class = "species_ul" style = "display : flex; margin-right : 10px;">
							<li>
								<p class = "species_text">가시박</p>
								<img class = "species_img" src = "${subimg0}"/>
							</li>
							<li>
								<p class = "species_text">가시상추</p>
								<img class = "species_img" src = "${subimg1}"/>
							</li>
						</ul>
						
						<ul class = "species_ul" style = "display : flex;">
							<li>
								<p class = "species_text">물참새피</p>
								<img class = "species_img" src = "${subimg2}"/>
							</li>
							<li>
								<p class = "species_text">애기수영</p>
								<img class = "species_img" src = "${subimg3}"/>
							</li>
						</ul>
						
						<ul class = "species_ul" style = "display : flex;">
							<li>
								<p class = "species_text">돼지풀</p>
								<img class = "species_img" src = "${subimg4}"/>
							</li>
							<li>
								<p class = "species_text">양미역취</p>
								<img class = "species_img" src = "${subimg5}"/>
							</li>
						</ul>
					</div>
				</div> 
				
			</div>
			
			<div style = "width : 85%; display : flex;">
			
				<div style="width : 40%;">
					<div style="display : flex; padding : 4%;">
						<p style = "color : rgb(171 , 201 , 39); margin-left : 10px; font-size : 20px;">◆ </p>
						&nbsp;
						<p style = "font-weight : bold; font-size : 20px;">예측년도</p>
					</div>
					
					<div style = "margin-left : 40px; ">
						<ul id = "diffusion_menu" >
					
						</ul>
					</div>
				</div>
				
				<div style="width : 60%;">
					<div style="display : flex; padding : 3%;">
						<p style = "color : rgb(171 , 201 , 39); margin-left : 10px; font-size : 20px;">◆ </p>
						&nbsp;
						<p style = "font-weight : bold; font-size : 20px;">예측결과</p>
					</div>
					<div id = "diffusion_bigImg" style="padding-left : 4%;">
						<div id = "diffustion_imgBox"></div>
					</div> 
				</div>
			
			<!-- 	<div style = "display : flex; margin-left : 25px;">
					<p style = "color : rgb(171 , 201 , 39); margin-left : 10px; font-size : 20px;">◆ </p>&nbsp;<p style = "font-weight : bold; font-size : 20px;">예측년도</p>
					<p style = "color : rgb(171 , 201 , 39); margin-left : 10px; font-size : 20px;">◆ </p>&nbsp;<p style = "font-weight : bold; font-size : 20px;">예측결과</p>
				</div>
			
				
				<div style = "display : flex; overflow : auto; overflow-x: hidden; height : 600px; width : 180px;border : 1px solid #DCDCDC;">
					<div style = "margin-left : 40px; ">
						<ul id = "diffusion_menu" >
					
						</ul>
					</div>
				</div>
				
				<div id = "diffusion_bigImg">
					<div id = "diffustion_imgBox">
					</div>
				</div> --> 
			</div> 
			
		</div>
	</div>
</div>

</body>
</html>
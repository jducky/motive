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
	
	
	.notice-table tr {
		background-color : white;
	}
	

           /*RESET*/
           li { list-style: none; }
           /*BODY*/
           #nav {
               width: 25%;
               height : 500px;
           }
           #nav:after {
               content: "";
               display: block;
               clear: both;
           }

           .main {
               margin: 30px;
           }

           .main>li {
               position: relative;
               float: left;
               width: 120px;
               height: 30px;
               box-sizing: border-box;
               line-height: 30px;
               text-align: left;
               background: white;
               bottom : 26px;
               left : 35px;
               border : 1px solid black;
           }

         /*   .main>li:hover .sub {
               display: block;
               width  : 250px;
               border : 1px solid #eee;
           } */
			
		   .subOn {
		   	   display: block;
               width  : 250px;
               border : 1px solid #eee;
               background: white;
		   }
		
			.subOn li:hover {
				color : blue;
           		text-decoration: underline;
			}
			
			.subOn li {
				border-bottom : 1px solid #eee;
			}
			
           .sub {
               display: none;
               position: absolute;
               top: 30px;
               left: 0;
               z-index: 1;
               width: 100px;
               background: white;
               opacity: 1;
           }
           
           .main  p {
           	 margin-left : 10px;
           }
           
           .main>li:hover .sub li {
           		border-bottom : 1px solid #eee;
           }
           
           .main>li:hover .sub li:hover {
           		color : blue;
           		text-decoration: underline;
           }
           
           #startDate {
           		width : 80px;
           		height : 15px;
           		margin-left : 10px;
           }
           
           
           #endDate {
           		width : 80px;
           		height : 15px;
           		margin-left : 10px;
           }
           
           #noticeInsPop {
           		position : relative;
           		bottom : 18px;
           		float : right;
           }
           
</style>
<!-- table.type02 { border-collapse: separate; border-spacing: 0; text-align: left; line-height: 1.5; border-top: 1px solid #ccc; border-left: 1px solid #ccc; margin : 20px 10px; } table.type02 th { width: 150px; padding: 10px; font-weight: bold; vertical-align: top; border-right: 1px solid #ccc; border-bottom: 1px solid #ccc; border-top: 1px solid #fff; border-left: 1px solid #fff; background: #eee; } table.type02 td { width: 350px; padding: 10px; vertical-align: top; border-right: 1px solid #ccc; border-bottom: 1px solid #ccc; -->

<script type="text/javascript">
	$(function() {
		var index = 0;
		$("#noticeCho").click(function() {
		});

		$("#projectInsPop").click(function() {
			var url = "projectInsPop.ad";
			var name = 'projectInsPop';
			var option = 'width = 560, height = 350';
			
			window.open(url,name,option);
		});
		
			$(".noticeDelete").click(function() {
			});
			
			
			  $(".main > li").click(function() {
				  
			 	  if($(this).children("ul").hasClass("sub")) {
			 		 $(this).children(".sub").stop().slideDown(200);
		             $(this).children(".sub").attr("class" , "subOn");
			 	  } else {
			 		  if(index == 0) {
			 			 $(this).children(".subOn").stop().slideUp(0);
						 $(this).children(".subOn").attr("class" , "sub");
			 	 	  }
			 	  }
			  
			   });
			 
			        	  

          $(".main > li > ul > li").click(function(e) {
        	  var li_index = $('.main > li > ul > li').index(this);
        	  
			  if(li_index == 0) {
			  	  index = 0;
				  $("#date-option").text("전체 기간");
			  	  $("#noticeDate").val("allDate");
				  $(this).children(".subOn").stop().slideUp(200);
				  $(this).children(".subOn").attr("class" , "sub");
			  } else if(li_index == 1) {
				  index = 0;
				  $("#noticeDate").val("1week");
				  $("#date-option").text("1주");
				  $(this).children(".subOn").stop().slideUp(200);
				  $(this).children(".subOn").attr("class" , "sub");
			  } else if(li_index == 2) {
				  index = 0;
				  $("#nooticeDate").val("1month");
				  $("#date-option").text("1개월");
				  $(this).children(".subOn").stop().slideUp(200);
				  $(this).children(".subOn").attr("class" , "sub");
			  } else if(li_index == 3) {
				  index = 0;
				  $("#noticeDate").val("6month");
				  $("#date-option").text("6개월");
				  $(this).children(".subOn").stop().slideUp(200);
				  $(this).children(".subOn").attr("class" , "sub");
			  } else if(li_index == 4) {
				  
					if(index != 1)  {
						index = 1;
						$(this).append("<div style = 'display : flex; margin-bottom : 5px;'><input type = 'text' id = 'startDate'/> <input type = 'text' id = 'endDate'/> <button class = 'btn-primary' style = 'width : 70px; height : 20px; margin-left : 10px;'id = 'datePick'>설정</button></div>");
						$("#startDate").datepicker();
						$("#endDate").datepicker();
					}
			  }
			 
          });
      	$(".chobox").click(function() {
			if(this.checked) {
				$(".chobox").prop("checked" , false);
				$(this).prop("checked" , true);
			}			
		});
      	
      	$("#sample").click(function() {
      		var url = "projectLookUpPop.eco";
			var name = 'projectLookUpPop';
			var option = 'width = 560, height = 420';
			
			window.open(url,name,option);
      	});
	});
	
	
</script>



<body style="background-color: white;">

<%@ include file="../all/header.jsp" %>

<div style = "display:flex;">

	
	<div class="sideMenu" style="width: 11%; height: 600px;">
		<div style="width: 100%; height: 20%; background-color: #17366E; font-weight: bold; text-align: center; line-height: 50px;">
			<p style="font-size:30px; color: #ABC927;">생태영향 및<br> 취약성 평가</p>
		</div>
		
		<div style="width: 100%; height: 100%;">
			<ul>
				<li class="on"><a href = "projectLookUp.eco">> 프로젝트 조회</a></li>
				<li><a href="distribution.eco">종분포모형</a></li>
				<li><a href="diffusion.eco">종확산모형</a></li>
				<li>
					<a href="distriButionResult.eco">기후변화 민감종</a>
					<!-- <ul class="ul1_menu2">
						<li><a href="distribution.eco">&nbsp;&nbsp;&nbsp;&nbsp;종분포모형</a></li>
						<li><a href="diffusion.eco">&nbsp;&nbsp;&nbsp;&nbsp;종확산모형</a></li>
						<li><a href="distriButionResult.eco">&nbsp;&nbsp;&nbsp;&nbsp;분포변화 결과</a></li>
						<li class="on"><a href="vulneRabilityIndex.eco">→ 취약성 지수 결과</a></li>
					</ul> -->
				</li>
				<li><a href="exoticSpecies.etsp">외래종</a></li>
				<li><a href="habitat.hb">취약서식지</a></li>
			</ul>
		</div>
	</div>
	
	
	<div class="content"  style="width: 60%; height: 730px; background-color : white; margin-top : 30px; margin-left : 200px;">
		<div style = "border:1px solid #d3d3d3; width : 1200px; height : 90%;">
			<div style="width: 96%; height: 30px; border-bottom: 3px solid #17366E; margin: 0 auto;">
				<h2>프로젝트 조회</h2>
			</div>
			
			<div style = "width : 83%; height : 9%; background-color : #DCDCDC; margin-top : 30px; margin-left : 100px; ">
				<div style = "margin : 0 auto; top : 10px; left : 50px; position : relative;">
					<form action = "noticeManagement.ad" method = "POST">
						 <div style = "display : flex; font-weight : bold;">
						     <select style = "width : 100px; height : 30px; margin-top : 5px; margin-left : 15px; border-bottom : 1px soild #DCDCDC;" id = "noticeClassifi" name = "noticeClassifi">
						     	<option value = "">검색 항목</option>
						     	<option value = "angeny">기관</option>
						     	<option value = "projectName">제목</option>
						     	<option value = "projectName">작성자</option>
						     </select>
							 <input  style = "width : 300px; height : 28px; margin-top : 5px; margin-left : 45%;" name = "noticeKeyword" type = "text" placeholder = "검색어를 입력해주세요."/>
							 <button class = "btn-primary" style = "float : right; width : 50px; height : 30px; margin-left : 10px; margin-top : 5px; position : relative;"id = "noticeCho">검색</button>
						</div> 
					</form>
				</div>
			</div>
			
			<div style = "width : 83%; height : 80%; margin : 0 auto;">
			
				<table  class = "notice-table" style = "border-bottom : 1px solid black; margin-top : 10px;'">
					<tr style = "border-bottom : 1px solid black;">
						<th style = "width : 163px; height : 40px;">번호</th>
						<th style = "width : 163px; height : 40px;">등록기관</th>
						<th style = "width : 163px; height : 40px;">프로젝트 명</th>
						<th style = "width : 163px; height : 40px;">작성자</th>
						<th style = "width : 163px; height : 40px;">등록일자</th>
					</tr>
					
					<c:if test = "${cnt == 0}">
						<tr>
							<td colspan = "6">등록된 공지사항이 없습니다.</td>
						</tr>
					</c:if>
						
					<c:if test = "${cnt > 0}">
						<c:forEach var = "notice" items = "${noticeList}">
							<tr>
								<td>${notice.rownum}</td>
								<td>${notice.classifi}</td>
								<td>${notice.board_name}</td>
								<td>${notice.ins_id}</td>
								<td>${notice.ins_date}</td>
								<td>
									<div style = "display : flex; top : 8px; position : relative;">
										<button style = "height : 25px; width : 70px;" class = "noticeUpdate btn-primary" value = "${notice.seq}">수정</button>
										/ &nbsp;&nbsp;
										&nbsp;<button style = "height : 25px; width : 70px;"  class = "noticeDelete btn-primary" value = "${notice.seq}">삭제</button>
									</div>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<tr id = "sample">
						<td>10</td>
						<td>KEI</td>
						<td>Middle_test</td>
						<td>홍길동</td>
						<td>2020.07.30</td>
					</tr>
					<tr>
						<td>9</td>
						<td>생태원</td>
						<td>BBB</td>
						<td>BBB</td>
						<td>2020.07.25</td>
					</tr>
					<tr>
						<td>8</td>
						<td>생태원</td>
						<td>CCC</td>
						<td>CCC</td>
						<td>2020.07.22</td>
					</tr>
					<tr>
						<td>7</td>
						<td>KEI</td>
						<td>DDD</td>
						<td>DDD</td>
						<td>2020.07.20</td>
					</tr><tr>
						<td>6</td>
						<td>KEI</td>
						<td>EEE</td>
						<td>EEE</td>
						<td>2020.07.19</td>
					</tr>
					<tr>
						<td>5</td>
						<td>생태원</td>
						<td>FFF</td>
						<td>FFF</td>
						<td>2020.07.15</td>
					</tr>
					<tr>
						<td>4</td>
						<td>KEI</td>
						<td>GGG</td>
						<td>GGG</td>
						<td>2020.07.15</td>
					</tr>
					<tr>
						<td>3</td>
						<td>생태원</td>
						<td>HHH</td>
						<td>HHH</td>
						<td>2020.07.10</td>
					</tr>
					<tr>
						<td>2</td>
						<td>KEI</td>
						<td>III</td>
						<td>III</td>
						<td>2020.07.05</td>
					</tr>
					<tr>
						<td>1</td>
						<td>생태원</td>
						<td>JJJ</td>
						<td>JJJ</td>
						<td>2020.07.03</td>
					</tr>
				</table>
				
				<div style = "margin-top : 30px; margin-left : 465px; display : flex; position : relative;">
					<table style="width: 90%;">
						<tr>
							<th align="center" style = "">
								<c:if test="${cnt > 0}">
								
									<c:if test="${startPage > pageBlock}">
										<a href="noticeManagement.ad?pageNum=${startPage - pageBlock}"><img style = "" src="${imagePath}page_left.png"/></a>
									</c:if>
									
									<div style = "display : flex; bottom : 10px; position : relative;">
										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i==currentPage}">
												<span><b><img style = "width : 25px ; height : 25px; margin-right : 15px; margin-left : 8px; " src="${imagePath}page_${i}.png"/></b></span>
											</c:if>	
											<c:if test="${i!=currentPage}">
												<a href="noticeManagement.ad?pageNum=${i}"><img style = " width : 25px ; height : 25px; margin-right : 10px;" src="${imagePath}page_${i}.png"/></a>
											</c:if>	
										</c:forEach>
									</div>
									
									<c:if test="${pageCount > endPage}">
										<a href="noticeManagement.ad?pageNum=${startPage + pageBlock}"><img src= "${imagePath}page_right.png"/></a>
									</c:if>
									
								</c:if>
							</th>
						</tr>
					</table>
				</div>
				
			</div>
		
		</div>
	</div>
 </div>

</body>
</html>
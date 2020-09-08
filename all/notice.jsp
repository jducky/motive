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
               /* margin: 30px; */
               margin-left: 30px;
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
               border:1px solid black;
               /* bottom : 26px;
               left : 35px; */
           }

         /*   .main>li:hover .sub {
               display: block;
               width  : 250px;
               border : 1px solid #eee;
           } */
			
		   .subOn {
		   	   display: block;
               width  : 110px;
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
           
           
</style>


<script type="text/javascript">
	$(function() {
		var index = 0;
		$('#searchOption_val').val('0'); /* 검색조건 초기화 */
		$("#noticeCho").click(function() {
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
			  $("#date-option").text("검색 조건");
		  	  /* $("#noticeDate").val("allDate"); */
			  $(this).children(".subOn").stop().slideUp(200);
			  $(this).children(".subOn").attr("class" , "sub");
			  $('#searchOption_val').val('0'); 
			  
		  } else if(li_index == 1) {
			  index = 0;
			  /* $("#noticeDate").val("1week"); */
			  $("#date-option").text("등록 기관");
			  $(this).children(".subOn").stop().slideUp(200);
			  $(this).children(".subOn").attr("class" , "sub");
			  $('#searchOption_val').val('1');
		  } else if(li_index == 2) {
			  index = 0;
			  /* $("#nooticeDate").val("1month"); */
			  $("#date-option").text("제목");
			  $(this).children(".subOn").stop().slideUp(200);
			  $(this).children(".subOn").attr("class" , "sub");
			  $('#searchOption_val').val('2');
		  } else if(li_index == 3) {
			  index = 0;
			  $("#date-option").text("내용");
			  $(this).children(".subOn").stop().slideUp(200);
			  $(this).children(".subOn").attr("class" , "sub");
			  $('#searchOption_val').val('3');
		  } else if(li_index == 4) {
			  index = 0;
			  $("#date-option").text("제목+내용");
			  $(this).children(".subOn").stop().slideUp(200);
			  $(this).children(".subOn").attr("class" , "sub");
			  $('#searchOption_val').val('4');
				/* if(index != 1)  {
					index = 1;
					$(this).append("<div style = 'display : flex; margin-bottom : 5px;'><input type = 'text' id = 'startDate'/> <input type = 'text' id = 'endDate'/> <button class = 'btn-primary' style = 'width : 70px; height : 20px; margin-left : 10px;'id = 'datePick'>설정</button></div>");
					$("#startDate").datepicker();
					$("#endDate").datepicker();
				} */
		  }
		 
     });
     
		/* $(".notice-table tr").click(function() {
			var text = $(this).children("td:eq(0)");
			
			var textVal = text[0].textContent;
			var realUrl = "noticeContentPop.do";
			var url = realUrl + "?id=" + textVal + "";
			var name = 'noticeContent';
			var option = 'width = 475, height = 284';
			
			window.open(url,name,option);
			
		}); */
		
	});
	
	function notice_detail(seq){
		
		var url = "NoticeDetailPop.do?seq=" + seq;
		var name = 'NoticeDetailPop';
		var option = 'width = 560, height = 500';
		
		window.open(url,name,option);
		
	}
	
	function noticeSearch(){
		
		var searchOption_val = $('#searchOption_val').val();
		var noticeKeyword = $('#noticeKeyword').val();
		var check_select = $('#check_select').val();
		
		
		if(searchOption_val == '0'){
			alert('검색 조건을 선택해주세요.');
			return false;
		}
		if(noticeKeyword == ''){
			alert('검색어를 입력해주세요.');
			return false;
		}
		
		return true;
		/* var data = {'searchOption_val':searchOption_val , 'noticeKeyword':noticeKeyword , 'check_select':check_select};
		
		$.ajax({
			type : 'POST' ,
			url : 'noticeManagement.ad' ,
			data : data,
			success : function(result) {
				location.reload(true);	
				
			} ,
			error : function(err) {
				alert(err);
			}
			
		}); */
	}
</script>



<body style="background-color: white;">

<%@ include file="../all/header.jsp" %>`

<div style = "display : flex;">

	<div class="sideMenu" style="width: 11%; height: 600px; margin-top: -20px;">
		<div style="width: 100%; height: 20%; background-color: #17366E; font-weight: bold; text-align: center; line-height: 120px;">
			<p style="font-size:30px; color: #ABC927;">소개</p>
		</div>
		
		<div style="width: 100%; height: 100%;">
			<ul>
				<li><a href="business.do">사업설명</a></li>
				<li><a href="material.do">입력 자료란</a></li>
				<li><a href="modelResult.do">모형 결과 분석</a></li>
				<li class = "on"><a href="notice.do">> 공지사항</a></li>
			</ul>
		</div>
	</div>
	
	<div class = "content" style="width: 60%; height: 730px; background-color : white; margin-top : 30px; margin-left : 200px;">
	
		<div style = "border:1px solid #d3d3d3; width : 1200px; height : 90%; ">
			<div style="width: 96%; height: 30px; border-bottom: 3px solid #17366E; margin: 0 auto;">
				<h2>공지사항</h2>
			</div>
			
			<!-- <form action = "notice.do" method = "POST" onsubmit="retrun noticeSearch();">
			</form> -->
			<div style = "width : 83%; height : 9%; background-color : #DCDCDC; margin-top : 30px; margin-left : 100px;">
				<form action = "notice.do" method = "POST" onsubmit="return noticeSearch();">
				<br>
			 	<ul class="main">
	                <li>
		                <div style = "display : flex;">
		                	<input type ="hidden" value = "1" name = "check_select"/> 
		                	<input type = "hidden" value = "allDate"  id = "noticeDate" name = "noticeDate"/>
		                	<input type = "hidden" value = ""  id = "searchOption_val" name = "searchOption_val"/>
			                <p id = "date-option">검색 조건</p>
				                <img style = "width : 20px; height : 20px; margin-left : 85px; margin-top : 5px; position : absolute;" src="${imagePath}down-arrow.png"/>
		                </div>
	                    <ul class="sub" id="searchOption">
	                        <li><a href="#">검색 조건</a></li>
	                        <li><a href="#">등록 기관</a></li>
	                        <li><a href="#">제목</a></li>
	                        <li><a href="#">내용</a></li>
	                        <li><a href="#">제목+내용</a></li>
	                    </ul>
	                </li>
	            </ul>
	          
				 <input  style = "width : 270px; height : 28px;  margin-left : 50px;" id="noticeKeyword" name = "noticeKeyword" type = "text" placeholder = "검색어를 입력해주세요."/>
				 <input type="submit"  class = "btn-primary" style = "float : right; width : 50px; height : 30px; margin-right:60px; position : relative;" id = "noticeCho" value="검색"/>
				</form> 
			</div> 
			
			<div style = "width : 83%; height : 80%; margin : 0 auto;">
			
				<table  class = "notice-table" style = "border-bottom : 1px solid black; margin-top : 10px;'">
					<tr style = "border-bottom : 1px solid black;">
						<th style = "width : 163px; height : 40px;">번호</th>
						<th style = "width : 163px; height : 40px;">분류</th>
						<th style = "width : 163px; height : 40px;">제목</th>
						<th style = "width : 163px; height : 40px;">작성자</th>
						<th style = "width : 163px; height : 40px;">등록일</th>
					</tr>
					
					<c:if test = "${cnt == 0}">
						<tr>
							<td colspan = "5">등록된 공지사항이 없습니다.</td>
						</tr>
					</c:if>
						
					<c:if test = "${cnt > 0}">
						<c:forEach var = "notice" items = "${noticeList}">
							<tr>
								<td>${notice.rownum}</td>
								<td>${notice.classifi}</td>
								<td><a href="#" onclick="notice_detail('${notice.seq}');">${notice.board_name}</a></td>
								<td>${notice.ins_id}</td>
								<td>${notice.ins_date}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				
				<div style = "margin-top : 30px; margin-left : 465px; display : flex;">
					<table style="width: 90%;">
						<tr>
							<th align="center" style = "">
								<c:if test="${cnt > 0}">
								
									<c:if test="${startPage > pageBlock}">
										<a href="notice.do?pageNum=${startPage - pageBlock}"><img style = "" src="resources/img/page_left.png"/></a>
									</c:if>
									
									<div style = "display : flex">
										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i==currentPage}">
												<span><b><img style = "width : 25px ; height : 25px; margin-left : 30px; margin-top : 10px;" src="resources/img/page_${i}.png"/></b></span>
											</c:if>	
											<c:if test="${i!=currentPage}">
												<a href="notice.do?pageNum=${i}"><img style = " width : 30px ; height : 30px; margin-left : 10px;  margin-right : 10px;" src="resources/img/page_${i}.png"/></a>
											</c:if>	
										</c:forEach>
									</div>
									
									<c:if test="${pageCount > endPage}">
										<a href="notice.do?pageNum=${startPage + pageBlock}"><img src= "resources/img/page_right.png"/></a>
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

<%@ include file="../all/footer.jsp" %>
</body>
</html>
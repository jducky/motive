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
           
            .ul1_menu1{
			/* padding:10px; */
				font-size: 18px;
			}

			.ul1_menu1 .on{
				background-color: #87827d;
				color:white;
			}
			
			.ul1_menu1 li {
				border-bottom : 1px solid #DCDCDC;
			}
           
</style>
<!-- table.type02 { border-collapse: separate; border-spacing: 0; text-align: left; line-height: 1.5; border-top: 1px solid #ccc; border-left: 1px solid #ccc; margin : 20px 10px; } table.type02 th { width: 150px; padding: 10px; font-weight: bold; vertical-align: top; border-right: 1px solid #ccc; border-bottom: 1px solid #ccc; border-top: 1px solid #fff; border-left: 1px solid #fff; background: #eee; } table.type02 td { width: 350px; padding: 10px; vertical-align: top; border-right: 1px solid #ccc; border-bottom: 1px solid #ccc; -->

<script type="text/javascript">
	$(function() {
		var index = 0;
		$('#searchOption_val').val('0'); /* 검색조건 초기화 */
		$("#noticeCho").click(function() {
		});

		$("#noticeInsPop").click(function() {
			var url = "noticeInsPop.ad";
			var name = 'noticeInsPop';
			var option = 'width = 560, height = 500';
			
			window.open(url,name,option);
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
			
	});
	
	
	function modifyNotice(modifyNotice_value){
		var url = "modifyNoticePop.ad?seq=" + modifyNotice_value;
		var name = 'modifyNoticePop';
		var option = 'width = 560, height = 500';
		
		window.open(url,name,option);
		
	}
	
	function deleteNotice(deleteNotice_value){
		
		
		var deletechoice = confirm('삭제하시겠습니까?');
		
		var data = {'seq' : deleteNotice_value};
		if(deletechoice == true){
			 
			$.ajax({
				type : 'POST' ,
				data : data,
				url : 'deleteNotice.ad',
				async: false,
				success : function(result) {
					alert('삭제되었습니다.');
					location.reload(true);
				} ,
				error : function(err) {
					alert('삭제 도중 오류가 발생했습니다 다시시도해주세요.');
				}
			});
		}
		
	}
	
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

<%@ include file="../all/header.jsp" %>

<div style="display:flex;">

	<div class="sideMenu" style="width: 11%; height: 600px;">
		<div style="width: 100%; height: 20%; background-color: #17366E; font-weight: bold; text-align: center; line-height: 120px;">
			<p style="font-size:30px; color: #ABC927;">시스템 관리</p>
		</div>
		
		<div style="width: 100%; height: 100%;">
			<ul>
				<li class="on"><a href="noticeManagement.ad">> 공지사항 관리</a></li>
				<li><a href="project_management.ad">프로젝트 관리</a></li>	
				<li><a href="user_management.ad">사용자 관리</a></li>
				<li><a href="group_management.ad">그룹 관리</a></li>
				<c:if test = "${sessionScope.auth == 'S'}">
					<li><a href="admin_management.ad">관리자 계정 관리</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	
	
	<div class="content"  style="width: 60%; height: 730px; background-color : white; margin-top : 30px; margin-left : 200px;">
	
		<div style = "border:1px solid #d3d3d3; width : 1200px; height : 95%;">
			<div style="width: 96%; height: 30px; border-bottom: 3px solid #17366E; margin: 0 auto;">
				<h2>공지사항 관리</h2>
			</div>
			
			<div style = "width : 83%; height : 9%; background-color : #DCDCDC; margin-top : 30px; margin-left : 100px;">
				<form action = "noticeManagement.ad" method = "POST" onsubmit="return noticeSearch();">
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
	                        <li><a href="#">분류</a></li>
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
						<th style = "width : 163px; height : 40px;">수정 / 삭제</th>
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
								<td><a href="#" onclick="notice_detail('${notice.seq}');">${notice.board_name}</a></td>
								<td>${notice.ins_id}</td>
								<td>${notice.ins_date}</td>
								<td>
									<div style = "display : flex; top : 8px; position : relative;">
										<button style = "height : 25px; width : 70px;"id="modifyNotice" class = "noticeUpdate btn-primary" value = "${notice.seq}" onclick="modifyNotice('${notice.seq}');">수정</button>
										/ &nbsp;&nbsp;
										&nbsp;<button style = "height : 25px; width : 70px;"  class = "noticeDelete btn-primary" value = "${notice.seq}" onclick="deleteNotice('${notice.seq}');">삭제</button>
									</div>
								</td>
							</tr>
						</c:forEach>
					</c:if>
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
					<input type ="button" id = "noticeInsPop" class = "btn-primary" value = "신규 등록"/>
				</div>
				
			</div>
		
		</div>
	</div>
</div>

<%@ include file="../all/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700&amp;subset=korean">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<!-- <script src="https://code.jquery.com/jquery-3.1.1.js"></script> -->
<!-- <script
	src="https://code.jquery.com/jquery-3.1.1.min.js" 
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script> --> 
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript">
	function loginPop(){
		var url = 'loginPop.do';
		var name = 'loginPopup';
		var option = 'width = 500, height = 350';
		
		window.open(url,name,option);
		
	}
	
	function logOut() {
		window.location.href = "logOut.do";
	}
	
	$(document).ready(function(){
		
		
		$('#menu2 li').click(function(){
			var li_index = $('#menu2 li').index(this);
			
			if(li_index == 0 ){
				window.location.href = "speciesdata.sp";	
			} else if(li_index == 1) {
				window.location.href = "linkedmaterial.sp";
			} else if(li_index == 2) {
				window.location.href = "climatematerial.sp";
			}
			
		});
		
		
		
		
		/* $('#menu4 li').click(function(){
			var li_index = $('#menu4 li').index(this);
			
			if(li_index == 0) {
				if('${sessionScope.auth}' == 'A' || '${sessionScope.auth}' == 'S') { 
					window.location.href = "noticeManagement.ad";	
				} else {
										
				}
			}else if(li_index == 1){
				if('${sessionScope.auth}' == 'A') {
					window.location.href = "user_management.ad";
				} else {
					window.location.href = "admin_management.ad";	
				}
			} else if(li_index == 2) {
				if('${sessionScope.auth}' == 'S') {
					window.location.href = "user_management.ad";
				} else {
					
				}
			}else if(li_index == 3) {
				if('${sessionScope.auth}' == 'A') {
					window.location.href = "project_management.ad";
				} else {
					window.location.href = "group_management.ad";	
				}
			} else if(li_index == 4) {
				window.location.href = "project_management.ad";
			}
		
		}); */
		
		
		/* $('#menu3 li').click(function(){
			var li_index = $('#menu3 li').index(this);
			
			if(li_index == 0){
				if('${sessionScope.auth}' == '') {
					window.location.href = "distribution.eco";	
				} else {
					window.location.href= "projectLookUp.eco";					
				}
			}	else if(li_index == 1) {
				if('${sessionScope.auth}' == '') {
					window.location.href = "";	
				} else {
					window.location.href= "distribution.eco";					
				}
			}	
		
		}); */
		
		$("#menu1 li").click(function() {
			var li_index = $("#menu1 li").index(this);
			
			if(li_index == 0) {
				window.location.href = "business.do";
			} else if(li_index == 1) {
				window.location.href = "material.do";
			} else if(li_index == 2) {
				window.location.href = "modelResult.do";
			} else if(li_index == 3) {
				window.location.href = "notice.do"
			}
			
		});
	});
	
</script>
<body>
	<div class="header">
	  <div class="wrap">
		<div class="hd_top">
			<ul class="ul_rt">
				<li>사용자 메뉴얼</li>
				<li>
					<c:if test = "${not empty sessionScope.id}">
						<a onclick="logOut();">LOGOUT </a>
					</c:if> 
					
					<c:if test = "${empty sessionScope.id}">
						<a onclick="loginPop();">LOGIN </a>
					</c:if>
				</li>
			</ul>
		</div>
		<div class="hd_bt">
		<!-- <div style="width: 150px; height: 150px; border:1px solid black;">
			
		</div> -->
		<img style="position:absolute; margin-left: 200px; margin-top: 25px;" src="resources/img/Ecosystem.png">
			<p>
				<a href = "main2.do"><img src="resources/img/logo3.png"><img src="resources/img/logo3_.png" class="t2"></a>
			</p> 
			<ul>
				
				<li>
					<a href="#">소　개</a>
					<ul class = "sub2" id = "menu1">
						<li>사업설명</li>
						<li>입력 자료란</li>
						<li>모형 결과 분석</li>
						<li>공지사항</li>
					</ul>
				</li>
				<li>
					<a href="#">입력자료 조회</a>
					<ul class="sub2" id = "menu2">
						<li>생물종자료</li>
						<li>연계자료</li>
						<li>기후자료</li>
					</ul>
				</li>
				<li>
					<a href="#">생태영향 및 취약성평가</a>
					<ul class="sub3" id="menu3">
						<c:if test = "${sessionScope.auth != 'U' && not empty sessionScope.id}">
							<li><a href="projectLookUp.eco">프로젝트 조회</a></li>
						</c:if>
						<li><a href="distribution.eco">종분포모형</a></li>
						<li><a href="diffusion.eco">종확산모형</a></li>
						<li><a href="distriButionResult.eco">기후변화민감종</a></li>
						<li><a href="exoticSpecies.etsp">외래종</a></li>
						<li><a href="habitat.hb">취약서식지</a></li>
					</ul>
				</li>
				<c:if test = "${sessionScope.auth != 'U'  && sessionScope.auth != 'R' && not empty sessionScope.id}">
					<li>
						<a href="#">시스템 관리</a>
						<ul class="sub4" id="menu4">
							<li><a href="noticeManagement.ad">공지사항 관리</a></li>
							<li><a href="project_management.ad">프로젝트 관리</a></li>
							<li><a href="user_management.ad">사용자 관리</a></li>
							<li><a href="group_management.ad">그룹관리</a></li>
							<c:if test = "${sessionScope.auth == 'S'}">
								<li><a href="admin_management.ad">관리자 계정관리</a></li>
							</c:if>
						</ul>
					</li>
				</c:if>
				
				<c:if test = "${sessionScope.auth == 'U' || sessionScope.auth == 'R'}">
					<li>
						<a href = "#">나의 검색 내역</a>
						<ul class = "sub4" id = "menu5">
							<li><a href="lookupList.do">조회 이력</a></li>
						</ul>
					</li>
				</c:if>
				
			</ul>
		</div>
	  </div>
	</div>
</body>
</html>
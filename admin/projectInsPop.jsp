<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700&amp;subset=korean">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
	.left-box {
		background-color : #DCDCDC; 
		width : 90px; 
		height : 45px; 
		border-right : 1px solid black;
	}
	
	.box-con{
		display : flex;  
		border-bottom: 1px solid black;
	}
	
	.admin-input {
		height: 18px; 
		width: 250px; 
		text-indent: 2px; 
		margin-top : 10px; 
		margin-left : 10px;
		position : relative; 
	}
	
	.left-text {
		text-align : left;
		margin-left : 10px;
		margin-top : 10px;
		font-weight : bold;
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
	
	.project-table {
	  border-collapse: collapse;
	  width: 100%;
	  text-align : center;
	}

	.project-table th, td {
	  text-align: center;
	  padding: 12px;
	}
	
	th {
		background-color : rgb(242, 242,242);
	}
	
	.project-table tr {
		border : 1px solid #DBDBDB;
	}
	
	table {
		 border : 1px solid #DBDBDB;
	}
	
	th , td {
		 border : 1px solid #DBDBDB;
	}
	
	#back{
	position: absolute;
	z-index: 100;
	background-color: #000000;
	display:none;
	left:0;
	top:0;
	}
	#loadingBar{
	position:absolute;
	left:50%;
	top: 40%;
	display:none;
	z-index:200;
	}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js" integrity="sha512-YUkaLm+KJ5lQXDBdqBqk7EVhJAdxRnVdT2vtCzwPHSweCzyMgYV/tgGF4/dCyqtCC2eCphz0lRQgatGVdfR0ww==" crossorigin="anonymous"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#insertCancle").click(function() {
			self.close();
		});
		
		$("#fileOpen").click(function() {
			
			const input = document.createElement("input");
			
			
			input.type = "file";
			//input.accept = ".hwp , .xlsx";
			input.name = "noticeFile";
			input.id = "noticeFile";
			/* 	input.multiple = "true"; */
			
			const fileName = $("#fileNm");
			
			input.onchange = function(e) {
				changeFile(e.target.files[0]);
				var inName =  e.target.files[0].name;
				fileName.text(inName);
				document.getElementById("noticeForm").appendChild(input);
			}
			
			input.click();
		});
		
		$("#popCancle").click(function() {
			window.close();
		});
		
		
		
	$("#proinsBtn").on("click", function(){
			
			
		    $('#fromid').ajaxSubmit({
				url: "test.ad", //컨트롤러 URL
				dataType: 'String',
				processData: false,
				contentType: false,
				type: 'POST',
				beforeSend: function () {
				FunLoadingBarStart(); //로딩바 생성
				}, 
				complete: function () {
				FunLoadingBarEnd(); //로딩바 제거
				},
				success: function (response) {
				  alert("등록완료");
				  console.log(response);
				}
		    });
		  });
		
	}); 

	
	function FunLoadingBarStart() {
		var backHeight = $(document).height(); //뒷 배경의 상하 폭
		var backWidth = window.document.body.clientWidth; //뒷 배경의 좌우 폭
		var backGroundCover = "<div id='back'></div>"; //뒷 배경을 감쌀 커버
		var loadingBarImage = ''; //가운데 띄워 줄 이미지
		loadingBarImage += "<div id='loadingBar'>";
		loadingBarImage += " <img src='resources/img/Spinner-1s-200px.gif'/>"; //로딩 바 이미지
		loadingBarImage += "</div>";
		$('body').append(backGroundCover).append(loadingBarImage);
		$('#back').css({ 'width': backWidth, 'height': backHeight, 'opacity': '0.3' });
		$('#back').show();
		$('#loadingBar').show();
		}
	
	function FunLoadingBarEnd() {
		$('#back, #loadingBar').hide();
		$('#back, #loadingBar').remove();
		}
</script>

<body style = "margin : 0 auto; background-color : white;">
	<div style = "width : 80%; height : 300px; margin : 0 auto; ">
		<p style = "font-size : 16px; font-weight : bold; margin-left : 3%; top : 4%; position : relative;">프로젝트 등록</p>
		<div style = "width : 95%; height : 5%; border-bottom : 2px solid #17366E; margin : 0 auto;">
			<div style = "float : left; margin-top : 10%;">
			
				<form id="fromid" enctype="multipart/form-data">
					<table class = "project-table">
						<tr>
							<th>등록기관</th>
							<td style = "text-align : left;">생태원</td>
						</tr>
						
						<tr>
							<th>프로젝트명</th>
							<td style = "text-align : left;"><input style = "width : 270px;" type = "text"/></td>
						</tr>
						
						<tr>
							<th>파일 첨부</th>
							<td style = "text-align : left;">
								<input type="file" name="file">
								<!-- <input  style ="width : 200px;" type = "text"/> 
								<button id = "fileOpen" class = "btn-primary" style = "height : 24px; width : 70px; margin-left : 10px;">불러오기</button> -->
							</td>
						</tr>
						
						<tr>
							<th>공개 여부</th>
							<td style = "text-align : left;">
								<div style = "display : flex;">
									<input style = " margin-top : 1.5%;" type = "radio"/><p style = "margin-left : 2%;">공개</p>
								 	<input style = " margin-top : 1.5%; margin-left : 5%;" type = "radio"/><p style = "margin-left : 2%;">비공개</p>
							 	</div>
							</td>
						</tr>
						
					</table>
				

					<div style = "float : right;  margin-top : 4%; position: relative; left : 2.5%;">
						<button type="button" id="proinsBtn" style = "height : 24px; width : 60px; " class = "btn-primary">등록</button>
						<button id = "popCancle" style = "height : 24px; width : 60px;" class = "btn-primary">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
<%@ include file = "../all/setting.jsp" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700&amp;subset=korean">
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
	
	.group-table {
	  border-collapse: collapse;
	  width: 40%;
	  text-align : center;
	}

	.group-table th, td {
	  text-align: center;
	  padding: 12px;
	}
	
	.group-table tbody tr {
		cursor : pointer;
	}
	
	th {
		background-color : rgb(242, 242,242);
	}
	
	.group-table tr {
		border : 1px solid #DBDBDB;
	}
	
	table {
		 border : 1px solid #DBDBDB;
	}
	
	th , td {
		 border : 1px solid #DBDBDB;
	}
	
	.trOn {
		background-color : #acc4ee;
	}
	
</style>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#popCancle").click(function() {
			self.close();
		});
		
		var version = "${version}";
		var colspanIndex = 0;
		
		if(version == 'A') {
			colspanIndex = 2;
		} else {
			colspanIndex = 3;
		}
		
		$(".thColspan").attr("colspan" , colspanIndex);
		
		
		var groupMember = [];
		var nullGroup = [];
		
		$(document).on('click' , '#groupMember tbody tr' , function() {
			var trId = $(this).attr("id");
			
			if(!$(this).hasClass("trOn")) {
				$(this).attr("class" , "trOn");
				groupMember.push(trId);
			} else {
				$(this).attr("class" , "");
				var index = groupMember.indexOf(trId);
				groupMember.splice(index , 1);
			}
		});
		
		$(document).on('click' , '#nullGroup tbody tr' , function() {
			var trId = $(this).attr("id");
			
			if(!$(this).hasClass("trOn")) {
				$(this).attr("class" , "trOn");
				nullGroup.push(trId);
			} else {
				$(this).attr("class" , "");
				var index = nullGroup.indexOf(trId);
				nullGroup.splice(index , 1);
			}
		});
		
		$("#move-right").click(function() {
			for(i = 0; i < groupMember.length; i++) {
				
				var groupTr = $("#groupMember tbody").find("#" + groupMember[i]);
				
				groupTr.attr('class' , '');
				
				var inputTr = groupTr[0].outerHTML;
				
				$("#nullGroup tbody").append(inputTr);
				
				$("#groupMember tbody").find("#" +groupMember[i]).remove();
			}
			groupMember = [];
		});
		
		$("#move-left").click(function() {
			for(i = 0; i < nullGroup.length; i++) {
				
				var groupTr = $("#nullGroup tbody").find("#" + nullGroup[i]);
				
				groupTr.attr('class' , '');
				
				var inputTr = groupTr[0].outerHTML;
				
				$("#groupMember tbody").append(inputTr);
				
				$("#nullGroup tbody").find("#" +nullGroup[i]).remove();
			}
			nullGroup = [];
		});
		
		$("#groupSetting").click(function() {
			
			var settingChoice = confirm("권한이 박탈될 수 있습니다.설정하시겠습니까?");
			
			if(settingChoice == true) {
				var groupMemberArr = [];
				var nullGroupArr = [];
				var trId = "";
				var groupSeq = "${select_groupSeq}";
				var realUrl = "groupSetting_Pro.ad";
				
				$("#groupMember > tbody > tr").each(function(index , tr) {
					trId = tr.id;
					groupMemberArr.push(trId);
				});
				
				$("#nullGroup > tbody > tr").each(function(index , tr) {
					trId = tr.id;
					nullGroupArr.push(trId);
				});
				
				var confirmIndex = groupMemberArr.length + nullGroupArr.length;
				
				$.ajax({
					url : realUrl ,
					data  : JSON.stringify({'groupMemberArr' :  groupMemberArr , 'nullGroupArr' : nullGroupArr , 'groupSeq' : groupSeq}),
					type : 'POST' ,
 					dataType : 'json' ,
 					contentType: "application/json",
					success : function(result) {
						if(result == confirmIndex) {
							alert("설정되었습니다.");
							opener.location.reload();
							self.close();
						} else {
							alert("설정에 실패했습니다.");
						}
					},
					error : function(err) {
						
					}
				});
				
			}
			
		}); 
		
	});
	
	
	

</script>
</head>
<body style="height:495px;">
	<div style = "width : 80%; height : 198px; margin : 0 auto; ">
		<p style = "font-size : 16px; font-weight : bold;padding-top : 3%;">
			<c:if test="${version == 'A'}">
				그룹관리자 설정	
			</c:if>
			<c:if test="${version == 'U'}">
				그룹원 설정			
			</c:if>
		</p>
		<div style = "width : 95%; height : 5%; border-bottom : 2px solid #17366E;">
			<div style = "float : left; margin-top : 10%; width : 100%; display : -webkit-inline-box;">
				<table class = "group-table" id="groupMember">
					<colgroup>
						<c:if test="${version == 'U'}">
							<col style="width : 33.3%;">
							<col style="width : 33.3%;"/>
							<col style="width : 33.3%;"/>
						</c:if>
						
						<c:if test="${version == 'A'}">
							<col style="width : 50%;">
							<col style="width : 50%;"/>
						</c:if>	
					</colgroup>
					<thead>
						<tr>
							<th class="thColspan" colspan="">
								<c:if test="${version == 'A'}">
									그룹관리자 목록
								</c:if>
								<c:if test="${version == 'U'}">
									그룹원 목록
								</c:if>
							</th>
						</tr>
						<tr>
							<c:if test="${version == 'U'}">
								<th>권한</th>
							</c:if>
							<th>ID</th>
							<th>이름</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="groupMember" items="${adminList}">
							<c:if test="${groupMember.mem_group_seq != 0}">
									<c:if test="${version == 'U' and groupMember.authority == 'U'  or  version == 'U' and groupMember.authority == 'R'}">
										<tr id="${groupMember.id}">
											<td>
												<c:if test="${groupMember.authority == 'R'}">
													연구원
													
												</c:if>
												<c:if test="${groupMember.authority == 'U'}">
													일반
												</c:if>
											</td>
											<td>${groupMember.id}</td>
											<td>${groupMember.name}</td>
										</tr>
									</c:if>
									
									<c:if test="${groupMember.authority == 'A' and version == 'A'}">
										<tr id="${groupMember.id}">
											<td>${groupMember.id}</td>
											<td>${groupMember.name}</td>
										</tr>
									</c:if>
							</c:if>
						</c:forEach>			
					</tbody>	
				</table>
				
				<div style = "display : inline-grid; top : 130px; position : relative; left : 45px;">
					<img id = "move-right"  style="width:30px;height:30px;cursor:pointer;" src = "resources/img/page_right.png">
					<img id = "move-left"   style="width:30px;height:30px;cursor:pointer;padding-top:50%;" src = "resources/img/page_left.png">
				</div>
				
				<table class="group-table" style="margin-left : 15%;" id="nullGroup">
					<colgroup>
						<c:if test="${version == 'U'}">
							<col style="width : 33.3%;">
							<col style="width : 33.3%;"/>
							<col style="width : 33.3%;"/>
						</c:if>
						
						<c:if test="${version == 'A'}">
							<col style="width : 50%;">
							<col style="width : 50%;"/>
						</c:if>	
					</colgroup>
					<thead>
						<tr>
							<th class="thColspan" colspan="">
								<c:if test="${version == 'A'}">
									그룹미지정 관리자 목록
								</c:if>
								<c:if test="${version == 'U'}">
									그룹미지정 유저 목록
								</c:if>
							</th>
						</tr>
						<tr>
							<c:if test="${version == 'U'}">
								<th>권한</th>
							</c:if>
							<th>ID</th>
							<th>이름</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="groupMember" items="${adminList}">
							<c:if test="${groupMember.mem_group_seq == 0}">
									<c:if test="${version == 'U' and groupMember.authority == 'U'  or  version == 'U' and groupMember.authority == 'R'}">
										<tr id="${groupMember.id}">
											<td>
												<c:if test="${groupMember.authority == 'R'}">
													연구원
												</c:if>
												<c:if test="${groupMember.authority == 'U'}">
													일반
												</c:if>
											</td>
											<td>${groupMember.id}</td>
											<td>${groupMember.name}</td>
										</tr>
									</c:if>
									
									<c:if test="${groupMember.authority == 'A' and version == 'A'}">
										<tr id="${groupMember.id}">
											<td>${groupMember.id}</td>
											<td>${groupMember.name}</td>
										</tr>
									</c:if>
							</c:if>
						</c:forEach>			
					</tbody>
					
				</table> 
				
			</div>
			<div style = "float : right;  top : 4%; position: relative; left : 2.5%;">
				<input type="button" id = "groupSetting" style = "height : 24px; width : 60px;" class = "btn-primary" value="설정"/>
			</div>
		</div>
	</div>
</body>
</html>
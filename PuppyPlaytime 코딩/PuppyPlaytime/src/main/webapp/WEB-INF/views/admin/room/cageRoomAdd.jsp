<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>케이지 테이블 팝업</title>

<style type="text/css">
body { margin:0 }
input,textarea,select { margin:0; padding:0;border:0;display:inline}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

	
	$(function(){
		$("#insertData").click(function(){
			if($("#c_no").val()==""){
				$("#c_no").val(0);
			}
			
			if($("#s_no").val()==""){
				$("#s_no").val(0);
			}	
			if($("#s_name").val()==""){
				$("#s_name").val(0);
			}	
			if($("#s_price").val()==""){
				$("#s_price").val(0);
			}	
			if($("#s_status").val()==""){
				$("#s_status").val(0);
			}	
			if($("#s_explain").val()==""){
				$("#s_explain").val(0);
			}	
			
			if($("#c_status").val()==""){
				$("#c_status").val("use");
			}
			if($("#c_kind").val().replace(/\s/g,"")==""){
				alert('케이지 종류를 입력해주세요.');
				return false;
			}
			if($("#c_price").val().replace(/[^0-9]/g,"")==""){
				alert('케이지 가격을 입력해주세요.');
				return false;
			}
			if($("#c_explain").val().replace(/\s/g,"")==""){
				alert('케이지 설명을 입력해주세요.');
				return false;
			}
			if($("#file").val().replace(/\s/g,"")==""){
				alert('케이지 사진을 등록해주세요.');
				return false;
			}
			
			var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
			var fileSize;
			var maxSize = 5 * 1024 * 1024;
			var fileValue = $("#file").val().split("\\");
			var fileName = fileValue[fileValue.length-1];
			
			if($("#file").val() != "" && $("#file").val() != null) {
				fileSize =  document.roomForm.file.files[0].size;
				
				alert(fileName);
				
				if(fileName > 20){
					alert('이미지 파일 이름이 너무 깁니다.(20자 이내)');	
					return;
				}
				if(!$("#file").val().match(fileForm)){
					alert('이미지 파일만 업로드 가능합니다.');
					return;
				}
				if(fileSize > maxSize){
					alert("파일 사이즈는 5MB까지 가능");
			        return;
				}
			}
			
			
			$("#roomForm").attr({
				"method":"POST",
				"action":"/admin/room/roomAdd"
			});
			$("#roomForm").submit();
		});
		
		$("#closeWindow").click(function(){
			window.history.back();
		});
	});
	
	
	
</script>
</head>
<body>
	<div>
		<form id ="roomForm" name="roomForm" enctype="multipart/form-data">
			<table class="table table-dark table-striped">
				<thead>
					<tr>
						<td colspan="4" align="center"><h4>케이지 룸 등록</h4></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th><span class ="required">*</span>케이지 종류</th>
						<td>
							<select name="c_kind">
								<option id="c_kind" value="small">소형</option>
								<option id="c_kind" value="middle">중형</option>
								<option id="c_kind" value="big">대형</option>
							</select>
						</td>
						<th><span class ="required">*</span>케이지 유형</th>
						<td>
							<select name="c_type">
								<option id="c_type" value="NOMAL">NOMAL</option>
								<option id="c_type" value="VIP">VIP</option>
							</select>
						</td>
					</tr>

					<tr>
						<th><span class ="required">*</span>케이지 번호</th>
						<td colspan ="3"><input type="text" id="c_no" name="c_no" disabled="disabled"/></td>
					</tr>
					<tr>
						<th><span class ="required">*</span>가격</th>
						<td colspan ="3"><input type="text" id="c_price" name="c_price"/></td>
					</tr>
					<tr>
						<th><span class ="required">*</span>케이지 설명</th>
						<td colspan ="3"><textarea cols="60" rows="10" id="c_explain" name="c_explain"></textarea></td>
					</tr>
					<tr>
						<th><span class ="required">*</span>케이지 사진</th>
						<td colspan ="3"><input type="file" id="file" name="file" accept="image/*"/></td>
					</tr>
					<tr>
						<th><span class ="required">*</span>부가서비스</th>
						<c:if test="${empty extraServiceList}">
						
						<td colspan="3" align="center">등록된 서비스 정보가 존재하지 않습니다.</td>
							
						</c:if>
								<td colspan="3" align ="center"><c:forEach items="${extraServiceList}" var="service"><input id="sno"  name="sno" type ="checkbox" value ="${service.s_no}"/>${service.s_no}.${service.s_name}&nbsp;&nbsp;</c:forEach></td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" id="c_status" name="c_status" />
			<input type="hidden" id="c_picture" name="c_picture" value="${file}" />
			
			<input type="hidden" id="s_no" name="s_no"/>
			<input type="hidden" id="s_name" name="s_name" />
			<input type="hidden" id="s_explain" name="s_explain" />
			<input type="hidden" id="s_status" name="s_status" />
			<input type="hidden" id="s_price" name="s_price" />
		</form>
	</div>
	<div>
		<p></p>
		<table>
			<tr align ="center">
				<td><input type="button" id ="insertData" value="등록"/></td>
				<td><input type="button" id ="closeWindow" value="취소" /></td>
			</tr>
		</table>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri ="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<style>
th{font-weight:bold}
 #contentForm { width: 40%; text-align:left; padding:8px}
.contentContainer{margin-top:30px; margin-bottom:30px; text-align:center; }
.contentTit{ margin-top:30px; margin-bottom:30px; text-align:left;}
.btn{ margin-top:30px; margin-bottom:30px; font-weight:bold; font-size:medium; margin:auto; display:inline-block}
</style>
<head>
<meta charset="UTF-8">
<title>글쓰기 화면</title>
<script type="text/javascript"
src="/resources/include/assets/js/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
	$(function(){
		/*저장 버튼 클릭 시 처리 이벤트*/
		$("#insertBtn").click(function(){
			//입력값 체크
			if(!chkSubmit($('#n_title'),"제목을")) return;
			else if(!chkSubmit($('#n_registrant'),"작성자를")) return;
			else if(!chkSubmit($('#n_content'),"작성할 내용을")) return;
			else{
				$("#f_writeForm").attr({
						"method":"POST",
						"action":"/admin/notice/noticeAdd"
				});
				$("#f_writeForm").submit();
			}
		});
		
		
		/*목록 버튼 클릭 시 처리 이벤트*/
		$("#noticeListBtn").click(function(){
			location.href="/admin/notice/noticeList";
		});
		
	});


</script>
</head>
<body>
<div class="contentContainer">
	<div class="contentTit"><h3>공지사항 등록</h3></div>
	
	<div class="contentTB">
	<form id="f_writeForm" name="f_writeForm">
		<table class="table table-dark table-striped">
			<colgroup>
				<col width="17%"/>
				<col width="83%"/>
			</colgroup>
			<tr>
				<th>작성자</th>
				<td>
					<div style="width: 100px">
						<input type="text" name="n_registrant" id="n_registrant" value="admin" readonly="true" class="form-control"/>
					</div>
				</td>
			<tr>
				<th>글제목</th>
					<td>
						<div style="width: 600px;">
							<input type="text" name="n_title" id="n_title" class="form-control" >
						</div>
					</td>
			</tr>
			<tr>
				<th>내용</th>
					<td>
					<div style="width: 800px;">
						<textarea class="form-control" rows="12" cols="150" name="n_content" id="n_content"></textarea>
					</div>
					</td>
			</tr>
		</table>	
	</form>
</div>
<div class="btn">
	<input type="button" value="저장" id="insertBtn" class="btn btn-primary">
	<input type="button" value="목록" id="noticeListBtn" class="btn btn-primary">
</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		/* 수정 버튼 클릭 시 처리 이벤트 */
		$("#myUpdateBtn").click(function() {
			goUrl = "/client/mypage/myUpdateForm";
			$("#myForm").attr("action", goUrl);
			$("#myForm").submit();
		});
	});
</script>
</head>
<body>
	<br>
	<br>
	<br>
	<h3 align="center">내정보 관리</h3>
<div class="nav-item1">
		
		<form id="myForm" name="myForm" method="post" class="form-group row">
			<div class="form-group">
				<label class="form-label mt-4" for="m_id">아이디</label>
				<input type="text" id="m_id" name="m_id" value="${detail.m_id}"
					readonly class="form-control" placeholder="영문 숫자 포함 20자" />
			</div>

			<div class="form-group">
				<label class="form-label mt-4" for="m_name">이름</label>
				<input type="text" id="m_name" name="m_name"
					value="${detail.m_name}" readonly class="form-control"
					placeholder="이름">
			</div>

			<div class="form-group">
				<label class="form-label mt-4" for="m_birth">생년월일</label>
				<input type="text" id="m_birth" name="m_birth"
					value="${detail.m_birth}" readonly class="form-control"
					placeholder="YYYY-MM-DD 입력">
			</div>
			
			<div class="form-group">
				<label class="form-label mt-4" for="m_phone">전화번호</label>
				<input type="text" id="m_phone" name="m_phone"
					value="${detail.m_phone}" readonly class="form-control"
					placeholder="(-) 제외 숫자로만 11자">
			</div>
			
			<div class="form-group">
				<label class="form-label mt-4" for="m_address">주소</label>
				<input type="text" id="m_address" name="m_address"
					placeholder=" 도로명 주소" value="${detail.m_address}" readonly
					class="form-control">
			</div>


			<div class="form-group">
				<label class="form-label mt-4" for="m_email">이메일</label>
				<input type="text" id="m_email" name="m_email"
					value="${detail.m_email}" readonly class="form-control"
					placeholder="이메일 입력">
			</div>
		</form>
	</div>

	<br>
	<div align="center" class="form-group">
		<input type="button" id="myUpdateBtn" name="myUpdateBtn"
			class="btn btn-primary" value="수정하러가기">
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
/* 기본스타일  */	
	table{ background-color: #F2F2F2;}
	
	table td, table th {
    	border: 1px solid black;
	}
	
	tr{height: 60px;}
	th{text-align: center;}
	td{width: 100px; text-align: right; font-size: 15pt; font-family: D2coding;}
	/* 타이틀 스타일 */
	th#title {font-size: 20pt; font-weight: bold; color: #FFBF00; font-family: D2coding; }

	/* 요일 스타일 */
	td.sunday{ text-align: center; font-weight: bold; color: red; font-family: D2coding; }
	td.saturday{ text-align: center; font-weight: bold; color: blue; font-family: D2coding; }
	td.etcday{ text-align: center; font-weight: bold; color: black; font-family: D2coding; }

	/* 날짜 스타일 */
	td.sun{ text-align: right; font-size: 15pt; color: red; font-family: D2coding; vertical-align: top;}
	td.sat{ text-align: right; font-size: 15pt; color: blue; font-family: D2coding; vertical-align: top;}
	td.etc{ text-align: right; font-size: 15pt; color: black; font-family: D2coding; vertical-align: top;}
	
	td.redbefore{ text-align: right; font-size: 12pt; color: red; font-family: D2coding; vertical-align: top;}
	td.before{ text-align: right; font-size: 12pt; color: gray; font-family: D2coding; vertical-align: top;}

	table td:hover {
   		background-color: rgba(0,0,0,.075);
	}
</style>
<script>
	var firstCheck = false;
	var reCheck = false;
	var first;
	
	$(function(){
		// 예약하러가기 버튼 클릭
		$("#reservation").click(function(){
			/*$.ajax({
				type : "GET",
				url : "/client/reserve/reserveRoom",
				data : $("#sendDate").serialize(),
				dataType : "text",
				error : function(request, status,error){
					alert('시스템 오류 입니다. 관리자에게 문의하세요.');
					 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				},
				success : function(result){
					$("#sendDate").submit();
				}
			});*/
			
			$("#dateSend").attr({
				"method" : "GET",
				"action" : "/client/reserve/reserveRoom"
			});
			$("#dateSend").submit();
		});
	});
	
	function dateClick(i){
		if(reCheck == true){
			$("td").css("background-color", "#F2F2F2");		
			reCheck = false;
		}
		if(firstCheck == false){
			// 선택자에 변수넣기
			$("#date"+i).css("background-color", "green");
			firstCheck = true;
			first = i;
			// 시작 날짜 보내기
			var start = $("#startDate").val()+first+"일";
			$("#startDate").val(start);
		}else{
			if(first >= i){
				$("#date"+first).css("background-color", "#F2F2F2");
				$("#date"+i).css("background-color", "green");
				first = i;
				// 시작 날짜 보내기
				var start = $("#startDate").val()+first+"일";
				$("#startDate").val(start);
				return;
			}
			// 끝날짜 정해짐
			for(var j=first; j <= i; j++){
				$("#date"+j).css("background-color", "green");
				reCheck = true;
			}
			// 종료 날짜 보내기
			var end = $("#endDate").val() + i +"일";
			$("#endDate").val(end);
		}
	}
</script>
<title>예약하기</title>
</head>
<body>
	<table class="table" border="1">
		<tr>
			<!-- 이전달 버튼 만들기 -->
			<th>
				<input type="button" value="이전 달" onclick="location.href='?year=${year}&month=${month-1}'">
			</th>
			<!-- 제목 만들기 -->
			<th id="title" colspan="5">${year }년 ${month }월</th>
			<!-- 다음달 버튼 만들기 -->
			<th>
				<input type="button" value="다음 달" onclick="location.href='?year=${year}&month=${month+1}'">
			</th>
		</tr>
		<tr>
			<th class="sunday">일</th>
			<th class="etcday">월</th>
			<th class="etcday">화</th>
			<th class="etcday">수</th>
			<th class="etcday">목</th>
			<th class="etcday">금</th>
			<th class="saturday">토</th>
		</tr>
		<tr>
			<c:forEach var="i" begin="1" end="${monthFirst%7 }">
				<th></th>
			</c:forEach>
			<c:forEach var="i" begin="1" end="${monthEnd }">
				<c:choose>
					<c:when test="${(i+monthFirst-1)%7==0 }">
						<td class="sun" id="date${i }" onClick="dateClick(${i})">${i}</td>
					</c:when>
					<c:when test="${(i+monthFirst-1)%7==6 }">
						<td class="sat" id="date${i }" onClick="dateClick(${i})">${i}</td>
					</c:when>
					<c:otherwise>
						<td class="etc" id="date${i }" onClick="dateClick(${i})">${i}</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${(i+monthFirst-1)%7==6 && i!=monthEnd }">
						<%
							out.println("</tr><tr>");
						%>
					</c:when>
				</c:choose>
			</c:forEach>
		</tr>
	</table>
	<form id="dateSend" name="dateSend">
		<input type="hidden" id="startDate" name="startDate" value="${year}년${month}월" />
		<input type="hidden" id="endDate" name="endDate" value="${year}년${month}월" />
		<button type="button" class="btn btn-lg btn-outline-success" id="reservation">예약하러 가기</button>
	</form>
</body>
</html>
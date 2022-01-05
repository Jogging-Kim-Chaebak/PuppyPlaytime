<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>댓글</title>

		<!-- jQuery Framework 참조하기 -->
		<script type="text/javascript">
		$(function() {
			/** 기본 덧글 목록 불러오기 */
			var q_no = "<c:out value='${detail.q_no}' />";
			listAll(q_no)

			/** 덧글 내용 저장 이벤트 */
			$("#replyInsert").click(function() {
					var insertUrl = "/reply/replyInsert";
					/** 글 저장을 위한 Post 방식의 Ajax 연동 처리 */
					$.ajax({
						url : insertUrl,  //전송 url
						type : "post",    // 전송 시 method 방식
						headers : {
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"POST"
						},
						dataType:"text",
						data : JSON.stringify({
							q_no:q_no,
							reply_title:$("#reply_title").val(),
							reply_registrant:$("#reply_registrant").val(),
							reply_content:$("#reply_content").val()
						}),
						error : function(){ 
					             alert('시스템 오류 입니다. 관리자에게 문의 하세요');
						}, 
						success : function(resultData){ 
							if(resultData=="SUCCESS"){
							    alert("댓글 등록이 완료되었습니다.");
							    dataReset();
							    listAll(q_no);
							}
						}
					});
			});
			
			/** 수정버튼 클릭시 수정폼 출력 */
			$(document).on("click", ".update_form", function() {
				$(".reset_btn").click();
				var currLi = $(this).parents("li");
				
				 	var conText = currLi.children().eq(1).html();
					//console.log("conText: " + conText);
						
					currLi.find("input[type='button']").hide();
					var conArea = currLi.children().eq(1);
						
					conArea.html("");
					var data="<textarea name='content' id='content'>"+ conText+"</textarea>";
					data+="<input type='button' class='update_btn' value='수정완료'>";
					data+="<input type='button' class='reset_btn' value='수정취소'>";
					conArea.html(data);
				
			});
			
			/** 초기화 버튼 */
			$(document).on("click", ".reset_btn", function() {
				var conText = $(this).parents("li").find("textarea").html();
				$(this).parents("li").find("input[type='button']").show();
				var conArea = $(this).parents("li").children().eq(1);
				conArea.html(conText);
			});
			
			/** 글 수정을 위한  Ajax 연동 처리 */
			$(document).on("click", ".update_btn", function() {
				var reply_no = $(this).parents("li").attr("data-num");
				var reply_content = $("#content").val();
				/*  if (!chkData("#content","댓글 내용을"))	return;
				else { */	 
					$.ajax({
						url:'/reply/'+reply_no,
						type:'put',
						headers: { 
							"Content-Type": "application/json",
							"X-HTTP-Method-Override": "PUT" },
						data:JSON.stringify({
							reply_content:reply_content}), 
						dataType:'text', 
						success:function(result){
							console.log("result: " + result);
							if(result == 'SUCCESS'){
								alert("수정 되었습니다.");
								listAll(q_no);
							}
						}
					}); 
				//}
			});
			
			/** 글 삭제를 위한  Ajax 연동 처리 */
			$(document).on("click", ".delete_btn", function() {
				$(".reset_btn").click();
				var currLi = $(this).parents("li")
				reply_no = currLi.attr("data-num");
				
					if (confirm("선택하신 댓글을 삭제하시겠습니까?")) {
						$.ajax({
							type : 'delete',
							url : '/reply/' + reply_no,
							headers : {
							   "Content-Type" : "application/json",
							   "X-HTTP-Method-Override" : "DELETE"
							},
							dataType : 'text',
							success : function(result) {
								console.log("result: " + result);
								if (result == 'SUCCESS') {
								      alert("삭제 되었습니다.");
								      listAll(q_no);
								}
							}
						});
					} 
				
			});
			
		});

		
		// 리스트 요청 함수
		function listAll(q_no){
			$("#comment_list").html("");
			var url = "/reply/all/"+q_no;
			$.getJSON(url, function(data) {
				console.log(data.length);
				
 				$(data).each(function() {
					var reply_no = this.reply_no;
					var reply_registrant = this.reply_registrant;
					var reply_content = this.reply_content;
					var reply_regdate = this.reply_regdate;
					addNewItem(reply_no, reply_registrant, reply_content, reply_regdate);
				}); 
			}).fail(function() {
				alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
			});
		}
		
		/** 새로운 글을 화면에 추가하기 위한 함수*/
		function addNewItem(reply_no, reply_registrant, reply_content, reply_regdate) {
			// 새로운 글이 추가될 li태그 객체
			var new_li = $("<li>");
			new_li.attr("data-num", reply_no);
			new_li.addClass("comment_item");

			// 작성자 정보가 지정될 <p>태그
			var writer_p = $("<p>");
			writer_p.addClass("writer");
			
			// 작성자 정보의 이름
			var name_span = $("<span>");
			name_span.addClass("name");
			name_span.html(reply_registrant + "님");

			// 작성일시
			var date_span = $("<span>");
			date_span.html(" / " + reply_regdate + " ");

			// 수정하기 버튼
			var up_input = $("<input>");
			up_input.attr({"type" : "button", "value" : "수정하기", "class":"btn btn-primary"});
			up_input.addClass("update_form");
			
			// 삭제하기 버튼
			var del_input = $("<input>");
			del_input.attr({"type" : "button", "value" : "삭제하기", "class":"btn btn-primary"});
			del_input.addClass("delete_btn");
			
			// 내용
			var content_p = $("<p>");
			content_p.addClass("con");
			content_p.html(reply_content);

			// 조립하기
			writer_p.append(name_span).append(date_span).append(up_input).append(del_input)
			new_li.append(writer_p).append(content_p);
			$("#comment_list").append(new_li);
		}
		
		function dataReset() {
			$("#reply_registrant").val("");
			$("#reply_content").val("");
		}
		</script>
	</head>
	<body>
		<div id="replyContainer">
			<h1></h1>
			<div id="comment_write" class="alert alert-dismissible alert-secondary">
				<form id="comment_form">
					<div >
						<label for="reply_registrant">작성자 ${userId}</label>
					</div>
					<div>
						<label for="reply_content" >덧글내용</label><br>
						<textarea name="reply_content" id="reply_content"></textarea><br>
						<input type="button" id="replyInsert" value="저장하기" class="btn btn-primary"  />
					</div>
				</form>
			</div>
			
			<ul id="comment_list">
				<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
			</ul>
		</div>
	</body>
</html>

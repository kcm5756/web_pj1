<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 추가</title>
<%@ include file="../include/include.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btnList").click(function() {
			location.href = "${path}/projectList"
		});

		$("#btnCreate").click(function() {
			if (confirm("등록하시겠습니까?")) {
				var projectId = $("#project_id").val();
				var projectName = $("#project_name").val();
				var projectContent = $("#project_content").val();
				var projectStart = $("#project_start").val();
				var projectEnd = $("#project_end").val();
				var projectState = $("#project_state").val();

				if (projectId == "") {
					alert("해당 프로젝트의 번호를 입력하세요.");
					$("#project_id").focus();
					return;
				}
				if (projectName == "") {
					alert("해당 프로젝트명을 입력하세요.");
					$("#project_name").focus();
					return;
				}
				if (projectContent == "") {
					alert("해당 프로젝트의 내용을 입력하세요.");
					$("#project_content").focus();
					return;
				}
				if (projectStart == "") {
					alert("해당 프로젝트의 시작일을 입력하세요.");
					$("#project_start").focus();
					return;
				}
				// 				if (projectEnd == "") {
				// 					alert("해당 프로젝트의 종료일을 입력하세요.");
				// 					$("#project_end").focus();
				// 					return;
				// 				}
				if (projectState == "") {
					alert("해당 프로젝트의 상태를 입력하세요.");
					$("#project_state").focus();
					return;
				}
				document.detailForm.action = "${path}/projectCreate";
				document.detailForm.submit();

			}
		});

	});
</script>
</head>
<body>
	<header>
		<%@ include file="../include/header.jsp"%>
	</header>
	<div id="root">
		<header>
			<h1>프로젝트 등록</h1>
		</header>
		<hr />

		<section id="container">
			<form role="form" id="detailForm" class="pro__info__form" name="detailForm"
				method="post">
				<table class="pro__info__table">
					<tbody>
						<tr>
							<td><label for="project_id" class="p__i__t__label">프로젝트 번호</label> <input
									type="text" id="project_id" class="p__i__t__type" name="p_id" /></td>
						</tr>
						<tr>
							<td><label for="project_name" class="p__i__t__label">프로젝트명</label> <input
									type="text" id="project_name" class="p__i__t__type" name="p_name" /></td>
						</tr>
						<tr>
							<td><label for="project_content" class="p__i__t__label">프로젝트 내용</label> <textarea
									rows="10" cols="50" id="project_content" class="p__i__t__content"
									name="p_content"></textarea></td>
						</tr>
						<tr>
							<td><label for="project_start" class="p__i__t__label">시작 날짜</label> <input
									type="date" name="p_start" id="project_start" class="p__i__t__date"
									min="2010-07-01" max="2025-06-30" class="s__pro">
						</tr>
						<tr>
							<td><label for="project_end" class="p__i__t__label">종료 날짜</label> <input
									type="date" name="p_end" id="project_end" class="p__i__t__date" min="2010-07-01"
									max="2025-06-30" class="s__pro">
						</tr>
						<tr>
							<td><label for="project_state" class="p__i__t__label">프로젝트 상태</label> <!-- <input type="text"
									class="p__i__t__type" id="project_state" name="p_state" /> --> <select
								name="p_state" id="project_state" class="s__pro">
									<option value="시작 전">시작 전</option>
									<option value="진행 중">진행 중</option>
									<option value="종료">종료</option>
									<option value="취소">취소</option>
							</select></td>
						</tr>
					</tbody>
				</table>
				<input type="button" id="btnCreate" class="pro__info__button" value="등록완료" />
				<input type="button" id="btnList" class="pro__info__button" value="목록" />
			</form>
		</section>
		<hr />
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 관리</title>
<%@ include file="../include/include.jsp"%>
</head>
<body>
	<header>
		<%@ include file="../include/header.jsp"%>
	</header>
	<a href="projectCreatePage"><button class="pro__add">프로젝트 추가</button></a>
	<form action="projectSearch">
		<table id="pro__search__table">
			<thead>
				<tr>
					<td>시작날짜</td>
					<td>마감날짜</td>
					<td>상태</td>
					<td>제목</td>
					<td>내용</td>
					<td></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="date" name="projectStart" id="projectStart" min="2010-07-01"
							max="2025-06-30" class="s__pro"></td>
					<td><input type="date" name="projectEnd" id="projectEnd" min="2010-07-01"
							max="2025-06-30" class="s__pro"></td>
					<td><select name="projectState" id="projectState" class="s__pro">
							<option value="">ALL</option>
							<option value="시작 전">시작 전</option>
							<option value="진행 중">진행 중</option>
							<option value="종료">종료</option>
							<option value="취소">취소</option>
					</select></td>
					<td><input type="text" name="projectName" id="projectName" class="s__pro"></td>
					<td><input type="text" name="projectContent" id="projectContent" class="s__pro"></td>
					<td><input type="submit" class="search__btn" value="검색"></td>
				</tr>
			</tbody>
		</table>
	</form>
	<table id="pro__table">
		<thead>
			<tr>
				<th>프로젝트번호</th>
				<th>프로젝트명</th>
				<th>시작날짜</th>
				<th>종료날짜</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${projectList}" var="projectList">
				<tr>
					<td>${projectList.p_id}</td>
					<td><a href="projectDetail?projectId=${projectList.p_id}">${projectList.p_name}</a></td>
					<td>${projectList.p_start}</td>
					<td>${projectList.p_end}</td>
					<td>${projectList.p_state}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul class="content__count">
		<%
			int cnt = Integer.parseInt(String.valueOf(request.getAttribute("pageCnt")));
			int cur = Integer.parseInt(String.valueOf(request.getAttribute("page")));
		%>
		<%
			for (int i = 1; i <= cnt; i++) {
				if (i == cur) {
		%>
		<li class="active"><span><%=i%></span></li>
		<%
			} else {
		%>
		<li><a href="projectList?page=<%=i%>"> <span><%=i%></span>
		</a></li>
		<%
			}
			}
		%>
	</ul>
</body>

</html>
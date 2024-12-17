<!DOCTYPE html>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="jdbcCon.Connector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="header.jsp" />
	<div class="container m-3">
		<h2>익명 글 목록</h2>
		<form name="frm" method="post" action="main.jsp">
				<table class="table">
					<tr>
						<td align="center">
							<select name="search">
								<option value="title">제목</option>
								<option value="userid">작성자</option>
							</select>
							<input type="text" name="svalue">
							<input type="submit" class="btn btn-primary" value="검색">
						</td>
					</tr>
				</table>
			</form>
		<table class="table">
			<thead class="table-dark">
				<tr>
					<th style="width: 50%">제목</th>
					<th>글쓴이</th>
					<th>작성일시</th>
				</tr>
			</thead>
			<tbody>
				<%
				Connection con = Connector.genConnection();
				Statement stmt = con.createStatement();
				
				String sql = "SELECT title, userid, post_date FROM post";
				if(request.getParameter("svalue") != null) {
					String search = request.getParameter("search");
					String svalue = request.getParameter("svalue");
					sql = sql + " WHERE " + search + " LIKE '%" + svalue + "%'";
				}
				
				ResultSet rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					String title = rs.getString(1);
					String user_id = rs.getString(2);
					Timestamp time = rs.getTimestamp(3);
					LocalDateTime date = time.toLocalDateTime();
					String str_date = date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
					
					%>
					<tr>
						<td>
							<a href="post_detail.jsp?title=<%= title %>"><%= title %></a>
						</td>
						<td>
							<span><%= user_id %></span>
						</td>
						<td><%= str_date %></td>
					</tr>
					<%
				}
				
				
				%>
			</tbody>
		</table>
		
		<%
		if(session.getAttribute("userid") != null) {
			%>
			<a href="post_create.jsp" class="btn btn-primary">질문 등록하기</a>
			<%
		}
		%>
	</div>
</body>
</html>
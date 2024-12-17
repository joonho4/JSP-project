<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="jdbcCon.Connector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<script type="text/javascript">
		function goBack() {
			window.history.back()
		}
	</script>
	<%
		try {
			Connection con = Connector.genConnection();
			Statement stmt = con.createStatement();
			
			String title = request.getParameter("title");
			String sql = "SELECT * FROM post WHERE title='" + title + "'";
			
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				String userid = rs.getString(2);
				String detail = rs.getString(3);
				Timestamp time = rs.getTimestamp(4);
				LocalDateTime date = time.toLocalDateTime();
				String str_date = date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
				%>
				<h2 class="border-bottom py-2"><%= title %></h2>
				<div class="mb-2">
					<span>글쓴이 : <%= userid %></span>
				</div>
				<div class="mb-2">
					<p>내용 : <%= detail %></p>
				</div>
				<button type="button" onclick="goBack()" class="btn btn-primary">뒤로가기</button>
				
			<%
			} else {
				throw new Exception();
			}
		} catch(Exception e) {
			%>
				<script type="text/javascript">
					alert("해당 게시물이 존재하지 않습니다")
				</script>
			<%
			response.sendRedirect("main.jsp");
		}
	%>
</body>
</html>
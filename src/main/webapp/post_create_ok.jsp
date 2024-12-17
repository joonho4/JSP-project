<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
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
	<%
	try{
		Connection con = Connector.genConnection();
		String sql = "INSERT INTO post(title, userid, detail, post_date) VALUES(?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		String title = request.getParameter("title");
		String userid = (String)session.getAttribute("userid");
		String detail = request.getParameter("content");
		Timestamp time = new Timestamp(System.currentTimeMillis());
		
		pstmt.setString(1, title);
		pstmt.setString(2, userid);
		pstmt.setString(3, detail);
		pstmt.setTimestamp(4, time);
		
		pstmt.executeUpdate();
		%>
		<script type="text/javascript">
		 	alert("글이 등록되었습니다.")
		</script>
		<%
		
		pstmt.close();
		
		con.close();
		
		response.sendRedirect("main.jsp");
	} catch(Exception e) {
		
	}
	%>
</body>
</html>
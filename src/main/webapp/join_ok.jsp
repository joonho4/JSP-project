<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.LocalDateTime"%>
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
			String sql = "INSERT INTO Suser (userid, password, use_date) VALUES(?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			String userid = request.getParameter("userid");
			String userpw = request.getParameter("password1");
			Timestamp date = new Timestamp(System.currentTimeMillis());
			
			pstmt.setString(1, userid);
			pstmt.setString(2, userpw);
			pstmt.setTimestamp(3, date);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			%>
			<script type="text/javascript">
				alert("회원가입이 성공적으로 완료되었습니다.")
			</script>
			<%
			response.sendRedirect("main.jsp");
		}catch(Exception e) {
			%>
			<script type="text/javascript">
				alert("회원가입에 실패했습니다. 다시 시도해 주세요")
			</script>
			<%
			response.sendRedirect("join.jsp");
		}
	%>
</body>
</html>
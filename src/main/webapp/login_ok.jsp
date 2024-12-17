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
	<%
		try{
			Connection con = Connector.genConnection();
			String userid = request.getParameter("username");
			String password = request.getParameter("password");
			
			String sql = "SELECT userid FROM Suser WHERE userid='" + userid +"' AND password='" + password + "'";
			Statement stmt = con.createStatement();
			
			
			
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				String login_userid = rs.getString(1);
				
				session.setAttribute("userid", login_userid);
				%>
				<jsp:forward page="/main.jsp" />
				<%
			} else {
				%>
				<script type="text/javascript">
					alert("데이터 베이스 정보가 제대로 불러와 지지 않았습니다. 다시 시도해 주세요.")
				</script>
				<jsp:forward page="/login.jsp" />
				<%
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch(Exception e) {
			%>
			<script type="text/javascript">
				alert("데이터 베이스 정보가 제대로 불러와 지지 않았습니다. 다시 시도해 주세요")
				
			</script>
			<jsp:forward page="/login.jsp" />
			<%
		}
	%>
</body>
</html>
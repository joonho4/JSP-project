<%@page import="jdbcCon.Connector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>password adjust</title>
</head>
<body>
	<%
	try {
		Connection con = Connector.genConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = null;
		String id = (String) session.getAttribute("userid");
		String prepw = request.getParameter("prepw");
		String nextpw = request.getParameter("nextpw");
		String sql = "select password from Suser where userid='" + id + "'";
		rs = stmt.executeQuery(sql);

		while (rs.next()) {
			String dbpw = rs.getString(1);
			if (dbpw.equals(prepw)) {
		sql = "update Suser set password='" + nextpw + "' where userid='" + id + "'";
		stmt.executeQuery(sql);
	%>
	<jsp:forward page="mypage.jsp" />
	<%
	} else {
	%>
	<jsp:forward page="mypage.jsp" />
	<%
	}
	}
	rs.close();
	stmt.close();
	con.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
</html>
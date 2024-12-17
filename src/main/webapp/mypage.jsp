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
<title>mypage</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<h3 style="text-align: center;">회원정보</h3>
	<%
	String loginInfo = request.getParameter("LoginInfo");
	if (loginInfo != null && loginInfo.equals("1")) {
	%>
	<script>
		alert('비밀번호를 변경했습니다.');
	</script>
	<%
	} else if (loginInfo != null && loginInfo.equals("2")) {
	%>
	<script>
		alert('이전비밀번호 입력을 다시 확인해주세요.');
	</script>
	<%
	}
	try {
	Connection con = Connector.genConnection();
	Statement stmt = con.createStatement();
	ResultSet rs = null;
	String id = (String) session.getAttribute("userid");
	String sql = "select * from Suser where userid='" + id + "'";
	rs = stmt.executeQuery(sql);

	while (rs.next()) {
		String userpw = rs.getString(1);
		
	%>
	<form name="frm" method="post" action="pw_adj.jsp">
		<table class="table table-striped" align=center>
			<tr>
				<td width="50% align=center">아이디</td>
				<td><%=id%></td>
			</tr>
			<tr>
				<td width="50% align=center">이전비밀번호</td>
				<td><input type="password" name="prepw"></td>
			</tr>
			<tr>
				<td width="50% align=center">새비밀번호</td>
				<td><input type="password" name="nextpw"></td>
			</tr>
			<tr>
				<td width="50% align=center">새비밀번호 확인</td>
				<td><input type="password" name="nextpw2"></td>
			</tr>
			<tr align=center>
				<br>
				<td colspan="2"><input class="btn btn-danger" type="button"
					onclick="Check()" value="변경"></td>
			</tr>
		</table>
	</form>
	
	<%
	}
	rs.close();
	stmt.close();
	con.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
<script type="text/javascript">
	function Check() {
		let prepw = document.frm.prepw
		let nextpw = document.frm.nextpw
		let nextpw2 = document.frm.nextpw2

		if (prepw.value == "") {
			alert("이전비밀번호 입력을 확인하세요.")
			return null;
		}
		if (nextpw.value == "") {
			alert("새비밀번호 입력을 확인하세요.")
			return null;
		}
		if (nextpw2.value == "") {
			alert("새비밀번호 확인 입력을 확인하세요.")
			return null;
		}
		if (nextpw.value == nextpw2.value) {
			document.frm.submit()
		}
	}
</script>
</html>
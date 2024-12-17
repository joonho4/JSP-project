<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		function check() {
			if(document.frm.username.value == "") {
				alert("로그인 아이디를 입력해주세요")
				document.frm.username.focus()
				return false
			} else if(document.frm.password.value =="") {
				alert("로그인 비밀번호를 입력해주세요")
				document.frm.password.focus()
				return false
			}
			document.frm.submit()
		}
	</script>
	<jsp:include page="header.jsp" />
	<h4>로그인</h4>
	<form action="login_ok.jsp" name="frm" method="post">
		
		<div class="mb-3">
			<label for="username" class="form-label">사용자 ID</label> 
			<input
				type="text" 
				name="username" 
				id="username" 
				class="form-control"
			/>
		</div>
		<div class="mb-3">
			<label for="password" class="form-label">비밀번호</label> 
			<input
				type="password" 
				name="password" 
				id="password" 
				class="form-control"
			/>
		</div>
		<button type="button" onclick="check()" class="btn btn-primary">로그인</button>
	</form>
</body>
</html>
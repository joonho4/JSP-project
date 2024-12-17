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
			
			if (document.frm.userid.value == "") {
				alert("사용자 ID를 입력해 주세요.")
				document.frm.userid.focus()
				return false
			} else if(document.frm.password1.value == "") {
				alert("비밀번호를 입력해주세요")
				document.frm.password1.focus()
				return false
			} else if(document.frm.password2.value == "") {
				alert("비밀번호확인을 입력해주세요")
				document.frm.password1.focus()
				return false
			} else if(document.frm.password1.value != document.frm.password2.value) {
				alert("비밀번호가 틀립니다 다시 확인해 주세요")
				document.frm.password2.focus
				return false
			}
			document.frm.submit()
		}
	</script>
	<jsp:include page="header.jsp" />
	
	<h4>회원가입</h4>
	<form action="join_ok.jsp" name="frm" method="post">
		<div class="mb-3">
			<label for="username" class="form-label">사용자 ID</label> 
			<input 
				type="text" 
				name="userid" 
				class="form-control">
		</div>
		<div class="mb-3">
			<label for="password1" class="form-label">비밀번호</label> 
			<input
				type="password" 
				name="password1"
				class="form-control">
		</div>
		<div class="mb-3">
			<label for="password2" class="form-label">비밀번호 확인</label>
			<input
				type="password" 
				name="password2"
				class="form-control">
		</div>
		<button type="button" class="btn btn-primary" onclick="check()">회원 가입</button>
	</form>
</body>
</html>
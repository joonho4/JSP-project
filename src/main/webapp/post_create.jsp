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
			if (document.frm.title.value == "") {
				alert("글 제목을 입력해주세요.")
				document.frm.title.focus()
				return false
			} else if (document.frm.content.value == "") {
				alert("글 내용을 입력해주세요.")
				document.frm.content.focus()
				return false
			}
			document.frm.submit()
		}
	</script>
	<jsp:include page="header.jsp" />
	
	<h5 class="my-3 border-bottom pb-2">글 등록하기</h5>
		<form name="frm" action="post_create_ok.jsp" method="post">
			<div class="mb-3">
				<label for="subject" class="form-label">제목</label>
				<input
					id="title"
					name="title" 
					type="text" 
					class="form-control"
				/>
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">내용</label>
				<textarea id="content" name="content" class="form-control"></textarea>
			</div>
			<input 
				type="button" 
				value="저장하기" 
				onclick="check()"
				class="btn btn-primary"
			/>
		</form>
</body>
</html>
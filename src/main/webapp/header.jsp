<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>익명 게시판</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<h1 style="text-align: center; margin: 20px">익명 게시판</h1>
<div>
		<ul class="nav nav-tabs">
			<li role="presentation">&emsp;&emsp;&emsp;<a href="main.jsp">메인화면</a></li>
			
			<%
			if (session.getAttribute("userid") != null) {
				String id = (String) session.getAttribute("userid");
				%>
				<li role="presentation" class="dropdown">
					&emsp;&emsp;&emsp;
					<button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
    					<%=id %>님<span class="caret"></span>
  					</button>
						
					<ul class="dropdown-menu" role="menu">
						<li role="presentation"><a href="mypage.jsp">회원정보</a></li>
						<li role="presentation"><a href="logout.jsp">로그아웃</a></li>
					</ul>
				</li>
				<%
			} else {
				%>
				<li role="presentation">&emsp;&emsp;&emsp;<a href="join.jsp">회원가입</a></li>
				<li role="presentation">&emsp;&emsp;&emsp;<a href="login.jsp">로그인</a></li>
				<%
			}
			
			%>
		</ul>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
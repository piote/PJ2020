<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 수정/삭제</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<br>
		<h1 class="text-center font-weight-bold">회원정보 수정/삭제</h1>
			
			<form action="adminWriterUpdatePro.jsp" method="post">
			<div class="form-group">
				<label for="id">ID</label>
				<input type="text" class="form-control" id="id" name="id" value=<%=id %>>
			</div>
			<div class="form-group">
				<label for="id">PassWord</label>
				<input type="text" class="form-control" id="pwd" name="pwd">
			</div>
			<div class="form-group">
				<label for="id">Nick Name</label>
				<input type="text" class="form-control" id="name" name="name">
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-secondary">변경</button>
				<button type="button" class="btn btn-secondary" onclick="location.href='adminMain.jsp'">취소</button>
				<button type="button" class="btn btn-secondary" onclick="location.href='adminWriterDelete.jsp?id=<%=id%>'">탈퇴</button>
				<button type="reset" class="btn btn-secondary">다시작성</button>
			</div>
		</form>
	</div>
</body>
</html>
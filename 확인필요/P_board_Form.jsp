<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd/HH:mm:ss");
	String ss=sf.format(new java.util.Date());
%>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>포토 게시판</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<br>
	<div class="container">
		<h3>포토 게시판</h3>
		<form action="P_board_Pro.jsp" method="post" enctype="multipart/form-data">
			<div class="form-group">
			작성자 <input type="text" name="writer" class="form-control">
			</div>
			<div class="form-group">
			<label  class="form-control"><%=ss %></label>
			</div>
			<div class="form-group">
			제목 <input type="text" name="title" class="form-control">
			</div>
			<input type="file" accept="image/*" name="filename" class="btn btn-success"><br><br>
			<input type="submit" value="업로드" class="btn bnt-primary">
		</form>
	</div>
</body>
</html>
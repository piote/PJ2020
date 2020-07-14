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

	String id = null;

	if(session.getAttribute("id") == null) {
		%>
		<script>
		alert("로그인후 이용가능합니다.");
		location.href = "loginForm.jsp";
		</script>
		<%
	}else{
		id = (String) session.getAttribute("id");
	}
%>

<!DOCTYPE html>
<html>
<style>
	#areaMain{padding:10%; margin-left:10%; margin-right:10%;}
</style>
<head>
	<meta charset="UTF-8">
	<title>포토 게시판</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<header>
		<jsp:include page="top.jsp" flush="false"/>
	</header>
	<section id = "areaMain">
	
	<br>
	<div class="container">
		<h2 class="text-center">포토 게시판</h2>
		<form action="P_board_Pro.jsp" method="post" enctype="multipart/form-data">
			<div class="form-group">
			작성자 <input type="text" name="P_ID" class="form-control" value=<%=id %> readonly>
			</div>
			
			<div class="form-group">
			제목 <input type="text" name="P_TITLE" class="form-control">
			</div>
			<div class="form-group">
			<label class="form-control"><%=ss %></label>
			</div>
			<input type="file" accept="image/*" name="P_FILE" class="btn btn-success"><br><br>
			<input type="submit" value="업로드" class="btn bnt-primary">
		</form>
	</div>
	</section>
</body>
</html>
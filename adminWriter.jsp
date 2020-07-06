<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import='java.sql.*'%>
<%@page import="csdit.WRITERDTO, java.util.ArrayList, csdit.PJ2020DAO"%>
<%
	WRITERDTO dto = new WRITERDTO();
	PJ2020DAO	dbPro = new PJ2020DAO();
	ArrayList<WRITERDTO> dtos = dbPro.listUser();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 페이지</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</head>
<body>
		<div class="container">
		<br>
		<h1 class="text-center font-weight-bold">회원정보</h1>
		<table class="table table-hover">
			<tr>
				<th>ID</th>
				<th>PASSWORD</th>
				<th>NICK NAME</th>
				<th> </th>
			</tr>
			<%//5. 결과집합 처리
				for(int i=0; i<dtos.size(); i++){
					dto = dtos.get(i);
					String id = dto.getId();
					String pwd = dto.getPwd();
					String name = dto.getName();
			%>
			<tr>
				<td><%=id %></td>
				<td><%=pwd %></td>
				<td><%=name %></td>
				<td><a href="adminWriterUpdateForm.jsp?id=<%=id %>">수정/삭제</a></td>
			</tr>
			<%} %>
		</table>
	</div>
</body>
</html>
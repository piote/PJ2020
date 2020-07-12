<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="csdit.PJ2020DAO,csdit.WRITERDTO" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="csdit.WRITERDTO">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>

<%
PJ2020DAO dbPro = PJ2020DAO.getInstance();

	dbPro.WRITERChange(dto,"i");

	response.sendRedirect("adminMain.jsp");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	
</body>
</html>
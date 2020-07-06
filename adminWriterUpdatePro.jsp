<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import='java.sql.*'%>
    
<%@page import="csdit.WRITERDTO, java.util.ArrayList, csdit.PJ2020DAO"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	
	WRITERDTO dto = new WRITERDTO(id, pwd, name);
	PJ2020DAO	dbPro = new PJ2020DAO();
	dbPro.WRITERChange(dto,"u");
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
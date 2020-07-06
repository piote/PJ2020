<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="csdit.PJ2020DAO"%>
<%@page import="csdit.BOARD_FDTO"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String num = request.getParameter("num");
	int numI = Integer.parseInt(num);
	BOARD_FDTO dto = new BOARD_FDTO();
	PJ2020DAO	dbPro = new PJ2020DAO();
	dto.setF_NUM(numI);
	dbPro.F_BOARD_Change(dto,"d");

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
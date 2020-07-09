<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	String ss=sf.format(new java.util.Date());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8"); //받아오는 값들을 한글로 인코딩합니다.

	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";
	String id = "MASTER";
	String pass = "1111";


	String U_ID = request.getParameter("U_ID"); //write.jsp에서 name에 입력한 데이터값
	String F_TITLE = request.getParameter("F_TITLE"); //write.jsp에서 title에 입력한 데이터값
	String F_CONTENT = request.getParameter("F_CONTENT"); //write.jsp에서F_CONTENT에 입력한 데이터값
	
	try {	
		Connection con = DriverManager.getConnection(url,id,pass);		
		String sql = "INSERT INTO board_f(F_NUM,F_TITLE,F_DATE,F_CONTENT,U_ID) VALUES(SEQ_ID.NEXTVAL,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, F_TITLE);
		pstmt.setString(2, ss);
		pstmt.setString(3, F_CONTENT);
		pstmt.setString(4, U_ID);
		
		pstmt.execute();
		pstmt.close();
		
		con.close();
} catch(SQLException e) {
	out.println( e.toString() );
	} 

%>


</body>
</html>
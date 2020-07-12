<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
	#areaMain{padding:10%; margin-left:10%; margin-right:10%;}
</style>
 <head>
 <title>게시판</title>
 </head>
 <body>
	<jsp:include page="top.jsp" flush="false"/>
	<section id="areaMain">
	<h2 class="text-center">자유 게시판</h2>
	
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@//localhost:1521/xepdb1";
	String id = "ANIMAL";
	String pass = "1111";
	int total = 0;
	
	try {
		Connection con = DriverManager.getConnection(url,id,pass);
		Statement stmt = con.createStatement();

		String sqlCount = "SELECT COUNT(*) FROM BOARD_F";
		ResultSet rs = stmt.executeQuery(sqlCount);
		
		if(rs.next()){
			total = rs.getInt(1);
		}
		rs.close();
		out.print("총 게시물 : " + total + "개");
		
		String sqlList = "SELECT F_NUM, U_ID, F_TITLE, F_DATE  from board_f order by F_NUM DESC";
		rs = stmt.executeQuery(sqlList);
		
%>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="4"><td width="4"></td></tr>
 <tr style="background:url('') repeat-x; text-align:center;">
   <td width="5"><img src="" width="4" height="30" /></td>
   <td width="73">번호</td>
   <td width="379">제목</td>
   <td width="73">작성자</td>
   <td width="164">작성일</td>  
   <td width="7"><img src="" width="4" height="30" /></td>
  </tr>
<%
	if(total==0) {
%>
	 		<tr align="center" bgcolor="#FFFFFF" height="30">
	 	   <td colspan="6">등록된 글이 없습니다.</td>
	 	  </tr>
<%
	 	} else {
	 		
		while(rs.next()) {
			int idx = rs.getInt(1);
			String U_ID = rs.getString(2);
			String F_TITLE = rs.getString(3);
			String F_DATE = rs.getString(4);					
%>
<tr height="25" align="center">
	<td>&nbsp;</td>
	<td><%=idx %></td>
	<td align="left"><%=F_TITLE %></td>
	<td align="center"><%=U_ID %></td>
	<td align="center"><%=F_DATE %></td>
	<td>&nbsp;</td>
</tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
<% 
		}
	} 
	rs.close();
	stmt.close();
	con.close();
} catch(SQLException e) {
	out.println( e.toString() );
}
%>
 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
 
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="center">
  	<td><a href="게시판.jsp" class="btn">글쓰기</a></td>
  </tr>
</table>
</section>
</body> 
</html>







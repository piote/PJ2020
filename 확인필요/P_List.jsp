<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="csdit.BOARD_PDTO, java.util.ArrayList, csdit.PJ2020DAO"%>
<%
	BOARD_PDTO dto = new BOARD_PDTO();
	PJ2020DAO	dbPro = new PJ2020DAO();
	ArrayList<BOARD_PDTO> dtos = dbPro.list_P(); 
%>
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
	<h2 class="text-center">포토 게시판</h2>
	
	<%
	  dto = dtos.get(0);
		int total = dto.getP_Total();
		out.print("총 게시물 : " + total + "개");
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
	 		
	 		for(int i=0; i<dtos.size(); i++){
				dto = dtos.get(i);
				int num = dto.getP_NUM();
				String title = dto.getP_TITLE();
				String date = dto.getP_DATE();
				String file = dto.getP_FILE();
				String writer = dto.getP_ID();					
%>
<tr height="25" align="center">
	<td>&nbsp;</td>
	<td><%=num %></td>
	<td align="left"><%=title %></a></td>
	<td align="left"><a href="P_BOARD.jsp?num=<%=num %>"><img src="http://localhost:8080/webPJ2020_1/uploadFiles/<%=file%>"></a></td>
	<td align="center"><%=writer %></td>
	<td align="center"><%=date %></td>
	<td>&nbsp;</td>
</tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
<% 
	 		}
	}
%>
 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
 
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="center">
  	<td><a href = "P_board_Form.jsp" class="btn">글쓰기</a></td>
  </tr>
</table>
</section>
</body> 

</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="csdit.BOARD_FDTO, java.util.ArrayList, csdit.PJ2020DAO"%>
<%
	BOARD_FDTO dto = new BOARD_FDTO();
	PJ2020DAO	dbPro = new PJ2020DAO();
	ArrayList<BOARD_FDTO> dtos = dbPro.list_F();
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
	<h2 class="text-center">자유 게시판</h2>
	
	<%
		int total = 0;
		if(dtos.size() != 0){
	  	dto = dtos.get(0);
			total = dto.getF_Total();
		}
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
				int num = dto.getF_NUM();
				String title = dto.getF_TITLE();
				String date = dto.getF_DATE();
				String content = dto.getF_CONTENT();
				String writer = dto.getU_ID();					
%>
<tr height="25" align="center">
	<td>&nbsp;</td>
	<td><%=num %></td>
	<td align="left"><a href="F_BOARD.jsp?num=<%=num %>"><%=title %></a></td>
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
  	<td><a href="게시판.jsp" class="btn">글쓰기</a></td>
  </tr>
</table>
</section>
</body> 
</html>







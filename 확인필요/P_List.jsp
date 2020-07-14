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
	.main_list {
    width: 1000px;
	}
	.list_start {
    text-align: left;
	}
	.list_detail {
    display: inline-block;
    width: 220px;
    height: 260px;
		border: 1px solid;
    margin-bottom: 5px;
	}
	.aText{
	 	color: black; /*글자 색변경*/
	}
	
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
	<div class="main_list">
		<div class="list_start">
		<%	 		
	 		for(int i=0; i<dtos.size(); i++){
				dto = dtos.get(i);
				int num = dto.getP_NUM();
				String title = dto.getP_TITLE();
				String date = dto.getP_DATE();
				String file = dto.getP_FILE();
				String writer = dto.getP_ID();					
%>	
			<div class="list_detail">
				<a class="aText" href="P_BOARD.jsp?num=<%=num %>">
					<img src="http://localhost:8080/webPJ2020_1/uploadFiles/<%=file%>" width="200" height="200"/>
					<%=title %><br>
					<%=writer %>
				</a>
			</div>
<% 
	 		}
%>	
			
		</div>
		<a  href = "P_board_Form.jsp" class="btn">글쓰기</a>
	</div>

</section>
</body> 

</html>



<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");

String id = null;

if(session.getAttribute("id") != null) {

	id = (String) session.getAttribute("id");

}
%>

<script language = "javascript">  // 자바 스크립트 시작

function writeCheck()
  {
   var form = document.writeform;
   
   if( !form.U_ID.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "이름을 적어주세요" ); // 경고창 띄움
    form.U_ID.focus();   // form 에 있는 name 위치로 이동
    return;
   }
   
  if( !form.F_TITLE.value )
   {
    alert( "제목을 적어주세요" );
    form.F_TITLE.focus();
    return;
   }
 
  if( !form.F_CONTENT.value )
   {
    alert( "내용을 적어주세요" );
    form.F_CONTENT.focus();
    return;
   }
 
  form.submit();
  }
 </script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
	#areaMain{padding:10%; margin-left:10%; margin-right:10%;}
</style>
 <head>
 <title>게시판</title>
 </head>
 <body>
 <jsp:include page="top.jsp"/>
 <section id="areaMain">

 <div class="container">
		<h2 class="text-center">자유 게시판</h2>

		<form name=writeform method=post action="게시판-1.jsp">
			<div class="form-group">
			제목 <input type="text" name="F_TITLE" class="form-control">
			</div>
			<div class="form-group">
			작성자 <input type="text" name="U_ID" class="form-control" value=<%=id %> readonly>
			</div>
			<div class="form-group">
			내용<textarea class="form-control" name="F_CONTENT" cols="50" rows="13"></textarea>
			</div>
			<div class="text-center">
				<input type=button value="등록" class="btn btn-primary" OnClick="javascript:writeCheck();">
				<input type=button value="취소" class="btn btn-primary" OnClick="javascript:history.back(-1)">
			</div>
			</form>
	</div>
	
 </section>
</body>
 </html>
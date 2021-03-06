<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd/HH:mm:ss");
	String ss=sf.format(new java.util.Date());
%>

<%
	request.setCharacterEncoding("utf-8");

	String id = null;

	if(session.getAttribute("id") == null) {//현제 있는 세션을 확인하여 로그인 되어있지 않으면 로그인 화면으로 이동
		%>
		<script>
		alert("로그인후 이용가능합니다.");
		location.href = "loginForm.jsp";
		</script>
		<%
	}else{
		id = (String) session.getAttribute("id");
	}
%>

<!DOCTYPE html>
<html>
<style>
	#areaMain{padding:10%; margin-left:10%; margin-right:10%;}
</style>
<script>
function writeCheck()
  {
   var form = document.writeform;
   
   if( !form.P_FILE.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "이미지파일이 없습니다" ); // 경고창 띄움
    form.P_FILE.focus();   // form 에 있는 name 위치로 이동
    return;
   }
   
  if( !form.P_TITLE.value )
   {
    alert( "제목을 적어주세요" );
    form.P_TITLE.focus();
    return;
   }
 
  form.submit();
  }
 </script>
<head>
	<meta charset="UTF-8">
	<title>포토 게시판</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<header>
		<jsp:include page="top.jsp" flush="false"/>
	</header>
	<section id = "areaMain">
	
	<br>
	<div class="container">
		<h2 class="text-center">포토 게시판</h2>
		
		<form name="writeform" action="P_board_Pro.jsp" method="post" enctype="multipart/form-data">
			<div class="form-group">
			작성자 <input type="text" name="P_ID" class="form-control" value=<%=id %> readonly>
			</div>
			
			<div class="form-group">
			제목 <input type="text" name="P_TITLE" class="form-control">
			</div>
			<div class="form-group">
			<label class="form-control"><%=ss %></label>
			</div>
			<input type="file" accept="image/*" name="P_FILE" class="btn btn-success"><br><br>
			<input type="button" value="업로드" class="btn bnt-primary" onclick="writeCheck()">
		</form>
	</div>
	</section>
</body>
</html>
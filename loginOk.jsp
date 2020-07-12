<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Cookie[] cookie =  request.getCookies();
	//String id = "";	

	//if(cookie != null){
		//for(int i=0; i<cookie.length; i++){
			//if(cookie[i].getName().equals("id")){
				//id = cookie[i].getValue();
			//}
		//}
	//} else
		//response.sendRedirect("loginForm.jsp");
	
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%=id %>님 로그인 하셨습니다.
</body>
</html>
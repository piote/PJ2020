<%@page import="csdit.PJ2020DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		PJ2020DAO dao = new PJ2020DAO();
		int check = dao.checkUser(id, pwd);
		if(dao.MASTER_Check(id)==true)
		{
			response.sendRedirect("adminMain.jsp");
			
		} else if(check == 1) {//관리자가 아님
			
			session.setAttribute("id", id);
			response.sendRedirect("main.jsp");
			
		} else if(check ==0){	//pwd 잘못 입력
%>
		<script>
		alert("비번을 잘못 입력하셨습니다. 다시 로그인 화면으로 이동합니다.");
		location.href = "loginForm.jsp";
		</script>
<%	} else {	//id pwd 없는 상태 ->사용자 등록
%>	
	<script>
		alert("없는 사용자 입니다. 회원가입화면으로 이동합니다.");
		location.href = "signUp.jsp";
	</script>
<%	}%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>

</body>
</html>
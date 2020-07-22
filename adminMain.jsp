<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 페이지</title>
</head>
<body>
	<section>
		<jsp:include page="adminWriter.jsp" flush="false"/>
	</section>
	<section>
		<jsp:include page="adminBoardF.jsp" flush="false"/>
	</section>
</body>
</html>
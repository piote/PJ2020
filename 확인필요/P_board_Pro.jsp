<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="csdit.BOARD_PDTO, csdit.PJ2020DAO"%>

<%
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd/HH:mm:ss");
	String ss=sf.format(new java.util.Date());
%>
<% 
	request.setCharacterEncoding("utf-8");
	
	String dir = application.getRealPath("/uploadFiles");

	int maxSize = 5*1024*1024;//파일사이즈
	
	String encType = "utf-8";
	
	File f = new File(dir);
	
	if(!f.exists())
		f.mkdir();
	
	//request
	//savedirectory
	//maxPostSize
	//encoding
	//fileRenamePolocy
	
	MultipartRequest multi = new MultipartRequest(request, dir, maxSize, encType, new DefaultFileRenamePolicy());
	
	String writer = multi.getParameter("writer");
	String title = multi.getParameter("title");
	String filename = multi.getFilesystemName("filename");
	String original = multi.getOriginalFileName("filename");
	
	String contype = multi.getContentType("filename");
	
	out.println("작성자: "+ writer + "<br>");
	out.println("제목: "+ title + "<br>");
	out.println("날짜: "+ ss + "<br>");
	out.println("파일명: "+ filename + "<br>");
	out.println(dir);
	
	// 서버 폴더에 파일을 업로드
	//----------------------
	
	BOARD_PDTO dto = new BOARD_PDTO();
	dto.setP_TITLE(title);
	dto.setP_DATE(ss);
	dto.setP_FILE(filename);
	PJ2020DAO	dbPro = new PJ2020DAO();
	dbPro.P_BOARD_Change(dto, "i");

	
%>
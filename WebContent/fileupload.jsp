<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%
	String uploadPath=request.getRealPath("/upload");
	int size = 10*1024*1024;
	String filename="";
	String origfilename="";
	String mime="";
	try{
		MultipartRequest multi=new MultipartRequest(request,
							uploadPath,
							size, 
							"UTF-8",
				new DefaultFileRenamePolicy());

		Enumeration files=multi.getFileNames();
		
		String file =(String)files.nextElement();
		filename=multi.getFilesystemName(file);
		origfilename= multi.getOriginalFileName(file);
		mime=multi.getContentType(file);
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<script>
	var file = new Object();
	file.filename="<%=filename%>";
	file.orgfilename="<%=origfilename%>";
	file.path="<%=uploadPath%>";
	file.mime="<%=mime%>";
	filearr.push(file);
	var fjson = JSON.stringify(file);
	out.print(fjson);
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
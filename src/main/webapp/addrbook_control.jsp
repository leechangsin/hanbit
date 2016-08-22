<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="addrbook.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="ab" scope="page" class="addrbook.AddrBean"/>
<jsp:useBean id="addrbook" class="addrbook.AddrBook"/>
<jsp:setProperty property="*" name="addrbook"/>
	<%
		String action = request.getParameter("action");
		if(action.equals("list")){
			
		}
		else if(action.equals("insert")){
			if(ab.insertDB(addrbook))
				response.sendRedirect("addrbook_control.jsp?action=list");
			else
				throw new Exception("DB 입력 오류");
		}
		else if(action.equals("edit")){
			
		}
		else if(action.equals("update")){
			
		}
		else if(action.equals("delete")){
			
		}
		else{
			
		}
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
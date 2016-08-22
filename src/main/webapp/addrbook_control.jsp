<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="addrbook.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="ad" scope="page" class="addrbook.AddrBean"/>
<jsp:useBean id="addrbook" class="addrbook.AddrBook">
	<jsp:setProperty property="*" name="addrbook"/>
</jsp:useBean>
	<%
		String action = request.getParameter("action");
	
		if(action.equals("list")){
			ArrayList<AddrBook> datas = ad.getDBList();
			request.setAttribute("datas", datas);
			pageContext.forward("addrbook_list.jsp");
		}
		else if(action.equals("insert")){
			if(ad.insertDB(addrbook))
				response.sendRedirect("addrbook_control.jsp?action=list");
			else
				throw new Exception("DB 입력 오류");
		}
		else if(action.equals("edit")){
			AddrBook abook = ad.getDB(addrbook.getAd_id());
			if(!request.getParameter("upasswd").equals("1234"))
				out.println("<script> alert('비밀번호가 틀렸습니다!'); history.go(-1); </script>");
			else{
				request.setAttribute("ad", abook);
				pageContext.forward("addrbook_edit_form.jsp");
			}
		}
		else if(action.equals("update")){
			
		}
		else if(action.equals("delete")){
			if(ad.deleteDB(addrbook.getAd_id())){
				response.sendRedirect("addrbook_control.jsp?action=list");
			}
			else
				throw new Exception("DB삭제 오류");
		}
		else{
			
		}
	%>
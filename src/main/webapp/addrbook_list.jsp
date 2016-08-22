<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="java.util.*, addrbook.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language=JavaScript>
	function check(ad_id) {
		pwd = prompt('수정/삭제 하려면 비밀번호를 넣으세요.');
		document.location.href = "addrbook_control.jsp?action=edit&ad_id=" + ad_id + "&upasswd=" + pwd;
	}
</script>
<title>주소록 : 목록화면</title>
</head>
<body>
	<jsp:useBean id="datas" scope="request" class="java.util.ArrayList"/>
	<div align="center">
		<h2>주소록 : 목록화면</h2>
		<hr>
		<form>
			<a href="addrbook_form.jsp">주소록 등록</a><p>
			
			<table border="1">
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>생일</th>
					<th>회사</th>
					<th>메모</th>
				</tr>
				<%
					for(AddrBook ab : (ArrayList<AddrBook>)datas){	
				%>
				<tr>
					<td><a href="javascript:check(<%=ab.getAd_id()%>)"><%=ab.getAd_id() %></a></td>
					<td><%=ab.getAd_name() %></td>
					<td><%=ab.getAd_tel() %></td>
					<td><%=ab.getAd_birth() %></td>
					<td><%=ab.getAd_comdept() %></td>
					<td><%=ab.getAd_memo() %></td>
				</tr>
				<% 
					}
				%>
			</table>
		</form>
	</div>
</body>
</html>
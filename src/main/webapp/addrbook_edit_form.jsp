<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="addrbook.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language=JavaScript>
	function delcheck(){
		result = confirm("정말로 삭제하시겠습니까?");
		
		if(result){
			document.form1.action.value="delete";
			document.form1.submit();
		}
		else{
			return;
		}
	}
</script>
<title>주소록 : 수정화면</title>
</head>
<body>
	<jsp:useBean id="ad" scope="request" class="addrbook.AddrBook"/>
	<div align="center">
		<h2>주소록 : 수정화면</h2>
		<hr>
		[<a href="addrbook_list.jsp">주소록 목록으로</a>]<p>
		<form name=form1 method=post action=addrbook_control.jsp>
		<input type="hidden" name="ad_id" value="<%=ad.getAd_id() %>">
		<input type=hidden name="action" value="update">
			<table border="1">
				<tr>
					<th>이름</th>
					<td><input type="text" name="ad_name" value="<%=ad.getAd_name() %>"></td>
				</tr>
				<tr>
					<th>email</th>
					<td><input type="text" name="ad_email" value="<%=ad.getAd_email() %>"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="ad_tel" value="<%=ad.getAd_tel() %>"></td>
				</tr>
				<tr>
					<th>생일</th>
					<td><input type="text" name="ad_birth" value="<%=ad.getAd_birth() %>"></td>
				</tr>
				<tr>
					<th>회사</th>
					<td><input type="text" name="ad_comdept" value="<%=ad.getAd_comdept() %>"></td>
				</tr>
				<tr>
					<th>메모</th>
					<td><input type="text" name="ad_memo" value="<%=ad.getAd_memo() %>"></td>
				</tr>
				<tr>
					<td colspan=2 align=center>
						<input type="submit" value="저장">
						<input type="reset" value="취소">
						<input type="button" value="삭제" onClick="delcheck()">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
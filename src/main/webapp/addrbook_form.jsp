<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소록 : 작성화면</title>
</head>
<body>
	<div align="center">
		<h2>주소록 : 작성화면</h2>
		<hr>
		[<a href=addrbook_list.jsp>주소록 목록으로</a>]<p>
		<form name=form1 method=post action=addrbook_control.jsp>
		<input type=hidden name="action" value="insert">
			<table border="1">
				<tr>
					<th>이름</th>
					<td><input type="text" name="ad_name" maxlength="15"></td>
				</tr>
				<tr>
					<th>email</th>
					<td><input type="text" name="ad_email" maxlength="50"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="ad_tel" maxlength="20"></td>
				</tr>
				<tr>
					<th>생일</th>
					<td><input type="date" name="ad_birth"></td>
				</tr>
				<tr>
					<th>회사</th>
					<td><input type="text" name="ad_comdept" maxlength="20"></td>
				</tr>
				<tr>
					<th>메모</th>
					<td><input type="text" name="ad_memo"></td>
				</tr>
				<tr>
					<td colspan=2 align=center>
						<input type="submit" value="저장">
						<input type=reset value="취소">
					</td>
			</table>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>������û �ý��� �α���</title>
<style>
	body{text-align:center;}
	h2{color:#0D2D84;}
	tr{
		height:40px;
	}
	tr:nth-child(even){background-color:#EAEAEA;}
</style>
</head>
<body>
	<%@include file="top.jsp" %>
	<h2>�α���</h2>
	<br>
	<table width="50%" align="center" bgcolor="#2060AA" cellspacing="0" cellpadding="0">
		<tr><td><div align="center" style="color:#ffffff;">���̵�� �н����带 �Է��ϼ���</div></td></tr>
	</table>
	<table width="50%" align="center" cellspacing="0" cellpadding="0">
		<form method="post" action="login_verify.jsp">
		<tr>
		<td><div align="center">���̵�</div></td>
		<td><div align="center"><input type="text" name="userID"></div></td>
		</tr>
		<tr>
		<td><div align="center">�н�����</div></td>
		<td><div align="center"><input type="password" name="userPassword"></div></td>
		</tr>
		<tr>
		<td colspan=2><div align="center">
		<input type="submit" name="Submit" value="�α���">
		<input type="reset" value="���"></div></td>
		</tr>
		</form>
	</table>
</body>
</html>

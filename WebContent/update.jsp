<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>������û ����� ����</title>
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
	<h2>����� ���� ����</h2>
	<%
	if(session_id != null){
		String dbdriver = "oracle.jdbc.driver.OracleDriver"; 
		String dburl = "jdbc:oracle:thin:@localhost:1521:orcl"; 
		String user = "db1714223";
		String passwd = "0917";
		Connection myConn = null;
		
		Class.forName(dbdriver);
		myConn=DriverManager.getConnection(dburl, user, passwd);
		
		Statement stmt = null;
		String mySQL = null;
		ResultSet rs = null;
		
		mySQL="select * from students where s_id='" + session.getAttribute("user") + "'";
		
		stmt = myConn.createStatement();
		rs = stmt.executeQuery(mySQL);
		
		String id = null, name = null, major = null;
		while(rs.next()){
			id = rs.getString("s_id");
			name = rs.getString("s_name");
			major = rs.getString("s_major");
		}%>
		<br>
		<table width="50%" align="center" bgcolor="#2060AA" cellspacing="0" cellpadding="0">
		<tr><td><div align="center" style="color:#ffffff;">������ ��й�ȣ�� �Է��� �ּ���</div></td></tr>
		</table>
		<table width="50%" align="center" cellspacing="0" cellpadding="0">
			<form method="post" action="update_verify.jsp">
				<tr>
				<td><div align="center">�й�(���̵�)</div></td>
				<td><div align="center"><%=id %></div></td>
				</tr>
				<tr>
				<td><div align="center">�н�����</div></td>
				<td><div align="center">
				<input type="password" name="userPassword">
				</div></td>
				</tr>
				<tr>
				<td><div align="center">�̸�</div></td>
				<td><div align="center"><%=name %></div></td>
				</tr>
				<tr>
				<td><div align="center">����</div></td>
				<td><div align="center"><%=major %></div></td>
				</tr>
				<tr>
				<td colspan=2 ><div align="center">
				<INPUT TYPE="SUBMIT" NAME="Submit" VALUE="�����ϱ�">
				<INPUT TYPE="RESET" VALUE="���"></div></td>
				</tr>
			</form>
		</table>
	</body>
<%
		rs.close();
		stmt.close();
		myConn.close();
	}
	else {
		%>
		<script>
			alert("�α��� �� �� ����ϼ���.");
			location.href="login.jsp";
		</script>
	<%}%>
</html>

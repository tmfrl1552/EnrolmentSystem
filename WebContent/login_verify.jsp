<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%
	String userID = request.getParameter("userID"); 
	String userPassword = request.getParameter("userPassword"); 
	
	Connection myConn = null;
	Statement stmt = null;
	String mySQL = null;
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db1714223"; 
	String passwd = "0917";
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	
	Class.forName(dbdriver); 
	myConn=DriverManager.getConnection(dburl, user, passwd); 
	
	stmt = myConn.createStatement();
	mySQL = "select s_id from students where s_id='"+userID+"' and s_pwd='"+userPassword+"'";
	ResultSet rs = stmt.executeQuery(mySQL);
	if(rs.next()){
		session.setAttribute("user", userID);
		response.sendRedirect("main.jsp");
	}else {
		%>
		<script>
			alert("����� ���̵� Ȥ�� ��ȣ�� Ʋ�Ƚ��ϴ�.");
			location.href="login.jsp";
		</script>
	<%}
	stmt.close();
	myConn.close();
%>

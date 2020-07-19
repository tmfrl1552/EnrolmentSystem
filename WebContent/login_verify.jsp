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
	String user = "db_id";
	String passwd = "db_pw";
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
			alert("사용자 아이디 혹은 암호가 틀렸습니다.");
			location.href="login.jsp";
		</script>
	<%}
	stmt.close();
	myConn.close();
%>

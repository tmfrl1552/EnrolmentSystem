<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������û �Է�</title>
<style>
	table{border: 1px solid #D5D5D5; border-collapse: collapse;}
	th,td{border: 1px solid #D5D5D5;}
	tr{height:40px;}
	#insert_btn a{color:#8C8C8C; text-decoration:none;}
	#insert_btn a:hover{color:#0D2D84; font-weight:bold;}
	#table_head{background-color:#2060AA; color:#ffffff;}
	table tr:nth-child(odd){background-color:#EAEAEA;}
</style>
</head>
<body>
	<%@ include file="top.jsp" %>
	<% if (session.getAttribute("user")==null){%>
		<script>
			alert("�α��� �� �� ����ϼ���.");
			location.href="login.jsp";
		</script>
	<%} %>
	<table width="80%" align="center">
	<br><br>
	<tr id="table_head"><th>�����ȣ</th><th>�й�</th><th>�����</th><th>������</th><th>���ǽð�</th><th>���</th><th>����</th><th>�����ο�</th><th>������û</th></tr>
	<%
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
	
	String c_id = null;
	String c_id_no = null;
	String c_name = null;
	String p_name = null;
	String t_time = null;
	String t_place = null;
	int c_unit = 0;
	int tmax = 0;
	int e_count = 0;
	
	Calendar cal = Calendar.getInstance();
	int nyear = cal.get(Calendar.YEAR);
    int nmonth = cal.get(Calendar.MONTH)+1; 
    String semester;
    if(nmonth>=1 && nmonth<=4){
    	semester = "1�б�";
    }else if(nmonth>=5 && nmonth<=10){
    	semester = "2�б�";
    }else{
    	nyear++;
    	semester = "1�б�";
    }
	
	stmt = myConn.createStatement();
	mySQL = "select i.c_id, i.c_id_no, i.c_name, i.p_name, i.t_time, i.t_place, i.c_unit, i.tmax, ec.count from enroll_count ec, insertview i where i.c_id=ec.c_id(+) and i.c_id_no=ec.c_id_no(+) and i.c_id not in (select c_id from enroll where s_id='"+session.getAttribute("user")+"' and e_year='"+nyear+"' and e_semester='"+semester+"') order by i.c_id";
	rs = stmt.executeQuery(mySQL);
	
	if (rs != null) {
		while (rs.next()) {
			c_id = rs.getString("c_id");
			c_id_no = rs.getString("c_id_no");
			c_name = rs.getString("c_name");
			p_name = rs.getString("p_name");
			t_time = rs.getString("t_time");
			t_place = rs.getString("t_place");
			c_unit = rs.getInt("c_unit");
			tmax = rs.getInt("tmax");
			e_count = rs.getInt("count");%>
			<tr>
			<td align="center"><%= c_id %></td> <td align="center"><%= c_id_no %></td>
			<td align="center"><%= c_name %></td> <td align="center"><%= p_name %></td>
			<td align="center"><%= t_time %></td> <td align="center"><%= t_place %></td>
			<td align="center"><%= c_unit %></td><td align="center"><%=e_count%>/<%= tmax %></td>
			<td id="insert_btn" align="center"><a href="insert_verify.jsp?c_id=<%= c_id %>&c_id_no=<%=c_id_no %>">��û</a></td>
			</tr>
		<%}
	}
	stmt.close(); 
	myConn.close();
	%>
	</table>
</body>
</html>


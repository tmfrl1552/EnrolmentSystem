<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% String session_id = (String)session.getAttribute("user");
String log;
if(session_id ==null)
log="<a href=login.jsp>�α���</a>";
else log="<a href=logout.jsp>�α׾ƿ�</a>";%>
<style>
	.title{text-align:center;}
	img{width:45px; height:45px; vertical-align:middle;}
	h2{color:#0D2D84; text-align:center; display:inline-block; vertical-align:middle;}
	ul{
	    list-style: none;
	    line-height:1;
		width: 100%;
	    background-color: #0D2D84;
	    text-align: center;
	}
	ul li{
	    display: inline-block;
	    margin: 0;
	}
	ul a{
		color:#ffffff; 
		text-decoration:none; 
		padding: 15px 25px;
	    margin: 0;
		display:block; 
		height:100%;
	}
	ul a:hover{color:#0D2D84; background-color:#ffffff;}
</style>
<body>
	<div class="title">
		<img src="sym01_s.gif"/>
		<h2>�����ڴ��б� ������û������</h2>
	</div>
	<ul>
		<li><b><%=log%></b></li>
		<li><b><a href="update.jsp">����� ���� ����</a></b></li>
		<li><b><a href="insert.jsp">������û �Է�</a></b></li>
		<li><b><a href="delete.jsp">������û ����</a></b></li>
		<li><b><a href="select.jsp">������û ��ȸ</a></b></li>
	</ul>
</body>
    
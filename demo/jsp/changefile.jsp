<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%@page pageEncoding="UTF-8"%>
<%
	String name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8");
	String email=new String(request.getParameter("email").getBytes("ISO-8859-1"),"utf-8");
	String phone=new String(request.getParameter("phone").getBytes("ISO-8859-1"),"utf-8");
	String address=new String(request.getParameter("address").getBytes("ISO-8859-1"),"utf-8");
	String userpassword=new String(request.getParameter("userpassword").getBytes("ISO-8859-1"),"utf-8");
	String sql="UPDATE members SET Member_Name = '"+name+"',Member_Password = '"+userpassword+"',Member_Email = '"+email+"',Member_Tel = '"+phone+"',Member_Address = '"+address+"' WHERE Member_Username='"+session.getAttribute("userid")+"';";
	con.createStatement().execute(sql);
	 
		session.removeAttribute("userid");
		out.print("<script>alert('更改成功!!請重新登錄!!'); window.location='index.jsp' </script>");
	 



%>
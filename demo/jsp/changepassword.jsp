<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%@page pageEncoding="UTF-8"%>
<%
	String userid=new String(request.getParameter("userid").getBytes("ISO-8859-1"),"utf-8");
	String phoneoremail=new String(request.getParameter("phoneoremail").getBytes("ISO-8859-1"),"utf-8");
	//String phone=new String(request.getParameter("phone").getBytes("ISO-8859-1"),"utf-8");
	String password=new String(request.getParameter("userpassword").getBytes("ISO-8859-1"),"utf-8");
	String password2=new String(request.getParameter("password2").getBytes("ISO-8859-1"),"utf-8");
	String sql="select * from `members`";
	ResultSet rs=con.createStatement().executeQuery(sql);
	rs.next();
	String user=rs.getString("Member_Username");
	String userphone=rs.getString("Member_Email");
	String useremail=rs.getString("Member_Tel");
	if(!password.equals(password2))
	{
		out.print("<script>alert('更改失敗!!再次輸入密碼錯誤!!'); window.location='password.jsp' </script>");
	}
	else
	{
		if(userid.equals(user)&&phoneoremail.equals(userphone)||phoneoremail.equals(useremail))
	{
		sql="UPDATE members SET Member_Password = '"+password+"' WHERE Member_Username='"+userid+"';";
	con.createStatement().execute(sql);
		session.removeAttribute("userid");
		out.print("<script>alert('更改成功!!'); window.location='index.jsp' </script>");
	}
	else
	{
		out.print("<script>alert('更改失敗!!使用者姓名或電話信箱不存在!!'); window.location='password.jsp' </script>");
	}
	}



%>
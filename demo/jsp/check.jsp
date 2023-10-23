<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>

<%

if(request.getParameter("userid")!= null && request.getParameter("userpassword")!= null)
	{
	 request.setCharacterEncoding("utf-8");
	 String managerid = new String(request.getParameter("userid").getBytes("ISO-8859-1"),"utf-8");
	 String managerpwd = request.getParameter("userpassword");

	 if( managerid.equals ("nong") &&  managerpwd.equals ("12345"))
	 {
	  out.print("<script>alert('管理員登入'); window.location='manager.jsp' </script>");
	 }
 	else
 	 {
 
	    String sql ="select * from members where Member_Username=? AND Member_Password=?";
		 PreparedStatement prst = null;
		 prst = con.prepareStatement(sql);
		 prst.setString(1,request.getParameter("userid"));
		 prst.setString(2,request.getParameter("userpassword"));
		 ResultSet paperrs = prst.executeQuery();
		 session.removeAttribute("userid");
	 
		 if(paperrs.next())
		 {
		  session.setAttribute("userid",managerid);
		  out.print("<script>alert('登入成功!!')</script>");
		  response.setHeader("refresh","0;URL=index.jsp") ;
		 }
	 
		 else{
		  out.println("<script>alert('帳號密碼錯誤')");
		  out.println("window.history.back();");
		   out.println("</script>");
		 }

 
	 }
	}

%>
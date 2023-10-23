<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<%
try{
	if(session.getAttribute("userid")==null)
	{	
		
		out.println("<script>alert('您尚未登入')</script>");
		out.println("<script>window.history.back();</script>");
	}
	else
	{
		request.setCharacterEncoding("UTF-8");
		String Member_Username=(String)session.getAttribute("userid");
		String Product_Id=(String)session.getAttribute("Product_Id");
		String comtext=request.getParameter("content");
		String heart=request.getParameter("rating");
		java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
		String sql="insert comment(Member_Username,Product_Id,textcom,heart,new_date) values('"+Member_Username+"',";
		sql+="'"+Product_Id+"',";
		sql+="'"+comtext+"',";
		sql+="'"+heart+"',";
		sql+="'"+new_date+"')";
		con.createStatement().execute(sql);	
		out.println("<script>alert('評論新增成功!')</script>");
		//response.sendRedirect("lookshop.jsp?p_no="+Product_Id);
		out.println("<script>window.history.back();</script>");
		//out.print("<meta http-equiv="refresh"content="1;url=lookshop.jsp?p_no=rs.getInt("Product_Id")">");
	}
}
catch(SQLException s)
{
	out.print(s.toString());
}
	
%>



<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<%

try{
	//int quantity=Integer.parseInt(request.getParameter("quantity"));
	if(session.getAttribute("userid")==null)
	{	
		
		out.println("<script>alert('您尚未登入')</script>");
		out.println("<script>window.history.back();</script>");
	}
}
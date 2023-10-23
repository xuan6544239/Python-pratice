<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@page pageEncoding="UTF-8"%>
<%
session.removeAttribute("userid");
out.print("<script>alert('登出成功!')</script>");
response.setHeader("refresh","0;URL=index.jsp") ;
%>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%@page pageEncoding="UTF-8"%>
<%
try{
	request.setCharacterEncoding("UTF-8");
	String sql = "DELETE FROM shoppingcar WHERE Product_Id='" +request.getParameter("Product_Id")+"'";
    con.createStatement().execute(sql);
	
    out.print("<script>");
    out.print("alert('刪除成功')");
    out.print("</script>");
	response.setHeader("refresh","0;URL=cart.jsp") ;
}
catch(Exception e)
{
	out.print(e.toString());
	
}%>
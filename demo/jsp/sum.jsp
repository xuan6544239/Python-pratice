<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<%
	try
	{
		request.setCharacterEncoding("UTF-8");
		String pay_way=request.getParameter("pay_way");
		String ship_way=request.getParameter("ship_way");
		String sql="INSERT orders(pay_way,ship_way) VALUES('"+pay_way+"',";
		sql+="'"+ship_way+"')";
		con.createStatement().execute(sql);
		
		String sql2 = "SELECT order_Id FROM orders";
		PreparedStatement pstmt=null;
    pstmt=con.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE, 
    ResultSet.CONCUR_UPDATABLE);
    ResultSet rs2=pstmt.executeQuery(sql2);

		//ResultSet rs2=con.createStatement().executeQuery(sql2);

		rs2.last();
		int num=rs2.getRow();
		int Inventory=0;
		String MU=(String)session.getAttribute("userid");
		String sql4 = "SELECT * FROM shoppingcar WHERE(Member_Username='"+MU+"')";
		
		ResultSet rs4=con.createStatement().executeQuery(sql4);
		while(rs4.next())
		{
			String sql3 = "INSERT order_detail(order_Id,Member_Username,Product_Id,order_Quantity) VALUES('"+num+"','"+MU+"','"+rs4.getString("Product_Id")+"','"+rs4.getString("Car_Quantity")+"')";
			con.createStatement().execute(sql3);
			String sql6= "SELECT * FROM product where Product_Id='"+rs4.getString("Product_Id")+"'";			
			ResultSet rs6=con.createStatement().executeQuery(sql6);
			while(rs6.next())
			{
				Inventory = rs6.getInt("Product_Inventory")-rs4.getInt("Car_Quantity");
			} 
			String sql7="update product set Product_Inventory='"+Inventory+"' where Product_Id='"+rs4.getString("Product_Id")+"'" ;
			con.createStatement().execute(sql7);                      		
		}
		String sql5 = "DELETE FROM shoppingcar WHERE (Member_Username='"+MU+"')";
		con.createStatement().execute(sql5);
		out.print("<script>");
		out.print("alert('結帳成功')");
		out.print("</script>");
		response.setHeader("refresh","0;URL=index.jsp");
	}
	catch(SQLException s)
	{
		out.print(s.toString());
	}
%>
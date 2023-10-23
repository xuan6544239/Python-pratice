<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<%

try{
	int quantity=Integer.parseInt(request.getParameter("quantity"));
	//int quan=quantity;
	if(session.getAttribute("userid")==null)
	{	
		
		out.println("<script>alert('您尚未登入')</script>");
		out.println("<script>window.history.back();</script>");
	}
	else if(quantity==0)
	{
		out.println("<script>alert('請選擇數量!')</script>");
		out.println("<script>window.history.back();</script>");
	}
	else
	{
		request.setCharacterEncoding("UTF-8");
		String Product_Id=request.getParameter("prid");
		String sql="select * from product where Product_Id='"+Product_Id+"'";
		ResultSet rs=con.createStatement().executeQuery(sql);
		int left=0;
		while(rs.next())
		{
			left=Integer.parseInt(rs.getString("Product_Inventory"));
		}

		if(left>=quantity)
		{	
			String Member_Username=(String)session.getAttribute("userid");
			request.setCharacterEncoding("UTF-8");

			String sql2="select * from shoppingcar where Member_Username='"+Member_Username+"'";
			ResultSet rs2=con.createStatement().executeQuery(sql2);
			int p1=0,p2=0;
			String exsist="";
			String exsist2="";
			//shopcar=rs2.getString(Product_Id);
			while(rs2.next())
			{
				exsist=rs2.getString("Product_Id");
				exsist2=rs2.getString("Product_Id2");
				if(exsist != null && !exsist.equals("") && !exsist.equals("null"))
				p1=rs2.getInt("Car_Quantity");
				if(exsist2 != null && !exsist2.equals("") && !exsist2.equals("null"))
				p2=rs2.getInt("Car_Quantity2");
			}
//out.print(sql2);
//out.close();
			if(exsist.equals(Product_Id))
			{
				p1+=quantity;
				sql="UPDATE shoppingcar Set Car_Quantity='"+p1+"'"+" where Product_Id='"+Product_Id+"'";
				con.createStatement().execute(sql);				
				out.print("<script>alert('已更新購物車!')</script>"); 
				out.println("<script>window.history.back();</script>");
			}
			else
			{
				

					
						//}
						
						sql="insert shoppingcar(Product_Id,Member_Username,Car_Quantity) values('"+Product_Id+"',";
						sql+="'"+Member_Username+"',";
						sql+="'"+quantity+"')";
						con.createStatement().execute(sql);				
						out.print("<script>alert('成功加入購物車!')</script>"); 
						out.println("<script>window.history.back();</script>");
					//}
				}
				
			
		}
		else
		{
			request.setCharacterEncoding("UTF-8");
			out.print("<script>alert('庫存不足')</script>");
			out.println("<script>window.history.back();</script>");
		}
	}	
}
	

catch(SQLException s)
{
	out.print(s.toString());
}
	
%>
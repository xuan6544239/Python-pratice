<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%@page pageEncoding="utf-8"%>
<%

		   request.setCharacterEncoding("utf-8"); 
    	   String Product_Id=request.getParameter("Product_Id");
	       String Product_Code=request.getParameter("Product_Code");
		   String Product_brand=request.getParameter("Product_brand");
		   String Product_Name=request.getParameter("Product_Name");
		   String Product_FM=request.getParameter("Product_FM");
		   String Product_Price=request.getParameter("Product_Price");
		   String Product_Inventory=request.getParameter("Product_Inventory");	
		   String Product_Note=request.getParameter("Product_Note");
		  
		   ResultSet rs;
		   
		   if(Product_Code=="" || Product_brand=="" || Product_Name=="" || Product_FM=="" || Product_Price=="" || Product_Inventory=="" || Product_Note=="")
		   {		   
				out.print("<script>alert('請輸入完整!!')</script>");
			    response.setHeader("refresh","0;URL=editmanager.jsp") ;
		   }
		  
		   else
		   {

			String sql = "DELETE FROM product WHERE Product_Id= '"+Product_Id+"'";
			con.createStatement().execute(sql);
			sql = "INSERT INTO product(Product_Id,Product_Code,Product_brand,Product_Name,Product_FM,Product_Price,Product_Inventory,Product_Note)";
			sql+="value ('"+ Product_Id +"',";
			sql+="'"+ Product_Code +"',";
			sql+="'"+ Product_brand +"',";
			sql+="'"+ Product_Name +"',";
			sql+="'"+ Product_FM +"',";
			sql+="'"+ Product_Price +"',";
			sql+="'"+ Product_Inventory +"',";
			sql+="'"+ Product_Note +"')";
		    con.createStatement().execute(sql);
			
			out.print("<script>");
    		out.print("alert('編輯成功')");
    		out.print("</script>");
			   response.setHeader("refresh","0;URL=editmanager.jsp") ;

			   
		   }
		   
			
					
		   


%>
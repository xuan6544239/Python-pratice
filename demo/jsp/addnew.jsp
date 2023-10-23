<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%

try {
    Class.forName("com.mysql.jdbc.Driver");
    try {	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";;
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed()){
           out.println("連線建立失敗");
		}
        else {
        	con.createStatement().execute("use db");
        	//ResultSet rs3;
			String sql3="select Product_Id from  product ";
			PreparedStatement pstmt=null;
           pstmt=con.prepareStatement(sql3,ResultSet.TYPE_SCROLL_SENSITIVE, 
                        ResultSet.CONCUR_UPDATABLE);
           ResultSet rs3=pstmt.executeQuery();
			//rs3 = con.createStatement().executeQuery(sql3);
			rs3.last();
			int num=rs3.getRow();
			num=num+1;
           request.setCharacterEncoding("utf-8");
           
		   String Product_Code=request.getParameter("Product_Code");
		   String Product_FM=request.getParameter("Product_FM");
		   String Product_brand=request.getParameter("Product_brand");
			 String Product_Picture=request.getParameter("Product_Picture");
           String Product_Name=request.getParameter("Product_Name");
	    String Product_Price=request.getParameter("Product_Price");
		   String Product_Inventory=request.getParameter("Product_Inventory");
		   String Product_Note=request.getParameter("Product_Note");
		  
		   Integer index = 0;
		   
		   ResultSet rs;
		  
			sql="SELECT * From product WHERE Product_Code='"+Product_Code+"'";
			rs = con.createStatement().executeQuery(sql);
			if(rs.next())
			{
				out.print("<script>alert('新增失敗!!!商品重複!!!'); window.location='addmanager.jsp' </script>");
			}
			else if(Product_Code==""||Product_FM==""||Product_Picture==""||Product_brand==""||Product_Name==""||Product_Price==""||Product_Inventory==""||Product_Note=="")
			{
				out.print("<script>alert('新增失敗!!!商品填寫不完整!!!'); window.location='addmanager.jsp' </script>");
			}
			else
			{
				sql = "insert product(Product_Id, Product_Code, Product_FM, Product_brand, Product_Name, Product_Price, Product_Inventory, Product_Note) values('"+num+"','"+Product_Code+"','"+Product_FM+"','"+Product_brand+"','"+Product_Name+"','"+Product_Price+"','"+Product_Inventory+"','"+Product_Note+"')";
				con.createStatement().execute(sql);		
				session.setAttribute("Product_Id",request.getParameter("Product_Id"));
				out.print("<script>alert('新增成功!!'); window.location='addmanager.jsp' </script>");
			
			}
			
		   }
		   
	}
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
			
					
%>
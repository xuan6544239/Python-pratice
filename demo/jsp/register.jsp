<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@page pageEncoding="utf-8"%>

<%

try {
    Class.forName("com.mysql.jdbc.Driver");
    try {	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed()){
           out.println("連線建立失敗");
		}
        else 
		{
      request.setCharacterEncoding("utf-8");
      con.createStatement().execute("use `db`");
      String name=request.getParameter("name");
	    String email=request.getParameter("email");
		   String phone=request.getParameter("phone");
		   String address=request.getParameter("address");
		   String userpassword=request.getParameter("user");
		   String userid=request.getParameter("userid");
		   String user2=request.getParameter("user2");
		   Integer index = 0;		   
		   ResultSet rs;
		   if(name=="" || phone=="" ||  userid==""|| userpassword==""||user2=="")
     		{     
      	 	out.print("<script>alert('註冊失敗!!!會員資料尚未填寫完全'); javascript:location.href=`addaccount.jsp` </script>");
     		} 
			else
			{
		  		if(!user2.equals(userpassword))
		  		{
			  		out.print("<script>alert('註冊失敗!!!再次輸入密碼錯誤'); javascript:location.href=`addaccount.jsp` </script>");
		  		}
		  		else
		  		{
						boolean res=phone.startsWith("09");
						int length=phone.length();
						int res2=email.indexOf("@");
						if(res==false)
						{
							out.print("<script>alert('註冊失敗!!!手機號碼格式錯誤!'); javascript:location.href=`addaccount.jsp` </script>");
						}
						else if(length<10)
						{
							out.print("<script>alert('註冊失敗!!!手機號碼長度不符!請輸入十個數字!'); javascript:location.href=`addaccount.jsp` </script>");
						}
						else if(res2<=-1)
						{
							out.print("<script>alert('註冊失敗!!!電子郵件格式錯誤!'); javascript:location.href=`addaccount.jsp` </script>");
						}
						else
						{
							sql="SELECT * From members WHERE Member_Username='"+userid+"'";
							rs = con.createStatement().executeQuery(sql);
							if(rs.next())
							{
								out.print("<script>alert('註冊失敗!!!帳號重複'); javascript:location.href=`register.jsp` </script>");
							}
							else
							{
								sql = "insert members(Member_Name,Member_Username,Member_Password,Member_Email,Member_Tel,Member_Address) values('"+name+"','"+userid+"','"+userpassword+"','"+email+"','"+phone+"','"+address+"')";
								con.createStatement().execute(sql);		
								session.setAttribute("userid",request.getParameter("userid"));
								response.setHeader("refresh","0;URL=register_ok.jsp") ;
							}
					
					}
				}
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
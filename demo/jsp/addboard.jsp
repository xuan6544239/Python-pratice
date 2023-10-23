<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>add</title>
</head>
<body>
<%!
  String newline(String str)
  {
    int index=0;
    while((index=str.indexOf("\n"))!=-1)
    str=str.substring(0,index)+"<br>"+str.substring(index+1);
    return(str);
  }
%>
<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    try {	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
           if(session.getAttribute("userid")==null)
	         {	
		         out.println("<script>alert('您尚未登入')</script>");
		         out.println("<script>window.history.back();</script>");
	         }
	         else
            {
               request.setCharacterEncoding("utf-8");
               con.createStatement().execute("use `db`");
               String name=request.getParameter("name");
	            String email=request.getParameter("mail");
		         String phone=request.getParameter("phone");
		         String subject=request.getParameter("subject");
               String contenttest=request.getParameter("content");
               if(name=="" || phone=="" ||  email==""|| subject==""||contenttest=="")
     		      {     
      	 	      out.print("<script>alert('送出失敗!!!資料尚未填寫完全'); javascript:location.href=`aboutus.jsp` </script>");
     		      } 
			      else
			      {
				      boolean res=phone.startsWith("09");
				      int length=phone.length();
				      int res2=email.indexOf("@");
				      if(res==false)
				      {
					      out.print("<script>alert('送出失敗!!!手機號碼格式錯誤!'); javascript:location.href=`aboutus.jsp` </script>");
						}
						else if(length<10)
						{
							out.print("<script>alert('送出失敗!!!手機號碼長度不符!請輸入十個數字!'); javascript:location.href=`aboutus.jsp` </script>");
						}
						else if(res2<=-1)
						{
							out.print("<script>alert('送出失敗!!!電子郵件格式錯誤!'); javascript:location.href=`aboutus.jsp` </script>");
						}
						else
						{
                     out.println("<script>alert('訊息送出成功!感謝您的回饋!')</script>");
                     sql="use db";
                     con.createStatement().execute(sql);
                     String new_name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
                     String new_phone=request.getParameter("phone");
                     String new_mail=request.getParameter("mail");
                     String new_subject=new String(request.getParameter("subject").getBytes("ISO-8859-1"),"UTF-8");
                     String content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
                     String new_content=newline(content);
                     java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());

                     sql="INSERT guestbook (`GBname`,`Phone`,`Mail`, `Subject`, `Content`, `Putdate`) ";
                     sql+="VALUES ('" + new_name + "', ";
                     sql+="'"+new_phone+"', ";
                     sql+="'"+new_mail+"', ";
                     sql+="'"+new_subject+"', ";
                     sql+="'"+new_content+"', ";   
                     sql+="'"+new_date+"')";      

		               out.println("<script>window.history.back();</script>");
                     con.createStatement().execute(sql);
                     con.close();

                     //response.sendRedirect("aboutus.jsp");
                  }
               }
            }
         }   
      }  
         catch (SQLException sExec)
         {
         out.println("SQL錯誤"+sExec.toString());
         }
   }
   catch (ClassNotFoundException err) 
   {
   out.println("class錯誤"+err.toString());
   }
   %>
</body>
</html>

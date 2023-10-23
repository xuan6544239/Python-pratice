<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; chars2et=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta chars2et="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>後台管理|留言查詢</title>
    <link rel="stylesheet" type="text/css" href="../assets/css/manger.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/index.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/footer.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    
</head>
<%!
String newline(String str)
{
    int index=0;
    while((index=str.indexOf("\n"))!=-1)
    str=str.substring(0,index)+"<br>"+str.substring(index+1);
    return(str);
}
%>
<!--Header開始-->
	<div class="stay-top">
	    <ul class="shipping">
			<li>
          <a href="#" onclick="showDialog();" class="right-line A" >SIGN IN</a>
      </li> 
		<li>

            <a href="logout.jsp" class="cart">
            <img src="../assets/images/signout.png"></a>
        </li></ul>
		
	<header class="main-header">
	    <div class="container">
		    <a href="manager.jsp" class="logo"><img src="../assets/images/logo.jpg"></a>
		        <ul class="main-nav">
		    <li>
			    <a href="addmanager.jsp" class="main-nav-a"><img src="../assets/images/plus.jpg" alt="新增圖示">新增商品</a>
	     	    <div class="aboutus">
			</li>
		    <li>
		        <a href="editmanager.jsp" class="inner main-nav-a sh"><img src="../assets/images/edit.png" alt="編輯圖示">編輯商品</a>
			    <div class="editt">
            </li>
            <li>
		        <a href="#" class="inner main-nav-a sh"><img src="../assets/images/inquire.png" alt="查詢圖示">查詢一覽</a>
			    <ul class="inquire">
                <li><a href="inquiremanager.jsp">訂單查詢</a></li>
				<li><a href="messagemanager.jsp">留言查詢</a></li>
		    </ul></li>
		    <li>
				<a href="deletemanager.jsp" class="inner2 main-nav-a"><img src="../assets/images/delete.png" alt="刪除圖示">刪除商品</a>  
            </li>
	    </div>
    </header>
</div>	
<!--Header結束-->
<!--登入介面彈跳的部分開始-->

<div onclick="closescr();" class="dialog" id="dialog">
        <div class="close"><a href="#" onclick="closeDialog();"><img src="assets/images/cross.png"></a></div>
        <div class="frama">
        <div class="login">
            <form class="form" action="check.jsp" method="POST"> 
            <h2>會員登入</h2>
            <div class="group">
                <label for="user-id">帳號</label>
                <input type="textmodal" placeholder="&ensp;Email / 使用者名稱" onKeyUp="value=value.replace(/[\W]/g,'')" name="userid" id="userid" maxlength="10">
            </div>
            <div class="group">
                <label for="user-password">密碼</label>
				<input type="password" placeholder="&ensp;輸入密碼" onKeyUp="value=value.replace(/[\W]/g,'')" name="userpassword" id="userpassword" maxlength="10">
            </div>
            <div class="btn-group">
                <button class="btn" type="submit">登入</button>
				<button class="btn" onclick="window.open('password.jsp')">忘記密碼</button>
            </div>
            <div class="btn-group1">
                <button class="btn2" onclick="window.open('addaccount.jsp')" >沒有帳號 ? 點擊註冊</button>
            </div>
                </form>
            </div>     
        </div>
    </div>

<script>
var dialog,dialog1;
	window.onload=function(){
		dialog=document.getElementById("dialog");
	};
	function showDialog(){
		dialog.style.display="block";
	};
	function closeDialog(){
		dialog.style.display="none";
	};
</script>
<!--登入介面彈跳的部分結束-->
<!--留言查詢開始-->
<div class="col-xl-14">
    <div class="trade">
        <div class="tradetitle">留言查詢</div>
        <div class="trademain">
            <div class="trade1">
            <ul>
                <li>留言內容</li>
            </ul>
            
        <form>
                <input type="search" name="product" size="5">
                <input type="button" value="搜尋">   	        
        </form>
        </div>
            <div class="trade2">
            
                <%
           String sql2="USE `db`";
           con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, 
           ResultSet.CONCUR_UPDATABLE).execute(sql2);

		   sql2="SELECT COUNT(*) FROM `guestbook`";
           PreparedStatement pstmt=null;
           pstmt=con.prepareStatement(sql2,ResultSet.TYPE_SCROLL_SENSITIVE, 
           ResultSet.CONCUR_UPDATABLE);
           ResultSet rs2=pstmt.executeQuery();

           rs2.next();
		   int total_content=rs2.getInt(1);
		   out.println("共"+total_content+"筆留言<p>");
           
           int page_num=(int)Math.ceil((double)total_content/10.0); //十筆換頁
           out.println("請選擇頁數");
           for(int i=1;i<=page_num;i++)
			   out.print("<a href='messagemanager'.jsp?page="+i+"'>"+i+"</a>&nbsp;"); 
           %>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <%
          
           String page_string = request.getParameter("page");
           if (page_string == null) 
               page_string = "0";          
           int current_page=Integer.valueOf(page_string);
           if(current_page==0) 
	          current_page=1;

           int start_record=(current_page-1)*10;
           sql2="SELECT * FROM `guestbook` ORDER BY `GBNO` DESC LIMIT ";
           sql2+=start_record+",10";
            if(current_page!=1)
            {
                out.print("<a href='messagemanager.jsp?page=1'>第一頁</a>");
            }
            if(current_page>1)
            {
                out.print("<a href='messagemanager.jsp?page="+(current_page-1)+"'>"+"上一頁</a>");
            }                   
            out.println("共"+page_num+"頁，目前在第"+current_page+"頁");
            if(current_page<page_num)
            {
                out.print("<a href='messagemanager.jsp?page="+(current_page+1)+"'>"+"下一頁</a>,<a href='messagemanager.jsp?page="+page_num+"'>"+"最後一頁"+"</a></p>");
            }       
            out.println("<form name='f' action='messagemanager.jsp' method='get'>跳至<input type='text' size='3' name='page' value='1'>頁<input type='submit' value='送出'></form>");              

            out.println("<hr>");%>

  <table>
                <tr>
                <th><u>姓名</u></th>
                <th><u>電話</u></th>
                <th><u>電子信箱</u></th>
                <th><u>主旨</u></th>
                <th><u>告訴我們</u></th>
                </tr>
                <%
           rs2=con.createStatement().executeQuery(sql2);

           while(rs2.next())
                {
                    
                String newcont=newline(rs2.getString(5));%>
                <tr>
                <td style="width: 90px;"><%out.println(rs2.getString(2)+"<br>");%></td>
                <td style="width: 160px;"><%out.println(rs2.getString(2)+"<br>");%></td>
                <td style="width: 200px;"><%out.println(rs2.getString(2)+"<br>");%></td>
                <td style="width: 90px;"><%out.println(rs2.getString(2)+"<br>");%></td>
                <td style="width: 400px;"><%out.println(rs2.getString(2)+"<br>");%></td>
                </tr> 
                <%}%>                
                </table>
            </div>
        </div>
    </div>
    </div>

<br><br><br>
<!--留言查詢結束-->
	    <%
			String sql="select * from  counter ";
			ResultSet rs =con.createStatement().executeQuery(sql);
			int x=1;	
				
				while(rs.next()){
				    x=rs.getInt("People_Number");
					
				}
			if(session.isNew())

			{
			x++;//計數器加1
			}

			sql="update counter set People_Number="+x ;
			con.createStatement().execute(sql);
		%>


<!--置頂開始-->
<div class="updiv">
	<a href="#top"><img src="assets/images/up.png" class="uppic"></a>
</div> 
<!--置頂結束-->
</body>
</html>
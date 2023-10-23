<!DOCTYPE html>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<html lang="en">
    <head>
    <meta charset="UTF-8">
    <title>會員中心|交易紀錄</title>
    <link rel="stylesheet" type="text/css" href="../assets/css/index.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/member.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/share.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/footer.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    
</head>
    <body>
    <div class="stay-top">
	    <ul class="shipping">
			<li>
                <a href="#" onclick="showDialog();" class="right-line A" >SIGN IN</a>
            </li> 
		<li>
		<a href="usercar.jsp" class="cart">
			<img src="../assets/images/shopcart.png"></a>
		</li>
        </ul>
		
	<header class="main-header">
	    <div class="container">
		    <a href="../index.jsp" class="logo">
			    <img src="../assets/images/logo.jpg"></a>
		        <ul class="main-nav">
		    <li>
			    <a href="#" class="main-nav-a"><img src="../assets/images/team.jpg" alt="團隊圖示">關於我們</a>
	     	    <ul class="aboutus">
		        <li><a href=".html">品牌優勢</a></li>
				<li><a href=".html">組員介紹</a></li>
			</ul>
            </li>
		    <li>
		        <a href="#" class="inner main-nav-a sh"><img src="../assets/images/shop.png" alt="提袋圖示">商品一覽</a>
			    <ul class="shop">
                <li><a href="item.jsp">所有商品</a></li>
	    		<li><a href=".html">蔬菜</a></li>
		    	<li><a href=".html">水果</a></li>
     	    	<li><a href=".html">乳製品</a></li>
		    </ul></li>
		    <li>
		        <% if(session.getAttribute("userid")==null) {
			%>
                <a href="member.jsp" class="inner2 main-nav-a" onclick="window.alert('請先登入!!')"><img src="../assets/images/member.jpg" alt="會員圖示">會員中心</a>  
                <%}%>
		    </li>
		    <li>
		        <a href="#" class="main-nav-a"><img src="../assets/images/qa.jpg" alt="Q＆A圖示">常見問題 Q&A</a>
			</li></ul>
	    </div>
    </header>
    
            

        <% if(session.getAttribute("userid")==null) {
			%>
        
         <div class="opp" id="navright">
           
            <!--<button  class="dropbtn" onclick="showDialog();"><img src="../assets/img/login.png" class="user"></button>
            <button  class="dropbtn" onclick="window.alert('請先登入!!')"><img src="../assets/img/wishlist.png" class="user"></button>
            <button  class="dropbtn" onclick="window.alert('請先登入!!')')"><img src="../assets/img/cart.png" class="user"></button>-->
        </div>
        
        <%} else{%>
         <div class="opp" id="navright">
           <!--
            <a href="member.jsp"><button  class="dropbtn"><img src="../assets/img/login.png" class="user"></button></a>
			<a href="wish.jsp"><button  class="dropbtn"><img src="../assets/img/wishlist.png" class="user"></button></a>
			<a href="usercar.jsp"><button  class="dropbtn"><img src="../assets/img/cart.png" class="user"></button></a>-->
        </div>
        
        <% } %>
        </div>
        
        <!--頂部固定部分結束-->

 <!--側邊導覽列開始-->
    <div class="membertop">
        <h1>會員中心</h1>
    </div>
    <div class="col">
        <div class="row margintop">
            <div class="col-xl-3">
                <div class="list-group">
                
        <div class="member-top">
            <h1><br>會員中心</h1>
        </div>
         <div class="member1">
         <div class="mm"></div>
            <div class="member2">
            <%ResultSet rs;%>	
                <div class="member-title">&nbsp;&nbsp;會員資料</div>
                <div>
            <%
			String sql = "select * from members where Member_Username='"+session.getAttribute("userid")+"';";
			 rs = con.createStatement().executeQuery(sql);
			 while(rs.next()){
			%>    	
                    <label class=ll>會員帳號:<%=rs.getString(2)%></label>
                    <label class=ll>會員密碼:<%=rs.getString(3)%></label>
                    <label class=ll>會員姓名:<%=rs.getString(1)%></label>
                    <label class=ll>會員手機:<%=rs.getString(5)%></label>
                    <label class=ll>會員信箱:<%=rs.getString(4)%></label>
                    <label class=ll>會員住址:<%=rs.getString(6)%></label>
            <%}%>        
                </div>
            </div>
            <div class="kk"></div>
            <div class="member3">
                <div class="member-title">&nbsp;&nbsp;修改會員資料</div>
               <div class="newmember">
                    <form action="../changefile.jsp" method="post">
                    <input class="tt" type="text" name="userpassword" id="userpassword" placeholder="&nbsp;新會員密碼:" >
                   <input class="tt" type="text" name="name" id="name" placeholder="&nbsp;新會員名稱:" >
                    <input class="tt" type="text" name="phone" id="phone" placeholder="&nbsp;新會員手機:" >
                     <input class="tt" type="text" name="email" id="email" placeholder="&nbsp;新會員信箱:" >
                   <input class="tt" type="text" name="address" id="address" placeholder="&nbsp;新會員住址:" >
                     <button class="nomal1" type="submit">修改資料</button>
					</form>
				</div>

                <div class="member-title">&nbsp;&nbsp;其他功能資料</div>
                <div class="member-connect">
                 
                <button class="nomal" type="text" onclick="location.href='comment.jsp'">查詢評論紀錄</button>
                 <button class="nomal" type="text" onclick="location.href='trade.jsp'">查詢交易紀錄</button>
               	<a href="../logout.jsp"><button class="spec" type="text" >登出</button></a>
            </div>
            </div>
            <div class="mm"></div>
            </div>
<%
	String sql="select * from  counter ";
	ResultSet rs =con.createStatement().executeQuery(sql);
	int x=0;
	while(rs.next())
	{
  	x=rs.getInt("People_Number");
	}
	session.setAttribute("count",x);
	if(session.isNew())
		{
			x++;  
		}
	sql="update counter set People_Number='"+x+"'" ;
	con.createStatement().execute(sql);
	%>

        <footer>
	<br>
	<div class="footertext">
	<div class="footercontainer">
	<div class="footer">
		<p>La via campesina</p>
        &nbsp;&nbsp;網站瀏覽人數:&nbsp;<%out.print(x);%></p>
		<p><img src="../assets/images/time.png" alt="時間">&nbsp;&nbsp;&nbsp;服務時間：周一至周五 A.M 8:00~ P.M 6:00</p>
		<p><img src="../assets/images/tele.png" alt="電話">&nbsp;&nbsp;&nbsp;	電話：(02)2860-7594</p>
		<p><img src="../assets/images/address.png" alt="地址">&nbsp;&nbsp;&nbsp;	地址：32023 桃園市中壢區中北路二OO號</p>
			
			<div class="col-md-4 column">
				<a href="https://www.facebook.com/%E4%B8%AD%E5%8E%9F%E5%A4%A7%E5%AD%B8-206886352670936/" target="_blank"><img src="../assets/images/fb.png" width="50px" ></a>
				<a href="mailto:gina19991008@gmail.com" target="_blank"><img src="../assets/images/mail.png" width="50px"></a>
				<a href="https://instagram.com/cycuim?igshid=chxfa2lzqi7g" target="blank"><img src="../assets/images/insta.png" width="50px"></div></a>
		
		
		</div>
		</div>
	</div>
</footer>
            </body>
        </html>
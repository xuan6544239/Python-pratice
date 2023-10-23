<!DOCTYPE html>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>會員中心|評論紀錄</title>
    <link rel="stylesheet" type="text/css" href="../assets/css/index.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/member.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/share.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/footer.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
   
</head>
<body>
<!--Header開始-->
	<div class="stay-top">
	    <ul class="shipping">
			<li>
					<a href="#" onclick="showDialog();" class="right-line A" >SIGN IN</a>
            </li> 
		<li>
		<% if(session.getAttribute("userid")==null) {
					%>
		<a href="#" onclick="window.alert('請先登入!!')"class="cart">
			<img src="../assets/images/shopcart.png"></a>
				<a href="#"onclick="window.alert('請先登入!!')" class="cart">
				<img src="../assets/images/signout.png"></a>
				<%}
				else{%>
					<a href="cart.jsp"class="cart">
					<img src="../assets/images/shopcart.png"></a>
					<a href="logout.jsp" class="cart">
					<img src="../assets/images/signout.png"></a>
				<%}%>
		</li></ul>
		
	<header class="main-header">
	    <div class="container">
		    <a href="index.jsp" class="logo">
			    <img src="../assets/images/logo.jpg"></a>
		        <ul class="main-nav">
		    <li>
			    <a href="#" class="main-nav-a"><img src="../assets/images/team.jpg" alt="團隊圖示">關於我們</a>
	     	    <ul class="aboutus">
		        <li><a href="advantage.jsp">品牌理念</a></li>
				<li><a href="aboutus.jsp">組員介紹</a></li>
			</ul></li>
		    <li>
		        <a href="#" class="inner main-nav-a sh"><img src="../assets/images/shop.png" alt="提袋圖示">商品一覽</a>
			    <ul class="shop">
                <li><a href="allshop.jsp?classify=all">所有商品</a></li>
	    		<li><a href="allshop.jsp?classify=veg">蔬菜</a></li>
		    	<li><a href="allshop.jsp?classify=fru">水果</a></li>
     	    	<li><a href="allshop.jsp?classify=mil">乳製品</a></li>
		    </ul></li>
		    <li>
					<% if(session.getAttribute("userid")==null) {
					%>
					<a href="#" onclick="window.alert('請先登入!!')" class="inner2 main-nav-a"><img src="../assets/images/member.jpg" alt="會員圖示">會員中心</a>     
					<%}
					else
					{%>
						
						<a href="editmember.jsp"  class="inner2 main-nav-a"><img src="../assets/images/member.jpg" alt="會員圖示">會員中心</a>
					<%}
					%>
		    </li>
		    <li>
		        <a href="qanda.jsp" class="main-nav-a"><img src="../assets/images/qa.jpg" alt="Q＆A圖示">常見問題 Q&A</a>
			</li></ul>
	    </div>
    </header>
</div>	
<!--Header結束-->
<!--登入介面彈跳的部分開始-->

<div onclick="closescr();" class="dialog" id="dialog">
        <div class="close"><a href="#" onclick="closeDialog();"><img src="../assets/images/cross.png"></a></div>
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
    <!--側邊導覽列開始-->
    <div class="membertop">
        <h1>會員中心</h1>
    </div>
    <div class="col">
        <div class="row margintop">
            <div class="col-xl-3">
                <div class="list-group">
                    <a class="list-group-item list-group-item-action barfont" href="trade.jsp">查詢交易紀錄</a>
                    <a class="list-group-item list-group-item-action active barfont" href="comment.jsp">查詢評論紀錄</a>
                    <a class="list-group-item list-group-item-action barfont" href="editmember.jsp">修改會員資料</a>
                </div>
            </div>
            <!--側邊導覽列結束-->
<!--評論紀錄開始-->
    <div class="col-xl-8" >
    <h1 style="color: #45807d; margin-right: 700px; margin-bottom: -50px;">評論紀錄</h1><hr style="border-width: 2.5px;border-color: #438d81;">
        <div class="comment">
        <table>
        <tr>
            <th style="width:25%">圖片</th>
            <th style="width:25%">商品</th>
            <th style="width:25%">評分</th>
            <th style="width:25%">評論</th>
        </tr>
        <%
        	String Member_Username=(String)session.getAttribute("userid");
        	String sql="select * from  product,comment where (product.Product_Id=comment.Product_Id) and Member_Username='"+Member_Username+"'";
        	ResultSet rs=con.createStatement().executeQuery(sql);
					
        	while(rs.next())
        	{
						String text=rs.getString("textcom");
						if(text.equals("null"))
						text="無";
        %>            
                    <tr>

                        <td><a href="lookshop.jsp?p_no=<%out.print(rs.getString("Product_Id"));%>"><img  class="comimg" src="../assets/images/<%out.print(rs.getString("Product_Code"));%>.jpg"></a></td>
                        <td width="14%" align="center"><%out.print(rs.getString("Product_brand"));%><%out.print(rs.getString("Product_Name"));%></td>
                        <td width="14%" align="center">
                        <%
                        int heart=rs.getInt("heart");

                        	switch (heart)
                        	{
                        		case 1 :
                        		out.print("♥");
                        		break;
                        		case 2 :
                        		out.print("♥♥");
                        		break;
                        		case 3 :
                        		out.print("♥♥♥");
                        		break;
                        		case 4 :
                        		out.print("♥♥♥♥");
                        		break;
                        		case 5 :
                        		out.print("♥♥♥♥♥");
                        		break;
                        	}%> 
                        </td>
                        <td width="14%" align="center" style="border-right: 0;"><%out.print(text);%></td>                                                 
                    </tr>
                    
   		<%}%>
                            
                </table>
</div>
</div> 
<!--評論紀錄結束-->
   <%
			String sql2="select * from  counter ";
			ResultSet rs2 =con.createStatement().executeQuery(sql2);
			int x=1;	
				
				while(rs2.next()){
				    x=rs2.getInt("People_Number");
					
				}
			if(session.isNew())

			{
			x++;//計數器加1
			}

			sql2="update counter set People_Number="+x ;
			con.createStatement().execute(sql2);
		%>

<!--footer開始-->
<footer style="margin-top: 1500px;">
    <p class="amount">網站瀏覽人數：&nbsp;<%out.print(x);%></p>
    <p></p>
    <p>+886-987987987&nbsp;|&nbsp;<a href="mailto:Laviacampesina@gmail.com">Laviacampesina@gmail.com</a></p>
    <p>© 2020 by TzuYen,TzuYing,YaXuan,MinJie,MangCheong</p>
</footer>
<!--footer結束-->
<!--置頂開始-->
<div class="updiv">
	<a href="#top"><img src="../assets/images/up.png" class="uppic"></a>
</div> 
<!--置頂結束-->
</body>
</html>
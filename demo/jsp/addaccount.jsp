<!DOCTYPE html>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<html lang="en">
<head>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>註冊會員</title>
    <link rel="stylesheet" type="text/css" href="../assets/css/index.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/member.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/footer1.css">
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
		        <a href="qanda.jsp"class="main-nav-a"><img src="../assets/images/qa.jpg" alt="Q＆A圖示">常見問題 Q&A</a>
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

<!-- 會員資料編輯 -->
    <div class="box">
		<div class="login2">
        <form class="form2" action="register.jsp" method="post">
		<p><b>註冊會員</b></p>
        <div class="group2">
			<label for="user-id">會員帳號(必填)</label>
            <input type="text" name="userid" id="userid" placeholder="&ensp;請輸您的會員帳號" onKeyUp="value=value.replace(/[\W]/g,'')" maxlength="10"required>
		</div>
		<div class="group2">
            <label for="user-password">會員密碼(必填)</label>
            <input type="text" name="user" id="userpassword" placeholder="&ensp;請輸入您的會員密碼" onKeyUp="value=value.replace(/[\W]/g,'')" maxlength="10"required>
        </div>
        <div class="group2">
            <label for="user-password2">確認密碼(必填)</label>
            <input type="text" name="user2" id="userpassword2" placeholder="&ensp;請再次輸入您的會員密碼" onKeyUp="value=value.replace(/[\W]/g,'')" maxlength="10"required>
		</div>
		<div class="group2">
			<label for="user-name">名字(必填)</label>
            <input type="text" name="name" id="username" placeholder="&ensp;請輸入您的名字" maxlength="10"required>
		</div>
		<div class="group2">
		    <label for="user-phone">手機號碼(必填)</label>
			<input type="text" name="phone" id="userphone" placeholder="&ensp;請輸入您的手機號碼" pattern="09\d{2}\-?\d{3}\-?\d{3}" onKeyUp="value=value.replace(/[\W]/g,'')" maxlength="10"required>
		</div>
		<div class="group2">
			<label for="user-mail">電子郵件</label>
			<input type="text" name="email" id="useremail" placeholder="&ensp;請輸入您的電子郵件" maxlength="40">
		</div>
		<div class="group2">
			<label for="user-adress">地址</label>
			<input type="text" name="address" id="useradress" placeholder="&ensp;請輸入您的地址" onKeyUp="value=value.replace(/[\W]/g,'')" maxlength="10">
		</div>
		<div class="btn-group2">
			<button class="btn1">重設</button>
			<button class="btn1">儲存</button>
		</div>

		</form>
		</div>     
    </div>
		<br><br>
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
	
<!--footer開始-->
<footer>
    <br>
        <p class="amount">網站瀏覽人數：<%out.print(x);%></p>
        <p></p>
        <p>+886-987987987&nbsp;|&nbsp;
            <a href ="mailto:Laviacampesina@gmail.com">Laviacampesina@gmail.com</a></p>
            <br>
        <p>© 2020 by TzuYen, TzuYing,YaXuan,MinJie,MangCheong</p>
</footer>
<!--footer結束-->

<!--置頂開始-->
<div class="updiv">
	<a href="#top"><img src="../assets/images/up.png" class="uppic"></a>
</div> 
<!--置頂結束-->
</body>
</html>
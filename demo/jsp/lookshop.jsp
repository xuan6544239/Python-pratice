<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品一覽|所有商品</title>
    <link rel="stylesheet" type="text/css" href="../assets/css/allshop.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/cart.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/footer.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/index.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
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
<!--側邊欄位-->
 <div class="stayleft">
    <input type="checkbox" name="" id="sideswitch">
    <div class="sidemenu">
    <form action="item.jsp">
			<input type="hidden" name="classify" value="search">
			<input type="text" placeholder="請輸入關鍵字" name="searchin">
			<button type="submit"><i class="fa fa-search"></i></button>
			</form>
    <nav>
        <ul>
            <li class="title"><u>蔬菜人氣王</u></li>
            <%	
							ResultSet rs4;
							String sql4="select * from  product where Product_brand='蔬菜';";
							rs4 = con.createStatement().executeQuery(sql4);
							while(rs4.next())
				 			{
						%>						
								<li><a href="lookshop.jsp?p_no=<%out.print(rs4.getString("Product_Id"));%>"><i class="fa fa-cutlery" aria-hidden="true"></i><%out.print(rs4.getString("Product_Name"));%></a></li>						
						<%}%>
            <!--<li><a href=".html"><i class="fa fa-cutlery" aria-hidden="true"></i>a菜</a></li>
            <li><a href=".html"><i class="fa fa-cutlery" aria-hidden="true"></i>b菜</a></li>
            <li><a href=".html"><i class="fa fa-cutlery" aria-hidden="true"></i>c菜</a></li>
            <li><a href=".html"><i class="fa fa-cutlery" aria-hidden="true"></i>d菜</a></li>-->
        </ul>
        <ul>
            <li class="title"><u>水果人氣王</u></li>
            <%	
							sql4="select * from  product where Product_brand='水果';";
							rs4 = con.createStatement().executeQuery(sql4);
							while(rs4.next())
				 			{
						%>						
								<li><a href="lookshop.jsp?p_no=<%out.print(rs4.getString("Product_Id"));%>"><i class="fa fa-cutlery" aria-hidden="true"></i><%out.print(rs4.getString("Product_Name"));%></a></li>						
						<%}%>
            <!--<li><a href=".html"><i class="fas fa-apple-alt" aria-hidden="true"></i>a果</a></li>
            <li><a href=".html"><i class="fas fa-apple-alt" aria-hidden="true"></i>b果</a></li>
            <li><a href=".html"><i class="fas fa-apple-alt" aria-hidden="true"></i>c果</a></li>
            <li><a href=".html"><i class="fas fa-apple-alt" aria-hidden="true"></i>d果</a></li>-->
        </ul>
        <ul>
            <li class="title"><u>乳製品人氣王</u></li>
            <%	
							sql4="select * from  product where Product_brand='乳製品';";
							rs4 = con.createStatement().executeQuery(sql4);
							while(rs4.next())
				 			{
						%>						
								<li><a href="lookshop.jsp?p_no=<%out.print(rs4.getString("Product_Id"));%>"><i class="fa fa-cutlery" aria-hidden="true"></i><%out.print(rs4.getString("Product_Name"));%></a></li>						
						<%}%>
            <!--<li><a href=".html"><i class="fas fa-cow" aria-hidden="true"></i>a乳</a></li>
            <li><a href=".html"><i class="fas fa-cow" aria-hidden="true"></i>b乳</a></li>
            <li><a href=".html"><i class="fas fa-cow" aria-hidden="true"></i>c乳</a></li>
            <li><a href=".html"><i class="fas fa-cow" aria-hidden="true"></i>d乳</a></li>-->
        </ul>
    </nav>
    <label for="sideswitch">
        <i class="fa fa-chevron-right" aria-hidden="true"></i>
    </label>
    </div>
</div>
<!--側邊欄位結束-->
<div class="lookshop">
    <div class="image">
    <%	
			String p_no=request.getParameter("p_no");
			session.setAttribute("Product_Id",request.getParameter("p_no"));
			String sql = "select * from product where Product_Id = '"+p_no+"'";
             PreparedStatement pstmt=null;
            pstmt=con.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE, 
            ResultSet.CONCUR_UPDATABLE);
            ResultSet rs=pstmt.executeQuery();
			while(rs.next()){%>  
            
    <img src="../assets/images/<%out.print(rs.getString("Product_Code"));%>.jpg">
    </div>
            <div class="introduce">
                <div class="introducetitle">
                <p class="a1"><%out.print(rs.getString("Product_brand"));%>&nbsp;&nbsp;<%out.print(rs.getString("Product_Name"));%></p>
                <p class="a2">NT$&nbsp;<%=rs.getString("Product_Price")%></p>
                </div>
                <div class="introducecontent">
                <h4>商品簡介：</h4>
                <p class="b1"><%=rs.getString("Product_Note")%></p>
                <div class="delivery">
                <img src="../assets/images/transport.png">
                <p class="c1"><b>取貨方式：</b></p>
                 <p class="c2">店取 ,宅配</p>
                 </div>
    <div class="paymethod">
        <img src="../assets/images/payment.png">
        <p class="d1"><b>付款方式：</b></p>
        <p class="d2">貨到付款 ,信用卡 ,轉帳</p>
    </div>
    </div>
    <div class="introducebuy">
        <div class="order">
        <p class="e1">購買數量</p>
        <form id="myform" method="get" action="cartcheck.jsp" style="display: flex; margin-top:-47px; margin-left: 90px;">
        <label for="pl"></label>
        <input type="button" value="-" class="plminus" field="quantity"/>
        <input type="text" name="quantity" value="0" class="pl"/>
        <input type="button" value="+" class="plplus" field="quantity"/>
        <input type="hidden" name="prid" value="<%=rs.getString("Product_Id")%>">
        <input type="submit" class="shippingcar" value="加入購物車">
        <!--<a href="#" class="shippingcar">加入購物車</a>-->
        <a href="cartcheck.jsp?quantity=1&prid=<%out.print(rs.getInt("Product_Id"));%>" class="buynow">立即購買</a>
        </form>
        <div class="stock"><p>庫存：<%out.print(rs.getInt("Product_Inventory"));%></p></div>
        <%}%>
    
<script>
    $(function() {
    $(".plplus").click(function(e) {
    e.preventDefault();
    fieldName = $(this).attr("field");
    var currentVal = parseInt($("input[name=" + fieldName + "]").val());
    if (!isNaN(currentVal)) {
    $("input[name=" + fieldName + "]").val(currentVal + 1);
    } else 
    {
    $("input[name=" + fieldName + "]").val(0);
    }
    });
    $(".plminus").click(function(e) 
    {
    e.preventDefault();
    fieldName = $(this).attr("field");
    var currentVal = parseInt($("input[name=" + fieldName + "]").val());
    if (!isNaN(currentVal) && currentVal > 0) {
    $("input[name=" + fieldName + "]").val(currentVal - 1);
    } else 
    {
    $("input[name=" + fieldName + "]").val(0);
    }
    });
    });
</script>
</div>
        
          
    </div>
    </div>
</div>
<!--查看商品結束-->
<!--評論開始-->
<br>
<div class="com">
    <font id="com">評論區</font>
</div>
<br>
<!---評論A開始-->
<div class="container-fluid mt-10">
<div class="row">
<%

    //String sql3 = "SELECT comment.comid,members.Member_Name,comment.Member_Username,comment.Product_Id,comment.textcom,comment.heart,comment.new_date FROM comment,members where members.Member_Username=comment.Member_Username and Product_Id = '"+request.getParameter("Product_Id")+"' ORDER BY comment.comid DESC";
    //String s=request.getParameter("Product_Id");
//test
    String sql5="select * from comment where Product_Id = '"+request.getParameter("p_no")+"' ORDER BY comment.comid DESC";
    ResultSet rs5=con.createStatement().executeQuery(sql5);
    
    //test
    //ResultSet rs3 = con.createStatement().executeQuery(sql3);
    while(rs5.next()){
    %>
    <br/>
<div class="comshow">
  <div class="comshow1  col-6">
    <img src="../assets/images/girl.png" class="compic">

    <ul class="comuserid">
        <li><%out.print(rs5.getString("Member_Username"));%></li>
        <!--<li><%out.print(rs5.getString("Product_Id"));%></li>-->
    </ul>
    <p class="time"><%out.print(rs5.getString("new_date"));%></p>
    <div class="comtext">
        <h4>COMMENT</h4>
        <p><%out.print(rs5.getString("textcom"));%></p>
    </div>
</div>
<div class="ratingshow col-4">
  
  <font class="showstar">
    <%
    int heart=rs5.getInt("heart");

      switch (heart)
      {
        case 1 :
        out.print("♥️");
        break;
        case 2 :
        out.print("♥️♥️");
        break;
        case 3 :
        out.print("♥️♥️♥️");
        break;
        case 4 :
        out.print("♥️♥️♥️♥️");
        break;
        case 5 :
        out.print("♥️♥️♥️♥️♥️");
        break;
      }%> 
  </font>
  
  </div> 

</div>

</div>
<!---右邊星星-->
  
<%}%>
</div>
   <%
           String sql2="USE `db`";
           con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, 
           ResultSet.CONCUR_UPDATABLE).execute(sql2);

		   sql2="SELECT COUNT(*) FROM `comment`where Product_Id = '"+p_no+"'";
           PreparedStatement pstmt2=null;
           pstmt2=con.prepareStatement(sql2,ResultSet.TYPE_SCROLL_SENSITIVE, 
           ResultSet.CONCUR_UPDATABLE);
           ResultSet rs2=pstmt2.executeQuery();

           rs2.next();
		   int total_content=rs2.getInt(1);
		   out.println("<br>&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共"+total_content+"筆留言<p>");
            out.println("<br>");%>
     </div>

<!--<div>
    <div class="ratingshow">
        <font class="showstar1">♥️</font>
        <font class="showstar1">♥️</font>
        <font class="showstar1">♥️</font>
        <font class="showstar2">♥️</font>
        <font class="showstar2">♥️</font> 
        </div>
    </div>
</div>-->
<!--評論A結束-->
   <br>
<div class="writecom">
    <font style="font-size: 25px;">填寫評論</font>
</div>
<br>
<form action="com.jsp" method="POST">
<div class="starcom">
    <div class="star1">
    <textarea  name="content"  maxlength="150" required oninvalid="setCustomValidity('請輸入評論');" oninput="setCustomValidity('');" style="resize:none;width:85%;height:120px;border:0px solid #806945;"></textarea>

    <ul id="star" style="margin-right: -100px;">
        <li><input type="radio" name="rating" value="1">♥</li>
        <li><input type="radio" name="rating" value="2">♥</li>
        <li><input type="radio" name="rating" value="3">♥</li>
        <li><input type="radio" name="rating" value="4">♥</li>
        <li><input type="radio" name="rating" value="5">♥</li>
    </ul>
    <div style="display:inline-block;margin-left:15px">
        <div id="star_word"></div>
    </div>
    
    <script>
    window.onload = function(){
      var star = document.getElementById("star");
      var star_li = star.getElementsByTagName("li");
      var star_word = document.getElementById("star_word");
      var i=0;
      var j=0;
      var len = star_li.length;
      var word = ['1','2','3',"4","5"]
        for(i=0; i<len; i++){
        star_li[i].index = i;                  
        star_li[i].onmouseover = function(){
        star_word.style.display = "block";
        star_word.innerHTML = word[this.index]+" / 5 ";
        for(i=0; i<len; i++){
        if(i<=this.index)
        {
            star_li[i].className = "act";	
        }
        else
        {
            star_li[i].className = "";
        }
        }
        }
        }
    }
    </script>
    <br>

    <div class="rat">
        <button class="ratbtn">送出評論</button>
    </div>
</div>
</form>
<div class="star3"></div>
</div>
</div>

<br>
<%
	String sql9="select * from  counter ";
	ResultSet rs9 =con.createStatement().executeQuery(sql9);
	int x=0;
	while(rs9.next())
	{
  	x=rs9.getInt("People_Number");
	}
	session.setAttribute("count",x);
	if(session.isNew())
		{
			x++;  
		}
	sql9="update counter set People_Number='"+x+"'" ;
	con.createStatement().execute(sql9);
	%>
<!--footer開始-->
<footer>
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
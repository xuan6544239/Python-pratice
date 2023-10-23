<!DOCTYPE html>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>購物車|確認訂單</title>
    <link rel="stylesheet" type="text/css" href="../assets/css/cart.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/index.css">
    <link rel="stylesheet" type="text/css" href="assets/css/allshop.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/footer.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
   
</head>
<body background="../assets/images/.png"> 
 
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
<!--購物車開始-->
  
    <div class="col-xl-11  margintop">
    <h1 class="title1"><img src="../assets/images/cart.png" alt="購物車">購物車</h1>
    <hr class="hr1">
    </div>
    <div class="div1">
    <p class="shh">訂單商品</p>
    <p class="pr">價格</p>
    <p class="co">數量</p>
    <p class="to">總計</p>
    <p class="op">操作</p>
    </div>
    <br>
    <div class="div2">
    <%
		String Member_Username=(String)session.getAttribute("userid");
		String sql = "select * from shoppingcar,product where Member_Username ='"+Member_Username+"' and (shoppingcar.Product_Id=product.Product_Id)";
		ResultSet rs = con.createStatement().executeQuery(sql);

		while(rs.next()){
		%>
      <p class="shp"><img src="../assets/images/<%out.print(rs.getString("Product_Code"));%>.jpg" class="photoframa" alt="<%out.print(rs.getString("Product_Name"));%>"></p>
      <p class="tit"><%=rs.getString("Product_Name")%></p>
      <p class="prr"><%=rs.getString("Product_Price")%></p>

    <form id="myform" method="POST" action="#" style="margin-top:95px; margin-left: -150px;">
    <label for="pl"></label>
    <%
    String pro=rs.getString("Product_Id");
    //int product=int.parseInt(pro);
    //if(rs.getString("Product_Id").equals(pro))
    %>
    <input type="button" name="btn" value="-" class="plminus" field="Car_Quantity"/>
    <input type="text" name="Car_Quantity" value="<%out.print(rs.getString("Car_Quantity"));%>" class="pl"/>
    <input type="button" name="btn"value="+" class="plplus" field="Car_Quantity"/>
    </form>
<script>
　 $(function() {
  $(".plplus").click(function(e) {
    e.preventDefault();
    fieldName = $(this).attr("field");
    var currentVal = parseInt($("input[name=" + fieldName + "]").val());
    if (!isNaN(currentVal)) {
      $("input[name=" + fieldName + "]").val(currentVal + 1);
    } else {
      $("input[name=" + fieldName + "]").val(0);
    }
  });
  $(".plminus").click(function(e) {
    e.preventDefault();
    fieldName = $(this).attr("field");
    var currentVal = parseInt($("input[name=" + fieldName + "]").val());
    if (!isNaN(currentVal) && currentVal > 0) {
      $("input[name=" + fieldName + "]").val(currentVal - 1);
    } else {
      $("input[name=" + fieldName + "]").val(0);
    }
  });
});
</script>
  
    <p class="tot"><%=rs.getInt("Product_Price") * rs.getInt("Car_Quantity")%></p>
    <form action="deletecar.jsp" method="POST">
          <input type="hidden" name="carid" value="<%=rs.getString("carid")%>">
						<input type="hidden" name="Product_Id" value="<%=rs.getString("Product_Id")%>">
						<input type="hidden" name="Member_Username" value="<%=rs.getString("Member_Username")%>">
						<input type="hidden" name="Car_Quantity" value="<%=rs.getString("Car_Quantity")%>">
    	    	<input class="button1" type="submit" value="刪除">
						<input type="hidden" name="code" value="">
						<input type="hidden" name="userid" value=""></form>
  </div><%}%>
<!--car2-->
<div class="div2">
    <%
		//String Member_Username=(String)session.getAttribute("userid");
		String sql2 = "select * from shoppingcar,product where Member_Username ='"+Member_Username+"' and (shoppingcar.Product_Id2=product.Product_Id)";
		ResultSet rs2 = con.createStatement().executeQuery(sql2);

		while(rs2.next()){
		%>

      <p class="tit"><%=rs2.getString("Product_Name")%></p>
      <p class="prr"><%=rs2.getString("Product_Price")%></p>

    <form id="myform" method="POST" action="#" style="margin-top:95px; margin-left: -150px;">
    <label for="pl"></label>
    <%
    String pro=rs2.getString("Product_Id");
    //int product=int.pars2eInt(pro);
    //if(rs2.getString("Product_Id").equals(pro))
    %>
    <input type="button" name="btn2"value="-" class="plminus" field="Car_Quantity2"/>
    <input type="text" name="Car_Quantity2" value="<%out.print(rs2.getString("Car_Quantity2"));%>" class="pl"/>
    <input type="button" name="btn2" value="+" class="plplus" field="Car_Quantity2"/>
    </form>
<script>
　 $(function() {
  $(".plplus").click(function(e) {
    e.preventDefault();
    fieldName = $(this).attr("field");
    var currentVal = parseInt($("input[name=" + fieldName + "]").val());
    if (!isNaN(currentVal)) {
      $("input[name=" + fieldName + "]").val(currentVal + 1);
    } else {
      $("input[name=" + fieldName + "]").val(0);
    }
  });
  $(".plminus").click(function(e) {
    e.preventDefault();
    fieldName = $(this).attr("field");
    var currentVal = parseInt($("input[name=" + fieldName + "]").val());
    if (!isNaN(currentVal) && currentVal > 0) {
      $("input[name=" + fieldName + "]").val(currentVal - 1);
    } else {
      $("input[name=" + fieldName + "]").val(0);
    }
  });
});
</script>
  
    <p class="tot"><%=rs2.getInt("Product_Price") * rs2.getInt("Car_Quantity2")%></p>
    <form action="deletecar.jsp" method="POST">
          <input type="hidden" name="carid" value="<%=rs2.getString("carid")%>">
						<input type="hidden" name="Product_Id2" value="<%=rs2.getString("Product_Id2")%>">
						<input type="hidden" name="Member_Username" value="<%=rs2.getString("Member_Username")%>">
						<input type="hidden" name="Car_Quantity2" value="<%=rs2.getString("Car_Quantity2")%>">
    	    	<input class="button1" type="submit" value="刪除">
						<input type="hidden" name="code" value="">
						<input type="hidden" name="userid" value=""></form>
  </div><%}%>


  <br>
  <%
    String sql4 = "SELECT * FROM shoppingcar";
		PreparedStatement pstmt=null;
    pstmt=con.prepareStatement(sql4,ResultSet.TYPE_SCROLL_SENSITIVE, 
    ResultSet.CONCUR_UPDATABLE);
    ResultSet rs4=pstmt.executeQuery(sql4);
    int car=0;int carid=0;
    
    while(rs4.next())
    {
      car=rs4.getInt("carid");
      if( car!= 0 )
      carid=car;
    }
      
    
    
    if(carid==0)
    {
    %>
    <button class="button2" onclick="window.alert('結帳失敗!購物車內沒有商品!!!')">
    <span class="ok">下一步</span></button>
    
    <%}
    else
    {%>
      <button class="button2" onclick="javascript:location.href='cartbuy.jsp'">
    <span class="ok">下一步</span></button>
      
    <%}
    %>
<!--購物車結束-->
<br><br><br>



<!--置頂開始-->
<div class="updiv">
	<a href="#top"><img src="../assets/images/up.png" class="uppic"></a>
</div> 
<!--置頂結束-->

</body>
</html>
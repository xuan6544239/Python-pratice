<!DOCTYPE html>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>La via campesina</title>
	<link rel="stylesheet" type="text/css" href="../assets/css/index.css">
	<link rel="stylesheet" type="text/css" href="../assets/css/allshop.css">
	<link rel="stylesheet" type="text/css" href="../assets/css/footer.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
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
	<!--輪播開始-->
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
		<%
		Random ran=new Random();
		String sql3="select * from ad";
      PreparedStatement pstmt=null;
      pstmt=con.prepareStatement(sql3,ResultSet.TYPE_SCROLL_SENSITIVE, 
      ResultSet.CONCUR_UPDATABLE);
			
      ResultSet rs3=pstmt.executeQuery(sql3);
			rs3.last();
			int n=rs3.getRow();
		int num=ran.nextInt(n)+1;
		int num2=ran.nextInt(n)+1;
		int num3=ran.nextInt(n)+1;
		while(num2==num)
		{
			num2=ran.nextInt(n)+1;
		}

		while(num3==num||num3==num2)
		{
			num3=ran.nextInt(n)+1;
		}
		//int n2=ran.nextInt(6)+1;
		ResultSet rs7,rs5,rs6;
		String sql7 = "select * from ad where adid="+num;
		String sql5 = "select * from ad where adid="+num2;
		String sql6 = "select * from ad where adid="+num3;
		rs7 = con.createStatement().executeQuery(sql7);
		rs5 = con.createStatement().executeQuery(sql5);
		rs6 = con.createStatement().executeQuery(sql6);
		while(rs7.next()){
		%>
			<div class="carousel-item active">
				<a href="<%out.print(rs7.getString(4));%>" target="_blank">
				<img class="d-block w-10" src="../assets/<%out.print(rs7.getString(2)+"/"+rs7.getString(3));%>" alt="<%out.print(rs7.getString(5));%>">
			</div>
			<%}
		while(rs5.next()){
		%>
			<div class="carousel-item ">
				<a href="<%out.print(rs5.getString(4));%>" target="_blank">
				<img class="d-block w-10" src="../assets/<%out.print(rs5.getString(2)+"/"+rs5.getString(3));%>" alt="<%out.print(rs5.getString(5));%>">
			</div>
			<%}%>
		<%while(rs6.next()){
		%>
			<div class="carousel-item ">
				<a href="<%out.print(rs6.getString(4));%>" target="_blank">
				<img class="d-block w-10" src="../assets/<%out.print(rs6.getString(2)+"/"+rs6.getString(3));%>" alt="<%out.print(rs6.getString(5));%>">
			</div>
			
			<%}%>
			
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
		
	</div>
<!--跑馬燈開始-->
	<marquee class="marquee" scrollamount="10">🔊買一份看得見的愛！小農時代的主角不是農產品，而是農夫👨‍🌾！</marquee>
<!--跑馬燈結束-->
<!--側邊欄位-->
 <div class="stayleft">
    <input type="checkbox" name="" id="sideswitch">
    <div class="sidemenu">
    <form action="allshop.jsp">
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
						<%
              }%>
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
        </ul>
    </nav>
    <label for="sideswitch">
        <i class="fa fa-chevron-right" aria-hidden="true"></i>
    </label>
    </div>
</div>
<!--側邊欄位結束-->
 <!--小農通路開始-->
 <div class="commodity">
	<!--item 1-->
	<div class="item">
		<div class="pic">
		<img src="../assets/images/item1.png">
		</div>
		<div class="literal">
		<h2>傳統批發</h2>
		<p>不想將農產品交給傳統批發，但靠產地直銷又擔心沒足夠的行銷能力。
			於是出現「中介者」角色的通路幫小農做好行銷包裝且不像傳統批發須轉好幾手。
			這不但替小農增加販售通路，同時消費者也能吃到產地直送的新鮮蔬果。</p>
		</div>
	</div>
	<!--item 2-->
	<div class="item">
		<div class="literal">
		<h2>小農直送</h2>
		<p>隨著網路科技與物流業的發達，小農開始經營社群網站，
			直接在網路上販售自家農產品。如此從產地到消費者手上只有物流成本。
			這讓產地直銷的小農變多，
			同時消費者的選擇也變多，所以小農自身行銷能力也變得更重要！</p>
		</div>
		<div class="pic">
		<img src="../assets/images/item2.png">
		</div>
	</div>
	<!--item 3-->
	<div class="item">
		<div class="pic">
		<img src="../assets/images/item3.png">
		</div>
		<div class="literal">
		<h2>友善通路</h2>
		<p>不想將農產品交給傳統批發，但靠產地直銷又擔心沒足夠的行銷能力。
			於是出現「中介者」角色的通路幫小農做好行銷包裝且不像傳統批發須轉好幾手。
			這不但替小農增加販售通路，同時消費者也能吃到產地直送的新鮮蔬果。</p>
		</div>
	</div>
</div>
<!--小農通路結束-->

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
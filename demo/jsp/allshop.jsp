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
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
   

</head>
<body style="background-color: rgb(175, 236, 218);">
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
<!--所有商品開始-->
<br>
<br>
<div class="container-fluid mt-10">
<br/><br/><br/><br/><h2 class="allname">商品一覽</h2> 
  <div class="row">

<%
      //ResultSet rs3;
      String sql3="select Product_Id from  product  ;";
      PreparedStatement pstmt=null;
      pstmt=con.prepareStatement(sql3,ResultSet.TYPE_SCROLL_SENSITIVE, 
      ResultSet.CONCUR_UPDATABLE);
      ResultSet rs3=pstmt.executeQuery(sql3);
      //rs3 = con.createStatement().executeQuery(sql3);
      rs3.last();
      int num=rs3.getRow();

      String classify=request.getParameter("classify");
      String all=new String("all");
      String veg=new String("veg");
      String fru=new String("fru");
      String mil=new String("mil");
      String search=new String("search");
      if(classify.equals(all))
      {
        for(int i=1;i<=num;i++)
        {
        ResultSet rs;
        String sql = "select * from product where Product_Id="+i;
    
         rs = con.createStatement().executeQuery(sql);
         while(rs.next())
           { %>         
            <div class="photocard col-4 col-md-2 mb-100">
              <img class="photoframa" src="../assets/images/<%out.print(rs.getString("Product_Code"));%>.jpg" class="photoframa" alt="<%out.print(rs.getString("Product_Name"));%>">
              <div class="img_description_layer">
                <img style="width: 30px;height: 30px;" class="img_description_text" src="../assets/images/fing.svg">
                <a class="img_description_text" href="lookshop.jsp?p_no=<%out.print(rs.getInt("Product_Id"));%>" target="連結目標" title="" style="color:#CE0000;" >查看商品</a>
                &emsp;
                <img style="width: 30px;height: 30px;" class="img_description_text" src="../assets/images/car.svg">
                                <!--<form method="post" action="cartcheck.jsp">-->
                                <a href="cartcheck.jsp?quantity=1&prid=<%out.print(rs.getInt("Product_Id"));%>" class="img_description_text">加入購物車</a>
                <!--<input type="hidden" name="quantity" value="1">
                <input type="hidden" name="prid" value="<%out.print(rs.getInt("Product_Id"));%>">

                <button class="img_description_text" value="" >加入購物車</button>-->
                </form>
              </div>  
            <div class="row">     
            <p class="goodsh col-6 col-md-6"><%out.print(rs.getString("Product_Name"));%><%out.print("("+rs.getString("Product_FM")+")");%></p>
            <p class="goodpr col-6 col-md-6">$<%out.print(rs.getString("Product_Price"));%></p>
            </div>
            </div>
    <%     }
        }
      }
      else if(classify.equals(veg))
      {
        ResultSet rs;
		String sql = "select * from product where Product_Code like 'a%'";
		rs = con.createStatement().executeQuery(sql);
		while(rs.next())
		{%>
            <div class="photocard col-4 col-md-2 mb-100">
              <img class="photoframa" src="../assets/images/<%out.print(rs.getString("Product_Code"));%>.jpg" class="photoframa" alt="<%out.print(rs.getString("Product_Name"));%>">
              <div class="img_description_layer">
                <img style="width: 30px;height: 30px;" class="img_description_text" src="../assets/images/fing.svg">
                <a class="img_description_text" href="lookshop.jsp?p_no=<%out.print(rs.getInt("Product_Id"));%>" target="連結目標" title="" style="color:#CE0000;" >查看商品</a>
                &emsp;
                <img style="width: 30px;height: 30px;" class="img_description_text" src="../assets/images/car.svg">
                                <!--<form method="post" action="cartcheck.jsp">-->
                                <a href="cartcheck.jsp?quantity=1&prid=<%out.print(rs.getInt("Product_Id"));%>" class="img_description_text">加入購物車</a>
                <!--<input type="hidden" name="quantity" value="1">
                <input type="hidden" name="prid" value="<%out.print(rs.getInt("Product_Id"));%>">

                <button class="img_description_text" value="" >加入購物車</button>-->
                </form>
              </div>  
            <div class="row">     
            <p class="goodsh col-6 col-md-6"><%out.print(rs.getString("Product_Name"));%><%out.print("("+rs.getString("Product_FM")+")");%></p>
            <p class="goodpr col-6 col-md-6">$<%out.print(rs.getString("Product_Price"));%></p>
            </div>
            </div>
    <%     }
      }
            else if(classify.equals(fru))
      {
        ResultSet rs;
		String sql = "select * from product where Product_Code like 'b%'";
		rs = con.createStatement().executeQuery(sql);
		while(rs.next())
		{%>
            <div class="photocard col-4 col-md-2 mb-100">
              <img class="photoframa" src="../assets/images/<%out.print(rs.getString("Product_Code"));%>.jpg" class="photoframa" alt="<%out.print(rs.getString("Product_Name"));%>">
              <div class="img_description_layer">
                <img style="width: 30px;height: 30px;" class="img_description_text" src="../assets/images/fing.svg">
                <a class="img_description_text" href="lookshop.jsp?p_no=<%out.print(rs.getInt("Product_Id"));%>" target="連結目標" title="" style="color:#CE0000;" >查看商品</a>
                &emsp;
                <img style="width: 30px;height: 30px;" class="img_description_text" src="../assets/images/car.svg">
                                <!--<form method="post" action="cartcheck.jsp">-->
                                <a href="cartcheck.jsp?quantity=1&prid=<%out.print(rs.getInt("Product_Id"));%>" class="img_description_text">加入購物車</a>
                <!--<input type="hidden" name="quantity" value="1">
                <input type="hidden" name="prid" value="<%out.print(rs.getInt("Product_Id"));%>">

                <button class="img_description_text" value="" >加入購物車</button>-->
                </form>
              </div>  
            <div class="row">     
            <p class="goodsh col-6 col-md-6"><%out.print(rs.getString("Product_Name"));%><%out.print("("+rs.getString("Product_FM")+")");%></p>
            <p class="goodpr col-6 col-md-6">$<%out.print(rs.getString("Product_Price"));%></p>
            </div>
            </div>
    <%     }
      }      
      else if(classify.equals(mil))
      {
        ResultSet rs;
		String sql = "select * from product where Product_Code like 'c%'";
		rs = con.createStatement().executeQuery(sql);
		while(rs.next())
		{%>
            <div class="photocard col-4 col-md-2 mb-100">
              <img class="photoframa" src="../assets/images/<%out.print(rs.getString("Product_Code"));%>.jpg" class="photoframa" alt="<%out.print(rs.getString("Product_Name"));%>">
              <div class="img_description_layer">
                <img style="width: 30px;height: 30px;" class="img_description_text" src="../assets/images/fing.svg">
                <a class="img_description_text" href="lookshop.jsp?p_no=<%out.print(rs.getInt("Product_Id"));%>" target="連結目標" title="" style="color:#CE0000;" >查看商品</a>
                &emsp;
                <img style="width: 30px;height: 30px;" class="img_description_text" src="../assets/images/car.svg">
                                <!--<form method="post" action="cartcheck.jsp">-->
                                <a href="cartcheck.jsp?quantity=1&prid=<%out.print(rs.getInt("Product_Id"));%>" class="img_description_text">加入購物車</a>
                <!--<input type="hidden" name="quantity" value="1">
                <input type="hidden" name="prid" value="<%out.print(rs.getInt("Product_Id"));%>">

                <button class="img_description_text" value="" >加入購物車</button>-->
                </form>
              </div>  
            <div class="row">     
            <p class="goodsh col-6 col-md-6"><%out.print(rs.getString("Product_Name"));%><%out.print("("+rs.getString("Product_FM")+")");%></p>
            <p class="goodpr col-6 col-md-6">$<%out.print(rs.getString("Product_Price"));%></p>
            </div>
            </div>
    <%     }
      }
      else if(classify.equals(search))
      {
        String searchin=request.getParameter("searchin");
        ResultSet rs;
		String sql = "select * from product where Product_brand like '%"+searchin+"%' or Product_Name like '%"+searchin+"%'";
		rs = con.createStatement().executeQuery(sql);
		while(rs.next())
		{%>
            <div class="photocard col-4 col-md-2 mb-100">
              <img class="photoframa" src="../assets/images/<%out.print(rs.getString("Product_Code"));%>.jpg" class="photoframa" alt="<%out.print(rs.getString("Product_Name"));%>">
              <div class="img_description_layer">
                <img style="width: 30px;height: 30px;" class="img_description_text" src="../assets/images/fing.svg">
                <a class="img_description_text" href="lookshop.jsp?p_no=<%out.print(rs.getInt("Product_Id"));%>" target="連結目標" title="" style="color:#CE0000;" >查看商品</a>
                &emsp;
                <img style="width: 30px;height: 30px;" class="img_description_text" src="../assets/images/car.svg">
                                <!--<form method="post" action="cartcheck.jsp">-->
                                <a href="cartcheck.jsp?quantity=1&prid=<%out.print(rs.getInt("Product_Id"));%>" class="img_description_text">加入購物車</a>
                <!--<input type="hidden" name="quantity" value="1">
                <input type="hidden" name="prid" value="<%out.print(rs.getInt("Product_Id"));%>">

                <button class="img_description_text" value="" >加入購物車</button>-->
                </form>
              </div>  
            <div class="row">     
            <p class="goodsh col-6 col-md-6"><%out.print(rs.getString("Product_Name"));%><%out.print("("+rs.getString("Product_FM")+")");%></p>
            <p class="goodpr col-6 col-md-6">$<%out.print(rs.getString("Product_Price"));%></p>
            </div>
            </div>
    <%     }
      }%>
 </div>
</div>
<!--所有商品結束-->

<%
	String sql2="select * from  counter ";
	ResultSet rs2 =con.createStatement().executeQuery(sql2);
	int x=0;
	while(rs2.next())
	{
  	x=rs2.getInt("People_Number");
	}
	session.setAttribute("count",x);
	if(session.isNew())
		{
			x++;  
		}
	sql2="update counter set People_Number='"+x+"'" ;
	con.createStatement().execute(sql2);
	%>
<!--footer開始-->
<footer style="margin-top: 400px;>
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
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>常見問題</title>
    <link rel="stylesheet" type="text/css" href="../assets/css/index.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/footer.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/allshop.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/qa.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
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
            <li class="title"><u>蔬菜人氣品</u></li>
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
            <li class="title"><u>水果人氣品</u></li>
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
            <li class="title"><u>乳製品人氣品</u></li>
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
<!--Q&A開始-->
<div class="container">
<div class="qa"><h1>常見問題Q&A</h1></div>

<div class="abc">
<div class="accordion" id="accordionExample">
    <div class="accordion-item">
      <h2 class="accordion-header" id="headingOne">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
            1. 如何訂購商品?
        </button>
      </h2>
      <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
        <div class="accordion-body">
          <strong>請先登入會員並點擊上方主選單【商品一覽】→【產品介紹頁的訂購按鈕】輸入數量、填寫相關資訊即可。</strong> 
        </div>
      </div>
    </div>
    
    <div class="accordion-item" >
      <h2 class="accordion-header" id="headingTwo">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
            2. 忘記密碼怎麼辦?
        </button>
      </h2>
      <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
        <div class="accordion-body">
          <strong>請點選【會員中心】中的【忘記密碼】，並依指示進行操作，密碼更改完畢後，請再重新登入。<br>
            ※如果經過一段時間，您仍然沒有收到我們系統的密碼提醒郵件，郵件有可能被分類到垃圾信件。請查看您的垃圾郵件信件箱。
            </strong> 
        </div>
      </div>
    </div>
    <div class="accordion-item">
      <h2 class="accordion-header" id="headingThree">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
            3. 訂購商品並成功付款後，需幾天的時間才可以收到商品？
        </button>
      </h2>
      <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
        <div class="accordion-body">
          <strong>約7-10個工作天。<br>
            ※若因天氣狀況不佳及交通道路中斷等配送困難的情況下，送達時間有可能變動。
            </strong>
         </div>     
      </div>
    </div>
    <div class="accordion-item" >
      <h2 class="accordion-header" id="headingfour">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapsefour" aria-expanded="false" aria-controls="collapsefour">
          4. 如何辦理退換貨？
        </button>
      </h2>
      <div id="collapsefour" class="accordion-collapse collapse" aria-labelledby="headingfour" data-bs-parent="#accordionExample">
        <div class="accordion-body">
          <strong>請您於收到貨後7天內與我們客服人員聯絡（客服專線xxxxxxxx），我們會安排宅配公司於5個工作天內前往取貨。<br>請您將退貨商品包裝妥當，於約定時間提供宅配人員取件，並請您保留宅配單據。
            </strong> 
        </div>
      </div>
    </div>
    <div class="accordion-item" >
      <h2 class="accordion-header" id="headingfive">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapsefive" aria-expanded="false" aria-controls="collapsefive">
         5. 目前提供哪些付款方式？
        </button>
      </h2>
      <div id="collapsefive" class="accordion-collapse collapse" aria-labelledby="headingfive" data-bs-parent="#accordionExample">
        <div class="accordion-body">
          <strong>貨到付款、信用卡、轉帳。
            </strong> 
        </div>
      </div>
    </div>
    <div class="accordion-item" >
      <h2 class="accordion-header" id="headingsix">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapsesix" aria-expanded="false" aria-controls="collapsesix">
         6. 購買金額達多少以上可免運費？
        </button>
      </h2>
      <div id="collapsesix" class="accordion-collapse collapse" aria-labelledby="headingsix" data-bs-parent="#accordionExample">
        <div class="accordion-body">
          <strong>1200元。
            </strong> 
        </div>
      </div>
    </div>
    <div class="accordion-item" >
      <h2 class="accordion-header" id="headingseven">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseseven" aria-expanded="false" aria-controls="collapseseven">
         7. 目前可使用的信用卡種類有哪些？
        </button>
      </h2>
      <div id="collapseseven" class="accordion-collapse collapse" aria-labelledby="headingseven" data-bs-parent="#accordionExample">
        <div class="accordion-body">
          <strong>目前可以使用Master、VISA、JCB卡。<br> ※部分發卡銀行所發行之信用卡可能會出現交易失敗的情形。
            </strong> 
        </div>
      </div>
    </div>
  </div>
</div>
</div>

<!--Q&A結束-->
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
<footer style="margin-top: 850px;>
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
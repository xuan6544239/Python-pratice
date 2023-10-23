<!DOCTYPE html>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>關於我們|組員介紹</title>
    <link rel="stylesheet" type="text/css" href="../assets/css/cart.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/index.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/footer.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/member.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>

</head>
<body style="background-color: #c2fcf6;"> 
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
<!--組員介紹開始-->

<div class="container2">
    <h1><i>~組員介紹~</i></h1>
    <content class="row">	

<!--people1 star-->
    <div class="col-md-10"><hr class="hra">
        <div class="row people">
        <div class="col-md-4">
        <a href="https://www.instagram.com/tzuyenz/?hl=zh-tw" target="_blank">
        <img style=" border:5px solid #26bb8e" src="../assets/images/lin.jpg" alt="林姿言" class='circle'/ ></a>
    </div>
    <div class="col-md-8">
        <br><br>
        <h4 class="lin">林姿言
        <h3 class="lin">&thinsp;國貿三甲</h3>
        </h4>
        <br><br>
        <div class="lin">
        這次的期末專案，除了技術上的困難之外，我覺得最麻煩的部分就是要分工並與後端協商了，<br>
        不過我認為我們這一組在這一方面非常和平且處理的很好，非常感謝有強大的組員們。另外，<br>
        因為我們的主題是小農，為了編排我們的網站，我們也查了非常多關於小農的資料，因此對這<br>
        方面也有了新的認識。這堂課雖然沒有讓我變得多會寫程式，但至少也讓我從完全看不懂到現<br>
        在會寫一些些比較簡單的程式，這也讓我蠻有成就感的！</div>
    </div>
    </div>
</div>
    <div class="col-md-10"><br></div>
    <div class="col-md-10"><hr class="hrb"></div>
<!--people1 stop-->
<!--people2 star-->
    <div class="col-md-10">
        <div class="row people">
        <div class="col-md-8">
        <br>
        <h4 class="wu">吳紫熒
        <h3 class="wu">&thinsp;資管二甲</h3>
        </h4>
        <br><br>
        <div class="wu">
            經歷期中專案的摧殘，期末專案更有了經驗，知道該如何與組員有效的溝通和分工合作。期末專案<br>
            我主要負責程式設計的部分，跟一年級學的.Net和Java大不同，但有大家一起盡心盡力的完成這項<br>
            專案，對我前端設計有很大的提升。我們的主題「小農」，不僅讓我們更了解到唐詩裡所寫的粒粒<br>
            皆辛苦，也讓我們對小農有更深入的認識，希望可以推廣出去，讓更多人知道我們發想。</div>
    </div>
        <div class="col-md-4">
        <a href="https://www.instagram.com/ziying__wu/" target="_blank">
        <img style=" border:5px solid #cce490" src="../assets/images/wu.png" alt="吳紫熒" class='circle'/ ></a>
        </div>
        </div>
</div>
    <div class="col-md-10"><br></div>
    <div class="col-md-10"><hr class="hra"></div>
<!--people2 stop-->
<!--people3 star-->
<div class="col-md-10">
    <div class="row people">
    <div class="col-md-4">
    <a href="https://www.instagram.com/ching6544239/" target="_blank">
    <img style=" border:5px solid #26bb8e" src="../assets/images/zhang.jpg" alt="林姿言" class='circle'/ ></a>
</div>
<div class="col-md-8">
    <br><br>
    <h4 class="zhang">張亞璇
    <h3 class="zhang">&thinsp;心理四乙</h3>
    </h4>
    <br><br>
    <div class="zhang">
        雖然我的專業是看起來跟資管毫無相關的心理，但轉學前曾接觸過網頁設計，當時也有與小組做出一個以文藝復興為主題的課程專題(html/css)。<br>
這次輔系選修的課程是後端的部分，以Java語言撰寫後端JSP對我來說，除了是一個新的領域，也打破了我以前對網頁的印象，因為整個網頁的結構將會連結資料庫，使用讀取的方式呈現出重複性的資料，不再是反覆的複製貼上。<br>
而我在這次的期末專題中，不僅將平時學習到的JSP後端技巧與資料庫連結實作，也透過與前端的小組溝通、利用先前所學到的前端知識，將「空有功能的網站」畫上一層裝飾，大大的提升製作網站的成就感！</div>
</div>
</div>
</div>
<div class="col-md-10"><br></div>
<div class="col-md-10"><hr class="hrb"></div>
<!--people3 stop-->
<!--people4 star-->
<div class="col-md-10">
    <div class="row people">
    <div class="col-md-8">
    <br>
    <h4 class="lee">李明潔
    <h3 class="lee">&thinsp;資管二乙</h3>
    </h4>
    <br><br>
    <div class="lee">
    身為後端的我，覺得最困難的就是，不但程式要寫的好，還要能與前端做的網頁接合完美，當個<br>
    「賢內助」。雖說撰寫程式碼能力不是很好，邏輯運算也有待加強，但會盡我所能，運用上課所<br>
    學知識，以及網路資源，與組員們同心協力，完成這次重大的專案；真心覺得組員們各懷絕技，<br>
    也盡心盡力在完成每一次的分工，我也要努力工作，不辜負他們的辛苦！</div>
</div>
    <div class="col-md-4">
    <a href="https://www.instagram.com/Opia_Drifter" target="_blank">
    <img style=" border:5px solid #cce490" src="../assets/images/lee.jpg" alt="吳紫熒" class='circle'/ ></a>
    </div>
    </div>
</div>
<div class="col-md-10"><br></div>
<div class="col-md-10"><hr class="hra"></div>
<!--people4 stop-->
<!--people5 star-->
 <div class="col-md-10">
    <div class="row people">
    <div class="col-md-4">
    <a href="https://www.instagram.com/_benny.cccc_0822/" target="_blank">
    <img style=" border:5px solid #26bb8e" src="../assets/images/xu.jpg" alt="徐萌鏘" class='circle'/ ></a>
</div>
<div class="col-md-8">
    <br><br>
    <h4 class="xu">徐萌鏘
    <h3 class="xu">&thinsp;資管二乙</h3>
    </h4>
    <br><br>
    <div class="xu">
    在修程式設計這門課時，我很高興地因為分組作業而認識到了不同班的同學，雖然我在高中時<br>
    有學到一些簡單的網頁代碼，但是在這門課裡，我還是感到十分辛苦。這次的分組作業讓我有<br>
    了與其他小組成員合作的經驗， 令我的溝通能力提升了。</div>
</div>
</div>
</div>
<div class="col-md-10"><br></div>
<div class="col-md-10"></div>
<!--people5 stop-->
</content>
<!--聯絡我們開始-->

<div class="col-xl-12 col-lg-12 col-md-12">
    <hr style="border-width:2px;margin-top: 100px;">
    <h3 class="call">聯絡我們</h3><img src="../assets/images/call.png" alt="喇叭" class="calll">
</div class="col-xl-12 col-lg-12 col-md-12 ">
<div class="col-xl-8 center">
    <form class="callus"method="post" action="addboard.jsp">
        <input class="form-control" name="name"type="text" placeholder="姓名NAME:"maxlength="10">
        <input class="form-control"name="phone" type="text" placeholder="電話PHONE:" maxlength="10">
        <input class="form-control"name="mail" type="text" placeholder="電子信箱EMAIL:"maxlength="30">
        <input class="form-control"name="subject" type="text" placeholder="主旨SUBJECT:" maxlength="20">
        <div class="form-group">
            <textarea class="form-control" name="content"id="exampleFormControlTextarea1"rows="5" placeholder="有什麼想對我們說的"></textarea>
        </div>
        <button type="submit" class="btn btn-primary center button" style="margin-left: 540px;">送出</button>
    </form>
</div>

<!--聯絡我們結束-->
<BR><br>
<!--組員介紹結束-->
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
	<p>+886-987987987&nbsp;|&nbsp;<a href="Laviacampesina@gmail.com">Laviacampesina@gmail.com</a></p>
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
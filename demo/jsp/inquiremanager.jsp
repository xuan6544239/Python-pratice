<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>後台管理|查詢商品</title>
    <link rel="stylesheet" type="text/css" href="../assets/css/manger.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/index.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/footer.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
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
<!--查詢商品開始-->
<div class="col-xl-14">
<div class="trade">
    <div class="tradetitle">查詢商品</div>
    <div class="trademain">
        <div class="trade1">
        <ul>
            <li>商品資訊</li>
        </ul>
    <form>
            <input type="search" name="product" size="5">
            <input type="button" value="搜尋">   	        
    </form>
    </div>
        <div class="trade2">
    	    	<table>
    	    		<tr>			    
    	    			<th>訂單編號</th>
						    <th>顧客帳號</th>
    	    			<th>商品名稱</th>
    	    			<th>數量</th>
    	    			<th>商品金額</th>
    	    			<th>付款方式</th>
    	    			<th>運送方式</th>
    	    			<th>取消訂單</th>
    	    		</tr>
    	    	<%
					String sql = "select orders.order_Id,order_detail.Member_Username,product.Product_brand,product.Product_Name,order_detail.order_Quantity,product.Product_Price,orders.pay_way,orders.ship_way,product.Product_Id from order_detail, product, orders where (order_detail.Product_Id = product.Product_Id) and (orders.order_Id=order_detail.order_Id)";
					ResultSet rs= con.createStatement().executeQuery(sql);
					while(rs.next())
								{
				%>
    	    		<tr>
    	    		  <td><label ><%out.print(rs.getString("order_Id"));%></label></td>
						    <td><label ><%out.print(rs.getString("Member_Username"));%></label></td>
    	    			<td><label ><%out.print(rs.getString("Product_brand"));%><%out.print(rs.getString("Product_Name"));%></label></td>
    	    			<td><label ><%out.print(rs.getString("order_Quantity"));%></label></td>
    	    			<td><label >$<%out.print(rs.getInt("order_Quantity")*rs.getInt("Product_Price"));%></label></td>
    	    			<td><label ><%out.print(rs.getString("pay_way"));%></label></td>
    	    			<td><label ><%out.print(rs.getString("ship_way"));%></label></td>
    	    			<form action="deleteitem.jsp" method="POST">
    	    			<td><input type="submit"  value="刪除" >   </td>
    	    			<input type="hidden" name="order_Id" value="<%out.print(rs.getString("order_Id"));%>">
    	    			<input type="hidden" name="Product_Id" value="<%out.print(rs.getString("Product_Id"));%>">
		            
						</form>	

    	    		</tr>
    	    	<%}%>	
    	    	</table>
    	    </div>
		</div>
	</div>
</div>

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


<!--置頂開始-->
<div class="updiv">
	<a href="#top"><img src="../assets/images/up.png" class="uppic"></a>
</div> 
<!--置頂結束-->
</body>
</html>
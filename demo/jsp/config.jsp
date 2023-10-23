
<%
	Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost/?serverTimezone=UTC";
    Connection con=DriverManager.getConnection(url,"root","1234");
    if(con.isClosed())
           out.println("連線建立失敗");
        else
    {	
    String sql="USE db";
    con.createStatement().execute(sql);
	}
%>
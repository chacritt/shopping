<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="style.html"%>
<%@include file="header.html"%>

<%
	if(request.getParameter("Action") != null)	
	{

		Connection connect = null;
		Statement s = null;
		
		try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost/oom_shop"+"?user=root&password=12345678");
            s = connect.createStatement();

            String username = request.getParameter("username");
			   String password = request.getParameter("password");
         
            String sql = "SELECT * FROM  member WHERE " +
                        " Username = '" + username + "' AND " + 
                        " Password = '" + password + "' ";
            
            ResultSet rec = s.executeQuery(sql);
			
            if(!rec.next())
            {
               out.print("<font color=red>Username and Password Incorrect!</font>");
            } else {
               rec.first();
               session.setAttribute("sUserID",rec.getString("id"));	
               %>
                  <script>location.href = "user/shop.jsp";</script>
               <%
            }
            
            } catch (Exception e) {
               // TODO Auto-generated catch block
               out.println(e.getMessage());
               e.printStackTrace();
            }
         
            try {
               if(s!=null){
                  s.close();
                  connect.close();
               }
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               out.println(e.getMessage());
               e.printStackTrace();
            }
		
	}
		
	%>

    <div class="modal fade lug" id="myModal" role="dialog">
         <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title">Change</h4>
               </div>
               <div class="modal-body">
                  <ul>
                     <li><a href="#"><img src="images/flag-up-1.png" alt="" /> United States</a></li>
                     <li><a href="#"><img src="images/flag-up-2.png" alt="" /> France </a></li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
      <div id="sidebar" class="top-nav">
         <ul id="sidebar-nav" class="sidebar-nav">
            <li><a href="#">Help</a></li>
            <li><a href="howitworks.html">How it works</a></li>
            <li><a href="#">chamb for Business</a></li>
         </ul>
      </div>
      <div class="page-content-product">
         <div class="main-product">
            <div class="container">
               <div class="row clearfix">
               <div class="col-lg-2 col-sm-2 col-md-2">
               
               </div>
                  <div class="col-lg-8 col-sm-8 col-md-8">
                        <div style="padding-top: 300px; height: 100%;">
                        <form method="post" action="login.jsp?Action=Login">
               <center>
                            <div>
                            <input type="text" name="username" placeholder="username :" class="form-control" style="border-radius: 25px;">
                            <br>
                            <input type="password" name="password" placeholder="password :" class="form-control" style="border-radius: 25px;">
                            <br>
                            <button class="btn btn-danger btn-lg" style="border-radius: 15px;" onclick="onBack()">BACK</button>
                            &nbsp;
                            <button class="btn btn-success btn-lg" style="border-radius: 15px;">LOGIN</button>
                            <br>
                            </div>
                            </form>
                            <br>
                            <a href="register.jsp"><p>register ?</p></a>
                  </center>
                        </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
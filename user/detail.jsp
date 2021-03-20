<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="style.html"%>
<%@include file="header.html"%>

    <%
    Connection connect = null;
        Statement s = null;
		try
		{
                String id = request.getParameter("id");
                Class.forName("com.mysql.jdbc.Driver");
                connect = DriverManager.getConnection("jdbc:mysql://localhost/oom_shop"+"?user=root&password=12345678");
                s = connect.createStatement();
				String sql = ("select * from item where id = "+id); 
                ResultSet rec = s.executeQuery(sql);
			%>
            <%
        if((rec != null)&&(rec.next())){
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
            <br>
               <div class="row clearfix">
                  <div class="col-lg-2 col-sm-6 col-md-3"></div>
                  <div class="col-lg-3 col-sm-6 col-md-3">
                        <div style="padding-top: 100px;">
                           <h1 align="center" style="color: #ffffff;"><%=rec.getString("name")%></h1>
                           <br><br><br><br><br>
                           <img src="<%=rec.getString("image")%>"  />
                        </div>
                  </div>
                  <div class="col-lg-1 col-sm-6 col-md-3"></div>
                  <div class="col-lg-4 col-sm-6 col-md-3">
                        <div style="padding-top: 200px; color: #ffffff;">
                           <h3 align="right">name : <%=rec.getString("name")%></h3>
                           <br>
                           <h3 align="right">descript : <%=rec.getString("descript")%></h3>
                           <br>
                           <h3 align="right">price : <%=rec.getString("price")%> ฿</h3>
                           <hr>
                           <div style="text-align: right;">
                              <a href="confirm.jsp?id=<%=rec.getString("id")%>">
                                <button class="btn btn-success btn-lg" style="border-radius: 15px;">KUY</button>
                              </a>
                           </div>
                        </div>
                  </div>
               </div>
               <br><br>
            </div>
         </div>
      </div>

          <%
        }	
		}
		catch(Exception e)
		{
			out.println(1);
		}
		%>	
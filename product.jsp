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

    try{
        Class.forName("com.mysql.jdbc.Driver");
        connect = DriverManager.getConnection("jdbc:mysql://localhost/oom_shop"+"?user=root&password=12345678");
        s = connect.createStatement();
        String sql = "SELECT * FROM item";
        ResultSet rec = s.executeQuery(sql);

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
                  <%
        for(int i=0; i<4; i++){
            while((rec != null)&&(rec.next())){
%>
                  <div class="col-lg-3 col-sm-6 col-md-3">
                     <a href="detail.jsp?id=<%=rec.getString("id")%>">
                        <div class="box-img" style="height: 350px; color: #ffffff;">
                        <br>
                           <h1><%=rec.getString("name")%></h1>
                           <br>
                           <img src="<%=rec.getString("image")%>" alt="" />
                           <br><br>
                           <h1>Price : <%=rec.getString("price")%> ฿ </h1>
                           <br>
                        </div>
                     </a>
                  </div>
                  <% } %>
               </div>
               <br><br>
            </div>
         </div>
      </div>
      
<%
        }
    }catch(Exception e){
        out.println(e.getMessage());
        e.printStackTrace();
    }

    try{
        if(s != null){
            s.close();
        }
    }catch(Exception e){
        out.println(e.getMessage());
        e.printStackTrace();
    }

%>
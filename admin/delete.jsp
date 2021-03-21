<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%
        String id = request.getParameter("id");
        Connection connect= null;
        Statement s =null;

        try{
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost/oom_shop"+"?user=root&password=12345678");
            s = connect.createStatement();
            String sql = "DELETE  FROM item "+"WHERE id='" +id+ "' ";
            s.executeUpdate(sql);
            out.println("Record Inserted Successfully");%>
                <script>
                    setTimeout(function(){ 
                        location.href = "pages/tables/data.jsp";
                        }, 1000);
                </script>
        <%
        }catch(Exception e){
            out.println(e.getMessage());
            e.printStackTrace();
            %>
                <script>
                    swal({
                        title: "Fail!",
                        text: "Insert Again",
                        icon: "danger",
                    });
                    setTimeout(function(){ 
                            location.href = "insert.jsp";
                        }, 1000);
                </script>
        <%
        }
        %>

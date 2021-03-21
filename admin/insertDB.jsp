<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%

if(request.getParameter("submit")!= null){
        String image = request.getParameter("image");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String descript = request.getParameter("descript");
        String category_id = request.getParameter("category_id");
        String shop_id = request.getParameter("shop_id");

        Connection connect = null;
        Statement s =null;

        try{
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost/oom_shop"+"?user=root&password=12345678");
            s = connect.createStatement();
            String sql = "INSERT INTO item "+" (image,name,price,descript,category_id,shop_id)"+"VALUES('"+image+"','"+name+"','"+price+"','"+descript+"','"+category_id+"','"+shop_id+"')";
            s.execute(sql);%>
                <script>
                    setTimeout(function(){ 
                            location.href = "index.jsp";
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
                            location.href = "shop.jsp";
                        }, 1000);
                </script>
        <%
        }
}

%>

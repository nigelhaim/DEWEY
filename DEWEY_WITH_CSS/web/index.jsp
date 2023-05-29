<%-- 
    Document   : index
    Created on : 05 1, 23, 7:40:10 PM
    Author     : nigel
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.OutputStream"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="index.css">
    </head>
    <body>
        <%
        String role = (String) session.getAttribute("role");
        %>
        <nav class="navbar">
            <img class="logo" src="Pictures/DEWEY.png">
            <ul>
                <li>
                    <form action="List_Discover" method="POST">
                        <input type="submit" value="Discover" class="nav_home">
                    </form>
                </li>
                <%if(role.equals("member")){%>
                    <li>
                        <form action="User_Home" method="POST" >
                            <input type="submit" value="Home" class="nav_home">
                        </form>
                    </li>
                <%}
                else if(role.equals("librarian")){%>
                    <li>
                        <form action="Get_ORDERS" method="POST">
                            <input type="submit" value="Home" class="nav_home">
                        </form>
                    </li>
                <%}else{%>
                    <li>
                        <a href="index.jsp">Home</a>
                    </li>
                <%}%>
                
                <li><a href="./login.jsp">Logout</a></li>
                <li><a href="./Search.jsp">Search</a></li>
            </ul>
        </nav>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>

        <%
            String username = (String) session.getAttribute("uname");
        %> 
        <center>
            <h1>Top Books in 2023</h1>
            <div class="top_books">
                <%
                ResultSet r = (ResultSet)request.getAttribute("Home_books");
                while(r.next())
                { %>
                    <div class="one_book">
                        <img class="book_cover" src="RenderImage?BOOK_ID=<%=r.getString("BOOK_ID")%>">
                        <h4><%=r.getString("BOOK_TITLE")%></h4>
                        <h5><%=r.getString("BOOK_AUTHOR")%></h5>
                    </div>
                <% }
                %>  
            </div>
        </center>
        <br>
        <div class="wrapper2">
            <nav class="navbar2">
                <ul>
                    <li>Dewey - 2023 |</li>
                    <li><a href="AboutUs.jsp">About Us</a></li>
                    <div class="right">
                        <p>Contact Us | group1@gmail.com</p>
                    </div>
                </ul>
            </nav>
        </div>
    </body>
</html>

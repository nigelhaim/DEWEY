<%-- 
    Document   : Discover.jsp
    Created on : 05 3, 23, 2:34:07 PM
    Author     : nigel
--%>

<%@page import="java.util.Objects"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Discover</title>
        <link rel="stylesheet" href="Discover.css">
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
        <h1>If the cover does not load press ctrl + a (Select all) then click anywhere in the page check the RenderImage.java servlet for more details</h1>
        <% 
            List<Objects> literature = (List) request.getAttribute("books_Literature");
            List<Objects> Scifi = (List) request.getAttribute("books_Scifi");
            List<Objects> programming = (List) request.getAttribute("books_Programming");
        %>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <center>
            <h1>Literature</h1>
            <%
                for(Object b: literature){     
            %>
                    <img src="RenderImage?BOOK_ID=<%= b %>" class="book_cover">
            <%
                }
            %>
            <h1>Sci-fi</h1>
            <%
                for(Object b: Scifi){     
            %>
                    <img src="RenderImage?BOOK_ID=<%= b %>" class="book_cover">
            <%
                }
            %>
            <h1>Programming</h1>
            <%
                for(Object b: programming){     
            %>
                <img src="RenderImage?BOOK_ID=<%= b %>" class="book_cover">
            <%
                }
            %>
            <% 
                if(role.equals("member")){
            %>
            <div class="borrow_buttons">
                    <form action="Borrow_Books_Categories" method="POST">
                        <input type="hidden" name="category" value="all">
                        <input type="submit" value="Borrow a book">
                    </form>
                    <form action="View_cart" method="POST">
                        <input type="hidden" name="category" value="all">
                        <input type="submit" value="View Cart">
                    </form>
            </div>
            <%
                }
            %>
        </center>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
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

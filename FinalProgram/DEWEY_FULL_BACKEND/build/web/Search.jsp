<%-- 
    Document   : Search
    Created on : 05 16, 23, 10:03:33 PM
    Author     : nigel
--%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="styles.css">
        <style>
        .form-row {
                display: flex;
                flex-wrap: wrap;
                margin-bottom: 10px;
            }

            .form-col {
                flex: 1;
                padding-right: 10px;
            }

            input[type="text"], select {
                border-radius: 10px;
                background-color: #f2f2f2;
                padding: 5px;
                border: none;
                width: 70%;
                height: 25px;
                font-size: 16px;
                color: #333;
                display: inline-block;
            }

            label {
                display: inline-block;
                text-align: right;
                margin-right: 10px;
                padding-top: 5px;
                color: #115A7D;
                font-size: 20px;
                font-weight: bold;
            }
            #result{
                position: relative;
                bottom: 5px;
                display: block;
            }

        </style>
    </head>
    <body>
        <style>
            img{
                width:150px;
                height:200px;
            }
        </style>
         <div class="wrapper">

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
             <div class="center">
                <h1>Search</h1>
                <form action="Search" method="POST">
                    <div class="form-row">
                        <div class="form-col">
                            <label for="book-id">Book ID:</label>
                            <input type="text" id="book-id" name="book_id" value=0>
                        </div>
                        <div class="form-col">
                            <label for="book-title">Title:</label>
                            <input type="text" id="book-title" name="title">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-col">
                            <label for="book-author">Author:</label>
                            <input type="text" id="book-author" name="author">
                        </div>
                        <div class="form-col">
                            <label for="book-type">Type:</label>
                            <select id="book-type" name="category">
                                <option>Literature</option>
                                <option value="Sci-fi">Sci-fi</option>
                                <option>Programming</option>
                            </select>
                        </div>
                    </div>
                    <div class="button aligncenter">
                        <button>Search</button>
                    </div>
                </form>
                <div id="result">
                    <% 
                    List<Objects> search = (List) session.getAttribute("search");
                    %>
                    <%
                        for(Object b: search){     
                    %>
                        <img src="RenderImage?BOOK_ID=<%=b%>">
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
            <!-- <h1>Book ID</h1>
            <input name="book_id" type="number" placeholder="0" value="0" required>
            <h1>Author</h1>
            <input name="author" type="text">
            <h1>Title</h1>
            <input name="title" type="text">
            <h1>Type</h1>
            <select name="category">
                <option value="all">All books</options>
                <option value="literature">Literature</option>
                <option value="sci-fi">Sci-fi</option>
                <option value="programming">Programming</option>
            </select>
            <br>
            <input type="submit" value="Submit">
        </form>
        <br> -->        

        <div class="wrapper2">
            <nav class="navbar2">
                <ul>
                    <li>Dewey - 2023 |</li>
                    <li><a href="AboutUs.jsp">About Us</a></li>
                    <div class="right">
                        <p>Contact Us | group1@gmail.com</p>
                </ul>
            </nav>
        </div>
    </body>
</html>

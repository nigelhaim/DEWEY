<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Dewey Library System</title>
        <link rel="stylesheet" href="aboutstyle.css">
    </head>
    <body>
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
                <h1>Dewey Library System</h1>
                <p2>The Dewey Library System is a directory of all the books stored in the database. Book enthusiasts can view the book, title, 
                    author, type based on its category, description, and availability. If users prefer to borrow a book, 
                    they can select each quantity. Meanwhile, the library staff can edit the database, add, update, and 
                    delete book records, or change the book status depending on availability. This library management system is a useful tool in 
                    speeding up the process in the library and providing easy surveillance of all books in the database.</p2>

            </div>
        </div>
        
        <div class="wrapper3">
            <nav class="navbar3">
                <ul>
                    <li>Neal Gayapa</li>
                    <li>Kristin Reyes</li>
                    <li>Nathaniel Samonte</li>
                    <li>Nigel Sebastian</li>
                    <li>Group 1</li>
                </ul>
            </nav>
        </div>

        <div class="wrapper2">
            <nav class="navbar2">
                <ul>
                    <li>Dewey - 2023 |</li>
                    <li><a class="active" href="AboutUs.jsp">About Us</a></li>
                    <div class="right">
                        <p>Contact Us | group1@gmail.com</p>
                </ul>
            </nav>
        </div>
    </body>
</html>
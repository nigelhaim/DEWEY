<%-- 
    Document   : CheckOutConfirm
    Created on : 05 8, 23, 3:01:23 PM
    Author     : nigel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="thank you styles.css">
        <title>JSP Page</title>
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

        <center>
        <h1>Thank you for borrowing a book!</h1>
        <h2>We hope you enjoy reading it</h2>
        <form action="List_Discover">
            <input type="submit" value="return">

        </form>
    </center>   
    </body>
</html>

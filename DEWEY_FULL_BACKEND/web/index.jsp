<%-- 
    Document   : index
    Created on : 05 1, 23, 7:40:10 PM
    Author     : nigel
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            ArrayList cart = new ArrayList();
            request.setAttribute("cart", cart);
        %>
        <h1>Hello World!</h1>
        <h1>Librarian's GUI</h1>
        <form action="Get_Books"  method="POST">
            <input type="submit" value="Go to Collections">
        </form>
        <h1>User's GUI</h1>
        <form action="List_Discover"  method="POST">
            
            <input type="submit" value="Discover">
        </form>
    </body>
</html>

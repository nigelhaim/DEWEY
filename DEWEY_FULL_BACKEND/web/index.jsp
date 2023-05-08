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
        <h1>Hello World!</h1>
        <%
            String role = (String) session.getAttribute("role");
            String username = (String) session.getAttribute("uname");
        %> 
        
        <h1>Welcome <%=username%></h1>
        <% 
            if(role.equals("librarian")){
        %>
                <h1>Librarian's GUI</h1>
                <form action="Get_Books"  method="POST">
                    <input type="submit" value="Go to Collections">
                </form>
                <form action="Get_ORDERS" method="POST">
                    <input type="submit" value="Borrowed books">
                </form>
        <%
            }else if(role.equals("member")){
        %>
                <h1>User's GUI</h1>
                <form action="List_Discover"  method="POST">
                    <input type="submit" value="Discover">
                </form>
        <%
            }else{ 
        %>
                <h1>INVALID LOGIN!</h1>
        <%
            }
        %>
   
    </body>
</html>

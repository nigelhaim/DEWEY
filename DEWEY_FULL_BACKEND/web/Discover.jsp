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
    </head>
    <body>
        <style>
            img{
                width:150px;
                height:200px;
            }
        </style>
        <% 
            List<Objects> literature = (List) request.getAttribute("books_Literature");
            List<Objects> Scifi = (List) request.getAttribute("books_Scifi");
            List<Objects> programming = (List) request.getAttribute("books_Programming");
        %>
        <h1>Discover</h1>
        <h1>Literature</h1>
        <%
            for(Object b: literature){     
        %>
                <img src="RenderImage?BOOK_ID=<%= b %>">
        <%
            }
        %>
        <h1>Sci-fi</h1>
        <%
            for(Object b: Scifi){     
        %>
                <img src="RenderImage?BOOK_ID=<%= b %>">
        <%
            }
        %>
        <h1>Programming</h1>
        <%
            for(Object b: programming){     
        %>
            <img src="RenderImage?BOOK_ID=<%= b %>">
        <%
            }
        %>
        <form action="Borrow_Books_Categories" method="POST">
            <input type="hidden" name="category" value="all">
            <input type="submit" value="Borrow a book">
        </form>
    </body>
</html>

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
    </head>
    <body>
        <style>
            img{
                width:150px;
                height:200px;
            }
        </style>
        <h1>Search</h1>
        <form action="Search" method="POST">
            <h1>Book ID</h1>
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
        <br>
        
        <% 
            List<Objects> search = (List) session.getAttribute("search");
        %>
        <%
        for(Object b: search){     
        %>
            <img src="RenderImage?BOOK_ID=<%= b %>">
        <%
            }
        %>
    </body>
</html>

<%-- 
    Document   : index
    Created on : 04 15, 23, 8:05:12 AM
    Author     : nigel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Insert a book</h1>
        <form action="JDBCcontroller" method="POST" enctype="multipart/form-data">
            <input type="text" name="title" placeholder="title">
            <br>
            <input type="text" name="author" placeholder="author">
            <br>
            <input type="text" name="type" placeholder="type">
            <br>
            <textarea name="description" placeholder="description"></textarea>
             <br>
            <input type="file" name="cover">
             <br>
            <input type="submit" value="Upload Book">
        </form>
        
        <form action="BookList" method="POST">
            <input type="submit" value="Go to the list of books">
        </form>
    </body>
</html>

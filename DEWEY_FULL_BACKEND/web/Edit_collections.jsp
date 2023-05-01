<%-- 
    Document   : Edit_collections
    Created on : 05 1, 23, 8:49:42 PM
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
        <form action="Edit_Collections" method="POST" enctype="multipart/form-data">
            <h1>Book title: </h1><input type="text" name="title" placeholder="title">
            <br>
            <h1>Book author:</h1><input type="text" name="author" placeholder="author">
            <br>
            <h1>Book Type</h1><input type="text" name="type" placeholder="type">
            <br>
            <textarea name="description" placeholder="description"></textarea>
             <br>
             <input name="quantity" placeholder="quantity">
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

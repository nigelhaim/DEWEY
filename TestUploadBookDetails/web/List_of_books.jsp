<%-- 
    Document   : List_of_books
    Created on : 04 18, 23, 9:10:23 PM
    Author     : nigel
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            img{
                width: 100px;
                height: 200px;
            }
        </style>
    </head>
    <body>
        <h1>List of Books</h1>
        <table border="1" align="center">
            <tr>
                <th>Id</th>
                <th>Title</th>
                <th>Author</th>
                <th>Type</th>
                <th>Description</th>
                <th>Book cover</th>
            </tr>
            
            <%
              ResultSet r = (ResultSet)request.getAttribute("books");
              while(r.next())
            { %>
              <tr>
                <td><%=r.getString("BOOK_ID") %> </td>
                <td><%=r.getString("BOOK_TITLE") %> </td>
                <td><%=r.getString("BOOK_AUTHOR") %> </td>
                <td><%=r.getString("BOOK_TYPE") %> </td>
                <td><%=r.getString("BOOK_DESCRIPTION") %> </td>
                <td>
                    <img src="RenderImage?BOOK_ID=<%=r.getString("BOOK_ID")%>">
                </td
              </tr>
            <% }
               %>
        </table>
    </body>
</html>

<%-- 
    Document   : Borrow_a_book
    Created on : 05 3, 23, 8:16:35 PM
    Author     : nigel
--%>

<%@page import="java.sql.ResultSet"%>
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
                height: 200px;
            }
            #quantity{
                width: 40px;
            }
        </style>
        <h1>Collections</h1>
        <form action="Borrow_Books_Categories" method="POST">
            <select name="category" onchange='this.form.submit()'>
                <option value="all">All books</options>
                <option value="literature">Literature</option>
                <option value="sci-fi">Sci-fi</option>
                <option value="programming">Programming</option>
            </select>
        </form>
        <table border="1" align="center">
            <tr>
                <th></th>
                <th>Book cover</th>
                <th>Title</th>
                <th>Author</th>
                <th>Type</th>
                <th>Description</th>
                <th>Status</th>
                <th>Available</th>
            </tr>
            
            <%
            ResultSet r = (ResultSet)request.getAttribute("categorized_books");
            while(r.next())
            { %>
            <form action="add_to_cart" method="POST">
                <tr>
                    <td>
                        <input type="submit" id="book" name="books" value="Add to cart">
                    </td>
                    <td>
                        <img src="RenderImage?BOOK_ID=<%=r.getString("BOOK_ID")%>">
                    </td>
                    <input type="hidden" name="book_id" value="<%=r.getString("BOOK_ID") %>" >
                    <td><%=r.getString("BOOK_TITLE") %> </td>
                    <td><%=r.getString("BOOK_AUTHOR") %> </td>
                    <td><%=r.getString("BOOK_TYPE") %> </td>
                    <td><%=r.getString("BOOK_DESCRIPTION") %> </td>
                    <td>
                        <% 
                            if(Integer.parseInt(r.getString("BOOK_QUANTITY")) > 0){ 
                        %>  
                            <input type="number" placeholder="0" name="quantity" id="quantity" max="<%=r.getString("BOOK_QUANTITY") %>">
                        <%
                            }
                            else{ 
                        %>  
                        <%
                            }
                        %>
                    <td>
                        <% 
                            if(Integer.parseInt(r.getString("BOOK_QUANTITY")) > 0){ 
                        %>  
                            <%=r.getString("BOOK_QUANTITY") %>
                        <%
                            }
                            else{ 
                        %>  
                            <h5>Not available</h5>
                        <%
                            }
                        %>
                    </td>
                </tr>
            </form>
            <% }
            %>
        </table>
        <a href="https://www.figma.com/proto/1uw29jeGsvnc9Qtthtp9ny/FAP_Design?node-id=44-177&scaling=contain&page-id=3%3A325&starting-point-node-id=3%3A430">Based from this figma</a>

    </body>
</html>

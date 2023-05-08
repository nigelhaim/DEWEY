<%-- 
    Document   : View_cart.jsp
    Created on : 05 7, 23, 5:34:48 PM
    Author     : nigel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Borrowed_Book_Details"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>View Cart</h1>
        <%
            ArrayList <Borrowed_Book_Details> cart = (ArrayList) session.getAttribute("cart");
        %>
        <table>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Quantity</th>
                <th>Due date</th>
            </tr> 
            <%
                for(Borrowed_Book_Details b : cart){
            %>
                <tr>
                    <td><%=b.getId()%></td>
                    <td><%=b.getTitle()%></td>
                    <td><%=b.getauthor()%></td>
                    <td><%=b.getquantity()%></td>
                    <td><%=b.getdue_date()%></td>
                </tr>
            <%
                }
          
            %>
        </table>

        <form action="Checkout" method="POST">
            <input type="submit" value="checkout">
        </form>
        <form action="Borrow_Books_Categories" method="POST">
            <input type="hidden" name="category" value="all">
            <input type="submit" value="return">
        </form>
         
    </body>
</html>

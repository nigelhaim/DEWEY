<%-- 
    Document   : View_cart
    Created on : 05 19, 23, 10:28:15 PM
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
        <link rel="stylesheet" href="View_cart.css">
    </head>
    <body>
        <style>

            
        </style>
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
            <br><br><br><br><br><br>
           
        <center>
            <h1>Checkout</h1>
            <%
                ArrayList <Borrowed_Book_Details> cart = (ArrayList) session.getAttribute("cart");
            %>
            <table>
                <tr>
                    <th>Book ID</th>
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
        
            <div id="forms">

                    <form action="Checkout" method="POST">
                        <input type="submit" value="checkout">
                    </form>
                    <form action="Borrow_Books_Categories" method="POST">
                        <input type="hidden" name="category" value="all">
                        <input type="submit" value="Borrow books">
                    </form>
            </div>
        </center>
    </body>
</html>

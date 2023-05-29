<%-- 
    Document   : Librarian_Home
    Created on : 05 8, 23, 4:29:43 PM
    Author     : nigel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="LibrarianHome.css">
    </head>
    <body>
        <style>
            body{
                font-size: 20px;
            }
            table{
                width: 100%;
                text-align: center;
            }
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
    <br>
    <br>
    <br>
    <br>
    <br>

        <table>
            <%
                try{

            %>
                    <tr>
                        <th></th>
                        <th></th>
                        <th>Order ID</th>
                        <th>Username</th>
                        <th>Book Id</th>
                        <th>Status</th>
                        <th>Quantity</th>
                        <th>Due Date</th>
                    </tr>
                    <% 
                        ResultSet r = (ResultSet) request.getAttribute("borrows");
                        while(r.next()){
                    %>
                        <tr>
                            <%
                                long millis=System.currentTimeMillis();
                                Date current_date=new Date(millis);

                                Date due_date = r.getDate("DUE_DATE");
                                String status = "Active";
                                if(current_date.compareTo(due_date) > 0){
                                    status = "Passed deadline";
                                }

                            %>
                            
                                <form action="Returned_Delete_Servlet" method="POST">
                                    <input type="hidden" name="borrow_id" value="<%=r.getString("BORROW_ID")%>">
                                    <input type="hidden" name="book_id" value="<%=r.getString("BOOK_ID")%>">
                                    <input type="hidden" name="quantity" value="<%=r.getString("QUANTITY")%>">
                                    <td><input type="submit" name="button" value="Returned" id="collections"></td>
                                    <td><input type="submit" name="button" value="Delete" id="collections"></td>
                                </form>
                            </td>
                            <td><%=r.getString("BORROW_ID")%></td>
                            <td><%=r.getString("MEMBER_ID")%></td>
                            <td><%=r.getString("BOOK_ID")%></td>
                            <td><%=status%></td>
                            <td><%=r.getString("QUANTITY")%></td>
                            <td><%=r.getString("DUE_DATE")%></td>

                    </tr>
                    <%
                        }
                    %>
            <%
                }catch(Exception e){
                    System.out.print(e.getMessage());
                }
            %>
        </table>
        <br><br><br><br><br><br><br><br>
        <center>
            <form action="Get_Books">
                <input type="submit" value="Edit Collections" id="collections">
            </form>
        </center>
        <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <div class="wrapper2">
        <nav class="navbar2">
            <ul>
                <li>Dewey - 2023 |</li>
                <li><a class="active" href="AboutUs.jsp">About Us</a></li>
                <div class="right">
                    <p>Contact Us | group1@gmail.com</p>
            </ul>
        </nav>
    </div>
    </body>
</html>

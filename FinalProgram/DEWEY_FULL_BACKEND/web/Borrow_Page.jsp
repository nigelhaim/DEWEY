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
        <link rel="stylesheet" href="Borrow.css">
    </head>
    <body>

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
        <br>
        <br>
        <center>
            <div>   
                <table align="center">
                    <tr>
                        <td>
                            <form action="Borrow_Books_Categories" method="POST">
                                <select name="category" onchange='this.form.submit()' class="categories">
                                    <option value="all">Categories</options>
                                    <option value="all">All books</options>
                                    <option value="literature">Literature</option>
                                    <option value="sci-fi">Sci-fi</option>
                                    <option value="programming">Programming</option>
                                </select>
                            </form>
                        </td>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
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
                                 <% 
                                    if(Integer.parseInt(r.getString("BOOK_QUANTITY")) > 0){ 
                                %>  
                                   <input type="submit" id="book" name="books" value="Add to cart">
                                <%
                                    }%>
                                
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
                                    <input required type="number" placeholder="0" name="quantity" id="quantity" max="<%=r.getString("BOOK_QUANTITY") %>">
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
            </div>
        </center>
     <div class="wrapper2">
            <nav class="navbar2">
                <ul>
                    <li>Dewey - 2023 | </li>
                    <li><a href="#">About Us</a></li>
                    <li>Contact Us | group1@gmail.com</li>
                </ul>
            </nav>
        </div>
    </body>
</html>

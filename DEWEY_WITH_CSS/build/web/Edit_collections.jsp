<%-- 
    Document   : Edit_collections
    Created on : 05 1, 23, 8:49:42 PM
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
        <link rel="stylesheet" href="Edit_collections.css">
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
        <br>
        <center>
            <form action="Edit_Book_Details" method="POST">
                <table class="collection_table" align="center">
                    <tr>
                        <th></th>
                        <th>Id</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Type</th>
                        <th>Status</th>
                        <th>Quantity</th>
                    </tr>
                
                    
                    <%
                    ResultSet r = (ResultSet)request.getAttribute("books");
                    while(r.next())
                    { %>
                    <tr>
                        <td></td>
                        <td><%=r.getString("BOOK_ID") %> </td>
                        <td><%=r.getString("BOOK_TITLE") %> </td>
                        <td><%=r.getString("BOOK_AUTHOR") %> </td>
                        <td><%=r.getString("BOOK_TYPE") %> </td>
                        <td>
                            <% 
                                if(Integer.parseInt(r.getString("BOOK_QUANTITY")) > 0){ 
                            %>  
                                <h5>Available</h5>
                            <%
                                }
                                else{ 
                            %>  
                                <h5>Not available</h5>
                            <%
                                }
                            %>
                        <td>
                            <form action="Edit_Book_Details">
                                <input name="BOOK_ID" type="hidden" value="<%=r.getString("BOOK_ID") %>">
                                <input name="BOOK_QUANTITY" type="hidden" value="<%=r.getString("BOOK_QUANTITY") %>">
                                <% 
                                    if(Integer.parseInt(r.getString("BOOK_QUANTITY")) > 0){ 
                                %>  
                                    <input type="submit" value="-" name="button" class="collection_button">
                                <%
                                    }
                                %>
                                <%=r.getString("BOOK_QUANTITY") %> 
                                <input type="submit" value="+" name="button" class="collection_button">
                            </form>
                        </td>
                    </tr>
                    <% }
                    %>
                    <tr>
                        <td>            
                            
                        </td>  
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </form>
        
        <br>
        <br>
        <form action="Edit_Collections" method="POST" enctype="multipart/form-data">
            <table class="form_table">
                <tr>
                    <td>
                        <!-- Change to uploading a book cover-->
                        <b>Book cover:</b>
                    </td>
                    <td class="input_td">
                        <input type="file" name="cover">
                    </td>
                    <td>
                        <b>Type: </b>
                    </td>
                    <td class="input_td">
                        <select name="type">
                            <option></option>
                            <option>Literature</option>
                            <option>Sci-fi</option>
                            <option>Programming</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Title: </b>
                    </td>
                    <td class="input_td">
                        <input type="text" name="title">
                    </td>
                    <td>
                        <b>Description: </b>
                    </td>
                    <td class="input_td">
                        <input name="description">
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Author: </b>
                    </td>
                    <td class="input_td">
                        <input type="text" name="author">
                    </td>
                    <td>
                        <b>Quantity: </b>
                    </td>
                    <td class="input_td">
                        <input name="quantity">
                    </td>
                </tr>
                
                
            </table>
            <center>
                <div class="buttons">
                    <input class="submit" type="submit" value="Add">
                </div>
            </center>
        </form>
     </center>

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

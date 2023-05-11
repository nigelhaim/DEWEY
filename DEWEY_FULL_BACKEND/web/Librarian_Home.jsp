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
                                    <td><input type="submit" name="button" value="returned"></td>
                                    <td><input type="submit" name="button" value="delete"></td>
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

    </body>
</html>

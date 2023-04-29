<%-- 
    Document   : message
    Created on : 04 15, 23, 11:22:02 AM
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
          <center>
        <h3><%=request.getAttribute("Message")%></h3>
    </center>
    </body>
</html>

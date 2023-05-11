<%-- 
    Document   : login
    Created on : 05 8, 23, 10:02:55 AM
    Author     : nigel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        table{
            width: 100%;
            text-align: center;
        }
    </style>
    <body>
        <center>
        <h1>MEMBERS</h1>
        <table>
            <tr>
                <th>Username</th>
                <th>Password</th>
            </tr>
            <tr>
                <td>Member1NealG</td>
                <td>PassNeal</td>
            </tr>
        </table>

        <h1>LIBRARIANS</h1>
        <table>
            <tr>
                <th>Username</th>
                <th>Password</th>
            </tr>
            <tr>
                <td>Lib1NathanielS</td>
                <td>PassNatheniel</td>
            </tr>
        </table>
        <form action="login" method="POST">
            <input type="text" name="username" placeholder="username"> 
            <input type="text" name="password" placeholder="password">
            <input type="submit" value="login">
        </form>
        </center>
    </body>
</html>

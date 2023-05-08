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
    <body>
        <table>
            <tr>
                <th>MEMBERS</th>
            </tr>
            <tr>
                <th>Username</th>
                <th>Password</th>
                <th>Role</th>
            </tr>
            <tr>
                <td>Member1NealG</td>
                <td>PassNeal</td>
            </tr>
            <tr>
                <td>Member2KristinR</td>
                <td>PassKristin</td>
            </tr>
        </table>

        <table>
            <tr>
                <th>LIBRARIANS</th>
            </tr>
            <tr>
                <th>Username</th>
                <th>Password</th>
                <th>Role</th>
            </tr>
            <tr>
                <td>Lib1NathanielS</td>
                <td>PassNatheniel</td>
            </tr>
            <tr>
                <td>Lib2NigelS</td>
                <td>PassNigel</td>
            </tr>
        </table>
        <form action="login" method="POST">
            <h1>Username</h1>
            <input type="text" name="username"> 
            <input type="text" name="password">
            <input type="submit" value="login">
        </form>
    </body>
</html>

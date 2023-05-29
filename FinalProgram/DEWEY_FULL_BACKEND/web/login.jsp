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
        <link rel="stylesheet" href="logincss.css">
    </head>
    <style>
        table{
            width: 100%;
            text-align: center;
        }
    </style>
    <body>
        <div class="wrapper">
            <%
                String role = (String) session.getAttribute("role");
            %>
            <nav class="navbar">
                <img class="logo" src="Pictures/DEWEY.png">
            </nav>
            <!--
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
        -->
        <div class="center">
                <h1>Dewey Library System</h1>
                <div class="form-border"><form action="login" method="POST">
                        <br><label for="user"><b>Username:</b></label>
                        <input type="text" placeholder="Enter Username" name="username" required><br>
                        <label for="pass"><b>Password:</b></label>
                        <input type="password" placeholder="Enter Password" name="password" required>
                        <div class="button">
                            <button>Login</button>
                        </div>
                </div>
            </div>
        </div>
        
        <div class="wrapper2">
            <nav class="navbar2">
                <ul>
                    <li>Dewey - 2023 |</li>
                    <li><a href="AboutUs.jsp">About Us</a></li>
                    <div class="right">
                        <p>Contact Us | group1@gmail.com</p>
                </ul>
            </nav>
        </div>
        </form>
        </center>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Dewey Library System - Log In</title>
        <link rel="stylesheet" href="/FAPGRP1/css/styles.css">
        <link rel="icon" href="/FAPGRP1/icons/favicon.png" type="image/png">
    </head>
    <body>
        <div class="wrapper">
            <nav class="navbar">
                <img class="logo" src="Pictures/DEWEY.png">
                <ul>
                    <li><a href="Discover.jsp">Discover</a></li>
                    <li><a href="Home.jsp">Home</a></li>
                    <li><a class="active" href="#">Login</a></li>
                    <li><a href="Search.jsp">Search</a></li>
                </ul>
            </nav>
            <div class="center">
                <h1>Dewey Library System</h1>
                <div class="form-border"><form action="JdbcController">
                        <br><label for="user"><b>Username:</b></label>
                        <input type="text" placeholder="Enter Username" name="user" required><br>
                        <label for="pass"><b>Password:</b></label>
                        <input type="password" placeholder="Enter Password" name="pass" required>
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
    </body>
</html>
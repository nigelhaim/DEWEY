<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Book Search</title>
        <link rel="stylesheet" href="/FAPGRP1/css/styles.css">
        <link rel="icon" href="/FAPGRP1/icons/favicon.png" type="image/png">
        <style>
            .center-img {
                display: block;
                margin-left: auto;
                margin-right: auto;
            }

            h2 {
                text-align: center;
            }
            a {
                text-decoration: none;
                color: #115A7D;
            }
            img {
                height: 350px;
                width: 355px;
                margin-bottom: 10px;
                margin-right: 50px;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">

            <nav class="navbar">
                <img class="logo" src="Pictures/DEWEY.png">
                <ul>
                    <li><a href="Discover.jsp">Discover</a></li>
                    <li><a href="Home.jsp">Home</a></li>
                    <li><a href="index.jsp">Logout</a></li>
                    <li><a href="#">Search</a></li>
                </ul>
            </nav>

            <div class="center">
                <img class="center-img" src="Pictures/406.png" alt="Error404.png"/>
                <h1>Uh oh! You don't have any books to borrow!</h1>
                <h2>Click <a href="Home.jsp">here</a> to go back</h2>        
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

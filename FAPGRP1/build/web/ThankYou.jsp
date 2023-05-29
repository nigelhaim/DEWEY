<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Dewey Library System - Thank You!</title>
        <link rel="stylesheet" href="/FAPGRP1/css/styles.css">
        <link rel="icon" href="/FAPGRP1/icons/favicon.png" type="image/png">
        <style>
            .center h1{
                color: #115A7D;
                font-size: 50px;
                width: 900px;
                font-weight: bold;
                text-align: center;
                margin-bottom: 50px;
                position: absolute;
                top: 25%;
                left: 50%;
                transform: translate(-50%, -50%);
                font-family: sans-serif;
            }
            .center h2{
                color: #115A7D;
                font-size: 50px;
                width: 900px;
                font-weight: bold;
                text-align: center;
                margin-bottom: 50px;
                position: absolute;
                top: 37%;
                left: 50%;
                transform: translate(-50%, -50%);
                font-family: sans-serif;
            }
            .center h3{
                color: #115A7D;
                font-size: 40px;
                width: 900px;
                font-weight: normal;
                text-align: center;
                margin-bottom: 50px;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                font-family: sans-serif;
            }
            .center .button{
                color: #115A7D;
                font-size: 50px;
                width: 900px;
                font-weight: bold;
                text-align: center;
                margin-bottom: 50px;
                position: absolute;
                top: 65%;
                left: 50%;
                transform: translate(-50%, -50%);
                font-family: sans-serif;
            }
            .button button{
                height: 40px;
                width: 100px;
                font-size: 812x;
                font-weight: 600;
                color: white;
                background: #115A7D;
                outline: none;
                cursor: pointer;
                border: 1px solid white;
                border-radius: 25px;
                transition: .4s;
            }
            .button button:hover{
                background: black;
                color: white;
            }
            a {
                text-decoration: none;
            }
            a:visited {
                text-decoration: none;
                color: white;
            }
        </style>
    </head>
    <body>
        <nav class="navbar">
            <img class="logo" src="Pictures/DEWEY.png">
            <ul>
                <li><a href="Discover.jsp">Discover</a></li>
                <li><a href="Home.jsp">Home</a></li>
                <li><a href="index.jsp">Logout</a></li>
                <li><a href="Search.jsp">Search</a></li>
            </ul>
        </nav>

        <div class="center">
            <h1>THANK YOU FOR</h1>
            <h2>BORROWING A BOOK !</h2>
            <h3>We hope you enjoy reading it.</h3>

            <div class="button">
                <button><a href="Home.jsp">Return</button>
            </div>
        </div>

        <div class="wrapper2">
            <nav class="navbar2">
                <ul>
                    <li>Dewey - 2023 |</li>
                    <li><a href="About.jsp">About Us</a></li>
                    <div class="right">
                        <p>Contact Us | group1@gmail.com</p>
                    </div>
                </ul>
            </nav>
        </div>
    </body>
</html>
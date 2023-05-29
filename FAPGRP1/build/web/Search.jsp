<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Dewey Library System - Search</title>
        <link rel="stylesheet" href="/FAPGRP1/css/styles.css">
        <link rel="icon" href="/FAPGRP1/icons/favicon.png" type="image/png">
        <style>
            .wrapper .center{
                position: absolute;
                left: 50%;
                top: 40%;
                transform: translate(-50%, -50%);
                font-family: sans-serif;
                user-select: none;
            }
            .form-row {
                display: flex;
                flex-wrap: wrap;
                margin-bottom: 10px;
            }

            .form-col {
                flex: 1;
                padding-right: 10px;
            }

            input[type="text"], select {
                border-radius: 10px;
                background-color: #f2f2f2;
                padding: 5px;
                border: none;
                width: 70%;
                height: 25px;
                font-size: 16px;
                color: #333;
                display: inline-block;
            }

            label {
                display: inline-block;
                text-align: right;
                margin-right: 10px;
                padding-top: 5px;
                color: #115A7D;
                font-size: 20px;
                font-weight: bold;
            }
            .center .button{
                color: #115A7D;
                font-size: 50px;
                width: 900px;
                font-weight: bold;
                text-align: center;
                margin-bottom: 50px;
                position: absolute;
                left: 45%;
                transform: translate(-50%, -50%);
                font-family: sans-serif;
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
                    <li><a href="index.jsp">Login</a></li>
                    <li><a class="active" href="#">Search</a></li>
                </ul>
            </nav>

            <div class="center">
                <h1>Search</h1>
                <form action="">
                    <div class="form-row">
                        <div class="form-col">
                            <label for="book-id">Book ID:</label>
                            <input type="text" id="book-id" name="book-id">
                        </div>
                        <div class="form-col">
                            <label for="book-title">Title:</label>
                            <input type="text" id="book-title" name="book-title">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-col">
                            <label for="book-author">Author:</label>
                            <input type="text" id="book-author" name="book-author">
                        </div>
                        <div class="form-col">
                            <label for="book-type">Type:</label>
                            <select id="book-type" name="book-type">
                                <option value="">Select a type</option>
                                <option value="fiction">Fiction</option>
                                <option value="non-fiction">Non-Fiction</option>
                                <option value="biography">Biography</option>
                                <option value="memoir">Memoir</option>
                            </select>
                        </div>
                    </div>
                    <div class="button">
                        <button>Search</button>
                    </div>
                </form>
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

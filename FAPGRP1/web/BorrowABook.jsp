<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Dewey Library System - Borrow A Book</title>
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
                    <li><a href="index.jsp">Login</a></li>
                    <li><a href="Search.jsp">Search</a></li>
                </ul>
            </nav>
        </div>
        <div class="main">
            <center><h1 class="header_collections">Collections</h1></center>
            <br>
            <form action="CheckOut.jsp">
                <table class="Borrow_list">
                    <tr>
                        <th></th>
                        <th>BookID</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Type</th>
                        <th>Description</th>
                        <th>Qty</th>
                        <th>Available</th>
                    </tr>
                    <tr>
                        <td><img src="Pictures/TheAlchemist.jpg" class="book_cover"></td>
                        <td>1234</td>
                        <td>The Alchemist</td>
                        <td>Paulo Coelho</td>
                        <td>Literature</td>
                        <td>This Book...</td>
                        <td class="cell_quantity"><input type="number" class="quantity2" placeholder="0"></td>
                        <td>5</td>
                    </tr>
                    <tr>
                        <td><img src="Pictures/Time.jpg" class="book_cover"></td>
                        <td>1234</td>
                        <td>The Time Keeper</td>
                        <td>Mitch Albom</td>
                        <td>Literature</td>
                        <td>This Book...</td>
                        <td class="cell_quantity"><input type="number" class="quantity2" placeholder="0"></td>
                        <td>5</td>
                    </tr>
                </table>
                <center><input type="submit" value="Checkout" class="Checkout"></center>
            </form>
        </div>

        <br>
        <br>
        <br>
        <br>
        <br>

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
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Dewey Library System - Inventory</title>
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
            <center>
                <h1 class="inventory">INVENTORY</h1>
            </center>
            <br>
            <form action="AddABook.jsp">
                <table class="Header_List">
                    <tr>
                        <th></th>
                        <th>Member ID</th>
                        <th>Book ID</th>
                        <th>Title</th>
                        <th>Status</th>
                        <th>Quantity</th>
                        <th>Available</th>
                    </tr>
                    <tr class="info"> 
                        <td></td>
                        <td>0327</td>
                        <td>1234</td>
                        <td>The Alchemist</td>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                    </tr>
                    <tr class="info"> 
                        <td></td>
                        <td>0</td>
                        <td>1235</td>
                        <td>The Time Keeper</td>
                        <td>0</td>
                        <td>0</td>
                        <td>5</td>
                    </tr>
                </table>
                <center><input type="submit" value="Edit Collection" class="Checkout"></center>
            </form>

        </div>
        <div class="wrapper2">
            <nav class="navbar2">
                <ul>
                    <li>Dewey - 2023 |</li>
                    <li><a href="AboutUs.jsp">About Us</a></li>
                    <div class="right">
                        <p>Contact Us | group1@gmail.com</p>
                    </div>
                </ul>
            </nav>
        </div>

    </body>
</html>
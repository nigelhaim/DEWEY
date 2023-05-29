
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Dewey Library System - Check Out</title>
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
                    <li><a href="index.jsp">Logout</a></li>
                    <li><a href="Search,jsp">Search</a></li>
                </ul>
            </nav>
        </div>
        <div class="main">
            <center><h1 class="header_checkout">CHECKOUT</h1></center>
            <br>
            <form action="/">
                <table class="Checkout_list">
                    <tr>
                        <th></th>
                        <th>Book ID</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Quantity</th>
                        <th>Due Date</th>
                    </tr>
                    <tr class="info"> 
                        <td></td>
                        <td>1234</td>
                        <td>The Alchemist</td>
                        <td>Paulo Coelho</td>
                        <td>2</td>
                        <td>April 20, 2023</td>
                    </tr>
                </table>
            </form>
            <form method="POST" action="#">
                <input type="submit" value="Submit" class="Submit"/>
            </form>

            <form method="POST" action="#">
                <input type="submit" value="Return" class="Return"/>
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
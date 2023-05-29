<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Add a book inventory</title>
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
            <center><h1 class="header_collections">Add a Book</h1></center>
            <table class="stock">
                <tr>
                    <th>Book ID</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Type</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Quantity</th>
                </tr>
                <tr>
                    <td>1234</td>
                    <td>The Alchemist</td>
                    <td>Paulo Coelho</td>
                    <td>Literature</td>
                    <td>This book...</td>
                    <td>
                        <select class="status">
                            <option>Available</option>
                            <option>Borrowed</option>
                            <option>Out of stock</option>
                        </select>
                    </td>
                    <td class="quantity">
                        <input type="number" placeholder="0" class="input_quantity">
                    </td>
                </tr>
                <tr>
                    <td>1235</td>
                    <td>The Time Keeper</td>
                    <td>Mitch Albom</td>
                    <td>Literature</td>
                    <td>This book...</td>
                    <td>
                        <select class="status">
                            <option>Available</option>
                            <option>Borrowed</option>
                            <option>Out of stock</option>
                        </select>
                    </td>
                    <td class="quantity">
                        <input type="number" placeholder="0" class="input_quantity">
                    </td>
                </tr>
            </table>
            <br>
            <br>
            <form action="/">
                <table class="form_table">
                    <tr>
                        <td>
                            <!-- Change to uploading a book cover-->
                            <b>Book ID: </b>
                        </td>
                        <td class="input_td">
                            <input class="form_input" type="number">
                        </td>
                        <td>
                            <b>Type: </b>
                        </td>
                        <td class="input_td">
                            <select>
                                <option></option>
                                <option>Literature</option>
                                <option>Sci-fi</option>
                                <option>Educational</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Title: </b>
                        </td>
                        <td class="input_td">
                            <input class="form_input" type="text">
                        </td>
                        <td>
                            <b>Description: </b>
                        </td>
                        <td class="input_td">
                            <!--Change to textarea-->
                            <input class="form_input" type="text">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Author: </b>
                        </td>
                        <td class="input_td">
                            <input class="form_input" type="text">
                        </td>
                    </tr>           
                </table>
                <center>
                    <div class="buttons">
                        <input class="submit" type="submit" value="Add">
                        <input class="submit" type="submit" value="Save Changes">
                        <input class="submit" type="submit" value="Delete">
                    </div>
                </center>
            </form>
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

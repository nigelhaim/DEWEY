<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Dewey Library System</title>
        <link rel="stylesheet" href="/FAPGRP1/css/styles.css">
        <link rel="icon" href="/FAPGRP1/icons/favicon.png" type="image/png">
        <style>
            .center h1{
                position: absolute;
                left: 50%;
                top: 55%;
                transform: translate(-50%, -50%);
                font-family: sans-serif;
                user-select: none;
                text-align: center;
                color: #115A7D;
                font-size: 50px;
                font-weight: normal;
                width: 900px;
                margin-top: -260px;
            }
            p{
                color: white;
                font-size: 20px;
                font-family: sans-serif;
            }
            .book img {
                max-width: 100%;
                height: 350px;
                width: 250px;
                margin-right: 0;
                margin-bottom: 10px;
                z-index: 1000;
            }
        </style>
    </head>
    <body>

        <nav class="navbar">
            <img class="logo" src="Pictures/DEWEY.png">
            <ul>
                <li><a href="Discover.jsp">Discover</a></li>
                <li><a class="active">Home</a></li>
                <li><a href="index.jsp">Login</a></li>
                <li><a href="Search.jsp">Search</a></li>
            </ul>
        </nav>

        <div class="center">
            <h1><b>Top Books in</b> 2023</h1>
        </div>

        <div class="books">
            <div class="book">
                <a href="https://www.amazon.com/Spare-Prince-Harry-Duke-Sussex/dp/0593593804" target="_blank">
                    <img src="Pictures/Spare.jpg" alt="Book 1">
                </a>
                <h2>Spare</h2>
                <p>Prince Harry</p>
            </div>

            <div class="book">
                <a href="https://www.amazon.com/Cold-People-Tom-Rob-Smith/dp/1982198400" target="_blank">
                    <img src="Pictures/Cold.jpg" alt="Book 2">
                </a>
                <h2>Cold People</h2>
                <p>Tom Rob Smith</p>
            </div>

            <div class="book">
                <a href="https://www.amazon.com/Guest-Novel-Emma-Cline/dp/0812998626" target="_blank">
                    <img src="Pictures/Guest.jpg" alt="Book 3">
                </a>
                <h2>The Guest</h2>
                <p>Emma Cline</p>
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

        <script>
            window.addEventListener('scroll', function () {
                var wrapper2 = document.querySelector('.wrapper2');
                if (window.scrollY + window.innerHeight >= document.body.scrollHeight) {
                    wrapper2.style.display = 'block';
                } else {
                    wrapper2.style.display = 'none';
                }
            });
        </script>

    </body>
</html>
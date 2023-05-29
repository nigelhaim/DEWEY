
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <title>Dewey Library System - Discover</title>
    <link rel="stylesheet" href="/FAPGRP1/css/styles.css">
    <link rel="icon" href="/FAPGRP1/icons/favicon.png" type="image/png">
    <style>
        .wrapper2{
            z-index: 0;
        }
        .center .button{
            margin-left: 215px;
            margin-top: 20px;
        }
        .button button{
            height: 50px;
            width: 120px;
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

        .navbar2{
            z-index: 1;
        }
    </style>
</head>

<nav class="navbar">
    <img class="logo" src="Pictures/DEWEY.png">
    <ul>
        <li><a class="active">Discover</a></li>
        <li><a href="Home.jsp">Home</a></li>
        <li><a href="index.jsp">Login</a></li>
        <li><a href="Search.jsp">Search</a></li>
    </ul>
</nav>

<div class="genre">

    <div class="science">
        <h1>Science</h1>

        <a href="https://www.amazon.com/Existential-Physics-Scientists-Biggest-Questions/dp/1984879456" target="_blank">
            <img src="Pictures/Exist.jpg" alt="Science 1">
        </a>

        <a href="https://www.amazon.com/Breathless-Scientific-Defeat-Deadly-Virus/dp/1982164360" target="_blank">
            <img src="Pictures/Breathless.jpg" alt="Science 2">
        </a>

    </div>


    <div class="literature">
        <h1>Literature</h1>

        <a href="https://www.amazon.com/Alchemist-Paulo-Coelho/dp/0061122416" target="_blank">
            <img src="Pictures/Alchemist.jpg" alt="Literature 1">
        </a>

        <a href="https://www.amazon.com/Time-Keeper-Mitch-Albom/dp/0316311537" target="_blank">
            <img src="Pictures/Time.jpg" alt="Literature 2">
        </a>


    </div>

    <div class="science">
        <h1>Science</h1>

        <a href="https://www.amazon.com/Existential-Physics-Scientists-Biggest-Questions/dp/1984879456" target="_blank">
            <img src="Pictures/Exist.jpg" alt="Science 1">
        </a>

        <a href="https://www.amazon.com/Breathless-Scientific-Defeat-Deadly-Virus/dp/1982164360" target="_blank">
            <img src="Pictures/Breathless.jpg" alt="Science 2">
        </a>

        <div class="center">
            <div class="button">
                <button><a href="BorrowABook.jsp">Borrow a Book</a></button>
            </div>
        </div>
    </div>


    <div class="literature">
        <h1>Literature</h1>

        <a href="https://www.amazon.com/Alchemist-Paulo-Coelho/dp/0061122416" target="_blank">
            <img src="Pictures/Alchemist.jpg" alt="Literature 1">
        </a>

        <a href="https://www.amazon.com/Time-Keeper-Mitch-Albom/dp/0316311537" target="_blank">
            <img src="Pictures/Time.jpg" alt="Literature 2">
        </a>

        <div class="center">
            <div class="button">
                <button><a href="CheckOut.jsp">View Cart</a></button>

            </div>
        </div>


        <br>
        <br>
        <br>
        <br>
        <br>

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



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- Font Awesome -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
            rel="stylesheet"
        />
        <!-- Stylesheet -->
        <link rel="stylesheet" href="./css/style.css" />
        <link rel="stylesheet" href="./css/entry.css" />
        <!--icon-->
        <link rel = "icon" href = "https://img.icons8.com/?size=512&id=lN6N18z2m6lx&format=png" type = "image/x-icon">
        <title>Login</title>
    </head>
    <body>           
        <form class="container" action="login" method="post">
            <h3 class="title">Login</h3>
            
            <input type="text" class="inputText" name="user" placeholder="User Name" value="${user}" required>
            <input type="password" class="inputText" name="pass" placeholder="Password" required>
            <p class="msg">${msg}</p>
            <p class="msgGreen">${msgGreen}</p>
            
            <input type="submit" value="Login" class="button">
            
            <h5 class="detail">Dont have account?<a href="register">  Signup</a> </h5> 
        </form>
    </body>
</html>


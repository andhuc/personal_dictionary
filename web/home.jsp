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
        <link rel="stylesheet" href="./css/home.css" />
        <!--icon-->
        <link rel = "icon" href = "https://img.icons8.com/?size=512&id=lN6N18z2m6lx&format=png" type = "image/x-icon">
        <title>Hello ${sessionScope.user.username},</title>
    </head>
    <body>
        <div class="container">
            <h3 class="title">Hello ${sessionScope.user.username}, </h3>
            
            <div class="control">
                <a class="button" href="set">
                    <img src="https://img.icons8.com/?size=512&id=843&format=png">
                    View your sets
                </a>
                
                <a class="button" href="dictionary.jsp">
                    <img src="https://img.icons8.com/?size=512&id=37917&format=png">
                    Dictionary
                </a>

                <a class="button" href="translate.jsp">
                    <img src="https://img.icons8.com/?size=512&id=12455&format=png">
                    Translate
                </a>
                
            </div>
            <h5 class="detail">
                <a href="logout">Log out</a> 
                <!--<a href="profile">Profile</a>-->
            </h5>
        </div>
    </body>
</html>


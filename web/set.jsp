<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <link rel="stylesheet" href="./css/set.css" />
        <!--icon-->
        <link rel = "icon" href = "https://img.icons8.com/?size=512&id=lN6N18z2m6lx&format=png" type = "image/x-icon">
        <title>Your sets</title>
    </head>
    <body>
        <div class="container">
            <h3 class="title">Your sets</h3>

            <ul class="scrollable">
                <li class="element">
                    <input type="text" class="inputText" id="filter" placeholder="Filter..." value="" oninput="doFilter(this.value)">
                </li>
                <li class="element">
                    <input type="text" class="inputText" id="newSet" placeholder="Enter new set" value="">
                    <div class="button" onclick="addSet()">
                        <img src="https://img.icons8.com/?size=512&id=37784&format=png">
                    </div>
                </li>

                <c:forEach items="${listSetAdmin}" var="i">
                    <li class="element">
                        <a style="background-color: #faa3a3; width: 95%;" href="word?setId=${i.id}" class="set">${i.name}<c:if test="${sessionScope.user.status eq 'admin'}">  -  ${i.owner}</c:if></a>
<!--                        <a style="background-color: #faa3a3;" class="button" onclick="deleteSet(${i.id})">
                            <img src="https://img.icons8.com/?size=512&id=37783&format=png">
                        </a>-->
                    </li>
                </c:forEach>

                <c:forEach items="${listSet}" var="i">
                    <li class="element">
                        <a href="word?setId=${i.id}" class="set">${i.name}<c:if test="${sessionScope.user.status eq 'admin'}">  -  ${i.owner}</c:if></a>
                        <a class="button" onclick="deleteSet(${i.id})">
                            <img src="https://img.icons8.com/?size=512&id=37783&format=png">
                        </a>
                    </li>
                </c:forEach>

            </ul>

            <h5 class="detail">
                <a href="home">Back</a> 
                <a onclick="importSet()">Import</a> 
            </h5>
        </div>

        <div class="dialog">
            <div>
                <p>Are you sure?</p>
                <button onclick="dialogConfirm(true)">Yes</button>
                <button onclick="dialogConfirm(false)">No</button>
            </div>
        </div>
        
        <div class="dialog msgBox">
            <div>
                <p class="msg"></p>
                <button onclick="closeBox()">OK</button>
            </div>
        </div>

        <script>
            function doFilter(s) {
                
                let elementList = document.querySelectorAll('.element')
                for(let i of elementList) {
                    
                    let a = i.querySelector('.set')
                    
                    if(a && !a.textContent.toLowerCase().includes(s.toLowerCase()))
                        i.style.display = 'none'
                    else i.style.display = 'flex'
                    
                }
                
            }
            
            function deleteSet(id) {

//                if (confirm("Are you sure?"))
//                    window.location.href = "deleteSet?setId=" + id
                state = "deleteSet?setId=" + id
                getConfirm()

            }

            function addSet() {
                let newSet = document.querySelector("#newSet")

                if (newSet.value.trim() != "") {
                    window.location.href = "addSet?name=" + newSet.value
                } else
                    showMessage("Please enter your Set name")

            }

            function importSet() {

                let input = prompt("Enter your share link: ").trim()

                if (input) {

                    if (input.includes(":"))
                        window.location.href = "importSet?s=" + input
                    else
                        showMessage("Input wrong format!")

                } else
                    showMessage("Input cant be empty!")

            }
            
            let state = ''
            const dialog = document.querySelector('.dialog')
            const msg = document.querySelector('.msg')
            const messageBox = document.querySelector('.msgBox')

            function dialogConfirm(userState) {

                dialog.style.display = 'none'
                
                if(userState) {
                    
                    if(state.includes('delete'))
                        window.location.href = state
                    
                }
                
                state = ''
            }

            function getConfirm() {

                dialog.style.display = 'flex'
                
            }
            
            function showMessage(s) {
                
                msg.textContent = s
                messageBox.style.display = 'flex'
                
            }
            
            function closeBox() {
                
                messageBox.style.display = 'none'
                
            }
            
            //event Eneter key
            document.addEventListener('keydown', function (event) {
                if (event.keyCode === 13) {
                    addSet()
                }
            })
        </script>
    </body>
</html>


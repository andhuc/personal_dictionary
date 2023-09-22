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
        <link rel="stylesheet" href="./css/word.css" />
        <!--icon-->
        <link rel = "icon" href = "https://img.icons8.com/?size=512&id=lN6N18z2m6lx&format=png" type = "image/x-icon">
        <title>${setName}</title>
    </head>
    <body>
        <div class="container">
            <h3 class="title">${setName}</h3>

            <ul class="scrollable">
                <li class="element">
                    <input type="text" class="inputText" id="filter" placeholder="Filter..." value="" oninput="doFilter(this.value)">
                </li>
                
                <li class="element">
                    <input type="text" class="inputText" id="key" placeholder="Enter new word" value="" required>
                    <input type="text" class="inputText" id="value" placeholder="Enter meaning" value="" required>
                    <div class="button" onclick="addWord()">
                        <img src="https://img.icons8.com/?size=512&id=37784&format=png">
                    </div>
                    <div class="button" onclick="renameSet()">
                        <img src="https://img.icons8.com/?size=512&id=99467&format=png">
                    </div>
                </li>

                <c:forEach items="${listWord}" var="i">
                    <li class="element">
                        <input type="text" class="inputText w" value="${i.word}" id="word${i.id}">
                        <input type="text" class="inputText m" value="${i.meaning}" id="meaning${i.id}">
                        <div class="button" onclick="deleteWord(${i.id})">
                            <img src="https://img.icons8.com/?size=512&id=37783&format=png">
                        </div>
                        <div class="button" onclick="editWord(${i.id})">
                            <img src="https://img.icons8.com/?size=512&id=H5dKJanZkZNk&format=png">
                        </div>
                    </li>
                </c:forEach>



            </ul>

            <div class="detail">
                <a href="set">Back</a> 
                <a onclick="share('${shareString}')">Share</a> 
                <a onclick="practice(${listSize})">Practice</a> 
            </div>
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
            const setId = new URLSearchParams(window.location.search).get('setId')
            
            function doFilter(s) {
                
                let elementList = document.querySelectorAll('.element')
                for(let i of elementList) {
                    
                    let w = i.querySelector('.w')
                    let m = i.querySelector('.m')

                    if(w && m && !w.value.toLowerCase().includes(s.toLowerCase()) && !m.value.toLowerCase().includes(s.toLowerCase()))
                        i.style.display = 'none'
                    else i.style.display = 'flex'
                    
                }
                
            }

            function deleteWord(id) {

//                if (confirm("Are you sure?"))
//                    window.location.href = "deleteWord?word=" + id + "&setId=" + setId
                getConfirm()
                state = "deleteWord?word=" + id + "&setId=" + setId

            }

            function addWord() {
                let key = document.querySelector("#key").value.trim()
                let value = document.querySelector("#value").value.trim()
                console.log(key)

                if (key != "" && value != "") {

                    if (!key.includes(";") && !key.includes(":") && !value.includes(";") && !value.includes(":"))
                        window.location.href = "addWord?key=" + key + "&value=" + value + "&setId=" + setId
                    else
                        showMessage("Please dont enter , and :")

                } else
                    showMessage("Please fill full the information!")

            }

            function editWord(id) {
                if (confirm("Are you sure edit this word")) {

                    let key = document.querySelector("#word" + id)
                    let value = document.querySelector("#meaning" + id)

                    if (key.value.trim() != "" && value.value.trim() != "") {
                        window.location.href = "editWord?key=" + key.value + "&value=" + value.value + "&id=" + id + "&setId=" + setId
                    } else
                        showMessage("Please fill full the information!")

                }

            }

            function renameSet() {
                if (confirm("Do you want to rename this Set?")) {
                    let input = prompt("Enter a new name:")

                    if (input.trim()) {
                        window.location.href = "renameSet?name=" + input + "&setId=" + setId
                    } else
                        showMessage("New name cant be empty")
                }

            }

            function share(string) {

                if (string) {
                    navigator.clipboard.writeText(string)
                    showMessage("Copied to clipboard")
                } else
                    showMessage("Nothing to share")

            }

            function practice(size) {

                if (size < 4)
                    showMessage("Not enough word to practice. At least 4 words!")
                else
                    window.location.href = "practice?setId=" + setId

            }

            let state = ''
            const dialog = document.querySelector('.dialog')
            const msg = document.querySelector('.msg')
            const messageBox = document.querySelector('.msgBox')

            function dialogConfirm(userState) {

                dialog.style.display = 'none'

                if (userState) {

                    if (state.includes('delete'))
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
                    addWord()
                }
            })
        </script>
    </body>
</html>


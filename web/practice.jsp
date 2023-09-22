 <%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> -->
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
        <link rel="stylesheet" href="./css/practice.css" />
        <!--icon-->
        <link rel = "icon" href = "https://img.icons8.com/?size=512&id=lN6N18z2m6lx&format=png" type = "image/x-icon">
        <title>${setName}</title>
    </head>
    <body>
        <div class="container">
            <h3 class="title">${setName}</h3>

            <h3 class="title record">Score: 0/0</h3>

            <div class="question title">
                D?
            </div>

            <div class="answer">
                <div class="button option" onclick="answer(0)">A</div>
                <div class="button option" onclick="answer(1)">A</div>
                <div class="button option" onclick="answer(2)"">A</div>
            </div>

            <div class="detail">
                <a href="word?setId=${setId}">Back</a> 
            </div>
        </div>
            
        <script>
            const setId = new URLSearchParams(window.location.search).get('setId')
            const listWord = ${listWord}
            const listMeaning = ${listMeaning}
            const size = ${listSize} - 1
            
            const question = document.querySelector(".question");
            const ansElement = document.querySelectorAll(".option");
            const record = document.querySelector(".record");
            const ans = [-1,-1,-1]
            
            let lastQuestion = -1
            let questionId = -1
            let totalQuestion = 1
            let rightAnswer = 0
            let recordText = 'Score: '
            
            function answer(i) {
                //correct answer
                if(ans[i] === quesitonId) {
                    rightAnswer++
                    recordText = '✅Score: '
                } else recordText = '❌Score: '
                
                //update score
                record.textContent = recordText + rightAnswer + '/' + totalQuestion
                
                totalQuestion++
                lastQuestion = quesitonId
                load()
            }
            
            function load(){
                //random question
                quesitonId = random(size)
                while(quesitonId === lastQuestion) quesitonId = random(size)
                question.textContent = listWord[quesitonId]
                
                //set correct answer
                ans.fill(-1)
                ans[random(2)] = quesitonId 
                let temp = []
                temp.push(quesitonId)
                
                //random answer for each answer
                for(let i=0; i<ansElement.length; i++)
                    if(ans[i] === -1) {
                        let t = random(size)
                        while(temp.includes(t)) t = random(size)
                        
                        ans[i] = t
                        ansElement[i].textContent = listMeaning[t]
                        temp.push(t)
                    } else ansElement[i].textContent = listMeaning[quesitonId]
                
//                console.log(quesitonId)
            }
            
            function random(n){
                return Math.floor(Math.random() * (n + 1))
            }
            
            load()
        </script>
    </body>
</html>


<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet" />
        <!-- Stylesheet -->
        <link rel="stylesheet" href="./css/style.css" />
        <link rel="stylesheet" href="./css/dictionary.css" />
        <!--icon-->
        <link rel="icon" href="https://img.icons8.com/?size=512&id=lN6N18z2m6lx&format=png" type="image/x-icon">
        <title>Dictionary</title>
    </head>

    <body>
        <div class="container">
            <h3 class="title">Dictionary</h3>

            <div class="content">

                <input type="text" class="inputText">

                <button class="button" onclick="search()">Search</button>

            </div>

            <p class="info boldText">Word:</p>
            <div class="content">

                <p class="info" id="word">........</p>

                <p class="info" id="phonetic"></p>

                <p class="info boldText" id="type"></p>

            </div>
            <p class="info boldText">Meaning:</p>
            <p class="info" id="meaning">........</p>

            <p class="info" id="meaning2" style="margin-bottom: 10%;"></p>

            <h5 class="detail"><a href="home">Back</a> </h5>
        </div>

        <script>

            const url = "https://api.dictionaryapi.dev/api/v2/entries/en/";
            const input = document.querySelector(".inputText");

            const word = document.querySelector("#word");
            const phonetic = document.querySelector("#phonetic");
            const type = document.querySelector("#type");
            const meaning = document.querySelector("#meaning");
            const meaning2 = document.querySelector("#meaning2");

            function search() {
                if(input.value.trim().length<1) {
                    alert("Cant input empty!");
                    return;
                }
                
                word.textContent = 'loading.....';
                meaning.textContent = 'loading.....';
                
                phonetic.textContent = '';
                type.textContent = '';
                meaning2.textContent = '';

                let inpWord = input.value;
                fetch(url + inpWord)
                    .then((response) => response.json())
                    .then((data) => {
                        // console.log(data[0]['meanings'][0]['definitions'][0]);

                        word.textContent = data[0]['word'];
                        phonetic.textContent = data[0]['phonetic'];
                        type.textContent = data[0]['meanings'][0]['partOfSpeech'];
                        meaning.textContent = data[0]['meanings'][0]['definitions'][0]['definition'];
                        meaning2.textContent = data[0]['meanings'][0]['definitions'][1]['definition'];
                    })
                    .catch(() => {
                        console.log('loi ' + inpWord);
                    });
            }

            document.addEventListener('keydown', function (event) {
                if (event.keyCode === 13) {
                    search();
                }
            })

        </script>
    </body>

    </html>
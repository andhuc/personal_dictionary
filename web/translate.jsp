<%@page contentType="text/html" pageEncoding="UTF-8"%>  
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
        <link rel="stylesheet" href="./css/translate.css" />
        <!--icon-->
        <link rel="icon" href="https://img.icons8.com/?size=512&id=lN6N18z2m6lx&format=png" type="image/x-icon">
        <title>Translate</title>
    </head>

    <body>
        <div class="container">
            <h3 class="title">Translate</h3>

            <div style="display: flex;flex-direction: row;align-items: center;">
                <textarea id="input" class="inputText" placeholder="Type something..." oninput="debouceTranslate()"></textarea>
                <select name="inputLang" id="from" onchange="translateText()">
                    <option value="en">ENG</option>
                    <option value="vi">VIE</option>
                    <option value="ja">JAP</option>
                </select>
            </div>

            <div style="display: flex;flex-direction: row;align-items: center;">
                <textarea id="output" class="inputText" placeholder="Translation" readonly></textarea>
                <select name="inputLang" id="to" onchange="translateText()">
                    <option value="en">ENG</option>
                    <option value="vi" selected>VIE</option>
                    <option value="ja">JAP</option>
                </select>
            </div>

            <h5 class="detail"><a href="home">Back</a> </h5>

            <a class="button" onclick="swap()">
                <img src="https://img.icons8.com/?size=512&id=45026&format=png">
            </a>
        </div>

        <script>

            const input = document.querySelector('#input')
            const output = document.querySelector('#output')
            const from = document.querySelector('#from')
            const to = document.querySelector('#to')

            async function translateText() {
                if (from.value == to.value) {
                    output.value = 'PLEASE SELECT TWO DISTINCT LANGUAGES'
                    return
                }

                const url = 'https://api.mymemory.translated.net/get?q=' + input.value + '&langpair=' + from.value + '|' + to.value

                try {
                    const response = await fetch(url)
                    const data = await response.json()

                    if (data.responseStatus === 200) {
                        output.value = data.responseData.translatedText

                        data.matches.forEach(data => {
                            if (data.id === 0) {
                                output.value = data.translation;
                            }
                        })
                    } else {
                        output.value = ''
                    }
                } catch (error) {
                    output.value = ''
                }
            }

            function swap() {

                let t = from.value
                from.value = to.value
                to.value = t

                t = input.value
                input.value = output.value
                output.value = t

            }

            let timer;
            let timeout = 250;

            function debouceTranslate() {
                clearTimeout(timer);
                timer = setTimeout(translateText, timeout);
            }

        </script>
    </body>

</html>
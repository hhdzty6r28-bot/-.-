<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>미리내님에게 온 편지</title>
    <style>
        body {
            background-color: #fce4ec;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: 'Malgun Gothic', sans-serif;
            overflow: hidden;
        }
        .card {
            background: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            text-align: center;
            width: 320px;
            position: relative;
        }
        h2 {
            color: #d81b60;
            margin-bottom: 30px;
            font-size: 22px;
            line-height: 1.4;
        }
        .btn-container {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }
        button {
            background-color: #e91e63;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.2s;
        }
        button:hover {
            background-color: #c2185b;
        }
        button.secondary {
            background-color: #e0e0e0;
            color: #333;
        }
        button.secondary:hover {
            background-color: #bdbdbd;
        }
        .heart-icon {
            font-size: 60px;
            cursor: pointer;
            background: none;
            border: none;
            margin: 20px 0;
        }
        .sub-text {
            color: #888;
            font-size: 13px;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <div class="card" id="card">
        <div id="content">
            <h2>편지지가 도착했어요! 💌</h2>
            <p class="sub-text">봉투를 눌러서 열어주세요</p>
            <button onclick="nextStep(1)">봉투 열기</button>
        </div>
    </div>

    <script>
        const steps = [
            `<h2>안녕하세요! 💖<br><br>누군가 미리내님에게<br>보낸 편지예요.</h2>
             <button class="heart-icon" onclick="nextStep(2)">❤️</button>
             <p class="sub-text">하트를 눌러주세요</p>`,
            
            `<h2>저를 많이 아껴주시나요? 🤔</h2>
             <div class="btn-container">
                <button onclick="nextStep(3)">네! ❤️</button>
                <button class="secondary" onclick="alert('다시 생각해보세요... 🥺')">아니요??</button>
             </div>`,

            `<h2>헤헷, 저도 미리내님을<br>많이 좋아해요 ❤️</h2>
             <button class="heart-icon" onclick="nextStep(4)">❤️</button>
             <p class="sub-text">하트를 눌러보세요</p>`,

            `<h2>요즘 어떻게 지내셔요?<br>보고 싶었어요 🥺</h2>
             <button class="heart-icon" onclick="nextStep(5)">❤️</button>
             <p class="sub-text">하트를 눌러주세요</p>`,

            `<h2>미리내님 좋아해요!<br>제 곁에 있어주셔서 감사해요오 💖</h2>
             <p class="sub-text">따뜻한 마음을 전합니다 ✨</p>`
        ];

        function nextStep(stepIndex) {
            const contentDiv = document.getElementById("content");
            contentDiv.innerHTML = steps[stepIndex];
        }
    </script>

</body>
</html>

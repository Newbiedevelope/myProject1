<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 | MyProject</title>

    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700;900&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet"/>

    <style>
        *, *::before, *::after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        :root {
            --bg: #f5f2ed;
            --surface: #ffffff;
            --border: #e2ddd6;
            --accent: #c8a96e;
            --accent-dk: #a8893e;
            --text-hd: #1a1714;
            --text-body: #3d3830;
            --text-mute: #8c7f6e;
            --danger: #b84d4d;
            --radius: 14px;
            --shadow: 0 4px 32px rgba(60,45,20,.08);
        }

        html, body {
            background: var(--bg);
            font-family: 'DM Sans', sans-serif;
            color: var(--text-body);
            min-height: 100%;
        }

        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background-image:
                    url("data:image/svg+xml,%3Csvg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.75' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.03'/%3E%3C/svg%3E");
            pointer-events: none;
            z-index: 0;
        }

        /* HEADER */
        header {
            position: relative;
            z-index: 2;
            width: 100%;
            padding: 42px 24px 30px;
            text-align: center;
            border-bottom: 1px solid var(--border);
            background: linear-gradient(to bottom, #fffcf7, var(--bg));
        }

        .brand-label {
            font-family: 'Playfair Display', serif;
            font-size: clamp(28px, 5vw, 48px);
            font-weight: 900;
            color: var(--text-hd);
            letter-spacing: -0.03em;
        }

        .brand-label span {
            color: var(--accent);
        }

        .tagline {
            margin-top: 10px;
            font-size: 12px;
            color: var(--text-mute);
            letter-spacing: 0.14em;
            text-transform: uppercase;
        }

        .accent-bar {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 12px;
            margin-top: 12px;
        }

        .accent-bar::before,
        .accent-bar::after {
            content: '';
            width: 48px;
            height: 1px;
            background: var(--accent);
            opacity: .5;
        }

        .accent-bar-dot {
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: var(--accent);
        }

        /* MAIN */
        main {
            position: relative;
            z-index: 1;
            min-height: calc(100vh - 180px);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 60px 24px;
        }

        .join-card {
            width: 100%;
            max-width: 520px;
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            overflow: hidden;
            animation: fadeUp .45s ease both;
        }

        .join-header {
            padding: 34px 36px 24px;
            border-bottom: 1px solid var(--border);
            background: linear-gradient(to bottom, #fffdf9, #fcfaf7);
        }

        .join-title {
            font-family: 'Playfair Display', serif;
            font-size: 34px;
            color: var(--text-hd);
            margin-bottom: 8px;
        }

        .join-subtitle {
            color: var(--text-mute);
            font-size: 14px;
            line-height: 1.6;
        }

        .join-form {
            padding: 34px 36px 40px;
        }

        .form-group {
            margin-bottom: 26px;
        }

        .form-label {
            display: block;
            margin-bottom: 10px;
            font-size: 14px;
            font-weight: 600;
            color: var(--text-hd);
        }

        .required {
            color: var(--danger);
            margin-left: 4px;
        }

        .form-input {
            width: 100%;
            padding: 14px 16px;
            border-radius: 10px;
            border: 1px solid var(--border);
            background: #fff;
            font-size: 15px;
            color: var(--text-body);
            transition: .2s ease;
        }

        .form-input:focus {
            outline: none;
            border-color: var(--accent);
            box-shadow: 0 0 0 4px rgba(200,169,110,.15);
        }

        .input-description {
            margin-top: 8px;
            font-size: 12px;
            color: var(--text-mute);
            line-height: 1.5;
        }

        .error-message {
            margin-top: 8px;
            font-size: 12px;
            color: var(--danger);
        }

        .join-btn {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(135deg, var(--accent), var(--accent-dk));
            color: white;
            font-size: 15px;
            font-weight: 600;
            letter-spacing: .02em;
            cursor: pointer;
            transition: .2s ease;
        }

        .join-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 8px 24px rgba(168,137,62,.22);
        }

        .join-footer {
            margin-top: 22px;
            text-align: center;
            font-size: 13px;
            color: var(--text-mute);
        }

        .join-footer a {
            color: var(--accent-dk);
            text-decoration: none;
            font-weight: 600;
        }

        .join-footer a:hover {
            text-decoration: underline;
        }

        footer {
            position: relative;
            z-index: 1;
            text-align: center;
            padding: 24px;
            border-top: 1px solid var(--border);
            color: var(--text-mute);
            font-size: 12px;
            letter-spacing: .08em;
        }

        @keyframes fadeUp {
            from {
                opacity: 0;
                transform: translateY(18px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 768px) {

            .join-header,
            .join-form {
                padding-left: 24px;
                padding-right: 24px;
            }

            .join-title {
                font-size: 28px;
            }
        }
    </style>
</head>

<body>

<!-- HEADER -->
<header>
    <div class="brand-label">My<span>Project</span></div>

    <div class="accent-bar">
        <div class="accent-bar-dot"></div>
    </div>

    <p class="tagline">Create Your Account</p>
</header>

<!-- MAIN -->
<main>

    <div class="join-card">

        <!-- 상단 -->
        <div class="join-header">
            <h1 class="join-title">회원가입</h1>

            <p class="join-subtitle">
                MyProject에 가입하고 자유롭게 게시글을 작성해보세요.
            </p>
        </div>

        <!-- FORM -->
        <form class="join-form"
              action="/users/joinResult"
              method="post">

            <!-- USERNAME -->
            <div class="form-group">

                <label class="form-label">
                    아이디
                    <span class="required">*</span>
                </label>

                <div style="display:flex; gap:10px;">

                    <input type="text"
                           id="username"
                           name="username"
                           class="form-input"
                           placeholder="로그인에 사용할 아이디"
                           required />

                    <button type="button"
                            id="check-btn"
                            style="
                                padding: 0 18px;
                                border:none;
                                border-radius:10px;
                                background:#c8a96e;
                                color:white;
                                cursor:pointer;
                                white-space:nowrap;
                            ">
                        중복확인
                    </button>

                </div>

                <div id="username-message"
                     class="input-description">
                    아이디는 중복될 수 없습니다.
                </div>

            </div>

            <!-- PASSWORD -->
            <div class="form-group">

                <label class="form-label">
                    비밀번호
                    <span class="required">*</span>
                </label>

                <input type="password"
                       name="password"
                       class="form-input"
                       placeholder="비밀번호 입력"
                       required />

            </div>

            <!-- NICKNAME -->
            <div class="form-group">

                <label class="form-label">
                    닉네임
                    <span class="required">*</span>
                </label>

                <input type="text"
                       name="nickname"
                       class="form-input"
                       placeholder="게시판에서 사용할 닉네임"
                       required />

                <div class="input-description">
                    닉네임은 중복 가능합니다.
                </div>

            </div>

            <!-- 에러 메시지 -->
            <c:if test="${not empty errorMessage}">
                <div class="error-message">
                    ${errorMessage}
                </div>
            </c:if>

            <!-- 가입 버튼 -->
            <button type="submit" class="join-btn" id="submit-btn">
                회원가입
            </button>

            <!-- 하단 -->
            <div class="join-footer">
                이미 계정이 있으신가요?
                <a href="/login">로그인</a>
            </div>

        </form>

    </div>

</main>

<!-- FOOTER -->
<footer>
    &copy; 2026 MyProject. All rights reserved.
</footer>

    <script>

           let usernameChecked = false;
           let checkedUsername = "";

           const usernameInput = document.getElementById("username");
           const checkBtn = document.getElementById("check-btn");
           const submitBtn = document.getElementById("submit-btn");
           const message = document.getElementById("username-message");

           // 아이디 변경 시 다시 검증 필요
           usernameInput.addEventListener("input", () => {

               usernameChecked = false;
               checkedUsername = "";

               message.textContent = "아이디 중복 확인이 필요합니다.";
               message.style.color = "#8c7f6e";
           });

           // 중복 확인 버튼
           checkBtn.addEventListener("click", async () => {

               const username = usernameInput.value.trim();

               if (!username) {

                   message.textContent = "아이디를 입력해주세요.";
                   message.style.color = "#b84d4d";

                   return;
               }

               try {

                   const response = await fetch(
                       "/users/check-username?username="
                       + encodeURIComponent(username)
                   );

                   const data = await response.json();

                   if (data.available) {

                       usernameChecked = true;
                       checkedUsername = username;

                       message.textContent =
                           "사용 가능한 아이디입니다.";

                       message.style.color = "green";

                   } else {

                       usernameChecked = false;

                       message.textContent =
                           "이미 사용 중인 아이디입니다.";

                       message.style.color = "#b84d4d";
                   }

               } catch (e) {

                   message.textContent =
                       "중복 검사 중 오류가 발생했습니다.";

                   message.style.color = "#b84d4d";
               }
           });

           // 가입 전 최종 검사
           document.querySelector(".join-form")
               .addEventListener("submit", (e) => {

               const currentUsername =
                   usernameInput.value.trim();

               if (!usernameChecked ||
                   checkedUsername !== currentUsername) {

                   e.preventDefault();

                   message.textContent =
                       "아이디 중복 확인을 완료해주세요.";

                   message.style.color = "#b84d4d";
               }
           });

       </script>
</body>
</html>
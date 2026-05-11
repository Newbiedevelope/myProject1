<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 | MyProject</title>

    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700;900&family=DM+Sans:wght@300;400;500;600&display=swap"
          rel="stylesheet"/>

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

        .login-card {
            width: 100%;
            max-width: 500px;
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            overflow: hidden;
            animation: fadeUp .45s ease both;
        }

        .login-header {
            padding: 34px 36px 24px;
            border-bottom: 1px solid var(--border);
            background: linear-gradient(to bottom, #fffdf9, #fcfaf7);
        }

        .login-title {
            font-family: 'Playfair Display', serif;
            font-size: 34px;
            color: var(--text-hd);
            margin-bottom: 8px;
        }

        .login-subtitle {
            color: var(--text-mute);
            font-size: 14px;
            line-height: 1.6;
        }

        .login-form {
            padding: 34px 36px 40px;
        }

        .form-group {
            margin-bottom: 24px;
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

        .login-btn {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(
                    135deg,
                    var(--accent),
                    var(--accent-dk)
            );
            color: white;
            font-size: 15px;
            font-weight: 600;
            letter-spacing: .02em;
            cursor: pointer;
            transition: .2s ease;
        }

        .login-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 8px 24px rgba(168,137,62,.22);
        }

        .error-message {
            margin-bottom: 20px;
            padding: 14px;
            border-radius: 10px;
            background: rgba(184,77,77,.08);
            color: var(--danger);
            font-size: 13px;
            line-height: 1.5;
        }

        .login-footer {
            margin-top: 22px;
            text-align: center;
            font-size: 13px;
            color: var(--text-mute);
        }

        .login-footer a {
            color: var(--accent-dk);
            text-decoration: none;
            font-weight: 600;
        }

        .login-footer a:hover {
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

            .login-header,
            .login-form {
                padding-left: 24px;
                padding-right: 24px;
            }

            .login-title {
                font-size: 28px;
            }
        }

    </style>
</head>

<body>

<!-- HEADER -->
<header>

    <div class="brand-label">
        My<span>Project</span>
    </div>

    <div class="accent-bar">
        <div class="accent-bar-dot"></div>
    </div>

    <p class="tagline">
        Welcome Back
    </p>

</header>

<!-- MAIN -->
<main>

    <div class="login-card">

        <!-- 상단 -->
        <div class="login-header">

            <h1 class="login-title">
                로그인
            </h1>

            <p class="login-subtitle">
                계정에 로그인하여 게시판 서비스를 이용해보세요.
            </p>

        </div>

        <!-- FORM -->
        <form class="login-form"
              action="/users/login"
              method="post">

            <!-- ERROR -->
            <c:if test="${not empty errorMessage}">
                <div class="error-message">
                    ${errorMessage}
                </div>
            </c:if>

            <!-- USERNAME -->
            <div class="form-group">

                <label class="form-label">
                    아이디
                    <span class="required">*</span>
                </label>

                <input type="text"
                       name="username"
                       class="form-input"
                       placeholder="아이디 입력"
                       required />

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

            <!-- LOGIN BUTTON -->
            <button type="submit"
                    class="login-btn">

                로그인

            </button>

            <!-- FOOTER -->
            <div class="login-footer">

                아직 계정이 없으신가요?

                <a href="/users/join">
                    회원가입
                </a>

            </div>

        </form>

    </div>

</main>

<!-- FOOTER -->
<footer>
    &copy; 2026 MyProject. All rights reserved.
</footer>

</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="UTF-8">

    <title>글 작성 | MyProject</title>

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
            --radius: 16px;
            --shadow: 0 8px 36px rgba(60,45,20,.08);
        }

        body {

            background: var(--bg);

            font-family: 'DM Sans', sans-serif;

            color: var(--text-body);

            padding: 60px 24px;
        }

        .write-container {

            max-width: 900px;

            margin: 0 auto;

            background: var(--surface);

            border-radius: var(--radius);

            border: 1px solid var(--border);

            box-shadow: var(--shadow);

            overflow: hidden;
        }

        .write-header {

            padding: 36px 42px;

            border-bottom: 1px solid var(--border);

            background:
                    linear-gradient(
                            to bottom,
                            #fffdf9,
                            #faf7f2
                    );
        }

        .write-title {

            font-family: 'Playfair Display', serif;

            font-size: 36px;

            color: var(--text-hd);

            margin-bottom: 10px;
        }

        .write-subtitle {

            color: var(--text-mute);

            font-size: 14px;
        }

        .write-form {

            padding: 40px 42px;
        }

        .form-group {

            margin-bottom: 28px;
        }

        .form-label {

            display: block;

            margin-bottom: 10px;

            font-size: 14px;

            font-weight: 600;

            color: var(--text-hd);
        }

        .form-input,
        .form-select,
        .form-textarea {

            width: 100%;

            border: 1px solid var(--border);

            border-radius: 12px;

            padding: 14px 16px;

            font-size: 15px;

            background: white;

            transition: .2s;
        }

        .form-input:focus,
        .form-select:focus,
        .form-textarea:focus {

            outline: none;

            border-color: var(--accent);

            box-shadow:
                    0 0 0 4px rgba(200,169,110,.15);
        }

        .form-textarea {

            min-height: 320px;

            resize: vertical;

            line-height: 1.7;
        }

        .submit-btn {

            width: 100%;

            border: none;

            border-radius: 14px;

            padding: 16px;

            background:
                    linear-gradient(
                            135deg,
                            var(--accent),
                            var(--accent-dk)
                    );

            color: white;

            font-size: 15px;

            font-weight: 700;

            cursor: pointer;

            transition: .2s;
        }

        .submit-btn:hover {

            transform: translateY(-2px);

            box-shadow:
                    0 8px 24px rgba(168,137,62,.22);
        }

    </style>

</head>

<body>

<div class="write-container">

    <!-- 상단 -->
    <div class="write-header">

        <h1 class="write-title">
            게시글 작성
        </h1>

        <p class="write-subtitle">
            자유롭게 글을 작성해보세요.
        </p>

    </div>

    <!-- FORM -->
    <form class="write-form"
          action="/posts/write"
          method="post">

        <!-- 카테고리 -->
        <div class="form-group">

            <label class="form-label">
                카테고리
            </label>

            <select name="categoryId"
                    class="form-select">

                <c:forEach var="category"
                           items="${categoryList}">

                    <option value="${category.id}">
                        ${category.name}
                    </option>

                </c:forEach>

            </select>

        </div>

        <!-- 제목 -->
        <div class="form-group">

            <label class="form-label">
                제목
            </label>

            <input type="text"
                   name="title"
                   class="form-input"
                   placeholder="제목 입력"
                   required />

        </div>

        <!-- 내용 -->
        <div class="form-group">

            <label class="form-label">
                내용
            </label>

            <textarea name="content"
                      class="form-textarea"
                      placeholder="내용을 입력하세요."
                      required></textarea>

        </div>

        <!-- 버튼 -->
        <button type="submit"
                class="submit-btn">

            게시글 등록

        </button>

    </form>

</div>

</body>
</html>
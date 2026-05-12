<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>내 게시글 관리 | MyProject</title>

    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700;900&family=DM+Sans:wght@300;400;500;600&display=swap"
          rel="stylesheet"/>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --bg: #f5f2ed;
            --surface: #ffffff;
            --border: #e2ddd6;
            --accent: #c8a96e;
            --accent-dark: #a8893e;
            --text-main: #2c251f;
            --text-sub: #8a7d6d;
            --danger: #b84d4d;
            --shadow: 0 10px 35px rgba(0,0,0,.06);
            --radius: 16px;
        }

        body {
            background: var(--bg);
            font-family: 'DM Sans', sans-serif;
            color: var(--text-main);
            min-height: 100vh;
        }

        /* HEADER */

        header {
            padding: 42px 24px 28px;
            text-align: center;
            border-bottom: 1px solid var(--border);
            background: linear-gradient(to bottom, #fffcf8, var(--bg));
        }

        .brand-label {
            font-family: 'Playfair Display', serif;
            font-size: 42px;
            font-weight: 900;
            letter-spacing: -0.03em;
        }

        .brand-label span {
            color: var(--accent);
        }

        .tagline {
            margin-top: 10px;
            color: var(--text-sub);
            font-size: 12px;
            letter-spacing: .16em;
            text-transform: uppercase;
        }

        .accent-bar {
            margin-top: 14px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .accent-bar-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: var(--accent);
        }

        /* MAIN */

        main {
            max-width: 1300px;
            margin: 0 auto;
            padding: 50px 24px;
        }

        .page-header {
            margin-bottom: 28px;
        }

        .page-title {
            font-family: 'Playfair Display', serif;
            font-size: 34px;
            margin-bottom: 10px;
        }

        .page-description {
            color: var(--text-sub);
            font-size: 15px;
        }

        /* TABLE */

        .board-wrap {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            overflow: hidden;
            box-shadow: var(--shadow);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background: #faf7f2;
        }

        th {
            padding: 18px 20px;
            text-align: left;
            font-size: 13px;
            letter-spacing: .08em;
            text-transform: uppercase;
            color: var(--text-sub);
            border-bottom: 1px solid var(--border);
        }

        td {
            padding: 20px;
            border-bottom: 1px solid #f0ebe4;
            font-size: 15px;
        }

        tbody tr {
            transition: .18s ease;
            cursor: pointer;
        }

        tbody tr:hover {
            background: #fcfaf7;
        }

        .badge-category {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 999px;
            background: rgba(200,169,110,.12);
            color: var(--accent-dark);
            font-size: 12px;
            font-weight: 600;
        }

        .post-title {
            font-weight: 600;
            color: var(--text-main);
        }

        .post-date {
            color: var(--text-sub);
            font-size: 14px;
        }

        /* ACTIONS */

        .action-wrap {
            display: flex;
            gap: 10px;
        }

        .action-btn {
            border: none;
            padding: 8px 14px;
            border-radius: 10px;
            cursor: pointer;
            font-size: 13px;
            font-weight: 600;
            transition: .18s ease;
        }

        .edit-btn {
            background: rgba(200,169,110,.15);
            color: var(--accent-dark);
        }

        .edit-btn:hover {
            background: rgba(200,169,110,.25);
        }

        .delete-btn {
            background: rgba(184,77,77,.1);
            color: var(--danger);
        }

        .delete-btn:hover {
            background: rgba(184,77,77,.18);
        }

        /* EMPTY */

        .empty-box {
            padding: 80px 24px;
            text-align: center;
        }

        .empty-text {
            color: var(--text-sub);
            font-size: 15px;
        }

        /* FOOTER */

        footer {
            margin-top: 60px;
            padding: 28px;
            text-align: center;
            border-top: 1px solid var(--border);
            color: var(--text-sub);
            font-size: 12px;
            letter-spacing: .08em;
        }

    </style>
</head>

<body>

<header>

    <div class="brand-label">
        My<span>Project</span>
    </div>

    <div class="accent-bar">
        <div class="accent-bar-dot"></div>
    </div>

    <p class="tagline">
        Manage Your Posts
    </p>

</header>

<main>

    <div class="page-header">

        <h1 class="page-title">
            내가 작성한 게시글
        </h1>

        <p class="page-description">
            작성한 게시글을 관리하고 수정 및 삭제할 수 있습니다.
        </p>

    </div>

    <div class="board-wrap">

        <table>

            <thead>
            <tr>
                <th>No.</th>
                <th>Category</th>
                <th>Title</th>
                <th>Date</th>
                <th>Manage</th>
            </tr>
            </thead>

            <tbody>

            <c:choose>

                <c:when test="${not empty postList}">

                    <c:forEach var="post"
                               items="${postList}">

                        <tr onclick="location.href='/posts/${post.postId}'">

                            <td>
                                ${post.postId}
                            </td>

                            <td>
                                <span class="badge-category">
                                    ${post.categoryName}
                                </span>
                            </td>

                            <td class="post-title">
                                ${post.title}
                            </td>

                            <td class="post-date">

                                <c:choose>

                                    <c:when test="${not empty post.createdAt}">
                                        ${fn:substring(post.createdAt, 0, 10)}
                                    </c:when>

                                    <c:otherwise>
                                        -
                                    </c:otherwise>

                                </c:choose>

                            </td>

                            <td>

                                <div class="action-wrap">

                                    <button type="button"
                                            class="action-btn edit-btn"
                                            onclick="
                                                event.stopPropagation();
                                                location.href='/posts/edit/${post.postId}'
                                            ">
                                        수정
                                    </button>

                                    <form action="/posts/delete/${post.postId}"
                                          method="post"
                                          onsubmit="
                                            event.stopPropagation();
                                            return confirm('정말 삭제하시겠습니까?');
                                          ">

                                        <button type="submit"
                                                class="action-btn delete-btn">
                                            삭제
                                        </button>

                                    </form>

                                </div>

                            </td>

                        </tr>

                    </c:forEach>

                </c:when>

                <c:otherwise>

                    <tr>

                        <td colspan="5">

                            <div class="empty-box">

                                <p class="empty-text">
                                    아직 작성한 게시글이 없습니다.
                                </p>

                            </div>

                        </td>

                    </tr>

                </c:otherwise>

            </c:choose>

            </tbody>

        </table>

    </div>

</main>

<footer>
    &copy; 2026 MyProject. All rights reserved.
</footer>

</body>
</html>
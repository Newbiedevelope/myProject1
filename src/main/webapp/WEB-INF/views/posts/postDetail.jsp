<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${post.title} | MyProject</title>

  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700;900&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet" />

  <style>
    *, *::before, *::after {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    :root {
      --bg:        #f5f2ed;
      --surface:   #ffffff;
      --border:    #e2ddd6;
      --accent:    #c8a96e;
      --accent-dk: #a8893e;
      --text-hd:   #1a1714;
      --text-body: #3d3830;
      --text-mute: #8c7f6e;
      --radius:    12px;
      --shadow:    0 4px 32px rgba(60,45,20,.08);
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
      background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.75' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.03'/%3E%3C/svg%3E");
      pointer-events: none;
      z-index: 0;
    }

    /* ───────── HEADER ───────── */
    header {
      position: relative;
      z-index: 10;
      width: 100%;
      padding: 40px 24px 32px;
      text-align: center;
      border-bottom: 1px solid var(--border);
      background: linear-gradient(to bottom, #fffcf7, var(--bg));
    }

    .brand-label {
      font-family: 'Playfair Display', serif;
      font-size: clamp(28px, 5vw, 48px);
      font-weight: 900;
      letter-spacing: -0.02em;
      color: var(--text-hd);
      line-height: 1;
    }

    .brand-label span {
      color: var(--accent);
    }

    .tagline {
      margin-top: 8px;
      font-size: 13px;
      color: var(--text-mute);
      letter-spacing: 0.12em;
      text-transform: uppercase;
    }

    .accent-bar {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 12px;
      margin: 10px auto 0;
    }

    .accent-bar::before,
    .accent-bar::after {
      content: '';
      width: 48px;
      height: 1px;
      background: var(--accent);
      opacity: 0.5;
    }

    .accent-bar-dot {
      width: 5px;
      height: 5px;
      border-radius: 50%;
      background: var(--accent);
    }

    /* ───────── MAIN ───────── */
    main {
      position: relative;
      z-index: 1;
      max-width: 960px;
      margin: 56px auto;
      padding: 0 24px 80px;
    }

    .detail-wrap {
      background: var(--surface);
      border-radius: var(--radius);
      border: 1px solid var(--border);
      box-shadow: var(--shadow);
      overflow: hidden;
      animation: fadeUp 0.45s ease both;
    }

    .detail-header {
      padding: 32px 36px 24px;
      border-bottom: 1px solid var(--border);
    }

    .detail-category {
      display: inline-block;
      margin-bottom: 18px;
      padding: 5px 12px;
      border-radius: 999px;
      background: #f5f0e8;
      border: 1px solid var(--accent);
      color: var(--accent-dk);
      font-size: 11px;
      font-weight: 600;
      letter-spacing: 0.05em;
    }

    .detail-title {
      font-family: 'Playfair Display', serif;
      font-size: clamp(28px, 4vw, 40px);
      font-weight: 700;
      color: var(--text-hd);
      line-height: 1.3;
      margin-bottom: 24px;
      word-break: break-word;
    }

    .detail-meta {
      display: flex;
      flex-wrap: wrap;
      gap: 24px;
      align-items: center;
      color: var(--text-mute);
      font-size: 14px;
    }

    .author-wrap {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .author-avatar {
      width: 34px;
      height: 34px;
      border-radius: 50%;
      background: linear-gradient(135deg, var(--accent), var(--accent-dk));
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 13px;
      font-weight: 700;
      color: white;
    }

    .author-name {
      color: var(--text-body);
      font-weight: 500;
    }

    .detail-content {
      padding: 42px 36px 48px;
      font-size: 16px;
      line-height: 1.9;
      color: var(--text-body);
      white-space: pre-wrap;
      word-break: break-word;
    }

    .detail-footer {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 24px 36px;
      border-top: 1px solid var(--border);
      background: #fcfaf7;
    }

    .back-link {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      text-decoration: none;
      color: var(--text-body);
      font-size: 14px;
      font-weight: 500;
      transition: 0.2s ease;
    }

    .back-link:hover {
      color: var(--accent-dk);
      transform: translateX(-2px);
    }

    .updated-label {
      font-size: 13px;
      color: var(--text-mute);
    }

    @keyframes fadeUp {
      from {
        opacity: 0;
        transform: translateY(16px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    footer {
      position: relative;
      z-index: 1;
      text-align: center;
      padding: 24px;
      font-size: 12px;
      color: var(--text-mute);
      letter-spacing: 0.08em;
      border-top: 1px solid var(--border);
    }

    @media (max-width: 768px) {
      .detail-header,
      .detail-content,
      .detail-footer {
        padding-left: 24px;
        padding-right: 24px;
      }

      .detail-title {
        font-size: 28px;
      }

      .detail-meta {
        flex-direction: column;
        align-items: flex-start;
        gap: 14px;
      }
    }
  </style>
</head>

<body>

<!-- ===================== HEADER ===================== -->
<header>
  <div class="brand-label">My<span>Project</span></div>
  <div class="accent-bar">
    <div class="accent-bar-dot"></div>
  </div>
  <p class="tagline">Community Board</p>
</header>

<!-- ===================== MAIN ===================== -->
<main>

  <div class="detail-wrap">

    <!-- 게시글 상단 -->
    <div class="detail-header">

      <!-- 카테고리 -->
      <span class="detail-category">
        <c:out value="${post.categoryName}" />
      </span>

      <!-- 제목 -->
      <h1 class="detail-title">
        <c:out value="${post.title}" />
      </h1>

      <!-- 메타 정보 -->
      <div class="detail-meta">

        <!-- 작성자 -->
        <div class="author-wrap">
          <div class="author-avatar">
            ${fn:substring(post.nickname, 0, 1)}
          </div>

          <span class="author-name">
            <c:out value="${post.nickname}" />
          </span>
        </div>

        <!-- 작성일 -->
        <div>
          작성일 :
          <c:choose>
            <c:when test="${not empty post.createdAt}">
              ${fn:substring(post.createdAt, 0, 16)}
            </c:when>
            <c:otherwise>-</c:otherwise>
          </c:choose>
        </div>

      </div>
    </div>

    <!-- 본문 -->
    <div class="detail-content">
      <c:out value="${post.content}" />
    </div>

    <!-- 하단 -->
    <div class="detail-footer">

      <!-- 목록 이동 -->
      <a href="/posts" class="back-link">
        ← 목록으로 돌아가기
      </a>

      <!-- 수정일 -->
      <div class="updated-label">
        <c:if test="${post.createdAt ne post.updatedAt}">
          최종 수정 :
          ${fn:substring(post.updatedAt, 0, 16)}
        </c:if>
      </div>

    </div>

  </div>

</main>

<!-- ===================== FOOTER ===================== -->
<footer>
  &copy; 2026 MyProject. All rights reserved.
</footer>

</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>MyProject</title>
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
      --text-mute:  #8c7f6e;
      --radius:    12px;
      --shadow:    0 4px 32px rgba(60,45,20,.08);
    }

    html, body {
      height: 100%;
      background: var(--bg);
      font-family: 'DM Sans', sans-serif;
      color: var(--text-body);
    }

    /* ── Noise Texture Overlay ── */
    body::before {
      content: '';
      position: fixed;
      inset: 0;
      background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.75' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.03'/%3E%3C/svg%3E");
      pointer-events: none;
      z-index: 0;
    }

    /* ── Header ── */
    header {
      position: relative;
      z-index: 10;
      width: 100%;
      padding: 40px 24px 32px;
      text-align: center;
      border-bottom: 1px solid var(--border);
      background: linear-gradient(to bottom, #fffcf7, var(--bg));
    }

    header .brand-label {
      font-family: 'Playfair Display', serif;
      font-size: clamp(28px, 5vw, 48px);
      font-weight: 900;
      letter-spacing: -0.02em;
      color: var(--text-hd);
      line-height: 1;
    }

    header .brand-label span {
      color: var(--accent);
    }

    header .tagline {
      margin-top: 8px;
      font-size: 13px;
      font-weight: 400;
      color: var(--text-mute);
      letter-spacing: 0.12em;
      text-transform: uppercase;
    }

    /* ── Accent line decoration ── */
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
      display: block;
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

    /* ── Main Layout ── */
    main {
      position: relative;
      z-index: 1;
      max-width: 1100px;
      margin: 56px auto;
      padding: 0 24px 80px;
    }

    /* ── Section Title ── */
    .section-header {
      display: flex;
      align-items: flex-end;
      justify-content: space-between;
      margin-bottom: 24px;
      padding-bottom: 16px;
      border-bottom: 2px solid var(--text-hd);
    }

    .section-title {
      font-family: 'Playfair Display', serif;
      font-size: 22px;
      font-weight: 700;
      color: var(--text-hd);
      letter-spacing: -0.01em;
    }

    .section-count {
      font-size: 13px;
      font-weight: 500;
      color: var(--text-mute);
      letter-spacing: 0.04em;
    }

    /* ── Board Table ── */
    .board-wrap {
      background: var(--surface);
      border-radius: var(--radius);
      box-shadow: var(--shadow);
      overflow: hidden;
      border: 1px solid var(--border);
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    thead {
      background: var(--text-hd);
    }

    thead th {
      padding: 16px 20px;
      font-family: 'DM Sans', sans-serif;
      font-size: 11px;
      font-weight: 600;
      color: var(--accent);
      text-transform: uppercase;
      letter-spacing: 0.14em;
      text-align: left;
      white-space: nowrap;
    }

    thead th:first-child { border-radius: 0; }

    /* Column Widths */
    .col-id       { width: 80px;  text-align: center; }
    .col-category { width: 130px; }
    .col-title    { }
    .col-author   { width: 120px; }
    .col-date     { width: 160px; }

    tbody tr {
      border-bottom: 1px solid var(--border);
      transition: background 0.18s ease, transform 0.18s ease;
      cursor: pointer;
    }

    tbody tr:last-child {
      border-bottom: none;
    }

    tbody tr:hover {
      background: #faf7f2;
      transform: translateX(3px);
    }

    tbody td {
      padding: 18px 20px;
      font-size: 14px;
      color: var(--text-body);
      vertical-align: middle;
      line-height: 1.4;
    }

    /* Post ID */
    .td-id {
      text-align: center;
      font-size: 13px;
      font-weight: 600;
      color: var(--text-mute);
    }

    /* Category Badge */
    .badge-category {
      display: inline-block;
      padding: 4px 10px;
      background: #f5f0e8;
      border: 1px solid var(--accent);
      border-radius: 999px;
      font-size: 11px;
      font-weight: 600;
      color: var(--accent-dk);
      letter-spacing: 0.05em;
      white-space: nowrap;
    }

    /* Title */
    .td-title {
      font-weight: 500;
      color: var(--text-hd);
      max-width: 400px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }

    /* Author */
    .author-wrap {
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .author-avatar {
      width: 28px;
      height: 28px;
      border-radius: 50%;
      background: linear-gradient(135deg, var(--accent), var(--accent-dk));
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 11px;
      font-weight: 700;
      color: #fff;
      flex-shrink: 0;
    }

    .author-name {
      font-size: 14px;
      font-weight: 500;
      color: var(--text-body);
    }

    /* Date */
    .td-date {
      font-size: 13px;
      color: var(--text-mute);
      font-weight: 400;
      white-space: nowrap;
    }

    /* ── Empty State ── */
    .empty-state {
      padding: 80px 24px;
      text-align: center;
    }

    .empty-state-icon {
      width: 56px;
      height: 56px;
      margin: 0 auto 20px;
      opacity: 0.25;
    }

    .empty-state-text {
      font-size: 15px;
      color: var(--text-mute);
      font-weight: 400;
    }

    /* ── Fade-in Animation ── */
    @keyframes fadeUp {
      from { opacity: 0; transform: translateY(16px); }
      to   { opacity: 1; transform: translateY(0); }
    }

    .board-wrap {
      animation: fadeUp 0.5s ease both;
      animation-delay: 0.1s;
    }

    tbody tr {
      animation: fadeUp 0.4s ease both;
    }

    /* stagger each row */
    <c:forEach var="post" items="${postList}" varStatus="st">
    tbody tr:nth-child(${st.count}) {
      animation-delay: ${0.05 * st.count}s;
    }
    </c:forEach>

    /* ── Footer ── */
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

    /* ── Responsive ── */
    @media (max-width: 700px) {
      .col-category, .col-date { display: none; }
      main { margin: 32px auto; }
    }
  </style>
</head>
<body>

  <!-- ===================== HEADER ===================== -->
  <header>
    <div class="brand-label">My<span>Project</span></div>
    <div class="accent-bar"><div class="accent-bar-dot"></div></div>
    <p class="tagline">Community Board</p>
  </header>

  <!-- ===================== MAIN ===================== -->
  <main>
    <div class="section-header">
      <span class="section-title">게시글 목록</span>
      <span class="section-count">
        Total
        <c:choose>
          <c:when test="${not empty postList}">${fn:length(postList)}</c:when>
          <c:otherwise>0</c:otherwise>
        </c:choose>
        posts
      </span>
    </div>

    <div class="board-wrap">
      <table>
        <thead>
          <tr>
            <th class="col-id">   No.       </th>
            <th class="col-category"> Category  </th>
            <th class="col-title">   Title     </th>
            <th class="col-author">  Author    </th>
            <th class="col-date">   Date       </th>
          </tr>
        </thead>
        <tbody>
          <c:choose>
            <c:when test="${not empty postList}">
              <c:forEach var="post" items="${postList}" varStatus="st">
                <tr>
                  <!-- 글번호 -->
                  <td class="td-id col-id">${post.postId}</td>

                  <!-- 카테고리 -->
                  <td class="col-category">
                    <span class="badge-category">
                      <c:out value="${post.categoryName}" default="General" />
                    </span>
                  </td>

                  <!-- 제목 -->
                  <td class="td-title col-title">
                    <c:out value="${post.title}" />
                  </td>

                  <!-- 작성자 -->
                  <td class="col-author">
                    <div class="author-wrap">
                      <div class="author-avatar">
                        <%-- 닉네임 첫 글자를 아바타로 표시 --%>
                        ${fn:substring(post.nickname, 0, 1)}
                      </div>
                      <span class="author-name">
                        <c:out value="${post.nickname}" />
                      </span>
                    </div>
                  </td>

                  <!-- 작성일 (LocalDateTime -> toString 또는 포맷된 String) -->
                  <td class="td-date col-date">
                    <%-- LocalDateTime의 경우 백엔드에서 String으로 포맷하거나 --%>
                    <%-- substring으로 앞 10자리(날짜)만 표시합니다        --%>
                    <c:choose>
                      <c:when test="${not empty post.createdAt}">
                        ${fn:substring(post.createdAt, 0, 10)}
                      </c:when>
                      <c:otherwise>-</c:otherwise>
                    </c:choose>
                  </td>
                </tr>
              </c:forEach>
            </c:when>

            <c:otherwise>
              <!-- 게시글이 없을 때 -->
              <tr>
                <td colspan="5">
                  <div class="empty-state">
                    <svg class="empty-state-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                      <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 14.25v-2.625a3.375 3.375 0 0 0-3.375-3.375h-1.5A1.125 1.125 0 0 1 13.5 7.125v-1.5a3.375 3.375 0 0 0-3.375-3.375H8.25m0 12.75h7.5m-7.5 3H12M10.5 2.25H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 0 0-9-9Z" />
                    </svg>
                    <p class="empty-state-text">등록된 게시글이 없습니다.</p>
                  </div>
                </td>
              </tr>
            </c:otherwise>
          </c:choose>
        </tbody>
      </table>
    </div>
  </main>

  <!-- ===================== FOOTER ===================== -->
  <footer>
    &copy; 2026 MyProject. All rights reserved.
  </footer>

</body>
</html>
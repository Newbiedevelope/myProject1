# 📝 Spring Boot 게시판 프로젝트

## 📌 프로젝트 소개

Spring Boot 기반의 간단한 게시판 시스템입니다.
JPA를 활용한 객체 중심 설계 및 확장 가능한 구조를 목표로 개발되었습니다.

## 🚀 기술 스택

* **Backend**

  * Java 17
  * Spring Web
  * Spring Data JPA
  * QueryDSL (예정)

* **Database**

  * H2 Database (File Mode)

* **Build Tool**

  * Gradle

* **ETC**

  * Lombok

---

## 📂 프로젝트 구조

```
src/main/java/my/project/origin
 ├── domain
 │    ├── user
 │    ├── post
 │    ├── comment
 │    └── category
 ├── repository
 ├── service
 └── controller
```

---

## 🧱 주요 기능

### 👤 User

* 회원 생성 (비밀번호 암호화)
* username / nickname 분리 설계

### 📝 Post

* 게시글 작성
* 카테고리 분류
* 작성자 연관관계

### 💬 Comment

* 게시글에 댓글 작성
* 작성자 연관관계

### 🏷 Category

* 게시글 분류용 엔티티
* 관리자 전용 관리 예정

### ❤️ Like

* User ↔ Post / Comment 관계 기반 설계

---

## 🔍 검색 기능 (진행 중)

* 제목 검색
* 내용 검색
* 작성자 닉네임 검색
* 카테고리 검색

👉 QueryDSL을 활용한 동적 검색 구현 예정

---

## ⚙️ 실행 방법

```bash
./gradlew build
./gradlew bootRun
```

---

## 🗄 H2 Console 접속

```
http://localhost:8080/h2-console
```

* JDBC URL: `jdbc:h2:file:./data/board-db`
* username: `sa`
* password: (비어있음)

---

## 📌 설계 원칙

* MVC 패턴 기반 구조
* SOLID 원칙 준수
* Entity는 순수 객체로 유지
* Service 계층에서 비즈니스 로직 처리
* Repository는 데이터 접근만 담당

---

## 🔥 향후 개선 계획

* QueryDSL 기반 검색 기능 완성
* 페이징 및 정렬 기능 추가
* Spring Security 적용 (인증/인가)
* 좋아요 기능 고도화
* API 문서화 (Swagger)

---

## 📖 배운 점

* JPA 기반 객체 설계
* Entity와 DTO 분리의 중요성
* Repository / Service 책임 분리
* 동적 쿼리(QueryDSL)의 필요성

---

## 🙌 개발자

* 개인 프로젝트

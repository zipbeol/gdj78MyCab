<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap Gallery - My Cab Bootstrap 5 Dashboard</title>

    <!-- Meta -->
    <meta name="description" content="Marketplace for Bootstrap Admin Dashboards">
    <meta name="author" content="Bootstrap Gallery">
    <link rel="canonical" href="https://www.bootstrap.gallery/">
    <meta property="og:url" content="https://www.bootstrap.gallery">
    <meta property="og:title" content="Admin Templates - Dashboard Templates | Bootstrap Gallery">
    <meta property="og:description" content="Marketplace for Bootstrap Admin Dashboards">
    <meta property="og:type" content="Website">
    <meta property="og:site_name" content="Bootstrap Gallery">
    <link rel="shortcut icon" href="/assets/images/favicon.svg">

    <!-- *************
			************ CSS Files *************
		************* -->
    <link rel="stylesheet" href="/assets/fonts/bootstrap/bootstrap-icons.css">
    <link rel="stylesheet" href="/assets/css/main.min.css">

	<!-- 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

	<!-- 따로 적용한 CSS -->
	<link rel="stylesheet" href="/assets/css/default.css">
	<!-- FontAwesome 추가 -->
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
	<style>
	video {
    -o-object-fit: cover;
    object-fit: cover;
    position: absolute;
    height: 100%;
    width: 100%;
    top: 0;
    left: 0;
    z-index: 0;
	}
	 .container {
      position: relative;
      z-index: 1;
    }
    .login-form {
      background: linear-gradient(124.47deg, 
              rgba(255, 255, 255, 0.0), 
              rgba(255, 255, 255, 0.0), 
              rgba(255, 255, 255, 0.0)); /* 배경색이 투명하게 보이게 한다 */
  	border-radius: 16px;
  box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(0px);
  padding: 30px;
    }
    .login-form:hover {
  background: linear-gradient(124.47deg, 
            rgba(255, 255, 255, 0.2), 
            rgba(255, 255, 255, 0.0), 
            rgba(255, 255, 255, 0.2));
  border-radius: 16px;
  box-shadow: 0 4px 30px rgba(0, 0, 0, 0.3);
  backdrop-filter: blur(5px);
  padding: 30px;
}
.incss {
  border: 1px;
  background-color:transparent;
  font-size: 16px;
  color: rgba(255, 255, 255, 0.9);
}
.incss::placeholder {
  color: #787878;
}
.incss:focus {
  outline: none;
  background-color:transparent;
}
	</style>
</head>
  <body>
  <video width="100%" height="auto" autoplay loop playsinline muted>
        <source src="/assets/taxi.mp4" type="video/mp4">
  </video>
    <!-- Container start -->
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-xl-4 col-lg-5 col-sm-6 col-12">
          <form class="my-5" action="/emp/login.do" method="post">
            <div class="rounded-2 p-4 mt-5">
              <div class="login-form">
                <a href="!#" class="mb-4 d-flex">
                  <img src="/assets/images/logo.svg" class="img-fluid login-logo" alt="Cab Admin Dashboard">
                </a>
                <h5 class="fw-bold mb-5">로그인이 필요합니다.</h5>
                <div class="mb-3">
                  <label class="form-label">사번</label>
                  <input type="text" class="incss form-control" placeholder="사번을 입력해주세요." name="emp_no">
                </div>
                <div class="mb-3">
                  <label class="form-label">비밀번호</label>
                  <input type="password" class="incss form-control" placeholder="비밀번호를 입력해주세요." name="emp_password">
                </div>
                <div class="d-flex align-items-center justify-content-between">
                  <a href="pwFind.go" class="text-blue text-decoration-underline">비밀번호 찾기</a>
                </div>
                <div class="d-grid py-3 mt-4">
                  <button type="submit" class="btn btn-lg btn-primary">
                    로그인 및 출근
                  </button>
                </div>
                <div class="text-center pt-4">
                  <span>등록 문의: 070-1234-1234 (인사부)</span>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <!-- Container end -->
  </body>
  <script>
    // 스크립트

    
     var message = "${message}";
        if (message) {
            alert(message);
        }

</script>

</html>
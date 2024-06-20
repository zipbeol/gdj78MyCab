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
  </head>

  <body>
    <!-- Container start -->
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-xl-4 col-lg-5 col-sm-6 col-12">
          <form action="index.go" class="my-5">
            <div class="border rounded-2 p-4 mt-5">
              <div class="login-form">
                <a href="index.go" class="mb-4 d-flex">
                  <img src="/assets/images/logo.svg" class="img-fluid login-logo" alt="Cab Admin Dashboard">
                </a>
                <h5 class="fw-bold mb-5">Create your admin account.</h5>
                <div class="mb-3">
                  <label class="form-label">Your Email</label>
                  <input type="text" class="form-control" placeholder="Enter your email">
                </div>
                <div class="mb-3">
                  <label class="form-label">Your Password</label>
                  <input type="password" class="form-control" placeholder="Enter password">
                </div>
                <div class="mb-3">
                  <label class="form-label">Confirm Password</label>
                  <input type="password" class="form-control" placeholder="Re-enter password">
                </div>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="form-check m-0">
                    <input class="form-check-input" type="checkbox" value="" id="termsConditions">
                    <label class="form-check-label" for="termsConditions">I agree to the terms and conditions</label>
                  </div>
                </div>
                <div class="d-grid py-3 mt-4">
                  <button type="submit" class="btn btn-lg btn-primary">
                    SIGNUP
                  </button>
                </div>
                <div class="text-center py-3">or Signup with</div>
                <div class="btn-group w-100">
                  <button type="button" class="btn btn-sm btn-outline-danger">
                    Google
                  </button>
                  <button type="button" class="btn btn-sm btn-outline-primary">
                    Facebook
                  </button>
                  <button type="button" class="btn btn-sm btn-outline-info">
                    Twitter
                  </button>
                </div>
                <div class="text-center pt-4">
                  <span>Already have an account?</span>
                  <a href="login.go" class="text-blue text-decoration-underline ms-2">
                    Login</a>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <!-- Container end -->
  </body>

</html>
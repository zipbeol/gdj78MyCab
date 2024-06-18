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
    <link rel="shortcut icon" href="assets/images/favicon.svg">

    <!-- *************
			************ CSS Files *************
		************* -->
    <link rel="stylesheet" href="assets/fonts/bootstrap/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/main.min.css">

    <!-- *************
			************ Vendor Css Files *************
		************ -->

    <!-- Scrollbar CSS -->
    <link rel="stylesheet" href="assets/vendor/overlay-scroll/OverlayScrollbars.min.css">

    <!-- Toastify CSS -->
    <link rel="stylesheet" href="assets/vendor/toastify/toastify.css">

  </head>

  <body>
    <!-- Page wrapper start -->
    <div class="page-wrapper">

      <!-- Main container start -->
      <div class="main-container">

        <!-- Sidebar wrapper start -->
        <nav id="sidebar" class="sidebar-wrapper">

          <!-- App brand starts -->
          <div class="app-brand px-3 py-2 d-flex align-items-center">
            <a href="index.go">
              <img src="assets/images/logo.svg" class="logo" alt="Bootstrap Gallery">
            </a>
          </div>
          <!-- App brand ends -->

          <!-- Sidebar menu starts -->
          <div class="sidebarMenuScroll">
            <ul class="sidebar-menu">
              <li class="active current-page">
              </li>
              <li>
                <a href="upcoming-trips.go">
                  <i class="bi bi-pin-map"></i>
                  <span class="menu-text">공지사항</span>
                </a>
              </li>
              
              <li class="treeview">
                <a href="#!">
                  <i class="bi bi-postcard"></i>
                  <span class="menu-text">마이페이지</span>
                </a>
                <ul class="treeview-menu">
                  <li>
                    <a href="calendar.go">프로필</a>
                  </li>
                  <li>
                    <a href="calendar-external-draggable.go">연차 관리</a>
                  </li>
                  <li>
                    <a href="calendar-google.go">연차 승인 및 반려</a>
                  </li>
                   <li>
                    <a href="calendar-google.go">근태 관리</a>
                  </li>
                  <li>
                    <a href="calendar-google.go">알림</a>
                  </li>
                  
                </ul>
              </li>
               <li>
                <a href="available-cabs.go">
                  <i class="bi bi-phone-vibrate"></i>
                  <span class="menu-text">채팅</span>
                </a>
              </li>
              <li class="treeview">
                <a href="#!">
                  <i class="bi bi-stickies"></i>
                  <span class="menu-text">메일</span>
                </a>
                <ul class="treeview-menu">
                  <li>
                    <a href="accordions.go">메일 작성</a>
                  </li>
                  <li>
                    <a href="accordions.go">보낸 메일함</a>
                  </li>
                </ul>
              </li>
              
              <li>
                <a href="#!">
                  <i class="bi bi-calendar2"></i>
                  <span class="menu-text">일정 관리</span>
                </a>
              </li>
              
              <li class="treeview">
                <a href="#!">
                  <i class="bi bi-car-front"></i>
                  <span class="menu-text">택시 관리</span>
                </a>
                <ul class="treeview-menu">
                  <li>
                    <a href="calendar.go">차량 관리</a>
                  </li>
                  <li>
                    <a href="calendar-external-draggable.go">기사 관리</a>
                  </li>
                  <li>
                    <a href="calendar-google.go">운행 기록 관리</a>
                  </li>
                </ul>
              </li>
              <li class="treeview">
                <a href="#!">
                  <i class="bi bi-layout-text-window-reverse"></i>
                  <span class="menu-text">전자결재</span>
                </a>
                <ul class="treeview-menu">
                  <li>
                    <a href="accordions.go">기안서 작성</a>
                  </li>
                    <li>
                    <a href="accordions.go">내 결재 관리</a>
                  </li>
                  <li>
                    <a href="accordions.go">결재 통합 관리</a>
                  </li>
                  <li>
                    <a href="accordions.go">공통 양식 등록</a>
                  </li>
                </ul>
              </li>
              
              <li class="treeview">
                <a href="#!">
                  <i class="bi bi-person"></i>
                  <span class="menu-text">인사 관리</span>
                </a>
                <ul class="treeview-menu">
                  <li>
                    <a href="calendar.go">근태 관리</a>
                  </li>
                  <li>
                    <a href="calendar-external-draggable.go">사원 생성</a>
                  </li>
                  <li>
                    <a href="calendar-external-draggable.go">사원 조회</a>
                  </li>
                  <li>
                    <a href="calendar-external-draggable.go">연차 관리</a>
                  </li>
                  <li>
                    <a href="calendar-google.go">부서 관리</a>
                  </li>
                  <li>
                    <a href="calendar-google.go">급여 관리</a>
                  </li>
                  <li>
                    <a href="calendar-google.go">기사 정산 관리</a>
                  </li>
                  <li>
                    <a href="calendar-google.go">사원 조회</a>
                  </li>
                </ul>
              </li>
               <li class="treeview">
                <a href="#!">
                  <i class="bi bi-pie-chart"></i>
                  <span class="menu-text">재무 관리</span>
                </a>
                <ul class="treeview-menu">
                  <li>
                    <a href="apex.go">수익</a>
                  </li>
                  <li>
                    <a href="apex.go">지출</a>
                  </li>
                  <li>
                    <a href="morris.go">거래 내역</a>
                  </li>
                   <li>
                    <a href="morris.go">잔여 예산</a>
                  </li>
                   <li>
                    <a href="morris.go">대쉬 보드</a>
                  </li>
                </ul>
              </li>
               <li class="treeview">
                <a href="#!">
                  <i class="bi bi-box"></i>
                  <span class="menu-text">자원 관리</span>
                </a>
                <ul class="treeview-menu">
                   <li>
                    <a href="morris.go">자원 등록</a>
                  </li>
                   <li>
                    <a href="morris.go">자원 예약</a>
                  </li>
                   <li>
                    <a href="morris.go">나의 예약</a>
                  </li>
                </ul>
              </li>
              <li class="treeview">
                <a href="#!">
                  <i class="bi bi-terminal"></i>
                  <span class="menu-text">로그 관리</span>
                </a>
                <ul class="treeview-menu">
                   <li>
                    <a href="morris.go">메일 로그</a>
                  </li>
                   <li>
                    <a href="morris.go">채팅 로그</a>
                  </li>
                </ul>
              </li>
              
              
          <!-- Sidebar menu ends -->

        </nav>
        <!-- Sidebar wrapper end -->

        <!-- App container starts -->
        <div class="app-container">

          <!-- App header starts -->
          <div class="app-header d-flex align-items-center">

            <!-- Toggle buttons start -->
            <div class="d-flex">
              <button class="btn btn-outline-primary me-2 toggle-sidebar" id="toggle-sidebar">
                <i class="bi bi-list fs-5"></i>
              </button>
              <button class="btn btn-outline-primary me-2 pin-sidebar" id="pin-sidebar">
                <i class="bi bi-list fs-5"></i>
              </button>
            </div>
            <!-- Toggle buttons end -->

            <!-- App brand sm start -->
            <div class="app-brand-sm d-lg-none d-sm-block">
              <a href="index.go">
                <img src="assets/images/logo-sm.svg" class="logo" alt="Bootstrap Gallery">
              </a>
            </div>
            <!-- App brand sm end -->

            <!-- Breadcrumb start -->
            <ol class="breadcrumb d-none d-lg-flex ms-3">
              <li class="breadcrumb-item">
                <i class="bi bi-house lh-1"></i>
                <a href="index.go" class="text-decoration-none">Home</a>
              </li>
              <li class="breadcrumb-item text-secondary">Dashboard</li>
            </ol>
            <!-- Breadcrumb end -->

            <!-- App header actions start -->
            <div class="header-actions">
              <div class="dropdown">
                <a class="dropdown-toggle d-flex px-3 py-4 position-relative" href="#!" role="button"
                  data-bs-toggle="dropdown" aria-expanded="false">
                  <img src="assets/images/flags/1x1/gb.svg" class="flag-img" alt="Cab Admin Template">
                </a>
                <div class="dropdown-menu dropdown-menu-end shadow-sm dropdown-menu-mini">
                  <div class="country-container">
                    <a href="index.go" class="py-2">
                      <img src="assets/images/flags/1x1/us.svg" alt="Business Dashboard Templates">
                    </a>
                    <a href="index.go" class="py-2">
                      <img src="assets/images/flags/1x1/in.svg" alt="Business Dashboard Templates">
                    </a>
                    <a href="index.go" class="py-2">
                      <img src="assets/images/flags/1x1/br.svg" alt="Business Dashboard Templates">
                    </a>
                    <a href="index.go" class="py-2">
                      <img src="assets/images/flags/1x1/tr.svg" alt="IT Dashboard Templates">
                    </a>
                    <a href="index.go" class="py-2">
                      <img src="assets/images/flags/1x1/id.svg" alt="IT Dashboard Templates">
                    </a>
                  </div>
                </div>
              </div>
              <div class="dropdown border-start">
                <a class="dropdown-toggle d-flex px-3 py-4 position-relative" href="#!" role="button"
                  data-bs-toggle="dropdown" aria-expanded="false">
                  <i class="bi bi-grid fs-4 lh-1 text-secondary"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-end shadow-sm dropdown-menu-md">
                  <!-- Row start -->
                  <div class="d-flex gap-2 m-2 flex-wrap">
                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                      <img src="assets/images/brand-behance.svg" class="img-3x" alt="IT Dashboard Templates">
                    </a>
                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                      <img src="assets/images/brand-google.svg" class="img-3x" alt="IT Dashboard Templates">
                    </a>
                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                      <img src="assets/images/brand-bitcoin.svg" class="img-3x" alt="IT Dashboard Templates">
                    </a>
                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                      <img src="assets/images/brand-dribbble.svg" class="img-3x" alt="IT Dashboard Templates">
                    </a>
                  </div>
                  <!-- Row end -->
                  <div class="d-grid">
                    <a href="javascript:void(0)" class="btn btn-primary m-2">View All</a>
                  </div>
                </div>
              </div>
              <div class="dropdown border-start">
                <a class="dropdown-toggle d-flex px-3 py-4 position-relative" href="#!" role="button"
                  data-bs-toggle="dropdown" aria-expanded="false">
                  <i class="bi bi-bag-check fs-4 lh-1 text-secondary"></i>
                  <span class="count-label info"></span>
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-md shadow-sm">
                  <div class="d-flex flex-column p-3 mx-3 my-2 border">
                    <a href="javascript:void(0)" class="text-decoration-none">
                      <h3 class="mb-1">$35,000</h3>
                      <div class="mb-1 d-flex justify-content-between">
                        <span class="text-secondary">Revenue</span>
                        <span class="text-primary">+2%</span>
                      </div>
                      <div class="progress small">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 25%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </a>
                  </div>
                  <div class="d-flex flex-column p-3 mx-3 my-2 border">
                    <a href="javascript:void(0)" class="text-decoration-none">
                      <h3 class="mb-1">$48,000</h3>
                      <div class="mb-1 d-flex justify-content-between">
                        <span class="text-secondary">Income</span>
                        <span class="text-primary">+7%</span>
                      </div>
                      <div class="progress small">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 50%" aria-valuenow="50"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </a>
                  </div>
                  <div class="d-flex flex-column p-3 mx-3 my-2 border">
                    <a href="javascript:void(0)" class="text-decoration-none">
                      <h3 class="mb-1">3400</h3>
                      <div class="mb-1 d-flex justify-content-between">
                        <span class="text-secondary">Sales</span>
                        <span class="text-danger">+3%</span>
                      </div>
                      <div class="progress small">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: 75%" aria-valuenow="75"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </a>
                  </div>
                  <div class="d-grid mx-3 my-3">
                    <a href="javascript:void(0)" class="btn btn-primary">View all</a>
                  </div>
                </div>
              </div>
              <div class="dropdown border-start">
                <a class="dropdown-toggle d-flex px-3 py-4 position-relative" href="#!" role="button"
                  data-bs-toggle="dropdown" aria-expanded="false">
                  <i class="bi bi-envelope-open fs-4 lh-1 text-secondary"></i>
                  <span class="count-label"></span>
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-md shadow-sm">
                  <a href="javascript:void(0)" class="dropdown-item">
                    <div class="d-flex py-2">
                      <img src="assets/images/user.png" class="img-3x me-3 rounded-3" alt="Admin Templates">
                      <div class="m-0">
                        <h5 class="mb-1">Stacy Macdonald</h5>
                        <p class="mb-1 text-secondary">
                          Got a new review. Congratulations!
                        </p>
                        <p class="small m-0 text-secondary">Today, 07:30pm</p>
                      </div>
                    </div>
                  </a>
                  <a href="javascript:void(0)" class="dropdown-item">
                    <div class="d-flex py-2">
                      <img src="assets/images/user2.png" class="img-3x me-3 rounded-3" alt="Admin Templates">
                      <div class="m-0">
                        <h5 class="mb-1">Harriet Orozco</h5>
                        <p class="mb-1 text-secondary">
                          Happy Customer.
                        </p>
                        <p class="small m-0 text-secondary">Today, 08:00pm</p>
                      </div>
                    </div>
                  </a>
                  <a href="javascript:void(0)" class="dropdown-item">
                    <div class="d-flex py-2">
                      <img src="assets/images/user1.png" class="img-3x me-3 rounded-3" alt="Admin Templates">
                      <div class="m-0">
                        <h5 class="mb-1">Grady Baxter</h5>
                        <p class="mb-1 text-secondary">
                          Grady wrote a new comment!
                        </p>
                        <p class="small m-0 text-secondary">Today, 09:30pm</p>
                      </div>
                    </div>
                  </a>
                  <div class="d-grid mx-3 my-3">
                    <a href="javascript:void(0)" class="btn btn-primary">View all</a>
                  </div>
                </div>
              </div>
              <div class="dropdown ms-2">
                <a id="userSettings" class="dropdown-toggle d-flex py-2 align-items-center text-decoration-none"
                  href="#!" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  <img src="assets/images/user.png" class="rounded-2 img-3x" alt="Bootstrap Gallery">
                </a>
                <div class="dropdown-menu dropdown-menu-end shadow-sm">
                  <div class="p-3 border-bottom mb-2">
                    <h6 class="mb-1">Ella Lindsey</h6>
                    <p class="m-0 small opacity-50">info@testing.com</p>
                  </div>
                  <a class="dropdown-item d-flex align-items-center" href="profile.go"><i
                      class="bi bi-person fs-4 me-2"></i>Profile</a>
                  <a class="dropdown-item d-flex align-items-center" href="settings.go"><i
                      class="bi bi-gear fs-4 me-2"></i>Settings</a>
                  <div class="d-grid p-3 py-2">
                    <a class="btn btn-danger" href="login.go">Logout</a>
                  </div>
                </div>
              </div>
            </div>
            <!-- App header actions end -->

          </div>
          <!-- App header ends -->

          <!-- App body starts -->
          <div class="app-body">

            <!-- Container starts -->
            <div class="container-fluid">

              <!-- Row start -->
              <div class="row">
                <div class="col-xl-4 col-sm-6 col-12">
                  <div class="card mb-4">
                    <div class="card-body">
                      <div class="d-flex flex-row">
                        <div class="icon-box lg rounded-3 bg-light mb-4">
                          <i class="bi bi-car-front text-primary fs-2"></i>
                        </div>
                        <div class="ms-4">
                          <p class="mb-2 lh-1 d-flex align-items-center">
                            <i class="bi bi-caret-up-fill text-success me-1 fs-3"></i><span class="text-success me-2">8%
                            </span> from
                            last week.
                          </p>
                          <h1 class="fw-bold mb-2">7,500</h1>
                          <h6 class="m-0 fw-normal opacity-50">Trips</h6>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-xl-4 col-sm-6 col-12">
                  <div class="card mb-4">
                    <div class="card-body">
                      <div class="d-flex flex-row">
                        <div class="icon-box lg rounded-3 bg-light mb-4">
                          <i class="bi bi-car-front text-primary fs-2"></i>
                        </div>
                        <div class="ms-4">
                          <p class="mb-2 lh-1 d-flex align-items-center">
                            <i class="bi bi-caret-up-fill text-success me-1 fs-3"></i><span
                              class="text-success me-2">23% </span> from
                            last week.
                          </p>
                          <h1 class="fw-bold mb-2">3,900</h1>
                          <h6 class="m-0 fw-normal opacity-50">Passengers</h6>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12">
                  <div class="card mb-4">
                    <div class="card-body">
                      <div class="d-flex flex-row">
                        <div class="icon-box lg rounded-3 bg-light mb-4">
                          <i class="bi bi-car-front-fill text-primary fs-2"></i>
                        </div>
                        <div class="ms-4">
                          <p class="mb-2 lh-1 d-flex align-items-center">
                            <i class="bi bi-caret-down-fill text-danger me-1 fs-3"></i><span
                              class="text-danger me-2">18% </span> from
                            last week.
                          </p>
                          <h1 class="fw-bold mb-2">$9,300</h1>
                          <h6 class="m-0 fw-normal opacity-50">Earnings</h6>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Row end -->

              <!-- Row start -->
              <div class="row">
                <div class="col-xxl-8 col-12">
                  <div class="card mb-4">
                    <div class="card-header">
                      <h4 class="card-title">Trips Overview</h4>
                    </div>
                    <div class="card-body">
                      <!-- Row start -->
                      <div class="row">
                        <div class="col-lg-4">
                          <div class="text-center">
                            <div class="text-center mb-3">
                              <p class="text-muted mb-1">This Month</p>
                              <div class="text-center">
                                <h2 class="mb-0">$86,990</h2>
                                <div class="badge bg-success mt-2">
                                  + 21.68%
                                </div>
                              </div>
                            </div>
                            <div class="row g-0">
                              <div class="col-sm-6">
                                <div class="border-bottom border-end p-3">
                                  <p class="text-muted mb-1">Booked</p>
                                  <h5 class="m-0">3,690</h5>
                                </div>
                              </div>
                              <div class="col-sm-6">
                                <div class="border-bottom p-3">
                                  <p class="text-muted mb-1">Trips</p>
                                  <h5 class="m-0">6065</h5>
                                </div>
                              </div>
                            </div>
                            <div class="row g-0">
                              <div class="col-sm-6">
                                <div class="border-bottom border-end p-3">
                                  <p class="text-muted mb-1">Growth</p>
                                  <h5 class="m-0">18.9%</h5>
                                </div>
                              </div>
                              <div class="col-sm-6">
                                <div class="border-bottom p-3">
                                  <p class="text-muted mb-1">Signups</p>
                                  <h5 class="m-0">560</h5>
                                </div>
                              </div>
                            </div>
                            <div class="row g-0">
                              <div class="col-sm-6">
                                <div class="border-end p-3">
                                  <p class="text-muted mb-1">Ratings</p>
                                  <h5 class="m-0">$9,984</h5>
                                </div>
                              </div>
                              <div class="col-sm-6">
                                <div class="p-3">
                                  <p class="text-muted mb-1">Earnings</p>
                                  <h5 class="m-0">$6,443</h5>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="col-lg-8">
                          <div id="overview"></div>
                        </div>
                      </div>
                      <!-- Row end -->
                    </div>
                  </div>
                </div>
                <div class="col-xxl-4 col-12">
                  <div class="card mb-4">
                    <div class="card-header">
                      <h4 class="card-title">Passengers</h4>
                    </div>
                    <div class="card-body">
                      <div class="auto-align-graph">
                        <div id="reachedAudience"></div>
                      </div>
                      <div class="grid text-center">
                        <div class="g-col-4">
                          <i class="bi bi-caret-up-fill text-primary"></i>
                          <h3 class="m-0 mt-1">54%</h3>
                          <p class="text-secondary m-0">Male</p>
                        </div>
                        <div class="g-col-4">
                          <i class="bi bi-caret-up-fill text-primary"></i>
                          <h3 class="m-0 mt-1">36%</h3>
                          <p class="text-secondary m-0">Female</p>
                        </div>
                        <div class="g-col-4">
                          <i class="bi bi-caret-down-fill text-danger"></i>
                          <h3 class="m-0 mt-1">10%</h3>
                          <p class="text-secondary m-0">Other</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Row end -->

              <!-- Row start -->
              <div class="row">
                <div class="col-xxl-3 col-lg-6 col-md-12 col-sm-6 col-12">
                  <div class="card mb-4">
                    <div class="card-header">
                      <h4 class="card-title">Top Social Networks</h4>
                    </div>
                    <div class="card-body">
                      <div id="socialNetwork" class="mb-5"></div>
                      <!-- Row start -->
                      <div class="row text-center">
                        <div class="col-4">
                          <i class="bi bi-record-circle text-primary"></i>
                          <h3 class="m-0 mt-1">68%</h3>
                          <p class="text-secondary m-0">Google</p>
                        </div>
                        <div class="col-4">
                          <i class="bi bi-record-circle text-primary"></i>
                          <h3 class="m-0 mt-1">24%</h3>
                          <p class="text-secondary m-0">Bing</p>
                        </div>
                        <div class="col-4">
                          <i class="bi bi-record-circle text-danger"></i>
                          <h3 class="m-0 mt-1">8%</h3>
                          <p class="text-secondary m-0">Yahoo</p>
                        </div>
                      </div>
                      <!-- Row end -->
                    </div>
                  </div>
                </div>
                <div class="col-xxl-3 col-lg-6 col-md-12 col-sm-6 col-12">
                  <div class="card mb-4">
                    <div class="card-header">
                      <div class="d-flex justify-content-between align-items-center">
                        <h4 class="card-title">Bookings</h4>
                        <div id="sparkline1"></div>
                      </div>
                    </div>
                    <div class="card-body">
                      <div class="text-center my-3">
                        <h1 class="fw-bold mb-2 display-6">2,500</h1>
                        <h5 class="m-0 fw-normal opacity-50">
                          8% of total (2,54,000)
                        </h5>
                      </div>
                    </div>
                  </div>
                  <div class="card mb-4">
                    <div class="card-header">
                      <div class="d-flex justify-content-between align-items-center">
                        <h4 class="card-title">Revenue</h4>
                        <div id="sparkline2"></div>
                      </div>
                    </div>
                    <div class="card-body">
                      <div class="text-center my-3">
                        <h1 class="fw-bold mb-2 display-6">$7,900</h1>
                        <h5 class="m-0 fw-normal opacity-50">
                          15% of total ($1,85,900.00)
                        </h5>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-xxl-6 col-sm-12 col-12">
                  <div class="card mb-4">
                    <div class="card-header">
                      <h4 class="card-title">Travellers</h4>
                    </div>
                    <div class="card-body">
                      <div class="m-0">
                        <h2 class="fw-semibold mb-2">5,89,000</h2>
                        <div class="d-flex gap-4">
                          <div class="fs-5">
                            <span class="opacity-50">New</span>
                            <span>465,900</span>
                          </div>
                          <div class="fs-5">
                            <span class="opacity-50">Returning</span>
                            <span>2,50,400</span>
                          </div>
                        </div>
                      </div>
                      <div id="visitorsGraph"></div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Row end -->

              <!-- Row start -->
              <div class="row">
                <div class="col-xl-12">
                  <div class="card mb-4">
                    <div class="card-header">
                      <div class="d-flex align-items-center">
                        <div class="">
                          <h4 class="card-title">Fare Charges</h4>
                        </div>
                        <div class="btn-group ms-auto" role="group" aria-label="Basic radio toggle button group">
                          <input type="radio" class="btn-check" name="btnradio" id="btnradio1" checked="">
                          <label class="btn btn-outline-primary" for="btnradio1">Today</label>

                          <input type="radio" class="btn-check" name="btnradio" id="btnradio2">
                          <label class="btn btn-outline-primary" for="btnradio2">7 days</label>

                          <input type="radio" class="btn-check" name="btnradio" id="btnradio3">
                          <label class="btn btn-outline-primary" for="btnradio3">15 days</label>
                          <input type="radio" class="btn-check" name="btnradio" id="btnradio4">
                          <label class="btn btn-outline-primary" for="btnradio4">30 days</label>
                          <input type="radio" class="btn-check" name="btnradio" id="btnradio5">
                          <label class="btn btn-outline-primary" for="btnradio5">90 days</label>
                        </div>
                      </div>
                    </div>
                    <div class="card-body">
                      <div class="table-outer">
                        <div class="table-responsive">
                          <table class="table align-middle custom-table m-0">
                            <thead>
                              <tr>
                                <th></th>
                                <th>Sunday</th>
                                <th>Monday</th>
                                <th>Tuesday</th>
                                <th>Wednesday</th>
                                <th>Thursday</th>
                                <th>Friday</th>
                                <th>Saturday</th>
                                <th></th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td>
                                  <span class="fw-semibold">Income</span>
                                </td>
                                <td>
                                  <h2 class="my-3">72,350</h2>
                                  <div id="sparkline3"></div>
                                </td>
                                <td>
                                  <h2 class="my-3">4,860</h2>
                                  <div id="sparkline4"></div>
                                </td>
                                <td>
                                  <h2 class="my-3">8,430</h2>
                                  <div id="sparkline5"></div>
                                </td>
                                <td>
                                  <h2 class="my-3">6,980</h2>
                                  <div id="sparkline6"></div>
                                </td>
                                <td>
                                  <h2 class="my-3">2,003</h2>
                                  <div id="sparkline7"></div>
                                </td>
                                <td>
                                  <h2 class="my-3">3932</h2>
                                  <div id="sparkline8"></div>
                                </td>
                                <td>
                                  <h2 class="my-3">8998</h2>
                                  <div id="sparkline9"></div>
                                </td>
                                <td></td>
                              </tr>
                              <tr>
                                <td>Trips</td>
                                <td>26</td>
                                <td>19</td>
                                <td>16</td>
                                <td>22</td>
                                <td>12</td>
                                <td>14</td>
                                <td>21</td>
                                <td>
                                  <button class="btn btn-outline-primary btn-sm">
                                    <i class="bi bi-download"></i>
                                  </button>
                                </td>
                              </tr>
                              <tr>
                                <td>Avg.Time</td>
                                <td>10.25</td>
                                <td>14.59</td>
                                <td>15.21</td>
                                <td>12.23</td>
                                <td>10.38</td>
                                <td>15.33</td>
                                <td>12.39</td>
                                <td>
                                  <button class="btn btn-outline-primary btn-sm">
                                    <i class="bi bi-download"></i>
                                  </button>
                                </td>
                              </tr>
                              <tr>
                                <td>Waiting Time</td>
                                <td>1.25</td>
                                <td>1.32</td>
                                <td>1.21</td>
                                <td>1.12</td>
                                <td>1.54</td>
                                <td>2.54</td>
                                <td>2.32</td>
                                <td>
                                  <button class="btn btn-outline-primary btn-sm">
                                    <i class="bi bi-download"></i>
                                  </button>
                                </td>
                              </tr>
                              <tr>
                                <td>Tips</td>
                                <td>72</td>
                                <td>41</td>
                                <td>38</td>
                                <td>20</td>
                                <td>67</td>
                                <td>29</td>
                                <td>69</td>
                                <td>
                                  <button class="btn btn-outline-primary btn-sm">
                                    <i class="bi bi-download"></i>
                                  </button>
                                </td>
                              </tr>
                              <tr>
                                <td>Vehicle Type</td>
                                <td>SUV</td>
                                <td>Sedan</td>
                                <td>Van</td>
                                <td>Wagon</td>
                                <td>Crossover</td>
                                <td>Mini</td>
                                <td>Coupe</td>
                                <td>
                                  <button class="btn btn-outline-primary btn-sm">
                                    <i class="bi bi-download"></i>
                                  </button>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Row end -->

            </div>
            <!-- Container ends -->

          </div>
          <!-- App body ends -->

          <!-- App footer start -->
          <div class="app-footer">
            <span>Â© Bootstrap Gallery 2024</span>
          </div>
          <!-- App footer end -->

        </div>
        <!-- App container ends -->

      </div>
      <!-- Main container end -->

    </div>
    <!-- Page wrapper end -->

    <!-- *************
			************ JavaScript Files *************
		************* -->
    <!-- Required jQuery first, then Bootstrap Bundle JS -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <!-- *************
			************ Vendor Js Files *************
		************* -->

    <!-- Overlay Scroll JS -->
    <script src="assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
    <script src="assets/vendor/overlay-scroll/custom-scrollbar.js"></script>

    <!-- Toastify JS -->
    <script src="assets/vendor/toastify/toastify.js"></script>
    <script src="assets/vendor/toastify/custom.js"></script>

    <!-- Apex Charts -->
    <script src="assets/vendor/apex/apexcharts.min.js"></script>
    <script src="assets/vendor/apex/custom/home/overview.js"></script>
    <script src="assets/vendor/apex/custom/home/reachedAudience.js"></script>
    <script src="assets/vendor/apex/custom/home/social.js"></script>
    <script src="assets/vendor/apex/custom/home/sparkline.js"></script>
    <script src="assets/vendor/apex/custom/home/sparkline2.js"></script>
    <script src="assets/vendor/apex/custom/home/visitors.js"></script>

    <!-- Custom JS files -->
    <script src="assets/js/custom.js"></script>
  </body>

</html>
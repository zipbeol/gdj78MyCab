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

    <!-- *************
			************ Vendor Css Files *************
		************ -->

    <!-- Scrollbar CSS -->
    <link rel="stylesheet" href="/assets/vendor/overlay-scroll/OverlayScrollbars.min.css">

    <!-- Toastify CSS -->
    <link rel="stylesheet" href="/assets/vendor/toastify/toastify.css">

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
              <img src="/assets/images/logo.svg" class="logo" alt="Bootstrap Gallery">
            </a>
          </div>
          <!-- App brand ends -->

          <!-- Sidebar menu starts -->
          <div class="sidebarMenuScroll">
            <ul class="sidebar-menu">
              <li>
                <a href="index.go">
                  <i class="bi bi-speedometer2"></i>
                  <span class="menu-text">Dashboard</span>
                </a>
              </li>
              <li class="active current-page">
                <a href="trips.go">
                  <i class="bi bi-car-front"></i>
                  <span class="menu-text">Trips</span>
                  <span class="badge border border-danger text-danger rounded-5 ms-2">New</span>
                </a>
              </li>
              <li>
                <a href="upcoming-trips.go">
                  <i class="bi bi-pin-map"></i>
                  <span class="menu-text">Upcoming Trips</span>
                </a>
              </li>
              <li>
                <a href="trip-history.go">
                  <i class="bi bi-map"></i>
                  <span class="menu-text">Trips History</span>
                </a>
              </li>
              <li>
                <a href="customers.go">
                  <i class="bi bi-person"></i>
                  <span class="menu-text">Customers</span>
                </a>
              </li>
              <li>
                <a href="available-cabs.go">
                  <i class="bi bi-phone-vibrate"></i>
                  <span class="menu-text">Available Cabs</span>
                </a>
              </li>
              <li>
                <a href="faq.go">
                  <i class="bi bi-box"></i>
                  <span class="menu-text">FAQ's</span>
                  <span class="badge border border-success text-success rounded-5 ms-2">New</span>
                </a>
              </li>
              <li class="treeview">
                <a href="#!">
                  <i class="bi bi-calendar2"></i>
                  <span class="menu-text">Calendars</span>
                </a>
                <ul class="treeview-menu">
                  <li>
                    <a href="calendar.go">Daygrid View</a>
                  </li>
                  <li>
                    <a href="calendar-external-draggable.go">External Draggable</a>
                  </li>
                  <li>
                    <a href="calendar-google.go">Google Calendar</a>
                  </li>
                  <li>
                    <a href="calendar-list-view.go">List View</a>
                  </li>
                  <li>
                    <a href="calendar-selectable.go">Selectable</a>
                  </li>
                </ul>
              </li>
              <li class="treeview">
                <a href="#!">
                  <i class="bi bi-stickies"></i>
                  <span class="menu-text">Components</span>
                </a>
                <ul class="treeview-menu">
                  <li>
                    <a href="accordions.go">Accordions</a>
                  </li>
                  <li>
                    <a href="alerts.go">Alerts</a>
                  </li>
                  <li>
                    <a href="avatars.go">Avatars</a>
                  </li>
                  <li>
                    <a href="buttons.go">Buttons</a>
                  </li>
                  <li>
                    <a href="badges.go">Badges</a>
                  </li>
                  <li>
                    <a href="carousel.go">Carousel</a>
                  </li>
                  <li>
                    <a href="list-items.go">List Items</a>
                  </li>
                  <li>
                    <a href="placeholders.go">Placeholders</a>
                  </li>
                  <li>
                    <a href="progress.go">Progress Bars</a>
                  </li>
                  <li>
                    <a href="popovers.go">Popovers</a>
                  </li>
                  <li>
                    <a href="spinners.go">Spinners</a>
                  </li>
                  <li>
                    <a href="tooltips.go">Tooltips</a>
                  </li>
                </ul>
              </li>
              <li class="treeview">
                <a href="#!">
                  <i class="bi bi-ui-checks-grid"></i>
                  <span class="menu-text">Forms</span>
                </a>
                <ul class="treeview-menu">
                  <li>
                    <a href="form-inputs.go">Basic Form Inputs</a>
                  </li>
                  <li>
                    <a href="form-checkbox-radio.go">Checkbox &amp; Radio</a>
                  </li>
                  <li>
                    <a href="form-file-input.go">File Input</a>
                  </li>
                  <li>
                    <a href="form-validations.go">Validations</a>
                  </li>
                  <li>
                    <a href="date-time-pickers.go">Date Time Pickers</a>
                  </li>
                  <li>
                    <a href="form-layouts.go">Form Layouts</a>
                  </li>
                </ul>
              </li>
              <li>
                <a href="tables.go">
                  <i class="bi bi-border-all"></i>
                  <span class="menu-text">Tables</span>
                </a>
              </li>
              <li>
                <a href="settings.go">
                  <i class="bi bi-gear"></i>
                  <span class="menu-text">Settings</span>
                </a>
              </li>
              <li>
                <a href="profile.go">
                  <i class="bi bi-postcard"></i>
                  <span class="menu-text">Profile</span>
                </a>
              </li>
              <li>
                <a href="starter-page.go">
                  <i class="bi bi-layout-text-window-reverse"></i>
                  <span class="menu-text">Starter Page</span>
                </a>
              </li>
              <li class="treeview">
                <a href="#!">
                  <i class="bi bi-code-square"></i>
                  <span class="menu-text">Cards</span>
                </a>
                <ul class="treeview-menu">
                  <li>
                    <a href="cards.go">Cards</a>
                  </li>
                  <li>
                    <a href="advanced-cards.go">Advanced Cards</a>
                  </li>
                </ul>
              </li>
              <li class="treeview">
                <a href="#!">
                  <i class="bi bi-pie-chart"></i>
                  <span class="menu-text">Graphs</span>
                </a>
                <ul class="treeview-menu">
                  <li>
                    <a href="apex.go">Apex</a>
                  </li>
                  <li>
                    <a href="morris.go">Morris</a>
                  </li>
                </ul>
              </li>
              <li>
                <a href="maps.go">
                  <i class="bi bi-pin-map"></i>
                  <span class="menu-text">Maps</span>
                </a>
              </li>
              <li>
                <a href="tabs.go">
                  <i class="bi bi-slash-square"></i>
                  <span class="menu-text">Tabs</span>
                </a>
              </li>
              <li>
                <a href="modals.go">
                  <i class="bi bi-terminal"></i>
                  <span class="menu-text">Modals</span>
                </a>
              </li>
              <li>
                <a href="icons.go">
                  <i class="bi bi-textarea"></i>
                  <span class="menu-text">Icons</span>
                </a>
              </li>
              <li>
                <a href="typography.go">
                  <i class="bi bi-explicit"></i>
                  <span class="menu-text">Typography</span>
                </a>
              </li>
              <li class="treeview">
                <a href="#!">
                  <i class="bi bi-upc-scan"></i>
                  <span class="menu-text">Login/Signup</span>
                </a>
                <ul class="treeview-menu">
                  <li>
                    <a href="login.go">Login</a>
                  </li>
                  <li>
                    <a href="signup.go">Signup</a>
                  </li>
                  <li>
                    <a href="forgot-password.go">Forgot Password</a>
                  </li>
                </ul>
              </li>
              <li>
                <a href="page-not-found.go">
                  <i class="bi bi-exclamation-diamond"></i>
                  <span class="menu-text">Page Not Found</span>
                </a>
              </li>
              <li>
                <a href="maintenance.go">
                  <i class="bi bi-exclamation-octagon"></i>
                  <span class="menu-text">Maintenance</span>
                </a>
              </li>
              <li class="treeview">
                <a href="#!">
                  <i class="bi bi-code-square"></i>
                  <span class="menu-text">Multi Level</span>
                </a>
                <ul class="treeview-menu">
                  <li>
                    <a href="#!">Level One Link</a>
                  </li>
                  <li>
                    <a href="#!">
                      Level One Menu
                      <i class="bi bi-chevron-right"></i>
                    </a>
                    <ul class="treeview-menu">
                      <li>
                        <a href="#!">Level Two Link</a>
                      </li>
                      <li>
                        <a href="#!">Level Two Menu
                          <i class="bi bi-chevron-right"></i>
                        </a>
                        <ul class="treeview-menu">
                          <li>
                            <a href="#!">Level Three Link</a>
                          </li>
                          <li>
                            <a href="#!">Level Three Link</a>
                          </li>
                        </ul>
                      </li>
                    </ul>
                  </li>
                  <li>
                    <a href="#!">Level One Link</a>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
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
                <img src="/assets/images/logo-sm.svg" class="logo" alt="Bootstrap Gallery">
              </a>
            </div>
            <!-- App brand sm end -->

            <!-- Breadcrumb start -->
            <ol class="breadcrumb d-none d-lg-flex ms-3">
              <li class="breadcrumb-item">
                <i class="bi bi-house lh-1"></i>
                <a href="index.go" class="text-decoration-none">Home</a>
              </li>
              <li class="breadcrumb-item text-secondary">Sales</li>
            </ol>
            <!-- Breadcrumb end -->

            <!-- App header actions start -->
            <div class="header-actions">
              <div class="dropdown">
                <a class="dropdown-toggle d-flex px-3 py-4 position-relative" href="#!" role="button"
                  data-bs-toggle="dropdown" aria-expanded="false">
                  <img src="/assets/images/flags/1x1/gb.svg" class="flag-img" alt="Cab Admin Template">
                </a>
                <div class="dropdown-menu dropdown-menu-end shadow-sm dropdown-menu-mini">
                  <div class="country-container">
                    <a href="index.go" class="py-2">
                      <img src="/assets/images/flags/1x1/us.svg" alt="Business Dashboard Templates">
                    </a>
                    <a href="index.go" class="py-2">
                      <img src="/assets/images/flags/1x1/in.svg" alt="Business Dashboard Templates">
                    </a>
                    <a href="index.go" class="py-2">
                      <img src="/assets/images/flags/1x1/br.svg" alt="Business Dashboard Templates">
                    </a>
                    <a href="index.go" class="py-2">
                      <img src="/assets/images/flags/1x1/tr.svg" alt="IT Dashboard Templates">
                    </a>
                    <a href="index.go" class="py-2">
                      <img src="/assets/images/flags/1x1/id.svg" alt="IT Dashboard Templates">
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
                      <img src="/assets/images/brand-behance.svg" class="img-3x" alt="IT Dashboard Templates">
                    </a>
                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                      <img src="/assets/images/brand-google.svg" class="img-3x" alt="IT Dashboard Templates">
                    </a>
                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                      <img src="/assets/images/brand-bitcoin.svg" class="img-3x" alt="IT Dashboard Templates">
                    </a>
                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                      <img src="/assets/images/brand-dribbble.svg" class="img-3x" alt="IT Dashboard Templates">
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
                      <img src="/assets/images/user.png" class="img-3x me-3 rounded-3" alt="Admin Templates">
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
                      <img src="/assets/images/user2.png" class="img-3x me-3 rounded-3" alt="Admin Templates">
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
                      <img src="/assets/images/user1.png" class="img-3x me-3 rounded-3" alt="Admin Templates">
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
                  <img src="/assets/images/user.png" class="rounded-2 img-3x" alt="Bootstrap Gallery">
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
                <div class="col-xl-4 col-lg-6 col-12">
                  <div class="card mb-4">
                    <div class="card-body">
                      <div class="d-flex flex-row justify-content-between">
                        <div>
                          <h5 class="mb-4 fw-normal">Booked Trips</h5>
                          <h1 class="fw-bold m-0 display-6">280</h1>
                        </div>
                        <div class="d-flex justify-content-between flex-column">
                          <div class="growth-block mb-4 danger rounded-5">
                            <i class="bi bi-caret-up-fill"></i>
                            <span>20%</span>
                          </div>
                          <a href="javascript:void(0)"
                            class="text-primary text-decoration-none d-flex align-items-center">Details <i
                              class="bi bi-caret-right-fill fs-4"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-xl-4 col-lg-6 col-12">
                  <div class="card mb-4">
                    <div class="card-body">
                      <div class="d-flex flex-row justify-content-between">
                        <div>
                          <h5 class="mb-4 fw-normal">Total Earning</h5>
                          <h1 class="fw-bold m-0 display-6">3900</h1>
                        </div>
                        <div class="d-flex justify-content-between flex-column">
                          <div class="growth-block mb-4 info rounded-5">
                            <i class="bi bi-caret-up-fill"></i>
                            <span>30%</span>
                          </div>
                          <a href="javascript:void(0)"
                            class="text-primary text-decoration-none d-flex align-items-center">Details <i
                              class="bi bi-caret-right-fill fs-4"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-xl-4 col-lg-12 col-12">
                  <div class="card mb-4">
                    <div class="card-body">
                      <div class="d-flex flex-row justify-content-between">
                        <div>
                          <h5 class="mb-4 fw-normal">Available Cabs</h5>
                          <h1 class="fw-bold m-0 display-6">240</h1>
                        </div>
                        <div class="d-flex justify-content-between flex-column">
                          <div class="growth-block mb-4 success rounded-5">
                            <i class="bi bi-caret-down-fill"></i>
                            <span>30%</span>
                          </div>
                          <a href="javascript:void(0)"
                            class="text-primary text-decoration-none d-flex align-items-center">Details <i
                              class="bi bi-caret-right-fill fs-4"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Row end -->

              <!-- Row start -->
              <div class="row">
                <div class="col-12">
                  <div class="card mb-4">
                    <div class="card-header">
                      <h4 class="card-title">Trips Stats</h4>
                    </div>
                    <div class="card-body">
                      <div id="visitorsStats"></div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Row end -->

              <!-- Row start -->
              <div class="row">
                <div class="col-xl-6 col-12">
                  <div class="card mb-4">
                    <div class="card-header">
                      <h4 class="card-title">Recent Trips</h4>
                    </div>
                    <div class="card-body">
                      <div class="table-outer">
                        <div class="table-responsive">
                          <table class="table align-middle custom-table m-0">
                            <thead>
                              <tr>
                                <th></th>
                                <th>Cab Type</th>
                                <th>Time</th>
                                <th>Amount</th>
                                <th>Status</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td>
                                  <img src="/assets/images/products/product1.jpg" alt="Bootstrap Admin Dashboard"
                                    class="img-4x rounded-3">
                                </td>
                                <td>
                                  <a href="#" class="btn-link">Cycapair Color Cream</a>
                                </td>
                                <td>10:30AM</td>
                                <td>$29</td>
                                <td>
                                  <button class="btn btn-outline-success btn-sm">
                                    Done
                                  </button>
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <img src="/assets/images/products/product3.jpg" alt="Bootstrap Admin Dashboard"
                                    class="img-4x rounded-3">
                                </td>
                                <td>
                                  <a href="#" class="btn-link">Yuji Cream</a>
                                </td>
                                <td>10:40AM</td>
                                <td>$48</td>
                                <td>
                                  <button class="btn btn-outline-success btn-sm">
                                    Done
                                  </button>
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <img src="/assets/images/products/product7.jpg" alt="Bootstrap Admin Dashboard"
                                    class="img-4x rounded-3">
                                </td>
                                <td>
                                  <a href="#" class="btn-link">Meswak Cream</a>
                                </td>
                                <td>11:00AM</td>
                                <td>$65</td>
                                <td>
                                  <button class="btn btn-outline-danger btn-sm">
                                    Cancelled
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
                <div class="col-xl-6 col-12">
                  <div class="card mb-4">
                    <div class="card-header">
                      <h4 class="card-title">Customers Data</h4>
                    </div>
                    <div class="card-body">
                      <div class="d-flex gap-4 justify-content-center flex-row">
                        <div class="stats-block bg-primary">
                          <i class="bi bi-bag-plus"></i>
                          <span>New</span>
                        </div>
                        <div class="stats-block bg-secondary">
                          <i class="bi bi-bag-check"></i>
                          <span>Return</span>
                        </div>
                        <div class="stats-block bg-dark">
                          <i class="bi bi-cart3"></i>
                          <span>Trips</span>
                        </div>
                      </div>
                      <div id="customersData"></div>
                    </div>
                  </div>
                </div>
                <div class="col-12">
                  <div class="card mb-4">
                    <div class="card-header">
                      <div class="d-flex align-items-end flex-wrap">
                        <div class="">
                          <h4 class="card-title">Top Countries By Income</h4>
                          <h5 class="fw-light mt-2 mb-0 lh-1">
                            Million US Dollars
                          </h5>
                        </div>
                        <div class="btn-group ms-auto" role="group" aria-label="Basic radio toggle button group">
                          <input type="radio" class="btn-check" name="btnradio" id="btnradio1" checked="">
                          <label class="btn btn-outline-primary" for="btnradio1">Q4</label>

                          <input type="radio" class="btn-check" name="btnradio" id="btnradio2">
                          <label class="btn btn-outline-primary" for="btnradio2">Q3</label>

                          <input type="radio" class="btn-check" name="btnradio" id="btnradio3">
                          <label class="btn btn-outline-primary" for="btnradio3">Q2</label>
                          <input type="radio" class="btn-check" name="btnradio" id="btnradio4">
                          <label class="btn btn-outline-primary" for="btnradio4">Q1</label>
                        </div>
                      </div>
                    </div>
                    <div class="card-body">
                      <div class="table-outer">
                        <!-- Row start -->
                        <div class="row">
                          <div class="col-xxl-8 col-md-12">
                            <div class="table-responsive">
                              <table class="table align-middle custom-table m-0">
                                <thead>
                                  <tr>
                                    <th></th>
                                    <th>Country</th>
                                    <th>Users</th>
                                    <th>Trips</th>
                                    <th>Income</th>
                                    <th>Conversion</th>
                                    <th></th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <td></td>
                                    <td></td>
                                    <td>
                                      <h2 class="my-3">86,750</h2>
                                    </td>
                                    <td>
                                      <h2 class="my-3">28560</h2>
                                    </td>
                                    <td>
                                      <h2 class="my-3">$7,58,920</h2>
                                    </td>
                                    <td>
                                      <h2 class="my-3 text-primary">25.5%</h2>
                                    </td>
                                    <td></td>
                                  </tr>
                                  <tr>
                                    <td>1</td>
                                    <td>
                                      <img src="/assets/images/flags/1x1/us.svg" alt="Bootstrap Admin Dashboard"
                                        class="img-2x rounded-3">
                                    </td>
                                    <td>Usa</td>
                                    <td>24,386</td>
                                    <td>6350</td>
                                    <td>18.5%</td>
                                    <td>
                                      <button class="btn btn-outline-primary btn-sm">
                                        View
                                      </button>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>2</td>
                                    <td>
                                      <img src="/assets/images/flags/1x1/in.svg" alt="Bootstrap Admin Dashboard"
                                        class="img-2x rounded-3">
                                    </td>
                                    <td>India</td>
                                    <td>18,226</td>
                                    <td>5482</td>
                                    <td>24.5%</td>
                                    <td>
                                      <button class="btn btn-outline-primary btn-sm">
                                        View
                                      </button>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>3</td>
                                    <td>
                                      <img src="/assets/images/flags/1x1/br.svg" alt="Bootstrap Admin Dashboard"
                                        class="img-2x rounded-3">
                                    </td>
                                    <td>Brazil</td>
                                    <td>14,364</td>
                                    <td>3290</td>
                                    <td>33.6%</td>
                                    <td>
                                      <button class="btn btn-outline-primary btn-sm">
                                        View
                                      </button>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>4</td>
                                    <td>
                                      <img src="/assets/images/flags/1x1/tr.svg" alt="Bootstrap Admin Dashboard"
                                        class="img-2x rounded-3">
                                    </td>
                                    <td>Turkey</td>
                                    <td>12,775</td>
                                    <td>2536</td>
                                    <td>29.2%</td>
                                    <td>
                                      <button class="btn btn-outline-primary btn-sm">
                                        View
                                      </button>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>5</td>
                                    <td>
                                      <img src="/assets/images/flags/1x1/de.svg" alt="Bootstrap Admin Dashboard"
                                        class="img-2x rounded-3">
                                    </td>
                                    <td>Germany</td>
                                    <td>9,238</td>
                                    <td>2290</td>
                                    <td>11.2%</td>
                                    <td>
                                      <button class="btn btn-outline-primary btn-sm">
                                        View
                                      </button>
                                    </td>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                          </div>
                          <div class="col-xxl-4 col-md-12">
                            <div id="world-map-markers2" class="chart-height-xl mt-5 p-3"></div>
                          </div>
                        </div>
                        <!-- Row end -->
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
    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/js/bootstrap.bundle.min.js"></script>

    <!-- *************
			************ Vendor Js Files *************
		************* -->

    <!-- Overlay Scroll JS -->
    <script src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
    <script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>

    <!-- Toastify JS -->
    <script src="/assets/vendor/toastify/toastify.js"></script>
    <script src="/assets/vendor/toastify/custom.js"></script>

    <!-- Apex Charts -->
    <script src="/assets/vendor/apex/apexcharts.min.js"></script>
    <script src="/assets/vendor/apex/custom/home2/visitorsStats.js"></script>
    <script src="/assets/vendor/apex/custom/home2/customersData.js"></script>

    <!-- Vector Maps -->
    <script src="/assets/vendor/jvectormap/jquery-jvectormap-2.0.5.min.js"></script>
    <script src="/assets/vendor/jvectormap/world-mill-en.js"></script>
    <script src="/assets/vendor/jvectormap/gdp-data.js"></script>
    <script src="/assets/vendor/jvectormap/continents-mill.js"></script>
    <script src="/assets/vendor/jvectormap/custom/world-map-markers2.js"></script>

    <!-- Custom JS files -->
    <script src="/assets/js/custom.js"></script>
  </body>

</html>
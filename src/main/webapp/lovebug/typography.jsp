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
              <li>
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
              <li class="active current-page">
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
              <li class="breadcrumb-item text-secondary">Typography</li>
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
              <div class="row gx-3">
                <div class="col-xxl-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="p-5">
                        <div class="row flex-lg-row-reverse align-items-center">
                          <div class="col-10 col-sm-8 col-lg-6">
                            <div class="mt-4">
                              <img src="/assets/images/products/product5.jpg"
                                class="d-block mx-lg-auto img-fluid rounded-5" alt="Example image">
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <h1 class="display-5">
                              Responsive left-aligned hero with image
                            </h1>
                            <p class="lead mb-4">
                              Quickly design and customize responsive
                              mobile-first sites with Bootstrap, the worldâs
                              most popular front-end open source toolkit,
                              featuring Sass variables and mixins, responsive
                              grid system, extensive prebuilt components, and
                              powerful JavaScript plugins.
                            </p>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                              <button type="button" class="btn btn-danger btn-lg">
                                Button
                              </button>
                              <button type="button" class="btn btn-info btn-lg">
                                Button
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Row end -->

              <!-- Row start -->
              <div class="row gx-3">
                <div class="col-xxl-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="p-5 text-center">
                        <h1 class="display-5 text-success">Centered Hero</h1>
                        <div class="col-lg-6 mx-auto">
                          <p class="lead mb-4">
                            Quickly design and customize responsive mobile-first
                            sites with Bootstrap, the worldâs most popular
                            front-end open source toolkit, featuring Sass
                            variables and mixins, responsive grid system,
                            extensive prebuilt components, and powerful
                            JavaScript plugins.
                          </p>
                          <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                            <button type="button" class="btn btn-success btn-lg">
                              Button
                            </button>
                            <button type="button" class="btn btn-secondary btn-lg">
                              Button
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Row end -->

              <!-- Row start -->
              <div class="row gx-3">
                <div class="col-xxl-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="p-5 text-center">
                        <h1 class="display-5 text-success">
                          Centered Screenshot
                        </h1>
                        <div class="col-lg-6 mx-auto">
                          <p class="lead mb-4">
                            Quickly design and customize responsive mobile-first
                            sites with Bootstrap, the worldâs most popular
                            front-end open source toolkit, featuring Sass
                            variables and mixins, responsive grid system,
                            extensive prebuilt components, and powerful
                            JavaScript plugins.
                          </p>
                          <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                            <button type="button" class="btn btn-success btn-lg">
                              Button
                            </button>
                            <button type="button" class="btn btn-secondary btn-lg">
                              Button
                            </button>
                          </div>
                          <div class="mt-4">
                            <img src="/assets/images/products/product10.jpg" class="img-fluid rounded-5 mb-4"
                              alt="Example image">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Row end -->

              <!-- Row start -->
              <div class="row gx-3">
                <div class="col-lg-6 col-sm-12 col-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <h1 class="mb-3">h1. Admin Heading</h1>
                      <h2 class="mb-3">h2. Admin Heading</h2>
                      <h3 class="mb-3">h3. Admin Heading</h3>
                      <h4 class="mb-3">h4. Admin Heading</h4>
                      <h5 class="mb-3">h5. Admin Heading</h5>
                      <h6 class="mb-3">h6. Admin Heading</h6>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 col-sm-12 col-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <h1 class="mb-3 text-dark">h1. Admin Heading</h1>
                      <h2 class="mb-3 text-secondary">h2. Admin Heading</h2>
                      <h3 class="mb-3 text-danger">h3. Admin Heading</h3>
                      <h4 class="mb-3 text-info">h4. Admin Heading</h4>
                      <h5 class="mb-3 text-success">h5. Admin Heading</h5>
                      <h6 class="mb-3 text-warning">h6. Admin Heading</h6>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 col-sm-12 col-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <h1 class="display-1">Display 1</h1>
                      <h1 class="display-2">Display 2</h1>
                      <h1 class="display-3">Display 3</h1>
                      <h1 class="display-4">Display 4</h1>
                      <h1 class="display-5">Display 5</h1>
                      <h1 class="display-6">Display 6</h1>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 col-sm-12 col-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <h1 class="display-1 text-dark">Display 1</h1>
                      <h1 class="display-2 text-secondary">Display 2</h1>
                      <h1 class="display-3 text-danger">Display 3</h1>
                      <h1 class="display-4 text-info">Display 4</h1>
                      <h1 class="display-5 text-success">Display 5</h1>
                      <h1 class="display-6 text-warning">Display 6</h1>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 col-sm-12 col-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <p class="fs-1">.fs-1 text</p>
                      <p class="fs-2">.fs-2 text</p>
                      <p class="fs-3">.fs-3 text</p>
                      <p class="fs-4">.fs-4 text</p>
                      <p class="fs-5">.fs-5 text</p>
                      <p class="fs-6">.fs-6 text</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 col-sm-12 col-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <p class="fs-1 text-dark">.fs-1 text</p>
                      <p class="fs-2 text-secondary">.fs-2 text</p>
                      <p class="fs-3 text-danger">.fs-3 text</p>
                      <p class="fs-4 text-info">.fs-4 text</p>
                      <p class="fs-5 text-success">.fs-5 text</p>
                      <p class="fs-6 text-warning">.fs-6 text</p>
                    </div>
                  </div>
                </div>
                <div class="col-xxl-12">
                  <div class="card mb-3">
                    <div class="card-header">
                      <h5 class="card-title">Text Colors</h5>
                    </div>
                    <div class="card-body">
                      <p class="text-primary">Text Primary</p>
                      <p class="text-secondary">Text Secondary</p>
                      <p class="text-light">Text Light</p>
                      <p class="text-dark">Text Dark</p>
                      <p class="text-muted">Text Muted</p>
                      <p class="text-danger">Text Danger</p>
                      <p class="text-info">Text Info</p>
                      <p class="text-success">Text Success</p>
                      <p class="text-warning">Text Warning</p>
                    </div>
                  </div>
                </div>
                <div class="col-xxl-12">
                  <div class="card mb-3">
                    <div class="card-header">
                      <h5 class="card-title">Text Alignments</h5>
                    </div>
                    <div class="card-body">
                      <p class="text-start">
                        Start aligned text on all viewport sizes.
                      </p>
                      <p class="text-center">
                        Center aligned text on all viewport sizes.
                      </p>
                      <p class="text-end">
                        End aligned text on all viewport sizes.
                      </p>
                    </div>
                  </div>
                </div>
                <div class="col-xxl-12">
                  <div class="card mb-3">
                    <div class="card-header">
                      <h5 class="card-title">Word break</h5>
                    </div>
                    <div class="card-body">
                      <p class="text-break">
                        mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
                      </p>
                    </div>
                  </div>
                </div>
                <div class="col-xxl-12">
                  <div class="card mb-3">
                    <div class="card-header">
                      <h5 class="card-title">Text transform</h5>
                    </div>
                    <div class="card-body">
                      <p class="text-lowercase">Lowercased text.</p>
                      <p class="text-uppercase">Uppercased text.</p>
                      <p class="text-capitalize">CapiTaliZed text.</p>
                    </div>
                  </div>
                </div>
                <div class="col-xxl-12">
                  <div class="card mb-3">
                    <div class="card-header">
                      <h5 class="card-title">Font weight and italics</h5>
                    </div>
                    <div class="card-body">
                      <p class="fw-bold">Bold text.</p>
                      <p class="fw-bolder">
                        Bolder weight text (relative to the parent element).
                      </p>
                      <p class="fw-semibold">Semibold weight text.</p>
                      <p class="fw-normal">Normal weight text.</p>
                      <p class="fw-light">Light weight text.</p>
                      <p class="fw-lighter">
                        Lighter weight text (relative to the parent element).
                      </p>
                      <p class="fst-italic">Italic text.</p>
                      <p class="fst-normal">Text with normal font style</p>
                    </div>
                  </div>
                </div>
                <div class="col-xxl-12">
                  <div class="card mb-3">
                    <div class="card-header">
                      <h5 class="card-title">Line height</h5>
                    </div>
                    <div class="card-body">
                      <p class="lh-1">
                        This is a long paragraph written to show how the
                        line-height of an element is affected by our utilities.
                        Classes are applied to the element itself or sometimes
                        the parent element. These classes can be customized as
                        needed with our utility API.
                      </p>
                      <p class="lh-sm">
                        This is a long paragraph written to show how the
                        line-height of an element is affected by our utilities.
                        Classes are applied to the element itself or sometimes
                        the parent element. These classes can be customized as
                        needed with our utility API.
                      </p>
                      <p class="lh-base">
                        This is a long paragraph written to show how the
                        line-height of an element is affected by our utilities.
                        Classes are applied to the element itself or sometimes
                        the parent element. These classes can be customized as
                        needed with our utility API.
                      </p>
                      <p class="lh-lg">
                        This is a long paragraph written to show how the
                        line-height of an element is affected by our utilities.
                        Classes are applied to the element itself or sometimes
                        the parent element. These classes can be customized as
                        needed with our utility API.
                      </p>
                    </div>
                  </div>
                </div>
                <div class="col-xxl-12">
                  <div class="card mb-3">
                    <div class="card-header">
                      <h5 class="card-title">Text decoration</h5>
                    </div>
                    <div class="card-body">
                      <p class="text-decoration-underline">
                        This text has a line underneath it.
                      </p>
                      <p class="text-decoration-line-through">
                        This text has a line going through it.
                      </p>
                      <a href="#" class="text-decoration-none">This link has its text decoration removed</a>
                    </div>
                  </div>
                </div>
                <div class="col-xxl-12">
                  <div class="card mb-3">
                    <div class="card-header">
                      <h5 class="card-title">Colored links</h5>
                    </div>
                    <div class="card-body">
                      <div class="d-flex gap-4 flex-wrap">
                        <a href="#" class="link-primary">Primary link</a>
                        <a href="#" class="link-secondary">Secondary link</a>
                        <a href="#" class="link-success">Success link</a>
                        <a href="#" class="link-danger">Danger link</a>
                        <a href="#" class="link-warning">Warning link</a>
                        <a href="#" class="link-info">Info link</a>
                        <a href="#" class="link-light">Light link</a>
                        <a href="#" class="link-dark">Dark link</a>
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

    <!-- Custom JS files -->
    <script src="/assets/js/custom.js"></script>
  </body>

</html>
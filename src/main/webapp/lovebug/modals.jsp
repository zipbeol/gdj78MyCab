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
              <li class="active current-page">
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
              <li class="breadcrumb-item text-secondary">Modals</li>
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
                      <div class="modal position-static d-block shade-light rounded-3" tabindex="-1" role="dialog"
                        id="modalSheet">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title">Modal title</h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              <p>
                                This is a modal sheet, a variation of the modal
                                that docs itself to the bottom of the viewport
                                like the newer share sheets in iOS.
                              </p>
                            </div>
                            <div class="modal-footer flex-column">
                              <button type="button" class="btn btn-lg btn-primary w-100 mx-0 mb-2">
                                Save changes
                              </button>
                              <button type="button" class="btn btn-lg btn-secondary w-100 mx-0" data-bs-dismiss="modal">
                                Close
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
                      <div class="modal modal-alert position-static d-block bg-primary rounded-3" tabindex="-1"
                        role="dialog" id="modalChoice">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <div class="modal-body p-4 text-center">
                              <h5 class="text-primary">Enable this setting?</h5>
                              <p class="mb-0">
                                You can always change your mind in your account
                                settings.
                              </p>
                            </div>
                            <div class="modal-footer flex-nowrap p-0">
                              <button type="button" class="btn text-primary fs-6 col-6 m-0 border-end">
                                <strong>Yes, enable</strong>
                              </button>
                              <button type="button" class="btn text-secondary fs-6 col-6 m-0" data-bs-dismiss="modal">
                                No thanks
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
                <div class="col-xxl-4">
                  <!-- Card start -->
                  <div class="card mb-3">
                    <div class="card-body">
                      <!-- Button trigger modal -->
                      <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#exampleModal">
                        Launch demo modal
                      </button>

                      <!-- Modal -->
                      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel">
                                Modal title
                              </h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                            </div>
                            <div class="modal-body">...</div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                Close
                              </button>
                              <button type="button" class="btn btn-primary">
                                Save changes
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- Card end -->
                </div>
                <div class="col-xxl-4">
                  <!-- Card start -->
                  <div class="card mb-3">
                    <div class="card-body">
                      <!-- Button trigger modal -->
                      <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#staticBackdrop">
                        Launch static backdrop modal
                      </button>
                      <!-- Modal -->
                      <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                        tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="staticBackdropLabel">
                                Modal title
                              </h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                            </div>
                            <div class="modal-body">...</div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                Close
                              </button>
                              <button type="button" class="btn btn-primary">
                                Understood
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- Card end -->
                </div>
                <div class="col-xxl-4">
                  <!-- Card start -->
                  <div class="card mb-3">
                    <div class="card-body">
                      <!-- Button trigger modal -->
                      <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#exampleModalScrollable">
                        Launch demo modal
                      </button>
                      <!-- Modal -->
                      <div class="modal fade" id="exampleModalScrollable" tabindex="-1"
                        aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-scrollable">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalScrollableTitle">
                                Modal title
                              </h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              <p>
                                This is some placeholder content to show the
                                scrolling behavior for modals. We use repeated
                                line breaks to demonstrate how content can
                                exceed minimum inner height, thereby showing
                                inner scrolling. When content becomes longer
                                than the predefined max-height of modal, content
                                will be cropped and scrollable within the modal.
                              </p>
                              <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                              <p>
                                This content should appear at the bottom after
                                you scroll.
                              </p>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                Close
                              </button>
                              <button type="button" class="btn btn-primary">
                                Save changes
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- Card end -->
                </div>
                <div class="col-xxl-4">
                  <!-- Card start -->
                  <div class="card mb-3">
                    <div class="card-body">
                      <!-- Button trigger modal -->
                      <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#exampleModalCenter">
                        Vertically centered modal
                      </button>
                      <!-- Modal -->
                      <div class="modal fade" id="exampleModalCenter" tabindex="-1"
                        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalCenterTitle">
                                Modal title
                              </h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              <p>This is a vertically centered modal.</p>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                Close
                              </button>
                              <button type="button" class="btn btn-primary">
                                Save changes
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- Card end -->
                </div>
                <div class="col-xxl-4">
                  <!-- Card start -->
                  <div class="card mb-3">
                    <div class="card-body">
                      <!-- Button trigger modal -->
                      <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#exampleModalCenteredScrollable">
                        Vertically centered scrollable modal
                      </button>
                      <!-- Modal -->
                      <div class="modal fade" id="exampleModalCenteredScrollable" tabindex="-1"
                        aria-labelledby="exampleModalCenteredScrollableTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalCenteredScrollableTitle">
                                Modal title
                              </h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              <p>
                                This is some placeholder content to show a
                                vertically centered modal. We've added some
                                extra copy here to show how vertically centering
                                the modal works when combined with scrollable
                                modals. We also use some repeated line breaks to
                                quickly extend the height of the content,
                                thereby triggering the scrolling. When content
                                becomes longer than the predefined max-height of
                                modal, content will be cropped and scrollable
                                within the modal.
                              </p>
                              <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                              <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                              <p>Just like that.</p>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                Close
                              </button>
                              <button type="button" class="btn btn-primary">
                                Save changes
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- Card end -->
                </div>
                <div class="col-xxl-4">
                  <!-- Card start -->
                  <div class="card mb-3">
                    <div class="card-body">
                      <!-- Modal -->
                      <div class="modal fade" id="exampleModalToggle" aria-hidden="true"
                        aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalToggleLabel">
                                Modal 1
                              </h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              Show a second modal and hide this one with the
                              button below.
                            </div>
                            <div class="modal-footer">
                              <button class="btn btn-primary" data-bs-target="#exampleModalToggle2"
                                data-bs-toggle="modal">
                                Open second modal
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="modal fade" id="exampleModalToggle2" aria-hidden="true"
                        aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalToggleLabel2">
                                Modal 2
                              </h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              Hide this modal and show the first with the button
                              below.
                            </div>
                            <div class="modal-footer">
                              <button class="btn btn-primary" data-bs-target="#exampleModalToggle"
                                data-bs-toggle="modal">
                                Back to first
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <a class="btn btn-primary" data-bs-toggle="modal" href="#exampleModalToggle" role="button">Open
                        first modal</a>
                    </div>
                  </div>
                  <!-- Card end -->
                </div>
                <div class="col-xxl-12">
                  <!-- Card start -->
                  <div class="card mb-3">
                    <div class="card-body">
                      <!-- Modal XL -->
                      <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#exampleModalXl">
                        Extra large modal
                      </button>
                      <!-- Modal XL -->
                      <div class="modal fade" id="exampleModalXl" tabindex="-1" aria-labelledby="exampleModalXlLabel"
                        aria-hidden="true">
                        <div class="modal-dialog modal-xl">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title h4" id="exampleModalXlLabel">
                                Extra large modal
                              </h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                            </div>
                            <div class="modal-body">...</div>
                          </div>
                        </div>
                      </div>

                      <!-- Modal LG -->
                      <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#exampleModalLg">
                        Large modal
                      </button>
                      <div class="modal fade" id="exampleModalLg" tabindex="-1" aria-labelledby="exampleModalLgLabel"
                        aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title h4" id="exampleModalLgLabel">
                                Large modal
                              </h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                            </div>
                            <div class="modal-body">...</div>
                          </div>
                        </div>
                      </div>

                      <!-- Modal SM -->
                      <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#exampleModalSm">
                        Small modal
                      </button>
                      <div class="modal fade" id="exampleModalSm" tabindex="-1" aria-labelledby="exampleModalSmLabel"
                        aria-hidden="true">
                        <div class="modal-dialog modal-sm">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title h4" id="exampleModalSmLabel">
                                Small modal
                              </h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                            </div>
                            <div class="modal-body">...</div>
                          </div>
                        </div>
                      </div>

                      <!-- Modal Fullscreen -->
                      <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#exampleModalFullscreen">
                        Full screen
                      </button>
                      <!-- Modal Fullscreen -->
                      <div class="modal fade" id="exampleModalFullscreen" tabindex="-1"
                        aria-labelledby="exampleModalFullscreenLabel" aria-hidden="true">
                        <div class="modal-dialog modal-fullscreen">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title h4" id="exampleModalFullscreenLabel">
                                Full screen modal
                              </h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                            </div>
                            <div class="modal-body">...</div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                Close
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- Card end -->
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
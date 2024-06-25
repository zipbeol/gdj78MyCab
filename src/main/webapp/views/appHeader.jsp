<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="utf-8">
</head>

<div class="header-actions">
    <div class="dropdown">

        <div class="dropdown-menu dropdown-menu-end shadow-sm dropdown-menu-mini">
            <div class="country-container">
                <a href="/" class="py-2">
                    <img src="/assets/images/flags/1x1/us.svg" alt="Business Dashboard Templates">
                </a>
                <a href="/" class="py-2">
                    <img src="/assets/images/flags/1x1/in.svg" alt="Business Dashboard Templates">
                </a>
                <a href="/" class="py-2">
                    <img src="/assets/images/flags/1x1/br.svg" alt="Business Dashboard Templates">
                </a>
                <a href="/" class="py-2">
                    <img src="/assets/images/flags/1x1/tr.svg" alt="IT Dashboard Templates">
                </a>
                <a href="/" class="py-2">
                    <img src="/assets/images/flags/1x1/id.svg" alt="IT Dashboard Templates">
                </a>
            </div>
        </div>
    </div>
    <div class="dropdown border-start">

        <div class="dropdown-menu dropdown-menu-end shadow-sm dropdown-menu-md">
            <!-- Row start -->
            <div class="d-flex gap-2 m-2 flex-wrap">
                <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                    <img src="/assets/images/brand-behance.svg" class="img-3x"
                         alt="IT Dashboard Templates">
                </a>
                <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                    <img src="/assets/images/brand-google.svg" class="img-3x"
                         alt="IT Dashboard Templates">
                </a>
                <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                    <img src="/assets/images/brand-bitcoin.svg" class="img-3x"
                         alt="IT Dashboard Templates">
                </a>
                <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                    <img src="/assets/images/brand-dribbble.svg" class="img-3x"
                         alt="IT Dashboard Templates">
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
            <i class="fs-3 bi bi-bell"></i>
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
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 25%"
                             aria-valuenow="25"
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
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 50%"
                             aria-valuenow="50"
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
                        <div class="progress-bar bg-danger" role="progressbar" style="width: 75%"
                             aria-valuenow="75"
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
            <i class="fs-3 bi bi-chat"></i>
            <span class="count-label"></span>
        </a>
        <div class="dropdown-menu dropdown-menu-end dropdown-menu-md shadow-sm">
            <a href="javascript:void(0)" class="dropdown-item">
                <div class="d-flex py-2">
                    <img src="/assets/images/user.png" class="img-3x me-3 rounded-3"
                         alt="Admin Templates">
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
                    <img src="/assets/images/user2.png" class="img-3x me-3 rounded-3"
                         alt="Admin Templates">
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
                    <img src="/assets/images/user1.png" class="img-3x me-3 rounded-3"
                         alt="Admin Templates">
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
            <!-- <img src="/assets/images/user.png" class="rounded-2 img-3x" alt="Bootstrap Gallery"> -->
            <i class="fs-3 bi bi-person-fill"></i>
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
                <a class="btn btn-danger" href="login/logout.do">Logout</a>
            </div>
        </div>
    </div>
</div>
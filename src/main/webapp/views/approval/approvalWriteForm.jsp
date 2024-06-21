<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Main</title>
    <!-- Meta -->
    <meta name="description" content="Marketplace for Bootstrap Admin Dashboards">
    <meta name="author" content="Bootstrap Gallery">
    <link rel="canonical" href="https://www.bootstrap.gallery/">
     <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery and Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- 따로 적용한 CSS -->
    <link rel="stylesheet" href="/assets/css/default.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 40px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .highlight {
            background-color: #e0ffe0;
        }
        a {
            color: #007BFF;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
<!-- Page wrapper start -->
<div class="page-wrapper">

    <!-- Main container start -->
    <div class="main-container">

        <!-- Sidebar wrapper start -->
        <jsp:include page="../sidebar.jsp"/>
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
                    <a href="/">
                        <img src="/assets/images/logo-sm.svg" class="logo" alt="Bootstrap Gallery">
                    </a>
                </div>
                <!-- App brand sm end -->

                <!-- Breadcrumb start -->
                <ol class="breadcrumb d-none d-lg-flex ms-3">
                    <li class="breadcrumb-item">
                        <a href="/"><i class="bi bi-house lh-1"></i></a>
                        <a href="/" class="text-decoration-none">메인</a>
                        <!-- 여기에 경로 추가 -->
                    </li>
                    <li class="breadcrumb-item">
                        <a href="/approval/approvalWriteForm" class="approvalWriteForm">기안서 작성</a>
                        <!-- 여기에 경로 추가 -->
                    </li>
                </ol>
                <!-- Breadcrumb end -->

                <!-- App header actions start -->
                <jsp:include page="../appHeader.jsp"/>
                <!-- App header actions end -->

            </div>

            <!-- App header ends -->

            <!-- App body starts -->
            <div class="app-body">

                <!-- Container starts -->
                <div class="container-fluid">
                    <!-- Row start -->
              <div class="row">
                <div class="col-12">
                  <div class="card mb-3">
                    <div class="card-header">
                      <h4 class="card-title">기안서 양식</h4>
                    </div>
                    <div class="card-body">
                      <div class="table-outer">
                        <div class="table-responsive">
                          <table class="table align-middle custom-table m-0">
                            <thead>
                              <tr>
                                <th></th>
                                <th>정렬순서</th>
                                <th>양식명</th>
                                <th>구 분</th>
                                <th style="min-width: 120px;">결재문서</th>
                              </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="list" items="${approvalWriteList}">
                                    <tr>
                                        <td></td>
                                        <td>${list.approval_doc_type_item_idx}</td>
                                        <td><a href="#" data-toggle="modal" data-target="#approvalModal">${list.approval_doc_type_item_name}</a></td>
                                        <td>${list.approval_doc_type_item_idx}</td>
                                        <td>
                                          <button class="btn btn-outline-danger btn-sm">
                                            전자결재문서
                                          </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            <!-- 양식 모달창 -->
                            <div class="modal fade" id="approvalModal" tabindex="-1" role="dialog" aria-labelledby="approvalModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="approvalModalLabel">기안서 작성</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="form-group">
                                                <label for="date">일자:</label>
                                                <input type="date" id="date" name="date" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="title">제목:</label>    
                                                <input type="text" id="title" name="title" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="approverline">결재라인:</label>
                                                <input type="text" id="approverline" name="approverline" class="form-control">
                                            </div>
<div class="form-group approver-container">
    <label class="approver-label">중간결재자:</label>
    <div class="d-flex justify-content-between align-items-center">
        <div class="d-flex align-items-center">
            <button type="button" class="btn btn-secondary approver-select-btn" id="midApproverButton" data-toggle="modal" data-target="#approverSelectModal" onclick="setApproverType('mid')">중간결재자 선택</button>
            <span id="midApproverName" class="ml-3"></span>
            <input type="hidden" id="midApprover" name="midApprover">
        </div>
    </div>
</div>

<div class="form-group approver-container">
    <label class="approver-label">최종결재자:</label>
    <div class="d-flex justify-content-between align-items-center">
        <div class="d-flex align-items-center">
            <button type="button" class="btn btn-secondary approver-select-btn" id="finalApproverButton" data-toggle="modal" data-target="#approverSelectModal" onclick="setApproverType('final')">최종결재자 선택</button>
            <span id="finalApproverName" class="ml-3"></span>
            <input type="hidden" id="finalApprover" name="finalApprover">
        </div>
    </div>
</div>
                                            <div class="form-group">
                                                <label for="participator">참조자:</label>
                                                <input type="text" id="participator" name="participator" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="category">구분:</label>
                                                <select id="category" name="category" class="form-control">
                                                    <option value="02">1</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="format">출력 양식:</label>
                                                <select id="format" name="format" class="form-control">
                                                    <option value="default">기본 양식</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="file">첨부:</label>
                                                <input type="file" id="file" name="file" class="form-control">
                                            </div>
                                        </form>
                                        <h2>연차 신청서</h2>
                                        <!-- 연차신청서.html을 불러오는 iframe -->
                                        <iframe src="/연차신청서.html" style="width:100%; height:400px; border:none;"></iframe>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary">저장/결재</button>
                                        <button type="button" class="btn btn-secondary">임시 저장</button>
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--  양식 모달창 종료 -->  
                                        
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
                <span>GDJ78FINALPROJECTMYCAB</span>
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
<script src="/assets/js/LocalStorage.js"></script>
<!-- 결재자 선택 모달창 -->
<div class="modal fade" id="approverSelectModal" tabindex="-1" role="dialog" aria-labelledby="approverSelectModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="approverSelectModalLabel">결재자 선택</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container">
                    <h2>사용자 검색</h2>
                    <div class="form-group">
                        <label for="search">검색:</label>
                        <input type="text" id="search" name="search" class="form-control" placeholder="검색">
                    </div>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>소속부서</th>
                                <th>성명</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>고객팀</td>
                                <td><a href="#" onclick="selectApprover('고객팀', '고개발')">고개발</a></td>
                            </tr>
                            <tr>
                                <td>개발팀</td>
                                <td><a href="#" onclick="selectApprover('개발팀', '사용자1')">사용자1</a></td>
                            </tr>
                            <tr>
                                <td>영업팀</td>
                                <td><a href="#" onclick="selectApprover('영업팀', '양개발')">양개발</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<!-- 결재자 선택 모달창 종료 -->
</body>
<script>
</script>


</html>

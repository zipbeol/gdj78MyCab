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
        .approval-line-table {
            width: auto;
            border: 1px solid #dee2e6;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .approval-line-table th, .approval-line-table td {
            border: 1px solid #dee2e6;
            padding: 8px;
            text-align: center;
        }
        .approval-line-table th {
            background-color: #f8f9fa;
            font-weight: bold;
        }
        .button-container {
            display: flex;
            justify-content: flex-end;
            padding: 10px;
            border-top: 1px solid #dee2e6;
            background-color: #f8f9fa;
            margin-top: 20px;
        }
        .button-container .btn {
            margin-left: 10px;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
        }
        .button-container .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: white;
        }
        .button-container .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
        .button-container .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            color: white;
        }
        .button-container .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #4e555b;
        }
    </style>
</head>

<body>
<!-- Page wrapper start -->
<div class="page-wrapper">

    <!-- Main container start -->
    <div class="main-container">

        <!-- Sidebar wrapper start -->
        <jsp:include page="/views/sidebar.jsp"/>
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
                </ol>
                <!-- Bread
                <!-- App header actions start -->
                <jsp:include page="/views/appHeader.jsp"/>
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
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h4 class="card-title">결재 문서</h4>
                                    <!-- 결재 라인 테이블 -->
                                   <table class="approval-line-table" style="margin-left: 20px; margin-top: 20px;">
								    <tr>
								        <th rowspan="3">결</br>재</th>
								        <th>&nbsp;&nbsp;기안자&nbsp;&nbsp;</th>
								        <th>중간결재자</th>
								        <th>최종결재자</th>
								    </tr>
								    <tr>
								    	<td>&nbsp;</td>
								        <td>&nbsp;</td>
								        <td>&nbsp;</td>
								       
								    </tr>
								    <tr>
								        <td>&nbsp;</td>
								        <td>&nbsp;</td>
								        <td>&nbsp;</td>
						
								    </tr>
								</table>
                                </div>
                                <div class="card-body">
                                    <c:if test="${not empty fileContent}">
                                        <iframe id="iframe-document" src="data:text/html;base64,${fileContent}" width="100%" height="700px"></iframe>
                                    </c:if>
                                    <c:if test="${not empty errorMessage}">
                                        <p style="color: red;">${errorMessage}</p>
                                    </c:if>
                                </div>
                    <div class="card-footer d-flex justify-content-end">
                        <button class="btn btn-primary me-2" id="approve-button">결재</button>
                        <button class="btn btn-secondary" id="close-button">닫기</button>
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

<!-- 드롭다운 결재 및 반려 버튼 -->

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
<script src="/assets/js/localStorage.js"></script>
</body>

<script>
$(document).ready(function() {
    $('#approve-button').on('click', function() {
        // 서버에서 서명 이미지를 불러와 결재라인에 표시
        $.ajax({
            url: '/getSignature',
            type: 'GET',
            success: function(response) {
                if (response) {
                    // 서명 이미지를 표시할 <img> 태그를 생성하고 결재라인에 추가
                    const signatureImage = $('<img>', {
                        src: 'data:image/png;base64,' + response,
                        alt: 'Signature',
                        style: 'width: 100px; height: auto;'
                    });

                    // 결재라인 테이블에 서명 이미지 추가
                    $('.approval-line-table tr:nth-child(2) td:nth-child(2)').html(signatureImage);
                    alert('결재가 완료되었습니다.');
                } else {
                    alert('서명 이미지를 불러오는 중 오류가 발생했습니다.');
                }
            },
            error: function(xhr, status, error) {
                console.error('서명 이미지를 불러오는 중 오류 발생:', error);
                alert('서명 이미지를 불러오는 중 오류가 발생했습니다.');
            }
        });
    });

    $('#close-button').on('click', function() {
        window.close(); // 창 닫기
    });
});
</script>
</html>

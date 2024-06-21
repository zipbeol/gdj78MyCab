<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Cab - Finance</title>
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

    <!-- CSS Files -->
    <link rel="stylesheet" href="/assets/fonts/bootstrap/bootstrap-icons.css">
    <link rel="stylesheet" href="/assets/css/main.min.css">

    <!-- Vendor Css Files -->
    <link rel="stylesheet" href="/assets/vendor/overlay-scroll/OverlayScrollbars.min.css">

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- 따로 적용한 CSS -->
    <link rel="stylesheet" href="/assets/css/default.css">
    <style>
    .detail-row {
        display: none;
        transition: all 0.3s ease;
    }
    .detail-row.active {
        display: table-row;
    }
    .filter-btn {
            background-color: #f8f9fa;
            color: #6c757d;
            border: 1px solid #ced4da;
            padding: 8px 16px;
            margin-right: 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease;
        }

        /* 호버 효과 */
        .filter-btn:hover {
            background-color: #e9ecef;
        }

        /* 액티브(선택된) 상태 */
        .filter-btn.active {
            background-color: #0d6efd;
            color: #fff;
            border-color: #0d6efd;
        }
    </style>
</head>

<body>
    <!-- Page wrapper start -->
    <div class="page-wrapper">

        <!-- Main container start -->
        <div class="main-container">

            <!-- Sidebar wrapper start -->
            <jsp:include page="../sidebar.jsp" />
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
                        <a href="/"> <img src="/assets/images/logo-sm.svg" class="logo" alt="Bootstrap Gallery">
                        </a>
                    </div>
                    <!-- App brand sm end -->

                    <!-- Breadcrumb start -->
                    <ol class="breadcrumb d-none d-lg-flex ms-3">
                        <li class="breadcrumb-item">
                            <a href="/"><i class="bi bi-house lh-1"></i></a>
                            <a href="/" class="text-decoration-none">메인</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="/finance/profit/list.go" class="text-decoration-none">수익</a>
                        </li>
                    </ol>
                    <!-- Breadcrumb end -->

                    <!-- App header actions start -->
                    <jsp:include page="../appHeader.jsp" />
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
                                        <h4 class="card-title">수익</h4>
                                    </div>
                                    <div class="card-body">
                                    	<!-- 카테고리 필터링 버튼 -->
                                        <div class="mt-3">
                                            <button class="btn btn-secondary filter-btn" data-category="택시">택시 수익</button>
                                            <button class="btn btn-secondary filter-btn" data-category="광고">광고 수익</button>
                                            <button class="btn btn-secondary filter-btn" data-category="기타">기타 수익</button>
                                        </div>
                                        <!-- 수익 등록 버튼 -->
                                        <div class="text-end">
                                            <button id="myBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">수익 등록</button>
                                        </div>
                                        <!-- 수익 리스트 테이블 -->
                                        <div class="table-outer mt-3">
                                            <table class="table table-hover align-middle custom-table m-0">
                                                <thead>
                                                    <tr>
                                                        <th>수익 발생일</th>
                                                        <th>수익자</th>
                                                        <th>수익 금액</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="profitTableBody">
                                                    <!-- AJAX 요청으로 항목들이 여기에 추가됩니다 -->
                                                </tbody>
                                            </table>
                                        </div>

                                        <!-- 모달 창 -->
                                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">수익 등록</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form id="profitForm">
                                                           <div class="mb-3">
                                                              <label for="pro_category" class="form-label">수익 종류:</label>
                                                              <select id="pro_category" name="pro_category" class="form-select" required>
                                                                  <option value="" selected disabled>수익 종류 선택</option>
                                                                  <option value="택시">택시 수익</option>
                                                                  <option value="광고">광고 수익</option>
                                                                  <option value="기타">기타 수익</option>
                                                              </select>
                                                          </div>
                                                            <div class="mb-3">
                                                                <label for="pro_actual_date" class="form-label">수익 발생일:</label>
                                                                <input type="date" id="pro_actual_date" name="pro_actual_date" class="form-control" required>
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="pro_who" class="form-label">수익자:</label>
                                                                <input type="text" id="pro_who" name="pro_who" class="form-control" required>
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="pro_cash" class="form-label">수익 금액:</label>
                                                                <input type="text" id="pro_cash" name="pro_cash" class="form-control" maxlength="10" required>
                                                            </div>
                                                            <div class="mb-3">
                                                              <label for="pro_content" class="form-label">수익 내용:</label>
                                                              <textarea id="pro_content" name="pro_content" class="form-control" rows="3"></textarea>
                                                          </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                                                <button type="button" class="btn btn-primary" id="submitBtn">등록</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 모달 창 끝 -->
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

    <!-- Required jQuery first, then Bootstrap Bundle JS -->
    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/js/bootstrap.bundle.min.js"></script>

    <!-- Vendor Js Files -->
    <script src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
    <script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>

    <!-- Custom JS files -->
    <script src="/assets/js/custom.js"></script>
    <script src="/assets/js/LocalStorage.js"></script>

    <!-- AJAX 및 모달 스크립트 -->
    <script>
 // 모든 버튼 요소를 선택합니다.
    const buttons = document.querySelectorAll('.filter-btn');

    // 각 버튼에 클릭 이벤트 리스너를 추가합니다.
    buttons.forEach(button => {
        button.addEventListener('click', function() {
            // 클릭된 버튼에만 active 클래스를 추가하고, 다른 버튼들은 active 클래스를 제거합니다.
            buttons.forEach(btn => btn.classList.remove('active'));
            this.classList.add('active');

            // 여기서 필요한 추가 작업을 수행할 수 있습니다.
            // 예를 들어, 클릭된 버튼의 데이터를 기반으로 필터링된 결과를 표시할 수 있습니다.
        });
    });
    
        // AJAX로 수익 리스트 불러오기
        $.ajax({
            url: '/finance/profit/list.ajax',
            method: 'POST',
            success: function(data) {
                displayProfitList(data.profit); // 초기 수익 리스트 표시
            },
            error: function(error) {
                console.error("AJAX 요청 실패:", error);
            }
        });

        // 등록 버튼 클릭 이벤트 처리
        $('#submitBtn').click(function(event) {
            $.ajax({
                url: '/finance/profit/add.ajax', // 서버의 폼 처리 엔드포인트
                method: 'POST',
                data: {
                    pro_category: $('#pro_category').val(),
                    pro_date: $('#pro_date').val(),
                    pro_actual_date: $('#pro_actual_date').val(),
                    pro_who: $('#pro_who').val(),
                    pro_cash: $('#pro_cash').val().replace(/,/g, ''),
                    pro_content: $('#pro_content').val()
                },
                success: function(response) {
                    // 성공적으로 저장되었음을 사용자에게 알리고 모달을 닫음
                    alert('수익이 등록되었습니다.');
                    $('#exampleModal').modal('hide');
                    // 수익 리스트를 다시 불러옵니다
                    refreshProfitList();
                },
                error: function(error) {
                    console.error("AJAX 요청 실패:", error);
                    alert('수익 등록 중 오류가 발생했습니다.');
                }
            });
        });

        // 숫자를 세 자리마다 쉼표가 포함된 형식으로 포맷하는 함수
        function formatNumberWithCommas(number) {
            return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

        // 수익 금액 입력 필드에서 키 입력 시 호출되는 함수
        $('#pro_cash').on('input', function() {
            var value = $(this).val(); // 입력된 값 가져오기
            var number = parseInt(value.replace(/[^\d]/g, '')); // 숫자만 추출하여 정수로 변환

            if (!isNaN(number)) {
                var formattedValue = formatNumberWithCommas(number); // 포맷 함수 호출
                $(this).val(formattedValue); // 포맷된 값으로 입력 필드 업데이트
            }
        });

        // 카테고리 필터링 버튼 클릭 이벤트 처리
        $('.filter-btn').click(function() {
            var category = $(this).data('category');
            $.ajax({
                url: '/finance/profit/category.ajax',
                method: 'POST',
                data: { category: category },
                success: function(data) {
                    displayProfitList(data.profit); // 필터링된 수익 리스트 표시
                },
                error: function(error) {
                    console.error("AJAX 요청 실패:", error);
                }
            });
        });

        // AJAX로 받은 수익 리스트를 테이블에 표시하는 함수
        function displayProfitList(profitList) {
            var tbody = $('#profitTableBody');
            tbody.empty(); // 테이블 본문을 비웁니다.
            var row = '';
            for (item of profitList) {
                row += '<tr class="clickable-row">' +
                    '<td>' + item.pro_actual_date + '</td>' +
                    '<td>' + item.pro_who + '</td>' +
                    '<td>' + formatNumberWithCommas(item.pro_cash) + '</td>' +
                    '</tr>'+
                    '<tr class="detail-row">'+
                    '<td colspan="3" class="detail-content">'+
                    '<strong>수익 발생일:</strong> ' + item.pro_actual_date +
                    '<strong>수익 등록일:</strong> ' + item.pro_date +
                    '<strong>수익 종류:</strong> ' + item.pro_category +
                    '<strong>수익 내용:</strong> ' + item.pro_content +
                    '<strong>수익 금액:</strong> ' + formatNumberWithCommas(item.pro_cash) +
                    '<strong>원</strong> ' +
                    '</td>'+
                    '</tr>';
            }
            tbody.html(row);
            // 각 행에 클릭 이벤트 추가
            $('.clickable-row').on('click', function() {
                $(this).next('.detail-row').toggleClass('active');
            });
        }

        // 수익 리스트 갱신 함수
        function refreshProfitList() {
            $.ajax({
                url: '/finance/profit/list.ajax',
                method: 'POST',
                success: function(data) {
                    displayProfitList(data.profit); // 갱신된 수익 리스트 표시
                },
                error: function(error) {
                    console.error("AJAX 요청 실패:", error);
                }
            });
        }

        // 모달이 닫힐 때 폼 초기화
        $('#exampleModal').on('hidden.bs.modal', function (e) {
            $('#profitForm')[0].reset();
        });
    </script>
</body>
</html>
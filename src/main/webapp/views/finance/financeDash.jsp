<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Cab - Finance Profit</title>
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
/* 기존 CSS 스타일 */
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
                        <li class="breadcrumb-item"><a href="/"><i class="bi bi-house lh-1"></i></a> <a href="/" class="text-decoration-none">메인</a></li>
                        <li class="breadcrumb-item"><a href="#!" class="text-decoration-none">재무 관리</a></li>
                        <li class="breadcrumb-item"><a href="/finance/profit/list.go" class="text-decoration-none">수익</a></li>
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
                        <div class="row mb-3">
                            <div class="col-md-3">
                                <label for="filterYear" class="form-label">연도</label>
                                <select id="filterYear" class="form-control">
                                    <!-- 연도 옵션은 JavaScript에서 동적으로 추가 -->
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label for="startMonth" class="form-label">시작 월</label>
                                <select id="startMonth" class="form-control">
                                    <option value="01">1월</option>
                                    <option value="02">2월</option>
                                    <option value="03">3월</option>
                                    <option value="04">4월</option>
                                    <option value="05">5월</option>
                                    <option value="06">6월</option>
                                    <option value="07">7월</option>
                                    <option value="08">8월</option>
                                    <option value="09">9월</option>
                                    <option value="10">10월</option>
                                    <option value="11">11월</option>
                                    <option value="12">12월</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label for="endMonth" class="form-label">종료 월</label>
                                <select id="endMonth" class="form-control">
                                    <option value="01">1월</option>
                                    <option value="02">2월</option>
                                    <option value="03">3월</option>
                                    <option value="04">4월</option>
                                    <option value="05">5월</option>
                                    <option value="06">6월</option>
                                    <option value="07">7월</option>
                                    <option value="08">8월</option>
                                    <option value="09">9월</option>
                                    <option value="10">10월</option>
                                    <option value="11">11월</option>
                                    <option value="12">12월</option>
                                </select>
                            </div>
                            <div class="col-md-3 align-self-end">
                                <button id="filterButton" class="btn btn-primary">필터 적용</button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="chart-container">
                                                    <h2 class="chart-title">월 별 수익</h2>
                                                    <canvas id="revenueChart"></canvas>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="chart-container">
                                                    <h2 class="chart-title">월 별 지출</h2>
                                                    <canvas id="expenseChart"></canvas>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="chart-container">
                                                    <h2 class="chart-title">월 별 손익</h2>
                                                    <canvas id="profitChart"></canvas>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="chart-container">
                                                    <h2 class="chart-title">수익</h2>
                                                    <canvas id="revenuePieChart"></canvas>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="chart-container">
                                                    <h2 class="chart-title">지출</h2>
                                                    <canvas id="expensePieChart"></canvas>
                                                </div>
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

    <!-- Required jQuery first, then Bootstrap Bundle JS -->
    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/js/bootstrap.bundle.min.js"></script>

    <!-- Vendor Js Files -->
    <script src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
    <script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>

    <!-- Custom JS files -->
    <script src="/assets/js/custom.js"></script>
    <script src="/assets/js/LocalStorage.js"></script>
    <!-- 페이지네이션 -->
    <script src="/assets/js/jquery.twbsPagination.min.js"></script>
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- AJAX 및 모달 스크립트 -->
    <script>
    
    $('#startMonth').on('change', function(){
    var monthName = $('#startMonth').val();
    console.log(monthName);
    	
    });
    $(document).ready(function() {
        // 현재 연도와 월을 계산하는 함수
        function getCurrentYear() {
            const now = new Date();
            return now.getFullYear();
        }

        // 1년 전 연도를 계산하는 함수
        function getOneYearAgoYear() {
            const now = new Date();
            return now.getFullYear() - 1;
        }

        // 연도 옵션 추가
        function populateYearOptions() {
            const currentYear = getCurrentYear();
            const oneYearAgoYear = getOneYearAgoYear();
            $('#filterYear').append(`<option value="${oneYearAgoYear}">${oneYearAgoYear}</option>`);
            $('#filterYear').append(`<option value="${currentYear}" selected>${currentYear}</option>`);
        }

        // 초기 설정
        populateYearOptions();
        const currentMonth = (new Date().getMonth() + 1).toString().padStart(2, '0'); // 현재 월

        // 필터의 초기 값을 설정
        $('#startMonth').val(currentMonth);
        $('#endMonth').val(currentMonth);

        // 그래프 변수 설정
        var revenueChart, expenseChart, profitChart, revenuePieChart, expensePieChart;
        
        // 그래프 생성 함수
        function createChart(ctx, type, data, options) {
            return new Chart(ctx, {
                type: type,
                data: data,
                options: options
            });
        }

        // 초기 데이터 로딩 함수
        function loadInitialData() {
            const filterYear = $('#filterYear').val();
            const startMonth = $('#startMonth').val();
            const endMonth = $('#endMonth').val();

            $.ajax({
                url: '/finance/dash/initialData.ajax',
                method: 'GET',
                data: {
                    startYearMonth: `${filterYear}-${startMonth}`,
                    endYearMonth: `${filterYear}-${endMonth}`
                },
                success: function(response) {
                    var revenueData = response.revenueData;
                    var expenseData = response.expenseData;
                    var profitData = revenueData.map((revenue, index) => revenue - expenseData[index]);
                    var revenuePieData = response.revenuePieData;
                    var expensePieData = response.expensePieData;

                    // 차트 데이터 설정 및 업데이트
                    updateCharts(revenueData, expenseData, profitData, revenuePieData, expensePieData);
                },
                error: function(error) {
                    console.error('Error fetching initial data', error);
                }
            });
        }
        
        // 라벨 생성 함수
        function generateLabels() {
            const filterYear = $('#filterYear').val();
            const startMonth = parseInt($('#startMonth').val());
            const endMonth = parseInt($('#endMonth').val());
            const labels = [];

            if (startMonth <= endMonth) {
                for (let month = startMonth; month <= endMonth; month++) {
                    labels.push(`${month.toString().padStart(2, '0')}월`);
                }
            } else {
                for (let month = startMonth; month <= 12; month++) {
                    labels.push(`${month.toString().padStart(2, '0')}월`);
                }
                for (let month = 1; month <= endMonth; month++) {
                    labels.push(`${month.toString().padStart(2, '0')}월`);
                }
            }

            return labels;
        }
        
        // 차트 업데이트 함수
        function updateCharts(revenueData, expenseData, profitData, revenuePieData, expensePieData) {
            const labels = generateLabels();
            
            // 수익 바 그래프 업데이트
            if (!revenueChart) {
                var ctxRevenue = document.getElementById('revenueChart').getContext('2d');
                revenueChart = createChart(ctxRevenue, 'bar', {
                    labels: labels,
                    datasets: [{
                        label: '수익',
                        data: revenueData,
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }]
                }, {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                });
            } else {
                revenueChart.data.labels = labels;
                revenueChart.data.datasets[0].data = revenueData;
                revenueChart.update();
            }

            // 지출 바 그래프 업데이트
            if (!expenseChart) {
                var ctxExpense = document.getElementById('expenseChart').getContext('2d');
                expenseChart = createChart(ctxExpense, 'bar', {
                    labels: labels,
                    datasets: [{
                        label: '지출',
                        data: expenseData,
                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 1
                    }]
                }, {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                });
            } else {
                expenseChart.data.labels = labels;
                expenseChart.data.datasets[0].data = expenseData;
                expenseChart.update();
            }

            // 손익 라인 그래프 업데이트
            if (!profitChart) {
                var ctxProfit = document.getElementById('profitChart').getContext('2d');
                profitChart = createChart(ctxProfit, 'line', {
                    labels: labels,
                    datasets: [{
                        label: '손익',
                        data: profitData,
                        backgroundColor: 'rgba(153, 102, 255, 0.2)',
                        borderColor: 'rgba(153, 102, 255, 1)',
                        borderWidth: 1
                    }]
                }, {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                });
            } else {
                profitChart.data.labels = labels;
                profitChart.data.datasets[0].data = profitData;
                profitChart.update();
            }

            // 수익 파이 그래프 업데이트
            if (!revenuePieChart) {
                var ctxRevenuePie = document.getElementById('revenuePieChart').getContext('2d');
                revenuePieChart = createChart(ctxRevenuePie, 'pie', {
                    labels: ['택시', '광고', '기타'],
                    datasets: [{
                        data: revenuePieData,
                        backgroundColor: [
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)'
                        ],
                        borderColor: [
                            'rgba(75, 192, 192, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)'
                        ],
                        borderWidth: 1
                    }]
                }, {
                    responsive: true
                });
            } else {
                revenuePieChart.data.datasets[0].data = revenuePieData;
                revenuePieChart.update();
            }

            // 지출 파이 그래프 업데이트
            if (!expensePieChart) {
                var ctxExpensePie = document.getElementById('expensePieChart').getContext('2d');
                expensePieChart = createChart(ctxExpensePie, 'pie', {
                    labels: ['택시', '사내', '기타'],
                    datasets: [{
                        data: expensePieData,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(75, 192, 192, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(75, 192, 192, 1)'
                        ],
                        borderWidth: 1
                    }]
                }, {
                    responsive: true
                });
            } else {
                expensePieChart.data.datasets[0].data = expensePieData;
                expensePieChart.update();
            }
        }
        
        // 페이지 로딩 시 초기 데이터 로드
        loadInitialData();

        // 필터 적용 버튼 클릭 시
        $('#filterButton').click(function() {
            loadInitialData();
        });
    });

    </script>
</body>
</html>

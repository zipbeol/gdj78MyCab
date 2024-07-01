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

    .modal-dialog {
        max-width: none; /* 기본 최대 너비 제거 */
        width: 50%; /* 원하는 너비로 설정 */
    }
    .table-bordered th, .table-bordered td {
        border: 1px solid #dee2e6 !important;
    }

    /* 새로운 스타일 */
    .modal-content {
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .modal-header {
        background-color: #007bff;
        color: #fff;
        border-bottom: none;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
    }
    .modal-title {
        font-weight: bold;
    }
    .close {
        color: #fff;
        opacity: 1;
    }
    .modal-body {
        padding: 30px;
    }
    .form-check {
        margin-bottom: 15px;
    }
    .form-group {
        margin-bottom: 20px;
    }
    .btn-group {
        display: flex;
        justify-content: center;
        gap: 10px;
    }
    .btn {
        border-radius: 5px;
        padding: 10px 20px;
    }
    #searchLine {
        margin-bottom: 20px;
    }
    label {
        font-weight: bold;
        margin-bottom: 5px;
    }

    .input-group-append .btn {
        border-top-left-radius: 0;
        border-bottom-left-radius: 0;
    }

    .form-row {
        display: flex;
        flex-wrap: wrap;
    }

    .form-group {
        flex: 1;
        min-width: 200px;
        margin-right: 20px;
    }

    .form-group:last-child {
        margin-right: 0;
    }
        .card {
        margin-bottom: 1rem; /* 카드 사이의 여백 최소화 */
        width: 100%; /* 카드가 가로로 꽉 차도록 설정 */
    }
    .card-body {
        padding: 0.5rem; /* 카드 내부의 패딩 최소화 */
    }
    .card-title {
        margin-bottom: 0.5rem; /* 제목 아래의 여백 최소화 */
    }
    .employee-item {
        cursor: pointer;
        margin-bottom: 2px; /* 직원 항목 사이의 여백 최소화 */
        padding-bottom: 2px;
        border-bottom: 1px solid #e0e0e0; /* 항목 간 구분선 */
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
                     
                        <a href="#" class="text-decoration-none">전자결재</a>
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
                                <tr>
                                    <th></th>
                                    <th>1</th>
                                    <th><a href="#" data-toggle="modal" data-target="#approvalModal" data-doc-name="연차신청서">연차신청서</a></th>
                                    <th>1</th>
                                    <th>
                                        <button class="btn btn-outline-danger btn-sm">
                                            전자결재문서
                                        </button>
                                    </th>
                                </tr>
                                <tr>
                                    <th></th>
                                    <th>2</th>
                                    <th><a href="#" data-toggle="modal" data-target="#approvalModal" data-doc-name="휴가신청서">휴가신청서</a></th>
                                    <th>2</th>
                                    <th>
                                        <button class="btn btn-outline-danger btn-sm">
                                            전자결재문서
                                        </button>
                                    </th>
                                </tr>
                                <tr>
                                    <th></th>
                                    <th>3</th>
                                    <th><a href="#" data-toggle="modal" data-target="#approvalModal" data-doc-name="출장보고서">출장보고서</a></th>
                                    <th>3</th>
                                    <th>
                                        <button class="btn btn-outline-danger btn-sm">
                                            전자결재문서
                                        </button>
                                    </th>
                                </tr>
                                <tr>
                                    <th></th>
                                    <th>4</th>
                                    <th><a href="#" data-toggle="modal" data-target="#approvalModal" data-doc-name="지출결의서">지출결의서</a></th>
                                    <th>4</th>
                                    <th>
                                        <button class="btn btn-outline-danger btn-sm">
                                            전자결재문서
                                        </button>
                                    </th>
                                </tr>
                                <tr>
                                    <th></th>
                                    <th>5</th>
                                    <th><a href="#" data-toggle="modal" data-target="#approvalModal" data-doc-name="사고경위서">사고경위서</a></th>
                                    <th>5</th>
                                    <th>
                                        <button class="btn btn-outline-danger btn-sm">
                                            전자결재문서
                                        </button>
                                    </th>
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
                            <input type="hidden" id="dateTime" name="dateTime">
                        </div>
                        <div class="form-group">
                            <label for="title">제목:</label>
                            <input type="text" id="title" name="title" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="approverline">결재라인:</label>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex align-items-center">
                                    <button type="button" class="btn btn-secondary approver-select-btn" id="approverLineButton" data-toggle="modal" data-target="#approverLineModal" onclick="setApproverType('line')">결재라인 선택</button>
                                    <span id="approverLineName" class="ml-3"></span>
                                    <input type="hidden" id="approverLine" name="approverline">
                                </div>
                            </div>
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
						    <div class="d-flex justify-content-between align-items-center">
						        <div class="d-flex align-items-center">
						            <button type="button" class="btn btn-secondary approver-select-btn" id="participatorButton" data-toggle="modal" data-target="#approverSelectModal" onclick="setApproverType('participator')">참조자 선택</button>
						            <div id="participatorNames" class="ml-3"></div>
						            <input type="hidden" id="participator" name="participator">
						        </div>
						    </div>
						</div>
						<div class="form-group">
                            <label for="file">첨부:</label>
                            <input type="file" id="file" name="file" class="form-control">
                        </div>
                    </form>
                    <!-- 경로를 지정하여 HTML 파일을 로드 -->
                    <iframe id="documentFrame" src="" width="100%" height="500px"></iframe>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="saveButton">저장/결재</button>
                    <button type="button" class="btn btn-secondary" id="saveTempButton">임시 저장</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 양식 모달창 종료 -->

<!-- 결재자 선택 모달 -->
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
                    <div id="employeeList">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<!-- 결재자 선택 모달창 종료 -->

<!-- 결재라인 선택 모달 -->
<div class="modal fade" id="approverLineModal" tabindex="-1" role="dialog" aria-labelledby="approverLineModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="approverLineModalLabel">결재라인 검색</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container">
                    <div class="form-group">
                        <label for="searchLine">결재라인 검색</label>
                        <input type="text" id="searchLine" name="searchLine" class="form-control" placeholder="입력 후 [Enter]">
                    </div>
                    <div class="form-group d-flex">
                        <div class="form-check mr-3">
                            <input class="form-check-input" type="radio" name="lineOptions" id="myLine" value="myLine">
                            <label class="form-check-label" for="myLine">My 결재라인</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="lineOptions" id="approvalLine" value="approvalLine" checked>
                            <label class="form-check-label" for="approvalLine">결재라인</label>
                        </div>
                    </div>
					<div class="form-group">
					    <label for="lineSelect">결재라인 명칭</label>
					    <select id="lineSelect" name="lineSelect" class="form-control">
					        <!-- 옵션은 JavaScript를 통해 동적으로 추가됩니다 -->
					    </select>
					</div>
                    <div class="form-group text-center">
                        <button type="button" class="btn btn-primary mr-2" id="addLineButton">신규(F2)</button>
                        <button type="button" class="btn btn-secondary mr-2" id="editLineButton">수정</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 결재라인 선택 모달창 종료 -->

</body>
<script>

//결재라인에 따른 중간결재자, 최종결재자 양식모달창에 불러오기
$(document).ready(function() {
    loadApprovalLines();

    $('#searchLine').on('input', function() {
        loadApprovalLines($(this).val());
    });

    //결재 라인 선택시 중간,최종결재자 
    function loadApprovalLines(searchQuery = '') {
        $.ajax({
            type: 'GET',
            url: '/getApprovalLines.ajax',
            data: { searchLine: searchQuery },
            success: function(response) {
                $('#lineSelect').empty();
                response.forEach(function(line) {
                    $('#lineSelect').append(new Option(line.appr_line_bkmk_name, line.appr_line_bkmk_idx));
                });
            },
            error: function(xhr, status, error) {
                console.error('결재라인 데이터를 불러오는 중 오류 발생:', error);
            }
        });
    }
	
    // 결재라인 조회
    $('#lineSelect').on('change', function() {
        var selectedLineId = $(this).val();
        $.ajax({
            type: 'GET',
            url: '/getApproverDetails.ajax',
            data: { lineId: selectedLineId },
            success: function(response) {
                $('#midApproverName').text(response.appr_midapprover);
                $('#midApprover').val(response.appr_midapprover);
                $('#finalApproverName').text(response.appr_finalapprover);
                $('#finalApprover').val(response.appr_finalapprover);
            },
            error: function(xhr, status, error) {
                console.error('결재자 데이터를 불러오는 중 오류 발생:', error);
            }
        });
    });
});

// 결재라인 불러오기
$(document).ready(function() {
    // 페이지가 로드될 때 결재라인 데이터를 가져와서 드롭다운 메뉴에 추가
    loadApprovalLines();

    // 결재라인 검색 입력 시 처리
    $('#searchLine').on('input', function() {
        loadApprovalLines($(this).val());
    });

    function loadApprovalLines(searchQuery = '') {
        $.ajax({
            type: 'POST',
            url: '/getApprovalLines.ajax', // 서버의 엔드포인트 URL을 설정합니다.
            data: { searchLine: searchQuery },
            success: function(response) {
                // 기존 옵션을 제거합니다.
                $('#lineSelect').empty();

                // 응답 데이터로 옵션을 추가합니다.
                response.forEach(function(line) {
                    $('#lineSelect').append(new Option(line.appr_line_bkmk_name, line.appr_line_bkmk_idx));
                });
            },
            error: function(xhr, status, error) {
                console.error('결재라인 데이터를 불러오는 중 오류 발생:', error);
            }
        });
    }
});

//페이지가 로드될 때 실행되는 코드
document.addEventListener('DOMContentLoaded', function() {
	
	// 제목명 자동 기입
	 var links = document.querySelectorAll('a[data-toggle="modal"]');

	    links.forEach(function(link) {
	        link.addEventListener('click', function(event) {
	            event.preventDefault();
	            var docName = this.getAttribute('data-doc-name');
	            if (docName) {
	                document.getElementById('title').value = " OOO님의 " + docName + " 입니다";
	            }
	        });
	    });
	
	
	//제목 일시 자동 기입
	 var dateInput = document.getElementById('date');
     var today = new Date().toISOString().split('T')[0];
     dateInput.value = today;
     
    // 모든 링크 요소와 버튼을 선택하여 변수에 저장
    var links = document.querySelectorAll('a[data-toggle="modal"], button[data-toggle="modal"]');

    // 각 링크에 클릭 이벤트 리스너 추가
    links.forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 동작을 방지 (링크 클릭 시 페이지 이동 방지)

            // 특정 버튼들이 아닌 경우에만 파일 경로 설정
            if (this.id !== 'midApproverButton' && this.id !== 'finalApproverButton' && this.id !== 'approverLineButton' && this.id !== 'participatorButton') {
                var docName = this.textContent.trim(); // 클릭된 링크의 텍스트를 가져옴

                var filePath = ''; // 파일 경로 변수 초기화
                // docName에 따라 파일 경로 설정
                switch(docName) {
                    case '연차신청서':
                        filePath = '/연차신청서.html';
                        break;
                    case '휴가신청서':
                        filePath = '/휴가신청서.html';
                        break;
                    case '출장보고서':
                        filePath = '/출장보고서.html';
                        break;
                    case '지출결의서':
                        filePath = '/지출결의서.html';
                        break;
                    case '사고경위서':
                        filePath = '/사고경위서.html';
                        break;
                }

                var iframe = document.getElementById('documentFrame'); // iframe 요소 선택
                iframe.setAttribute('src', filePath); // iframe의 src 속성을 업데이트하여 새로운 파일을 로드
            }
        });
    });

    // 결재라인 모달이 열릴 때 이벤트 핸들러 (여기서는 초기 설정이나 데이터 로드가 필요하면 작성)
    $('#approverLineModal').on('show.bs.modal', function (event) { });

    // 결재라인 선택 시 이벤트 핸들러
    document.getElementById('lineSelect').addEventListener('change', function() {
        var selectedLine = this.options[this.selectedIndex].text; // 선택된 옵션의 텍스트를 가져옴
        document.getElementById('approverLineName').textContent = selectedLine; // 선택된 라인의 이름을 설정
        document.getElementById('approverLine').value = selectedLine; // 선택된 라인의 값을 설정
    });

    // 신규 버튼 클릭 시 이벤트 핸들러
    document.getElementById('addLineButton').addEventListener('click', function() {
        alert('신규 결재라인을 추가합니다.');
    });

    // 수정 버튼 클릭 시 이벤트 핸들러
    document.getElementById('editLineButton').addEventListener('click', function() {
        alert('선택된 결재라인을 수정합니다.');
    });
});

document.addEventListener('DOMContentLoaded', function() {
    document.querySelector('#saveButton').addEventListener('click', function() {
        sendHtmlToServer(true);
    });

    document.querySelector('#saveTempButton').addEventListener('click', function() {
        sendHtmlToServer(false);
    });

// 서버로 기안서 작성 내용 데이터 전송
function sendHtmlToServer(isFinal) {
    const iframe = document.getElementById('documentFrame');
    const doc = iframe.contentDocument || iframe.contentWindow.document;

    // 모든 input 요소의 값을 설정
    const inputs = doc.querySelectorAll('input');
    inputs.forEach(input => {
        if (input.type === 'checkbox' || input.type === 'radio') {
            if (input.checked) {
                input.setAttribute('checked', 'checked');
            } else {
                input.removeAttribute('checked');
            }
        } else {
            input.setAttribute('value', input.value);
        }
    });

    // 모든 textarea 요소의 값을 설정
    const textareas = doc.querySelectorAll('textarea');
    textareas.forEach(textarea => {
        textarea.textContent = textarea.value;
    });

    // 모든 select 요소의 값을 설정
    const selects = doc.querySelectorAll('select');
    selects.forEach(select => {
        const options = select.querySelectorAll('option');
        options.forEach(option => {
            if (option.selected) {
                option.setAttribute('selected', 'selected');
            } else {
                option.removeAttribute('selected');
            }
        });
    });

    const htmlContent = doc.documentElement.outerHTML; // 최종 HTML 콘텐츠 가져오기
    console.log(htmlContent); // HTML 콘텐츠를 콘솔에 출력

    const formData = new FormData();
   

    // 모달의 다른 입력 요소 값을 추가
    formData.append('date', document.getElementById('date').value);
    formData.append('title', document.getElementById('title').value);
    formData.append('approverline', document.getElementById('approverLine').value);
    formData.append('midApprover', document.getElementById('midApprover').value);
    formData.append('finalApprover', document.getElementById('finalApprover').value);
    formData.append('participator', document.getElementById('participator').value);
    formData.append('htmlContent', htmlContent); // FormData 객체에 HTML 콘텐츠 추가
    
    // 파일 입력 값 추가
    const fileInput = document.getElementById('file');
    
    if (fileInput.files.length > 0) {
        formData.append('file', fileInput.files[0]);
    }

    // 전송 타입 추가
    formData.append('isFinal', isFinal);

    fetch('/approval/save-html.fetch', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(result => {
        alert('결재 문서 등록 되었습니다.');
        $('#approvalModal').modal('hide'); // 모달 창 닫기
    })
    .catch(error => {
        console.error('Error:', error);
    });
}
});

// 결재자 유형을 설정하는 함수
function setApproverType(type) {
    $('#approverSelectModal').data('approverType', type); // 결재자 유형을 설정
}

// 직원 목록을 불러오는 함수
function loadEmployees(search) {
    $.ajax({
        url: '/approvalList.ajax',
        type: 'GET',
        data: { search: search }, // 검색어를 서버로 전송
        success: function(data) {
            console.log(data); // 서버에서 반환된 데이터를 콘솔에 출력
            $('#employeeList').empty(); // 기존 직원 목록을 초기화

            // 데이터를 부서별로 그룹화
            const departmentMap = new Map();
            data.forEach(employee => {
                if (!departmentMap.has(employee.dept_name)) {
                    departmentMap.set(employee.dept_name, []);
                }
                departmentMap.get(employee.dept_name).push(employee);
            });

            // 부서별로 그룹화된 데이터를 출력
            departmentMap.forEach((employees, deptName) => {
                const deptCard = $('<div class="card mb-1 shadow-sm" style="width: 100%;"></div>');
                const deptCardBody = $('<div class="card-body p-2"></div>');
                const deptCardTitle = $('<h6 class="card-title"></h6>').text(deptName);

                deptCardBody.append(deptCardTitle);
                employees.forEach(employee => {
                    const employeeInfo = $('<div class="employee-item" style="cursor: pointer; padding: 2px 0;"></div>').text(employee.emp_name + ' ' + employee.title_name + '님');
                    employeeInfo.data('employee', employee); // 데이터 저장
                    deptCardBody.append(employeeInfo);
                });

                deptCard.append(deptCardBody);
                $('#employeeList').append(deptCard);
            });
        },
        error: function(xhr, status, error) {
            console.error('Error fetching employees:', status, error);
        }
    });
}

// 페이지 로드 시 실행되는 코드
$(document).ready(function() {
    $('#search').on('input', function() {
        var search = $(this).val();
        loadEmployees(search); // 검색어를 기반으로 직원 목록을 불러옴
    });

    // 동적으로 생성된 요소에 클릭 이벤트 바인딩
    $(document).on('click', '.employee-item', function() {
        const employee = $(this).data('employee');
        const approverType = $('#approverSelectModal').data('approverType');

        if (approverType === 'mid') {
            $('#midApproverName').text(employee.emp_name + ' ' + employee.title_name + '님');
            $('#midApprover').val(employee.emp_name);
        } else if (approverType === 'final') {
            $('#finalApproverName').text(employee.emp_name + ' ' + employee.title_name + '님');
            $('#finalApprover').val(employee.emp_name);
        } else if (approverType === 'participator') {
        	 const participatorNames = $('#participatorNames');
             participatorNames.append('<span>' + employee.emp_name + ' ' + employee.title_name + '님, </span>');
             
             const participatorVal = $('#participator').val();
             const newParticipatorVal = participatorVal ? participatorVal + ',' + employee.emp_name : employee.emp_name;
             $('#participator').val(newParticipatorVal);
        }

        $('#approverSelectModal').modal('hide'); // 모달 닫기
    });

    loadEmployees(); // 초기 로드 시 모든 사원 데이터 로드
});
</script>
</html>

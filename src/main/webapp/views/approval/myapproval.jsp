<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>내 결재 관리</title>
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
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f8f9fa; }
        .container { padding: 20px; }
        .card { background-color: #ffffff; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        .card-header { background-color: #ffffff; color: #343a40; padding: 15px; border-bottom: 1px solid #343a40; }
        .card-title { margin: 0; }
        .btn-group .btn { margin-right: 5px; }
        .btn-outline-all { color: #6c757d; border-color: #6c757d; }
        .btn-outline-all:hover { background-color: #6c757d; color: #fff; }
        .btn-outline-temporary { color: #ffc107; border-color: #ffc107; }
        .btn-outline-temporary:hover { background-color: #ffc107; color: #fff; }
        .search-form input { margin-right: 5px; }
        .table thead th { background-color: #ffffff; color: #343a40; }
        .table-bordered th, .table-bordered td { border: 1px solid #dee2e6 !important; }
        .table tbody tr { transition: background-color 0.2s; }
        .table tbody tr:hover { background-color: #f1f1f1; }
        .date-range { text-align: right; margin-bottom: 10px; }
        .btn-container { display: flex; justify-content: flex-start; margin-top: 10px; }
                /* 결재 상태별 텍스트 색상 */

.pagination { 
    justify-content: center; 
    margin-top: 20px; 
}

.pagination .page-item.active .page-link {
    background-color: #343a40;
    border-color: #343a40;
    color: white;
}

.pagination .page-link {
    color: #343a40;
}

.pagination .page-link:hover {
    background-color: #ddd;
    color: #343a40;
}
        .form-inline label { margin-right: 10px; }
        .status-btn { margin-right: 10px; }
        .top-buttons { display: flex; align-items: center; justify-content: space-between; }
        .top-buttons .search-form { display: flex; align-items: center; }
        .card-body { overflow-x: auto; }
    #signatureModal .modal-dialog {
    max-width: 1000px; /* 모달 크기 확장 */
  }
  .modal-body {
    display: flex;
    flex-direction: column;
  }
  .instructions {
    margin-bottom: 15px;
    text-align: center; /* 중앙 정렬 */
  }
  .image-container, .preview-container {
    border: 1px solid #000;
    width: 100%;
    height: 300px; /* Before와 After의 크기를 동일하게 */
  }
  #signatureCanvas {
    width: 100%;
    height: 100%;
  }
  .preview-container img {
    width: 100%;
    height: 100%;
  }
  .col-6 {
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .modal-footer {
    display: flex;
    justify-content: flex-end;
  }
  .modal-footer .btn {
    margin-left: 10px;
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
                    <li class="breadcrumb-item">
                        <a href="/approval/approvalWriteForm.go" class="text-decoration-none">전자결재</a>
                        <!-- 여기에 경로 추가 -->
                    </li>
                    <li class="breadcrumb-item">
                        <a href="/approval/myapproval.go" class="approvalWriteForm">내 결재 관리</a>
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
              <div class="container mt-5">
        <!-- Row start -->
        <div class="row">
            <div class="col-12">
                <div class="card mb-3">
                    <div class="card-header">
                        <h4 class="card-title">내 결재 관리</h4>
                    </div>
                    <div class="card-body">
                        <div class="top-buttons mb-3">
                            <div>
								<button class="btn btn-outline-all status-btn" data-status="">전체</button>
								<button class="btn btn-outline-primary status-btn" data-status="0">진행중</button>
								<button class="btn btn-outline-secondary status-btn" data-status="1">중간 결재 완료</button>
								<button class="btn btn-outline-success status-btn" data-status="2">결재 완료</button>
                            </div>
								<form class="form-inline search-form">
								    <input type="text" class="form-control" placeholder="검색" id="query">
								    <button type="submit" class="btn btn-primary">Search(F3)</button>
								</form>
                        </div>
                        <div class="date-range">
                            <label></label>
                        </div>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" id="checkAll"> 기안일자</th>
                                    <th>제목</th>
                                    <th>기안자</th>
                                    <th>중간결재자</th>
                                    <th>최종결재자</th>
                                    <th>결재일</th>
                                    <th>결재상태</th>
                                    <th>결재</th>
                                </tr>
                            </thead>
                                <tbody id="approvalDataBody">
        						<!-- 데이터가 동적으로 추가될 부분 -->
   								</tbody>
                        </table>
                        <div class="btn-container">
                            <button class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#signatureModal">My도장/서명</button>
                        </div>
                        <nav aria-label="Page navigation">
                            <ul class="pagination">   
                            </ul>
                        </nav>
                    </div>
                     <iframe id="form-document" style="display:none;"></iframe>
                    
                </div>
            </div>
        </div>
        <input type="hidden" id="hiddenApprovalDocIdx">
        <!-- Row end -->
<!-- My도장/서명 모달 -->
<div class="modal fade" id="signatureModal" tabindex="-1" aria-labelledby="signatureModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="signatureModalLabel">도장/서명 올리기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="instructions mb-3">
          1. 등록할 이미지를 선택한 후, 사용할 영역을 선택합니다.
        </div>
        <div class="row">
          <div class="col-6">
            <h6>Before : 원본사진</h6>
            <input type="file" id="imageUpload" class="form-control mb-3" accept="image/*">
            
            </br>
            <div class="image-container mb-3">
              <canvas id="signatureCanvas" width="400" height="300" style="border: 1px solid #000; width: 100%;"></canvas>
            </div>
            
          </div>
          <div class="col-6 text-center">
            <h6>After</h6>
            </br>
            </br>
            </br>
            </br>
            <div class="preview-container mb-3" style="width: 400px; height: 300px; margin: 0 auto;">
              <img id="previewImage" src="" alt="미리보기 이미지">
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="saveSignature">저장(F8)</button>
        <button class="btn btn-outline-primary" id="clearCanvas">서명 삭제</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
    </div>
                <!-- Container ends -->
                
            </div>
            <!-- App body ends -->
    
            <!-- App footer start -->
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
<script src="/assets/js/localStorage.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
</body>
<script>
$(document).ready(function() {
    const canvas = document.getElementById('signatureCanvas');
    const ctx = canvas.getContext('2d');
    let isDrawing = false;

    // 캔버스 미리보기 업데이트
    function updatePreview() {
        const dataURL = canvas.toDataURL('image/png');
        document.getElementById('previewImage').src = dataURL;
    }

    // 마우스 다운 이벤트 핸들러
    canvas.addEventListener('mousedown', (e) => {
        isDrawing = true;
        ctx.beginPath();
        ctx.moveTo(e.offsetX, e.offsetY);
    });

    // 마우스 무브 이벤트 핸들러
    canvas.addEventListener('mousemove', (e) => {
        if (isDrawing) {
            ctx.lineTo(e.offsetX, e.offsetY);
            ctx.stroke();
            updatePreview();
        }
    });

    // 마우스 업 이벤트 핸들러
    canvas.addEventListener('mouseup', () => {
        isDrawing = false;
        updatePreview();
    });

    // 캔버스 지우기 버튼 이벤트 핸들러
    document.getElementById('clearCanvas').addEventListener('click', function() {
        if (confirm('서명을 삭제하시겠습니까?')) {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            updatePreview();
        }
    });

    // 이미지 업로드 이벤트 핸들러
    document.getElementById('imageUpload').addEventListener('change', function(event) {
        const file = event.target.files[0];
        const reader = new FileReader();

        reader.onload = function(e) {
            const img = new Image();
            img.onload = function() {
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
                updatePreview();
            };
            img.src = e.target.result;
        };

        reader.readAsDataURL(file);
    });

 // 서명 저장 버튼 클릭 이벤트 핸들러
    $('#saveSignature').click(function() {
        const dataURL = canvas.toDataURL('image/png');
        const loginId = '<%= session.getAttribute("loginId") %>';

        $.ajax({
            url: '/uploadSignature',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                image: dataURL,
                loginId: loginId
            }),
            success: function(response) {
                alert(response);
                $('#signatureModal').modal('hide'); // 모달 창 닫기
            },
            error: function(xhr, status, error) {
                console.error('서명 저장 중 오류 발생:', error);
            }
        });
    });

    // 기존 서명 이미지 로드
    $.ajax({
        url: '/getSignature',
        type: 'GET',
        success: function(response) {
            if (response) {
                const img = new Image();
                img.onload = function() {
                    ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
                    updatePreview();
                };
                img.src = 'data:image/png;base64,' + response;
            }
        },
        error: function(xhr, status, error) {
            console.error('서명 이미지 로드 중 오류 발생:', error);
        }
    });
});
  
$(document).ready(function() {
    // 전체 선택 기능
    $('#checkAll').on('change', function() {
        const isChecked = $(this).is(':checked');
        $('.approval-checkbox').prop('checked', isChecked);
    });

    // 검색 기능
    $('.search-form').on('submit', function(e) {
        e.preventDefault();
        const query = $('#query').val();
        loadApprovalData(1, query);  // 페이지를 1로 초기화
    });

    // 필터링 기능
    $('.status-btn').on('click', function() {
        const status = $(this).data('status');  // 버튼에 data-status 속성 사용
        loadApprovalData(1, '', status);
    });

    // 데이터 가져오기
function loadApprovalData(page = 1, query = '', status = '') {
    $.ajax({
        url: '/getApprovalData.ajax',
        type: 'POST',
        data: {
            page: page,
            query: query,
            status: status
        },
        dataType: 'json',
        success: function(response) {
            $('#approvalDataBody').empty();

            response.data.forEach(function(item) {
                const row = $('<tr></tr>');
                const writeDateCell = $('<td></td>').append($('<input>', {
                    type: 'checkbox',
                    class: 'approval-checkbox',
                    value: item.approval_doc_path
                })).append(' ' + item.approval_doc_write_date);
                const titleCell = $('<td></td>').text(item.approval_doc_title);
                const idCell = $('<td></td>').text(item.emp_name + ' ' + item.title_name);  // 이름과 직책
                const midApproverCell = $('<td></td>').text(item.appr_midapprover);
                const finalApproverCell = $('<td></td>').text(item.appr_finalapprover);
                const appr_mngr_updt = $('<td></td>').text(item.approval_doc_udt_dt);
                const stateCell = $('<td></td>').text(getApprovalStateText(item.approval_doc__state));

                const buttonClass = item.approval_doc__state === 2 ? 'btn btn-success' : 'btn btn-primary';
                const buttonText = item.approval_doc__state === 2 ? '보기' : '결재';

                const buttonCell = $('<td></td>').append($('<button>', {
                    class: buttonClass,
                    text: buttonText,
                    click: function() {
                        window.location.href = '/  /viewFile/' + btoa(item.approval_doc_path) + '/' + item.approval_doc_idx;
                    }
                }));

                row.append(writeDateCell, titleCell, idCell, midApproverCell, finalApproverCell, appr_mngr_updt, stateCell, buttonCell);
                $('#approvalDataBody').append(row);
            });

            // 페이징 처리
            renderPagination(response.totalPages, page);
        },
        error: function(xhr, status, error) {
            console.error('데이터를 가져오는 중 오류 발생:', error);
        }
    });
}

    // 페이징 처리
   function renderPagination(totalPages, currentPage) {
    const pagination = $('.pagination');
    pagination.empty();

    const createPageItem = (page, label, disabled = false) => {
        const li = $('<li></li>').addClass('page-item').toggleClass('active', page === currentPage).toggleClass('disabled', disabled);
        const a = $('<a></a>').addClass('page-link').attr('href', '#').text(label);
        if (!disabled) {
            a.on('click', function(e) {
                e.preventDefault();
                loadApprovalData(page);
            });
        }
        li.append(a);
        return li;
    };

    pagination.append(createPageItem(currentPage - 1, 'Previous', currentPage === 1));
    
    for (let i = 1; i <= totalPages; i++) {
        pagination.append(createPageItem(i, i));
    }

    pagination.append(createPageItem(currentPage + 1, 'Next', currentPage === totalPages));
}

    // 결재 상태 텍스트 변환
    function getApprovalStateText(state) {
        if (state === 1) return '중간 결재 완료';
        if (state === 2) return '결재 완료';
        return '진행 중';
    }

    // 페이지 로드 시 데이터 가져오기
    loadApprovalData();
});

</script>
</html>
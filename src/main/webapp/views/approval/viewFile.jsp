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
            margin-top: 0px;
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
        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start; /* 추가 */
        }
        .card-title {
            margin-bottom: 0; /* 추가 */
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
        <th rowspan="3">결재</th>
        <th>중간결재자</th>
        <th>최종결재자</th>
    </tr>
    <tr>
        <td id="midApproverSignature">&nbsp;</td>
        <td id="finalApproverSignature">&nbsp;</td>
    </tr>
    <tr>
        <td id="midApproverSignatureDate">&nbsp;</td>
        <td id="finalApproverSignatureDate">&nbsp;</td>
    </tr>
								</table>
                                </div>
                                <div class="card-body">
                                    <c:if test="${not empty fileContent}">
                                        <iframe id="iframe-document" src="/api/document/${fileContent}" width="100%" height="700px"></iframe>
                                    </c:if>
                                    <c:if test="${not empty errorMessage}">
                                        <p style="color: red;">${errorMessage}</p>
                                    </c:if>
                                </div>
                    <div class="card-footer d-flex justify-content-end">
                        <button id="approve-button" class="btn btn-primary">결재</button>
                        <button class="btn btn-secondary" id="close-button">닫기</button>
                        <button class="btn btn-secondary" id="download-pdf-button" onclick="downloadPDF()">PDF 다운로드</button>
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
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
</body>

<script>
//페이지 로드 시 로컬 스토리지에서 해당 페이지의 서명 정보 불러오기
$(document).ready(function() {
    const currentPage = window.location.pathname; // 현재 페이지 경로
    const midApproverSignature = localStorage.getItem(currentPage + '-midApproverSignature');
    const finalApproverSignature = localStorage.getItem(currentPage + '-finalApproverSignature');
    const midApproverSignatureDate = localStorage.getItem(currentPage + '-midApproverSignatureDate');
    const finalApproverSignatureDate = localStorage.getItem(currentPage + '-finalApproverSignatureDate');

    if (midApproverSignature) {
        $('#midApproverSignature').html('<img src="' + midApproverSignature + '" style="width: 100px; height: auto;">');
        $('#midApproverSignatureDate').text(midApproverSignatureDate);
    }

    if (finalApproverSignature) {
        $('#finalApproverSignature').html('<img src="' + finalApproverSignature + '" style="width: 100px; height: auto;">');
        $('#finalApproverSignatureDate').text(finalApproverSignatureDate);
    }
});

 // 결재 버튼 클릭 시 서명 추가 및 로컬 스토리지에 저장
    $('#approve-button').on('click', function() {
        $.ajax({
            url: '/getUserType',
            type: 'GET',
            success: function(response) {
                const userType = response;
                const currentPage = window.location.pathname; // 현재 페이지 경로

                $.ajax({
                    url: '/getSignature',
                    type: 'GET',
                    success: function(response) {
                        if (response) {
                            const signatureImageSrc = 'data:image/png;base64,' + response;
                            const currentDate = new Date().toISOString().split('T')[0];

                            if (userType === 'midApprover') {
                                $('#midApproverSignature').html('<img src="' + signatureImageSrc + '" style="width: 100px; height: auto;">');
                                $('#midApproverSignatureDate').text(currentDate);

                                // 로컬 스토리지에 저장
                                localStorage.setItem(currentPage + '-midApproverSignature', signatureImageSrc);
                                localStorage.setItem(currentPage + '-midApproverSignatureDate', currentDate);
                            } else if (userType === 'finalApprover') {
                                $('#finalApproverSignature').html('<img src="' + signatureImageSrc + '" style="width: 100px; height: auto;">');
                                $('#finalApproverSignatureDate').text(currentDate);

                                // 로컬 스토리지에 저장
                                localStorage.setItem(currentPage + '-finalApproverSignature', signatureImageSrc);
                                localStorage.setItem(currentPage + '-finalApproverSignatureDate', currentDate);
                            }

                            // 결재 상태 업데이트
                            $.ajax({
                                url: '/updateApprovalStatus',
                                type: 'POST',
                                contentType: 'application/json',
                                data: JSON.stringify({
                                    approvalDocIdx: '${approval_doc_idx}',
                                    userType: userType,
                                    approvalDate: currentDate
                                }),
                                success: function(response) {
                                    if (response === 'success') {
                                        alert('결재가 완료되었습니다.');
                                        window.location.href = '/approval/myapproval.go'; // 페이지 이동
                                    } else {
                                        alert('결재 상태 업데이트 중 오류가 발생했습니다.');
                                    }
                                },
                                error: function() {
                                    alert('결재 상태 업데이트 중 오류가 발생했습니다.');
                                }
                            });

                        } else {
                            alert('서명 이미지를 불러오는 중 오류가 발생했습니다.');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('서명 이미지를 불러오는 중 오류 발생:', error);
                        alert('서명 이미지를 불러오는 중 오류가 발생했습니다.');
                    }
                });
            },
            error: function(xhr, status, error) {
                console.error('결재자 유형을 확인하는 중 오류 발생:', error);
                alert('결재자 유형을 확인하는 중 오류가 발생했습니다.');
            }
        });
    });

    function downloadPDF() {
        const element = document.getElementById('iframe-document'); // PDF로 변환하고자 하는 HTML 요소를 선택합니다. 예: document.getElementById('your-element-id')
        console.log(element);

        const iframeDocument = element.contentDocument || element.contentWindow.document;

        const content = iframeDocument.body; 

        html2canvas(content, { scale: 2 }).then(canvas => {
            const imgData = canvas.toDataURL('image/png');
            const { jsPDF } = window.jspdf;
            const pdf = new jsPDF('p', 'mm', 'a4');

            const imgProps = pdf.getImageProperties(imgData);
            const pdfWidth = pdf.internal.pageSize.getWidth();
            const pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;

            pdf.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
            pdf.save('document.pdf');
        });
    }
</script>
</html>

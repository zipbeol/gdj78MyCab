<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<!-- Meta -->
<meta name="description"
	content="Marketplace for Bootstrap Admin Dashboards">
<meta name="author" content="Bootstrap Gallery">
<link rel="canonical" href="https://www.bootstrap.gallery/">
<meta property="og:url" content="https://www.bootstrap.gallery">
<meta property="og:title"
	content="Admin Templates - Dashboard Templates | Bootstrap Gallery">
<meta property="og:description"
	content="Marketplace for Bootstrap Admin Dashboards">
<meta property="og:type" content="Website">
<meta property="og:site_name" content="Bootstrap Gallery">
<link rel="shortcut icon" href="/assets/images/favicon.svg">
<!-- *************
            ************ CSS Files *************
        ************* -->
<link rel="stylesheet"
	href="/assets/fonts/bootstrap/bootstrap-icons.css">
<link rel="stylesheet" href="/assets/css/main.min.css">

<!-- *************
            ************ Vendor Css Files *************
        ************ -->

<!-- Scrollbar CSS -->
<link rel="stylesheet"
	href="/assets/vendor/overlay-scroll/OverlayScrollbars.min.css">

<!-- Date Range CSS -->
<link rel="stylesheet" href="/assets/vendor/daterange/daterange.css">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<!-- 따로 적용한 CSS -->
<link rel="stylesheet" href="/assets/css/default.css">
<!-- FontAwesome 추가 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<style>
.alert-placeholder {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 1050;
	margin: 0;
	padding: 10px;
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

.header1 {
	background-color: #4ca2d2;
	color: white;
}
.header2 {
	background-color: #32b8b7;
	color: white;
}

.summary {
	background-color: #f2f2f2;
	color: black;
}
.info{
	font-size: large;
}
.info2{
	margin-left: 1400px;
	font-size: large;
}
.buttonPosition{
	margin-left: 1509px;
}
#currMonth{
	font-size: large;
	text-align: center;
}
input {
	text-align: end;
	width: 80%;
}
.add{
	background-color: #4ca2d2;
	color: white;
}
.ded{
	background-color: #32b8b7;
	color: white;
}
.total{
	background-color: #41ca4a;
	color: white;
}
</style>


</head>

<body>
	<!-- Page wrapper start -->
	<div class="page-wrapper">

		<!-- Main container start -->
		<div class="main-container">

			<!-- Sidebar wrapper start -->
			<jsp:include page="/views/sidebar.jsp" />
			<!-- Sidebar wrapper end -->

			<!-- App container starts -->
			<div class="app-container">

				<!-- App header starts -->

				<div class="app-header d-flex align-items-center">

					<!-- Toggle buttons start -->
					<div class="d-flex">
						<button class="btn btn-outline-primary me-2 toggle-sidebar"
							id="toggle-sidebar">
							<i class="bi bi-list fs-5"></i>
						</button>
						<button class="btn btn-outline-primary me-2 pin-sidebar"
							id="pin-sidebar">
							<i class="bi bi-list fs-5"></i>
						</button>
					</div>
					<!-- Toggle buttons end -->

					<!-- App brand sm start -->
					<div class="app-brand-sm d-lg-none d-sm-block">
						<a href="/"> <img src="/assets/images/logo-sm.svg"
							class="logo" alt="Bootstrap Gallery">
						</a>
					</div>
					<!-- App brand sm end -->

					<!-- Breadcrumb start -->
					<ol class="breadcrumb d-none d-lg-flex ms-3">
						<li class="breadcrumb-item"><a href="/"><i
								class="bi bi-house lh-1"></i></a> <a href="/"
							class="text-decoration-none">메인</a></li>
						<li class="breadcrumb-item"><a href="#"
							class="text-decoration-none">인사 관리</a></li>
						<li class="breadcrumb-item"><a href="/emp/sal/list.go"
							class="text-decoration-none">급여 관리</a></li>
						<li class="breadcrumb-item"><a href="#"
							class="text-decoration-none">급여명세서 수정</a></li>
					</ol>
					<!-- Breadcrumb end -->

					<!-- App header actions start -->
					<jsp:include page="/views/appHeader.jsp" />
					<!-- App header actions end -->

				</div>

				<!-- App header ends -->

				<!-- App body starts -->
				<div class="app-body">

					<!-- Container starts -->
					<div class="container-fluid">
						<!-- Alert placeholder start -->
						<div id="alertPlaceholder"></div>
						<!-- Alert placeholder end -->
						<!-- Row start -->
						<div class="row">
							<div class="col-12">
								<div class="card mb-3">
									<div class="card-header">
										<h4 class="card-title">급여명세서 수정</h4>
									</div>
									<div class="card-body">
										<!-- 여기에 코딩 -->
												
										<div id="currMonth"></div>
										<div class="mt-2 info2">등록자: ${emp.sal_register} <br/> 등록일: ${emp.sal_register_date}</div>
  		 								<div class="mt-5 info">사번:${emp.emp_no}  성명:${emp.emp_name}  부서: ${emp.dept_name}  직급:${emp.title_name}</div>
  		 								<div class="mt-1"></div>
										<table>
											<tr>
												<td rowspan="3" class="header1">지급<br/> 내역</td>
												<td colspan="2" class="add">기본금</td>
												<td colspan="2" class="add">식대</td>
												<td colspan="2" class="add">직급 수당</td>
												<td class="add">보너스</td>
											</tr>
											<tr>
												<td colspan="2"><input type="text" value="0" id="sal_base" readonly>원</td>
												<td colspan="2"><input type="text" value="0" id="sal_meal" readonly>원</td>
												<td colspan="2"><input type="text" value="0" id="title_pay" readonly>원</td>
												<td><input type="text" value="0" id="bonus" ></td>
											</tr>
											<tr>

											</tr>
											<tr>
												<td rowspan="2" class="header2">공제<br/> 내역</td>
												<td class="ded">국민연금</td>
												<td class="ded">건강보험</td>
												<td colspan="2" class="ded">장기요양보험</td>
												<td class="ded">고용보험</td>
												<td class="ded">소득세</td>
												<td class="ded">지방소득세</td>
											</tr>
											<tr>
												<td><input type="text" value="0" id="nationalPension" oninput="formatNumber(this)" readonly>원</td>
												<td><input type="text" value="0" id="healthInsur"  oninput="formatNumber(this)" readonly>원</td>
												<td colspan="2"><input type="text" id="longtermInsur" value="0" oninput="formatNumber(this)" readonly>원</td>
												<td><input type="text" value="0" id="empInsur" oninput="formatNumber(this)" readonly>원</td>
												<td><input type="text" value="0" id="incomeTax" oninput="formatNumber(this)" readonly>원</td>
												<td><input type="text" value="0" id="localIncomeTax" oninput="formatNumber(this)" readonly>원</td>
											</tr>
										</table>
										
										<div class="mt-2"><button class="btn btn-secondary buttonPosition" onclick="calDED()" id="calDed">계산</button></div>
										<div class="mt-3"></div>
										<table>
											<tr>
												<td rowspan="2" class="summary">합계</td>
												<td colspan="2" class="add">총 급여</td>
												<td colspan="2" class="ded">공제총액</td>
												<td colspan="2" class="total">실지급액</td>
											</tr>
											<tr>
												<td colspan="2"><input type="text" value="0"  id="total_sal" readonly>원</td>
												<td colspan="2"><input type="text" value="0" id="total_ded" readonly>원</td>
												<td colspan="2"><input type="text" value="0" id="real_sal" readonly>원</td>
											</tr>
										</table>
										<div class="mt-3"></div>
										<div class="mt-3"><button class="btn btn-primary buttonPosition" id="edit">수정</button></div>
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







</body>
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
<script
	src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
<script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>
<!-- Moment JS -->
<script src="/assets/js/moment.min.js"></script>
<!-- Date Range JS -->
<script src="/assets/vendor/daterange/daterange.js"></script>
<script src="/assets/vendor/daterange/custom-daterange.js"></script>
<!-- Custom JS files -->
<script src="/assets/js/custom.js"></script>
<script src="/assets/js/localStorage.js"></script>
<script src="/assets/js/showAlert.js"></script>
<!-- 페이지네이션 -->
<script src="/assets/js/jquery.twbsPagination.min.js"></script>

<script>
var chk = false;
$(document).ready(function() {
    
	calDED();
	calculateDed();
	
});

$('#bonus').on('keyup',function(){
	calculateTotal();
	chk = false;
	$('#empInsur').val('0');
    $('#healthInsur').val('0');
    $('#longtermInsur').val('0');
    $('#nationalPension').val('0');
    $('#incomeTax').val('0');
    $('#localIncomeTax').val('0');
    $('#total_ded').val('0');
    $('#real_sal').val('0');
    
});

function calculateTotal() {
    let salBase = document.getElementById('sal_base').value.replace(/,/g, '') || 0;
    let salMeal = document.getElementById('sal_meal').value.replace(/,/g, '') || 0;
    let titlePay = document.getElementById('title_pay').value.replace(/,/g, '') || 0;
    let bonus = document.getElementById('bonus').value.replace(/,/g, '') || 0;

    let total = parseInt(salBase) + parseInt(salMeal) + parseInt(titlePay) + parseInt(bonus);
    document.getElementById('total_sal').value = addCommasToNumber(total);
}

function calculateReal() {
    let salT = document.getElementById('total_sal').value.replace(/,/g, '') || 0;
    let dedT = document.getElementById('total_ded').value.replace(/,/g, '') || 0;

    let real_sal = parseInt(dedT) - parseInt(salT);
    real_sal = Math.abs(real_sal);
    document.getElementById('real_sal').value = addCommasToNumber(real_sal);
    
    return real_sal;
}


function formatDateToYearMonth(dateString) {
    return dateString.slice(0, 7); // yyyy-MM-dd 형식의 문자열을 yyyy-MM 형식으로 자름
}


var currentMonth = '${emp.sal_register_date}';
console.log(currentMonth);

$('#currMonth').text(formatDateToYearMonth(currentMonth)+' 급여 명세서');

var sal_base = '${emp.sal_base}';
var sal_meal = '${emp.sal_meal}';
var title_pay = '${emp.title_add_pay}';
var sal_bonus = '${emp.sal_bonus}';
var sal_total = '${emp.sal_total}';
var sal_actual = '${emp.sal_actual}';
			

$('#sal_base').val(addCommasToNumber(sal_base));
$('#sal_meal').val(addCommasToNumber(sal_meal));
$('#title_pay').val(addCommasToNumber(title_pay));
$('#bonus').val(addCommasToNumber(sal_bonus));
$('#total_sal').val(addCommasToNumber(sal_total));
$('#real_sal').val(addCommasToNumber(sal_actual));

function addCommasToNumber(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}


function calculateDed() {
    let q = document.getElementById('empInsur').value.replace(/,/g, '') || 0;
    let w = document.getElementById('healthInsur').value.replace(/,/g, '') || 0;
    let e = document.getElementById('longtermInsur').value.replace(/,/g, '') || 0;
    let r = document.getElementById('nationalPension').value.replace(/,/g, '') || 0;
    let t = document.getElementById('incomeTax').value.replace(/,/g, '') || 0;
    let y = document.getElementById('localIncomeTax').value.replace(/,/g, '') || 0;

    let ded = parseInt(q) + parseInt(w) + parseInt(e) + parseInt(r)+ parseInt(t)+ parseInt(y);
    document.getElementById('total_ded').value = addCommasToNumber(ded);
}


	
	
var total_sal = parseInt($('#total_sal').val().replace(/,/g, ''));

function calDED(){
	
	        $.ajax({
	            url: '/calculateDeductions.ajax',
	            type: 'GET',
	            data: {
	                'totalSalary': total_sal
	            },
	            dataType: 'JSON',
	            success: function (result) {
	            	$('#empInsur').val(addCommasToNumber(Math.round(result.empInsur)));
                    $('#healthInsur').val(addCommasToNumber(Math.round(result.healthInsur)));
                    $('#longtermInsur').val(addCommasToNumber(Math.round(result.longtermInsur)));
                    $('#nationalPension').val(addCommasToNumber(Math.round(result.nationalPension)));
                    $('#incomeTax').val(addCommasToNumber(Math.round(result.incomeTax)));
                    $('#localIncomeTax').val(addCommasToNumber(Math.round(result.localIncomeTax)));
                    
                    chk = true;
                    calculateDed();
                    calculateReal();
                    
	            },
	            error: function (error) {
	                console.log(error);
	            }
	        });
}


var sal_idx = '${emp.sal_idx}';
var sal_modifier = '${sessionScope.loginId}';
	        
$('#edit').on('click', function(){
	var sal_actual = calculateReal();
	var salBonus = $('#bonus').val().replace(/,/g, '');
	var totalSal = $('#total_sal').val().replace(/,/g, '');
	console.log(sal_actual);
	console.log(sal_idx);
	console.log(sal_modifier);
	console.log(salBonus);
	console.log(totalSal);
	
	 if (chk === false) {
		showAlert('danger','공제액을 계산해주세요.');
	}else{
		
		$.ajax({
            url: '/editSalary.ajax',
            type: 'GET',
            data: 
            {
            'sal_idx': sal_idx,
            'sal_modifier': sal_modifier,
           	'sal_bonus': salBonus,
           	'sal_total': totalSal,
           	'sal_actual': sal_actual,
            },
            dataType: 'JSON',
            success: function (data) {
            	if (data.isSuccess) {
                    showAlert('success', '급여 명세서 수정이 완료되었습니다.');
                    setTimeout(function() {
                        location.href='/emp/sal/list.go';
                    }, 1200);
                } else {
                    showAlert('danger', '급여 명세서 수정에 실패했습니다.');
                }  
            },
            error: function (error) {
                console.log(error);
            }
        });
		 
	} 
	 
	
	
});
	



</script>
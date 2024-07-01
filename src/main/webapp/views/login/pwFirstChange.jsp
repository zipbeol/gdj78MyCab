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
  </head>

  <body>
    <!-- Container start -->
    <div class="container">
      <div class="row justify-content-center" style="position: relative;left: -6%;">
        <div class="col-xl-4 col-lg-5 col-sm-6 col-12">
          <form class="my-5 needs-validation" action="/login/pwFirstChange.do" onsubmit="return validateForm()" method="post" novalidate>
            <div class="border rounded-2 p-4 mt-5" style="width: 550px">
                <a href="!#" class="mb-4 d-flex">
                  <img src="/assets/images/logo.svg" class="img-fluid login-logo" alt="Cab Admin Dashboard">
                </a>
                <h5 class="mb-4 lh-2 fw-light">
                 최초 로그인시 비밀번호 변경은 필수입니다. 
                 <br/>
                 비밀번호 변경 후 다시 로그인 해주세요.
                </h5>
                <div class="mb-2" >
                	<div style="position: relative;">
                  <label for="validationTooltip01" class="form-label">새 비밀번호 <br/>8자리 이상, 영문, 숫자, 특수문자를 모두 포함해야 합니다. <br/>(특수문자는 !@#$%^&*만 가능합니다.)</label>
                  <input type="password" class="form-control" oninput="pwCheck()" name="emp_password" placeholder="새 비밀번호" required pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$" minlength="8" required>
                  <div id="pwChk" class="invalid-feedback">비밀번호 조건을 확인해주세요.</div>
                  </div>
                  <br/>
                  
                  <label for="validationCustom01" class="form-label">새 비밀번호 확인</label>
                  <input type="password" class="form-control" oninput="pwCheck()" name="emp_passwordChk" placeholder="새 비밀번호 확인" >
                    <font id="pwChkValid"></font>
                    
                </div>
                <div class="d-grid pb-3">
                <input type="hidden" class="form-control" id="passwordChk" name="emp_no" value="${sessionScope.loginId}">
                </div>
                          <button class="btn btn-primary" type="submit" id="submitBtn">
                            비밀번호 수정
                          </button>
              
            </div>
          </form>
        </div>
      </div>
    </div>
    <!-- Container end -->
    
    <!-- Custom JS files -->
    <script src="/assets/js/validations.js"></script>
    
  </body>

  <script>
  
  
  var message = "${message}";
     if (message) {
         alert(message);
     }
  
    
    	    var pwInput = document.querySelector('input[name="emp_password"]');
    	    var pwChkInput = document.querySelector('input[name="emp_passwordChk"]');
    	    var pwChkValid = document.getElementById('pwChkValid');

    		function validatePasswords() {
    		    var pw = pwInput.value;
    		    var pwChk = pwChkInput.value;

    		    if (pw === pwChk) {
    		        pwChkValid.textContent = '비밀번호가 일치합니다';
    		        pwChkValid.style.color = 'green';
    		        
    		    } else {
    		        pwChkValid.textContent = '비밀번호가 일치하지 않습니다';
    		        pwChkValid.style.color = 'red';
    		       
    		    }
    		}

    		pwChkInput.addEventListener('keyup', validatePasswords);
    		pwInput.addEventListener('keyup', validatePasswords);
			
			
			function validateForm() {
			     if (pw !== pwChk) {
			         alert('비밀번호 확인란을 올바르게 작성해주세요.');
			         return false; // 폼 전송 취소
			     }else{
			    	 if (confirm("비밀번호를 수정하시겠습니까?")) {
			     		return true; // 폼 전송 허용
					}else{
							alert("비밀번호 수정을 취소했습니다.");
					}
			     }
			 }
			 
		</script>

</html>
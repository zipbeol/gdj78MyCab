var alertMessage = '';
var isModalAlert = false;

function showAlert(type, message) {
    if (alertMessage === message) {
        return;
    }
    alertMessage = message;
    var icon = '';
    if (type === 'success') {
        icon = '<i class="bi bi-check-circle-fill"></i>';
    } else if (type === 'danger') {
        icon = '<i class="bi bi-exclamation-triangle-fill"></i>';
    }
    console.log(icon);

    // 알림 메시지 HTML을 생성
    var alertHtml = `
      <div class="alert alert-` + type + ` alert-dismissible fade show" role="alert" style="display: none;">
         ` + icon + ` ` + message + `
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>`;
    var $alert = $(alertHtml); // jQuery 객체로 변환

    // modalFailFlag에 따라 알림 메시지를 추가할 위치 결정
    if (isModalAlert) {
        $('#alertModalPlaceholder').append($alert); // 모달 내의 알림
    } else {
        $('#alertPlaceholder').append($alert); // 일반 알림
    }

    $alert.slideDown(); // 알림 메시지를 슬라이드 다운으로 표시

    // 5초 후 알림 메시지를 슬라이드 업으로 숨기고 제거
    setTimeout(function () {
        $alert.slideUp(function () {
            $(this).remove(); // 슬라이드 업이 완료되면 알림 메시지를 DOM에서 제거
            alertMessage = '';
        });
    }, 5000); // 5000 밀리초 = 5초
}

// 사이드바 메뉴의 a 태그가 클릭되었을 때
$('.sidebar-menu').on('click', 'a', function (e) {
    var clickedA = $(this);
    var clickedAId = clickedA.attr('id');
    // 클릭된 a 태그의 가장 가까운 li 요소 찾기
    var currentLi = clickedA.closest('li');
    var topMostLi = currentLi.parents('li').last();

    var parentLi, parentLiId, parentLiClass;
    // 가장 가까운 li 요소에 id가 있는지 확인
    if (currentLi.attr('id')) {
        parentLi = currentLi;
    } else {
        // 가장 위의 li 요소 사용
        parentLi = topMostLi;
    }

    parentLiId = parentLi.attr('id');
    parentLiClass = parentLi.attr('class');

    // console.log(parentLi);
    // console.log(parentLiId);
    // console.log(parentLiClass);

    // 로컬 스토리지에 id와 class 저장
    localStorage.setItem('lastClickedMenuId', parentLiId);
    localStorage.setItem('lastClickedMenuClass', parentLiClass);
    localStorage.setItem('lastClickedAId', clickedAId);
});

$(document).ready(function () {
    var menuId = localStorage.getItem('lastClickedMenuId');
    var menuClass = localStorage.getItem('lastClickedMenuClass');
    var clickedAId = localStorage.getItem('lastClickedAId');
    // console.log(menuId);
    // console.log(menuClass);
    // console.log(clickedAId);

    if (menuId) {
        console.log('적용');
        var menuElement = $('#' + menuId);
        // console.log(menuElement);
        if (menuClass === 'undefined') {
            menuElement.attr('class', 'active current-page');
        } else {
            menuElement.attr('class', menuClass);
        }
    }
    if (clickedAId) {
        var clickedElement = $('#' + clickedAId);
        // console.log(clickedElement);
        clickedElement.attr('class', 'active active-sub');

    }
});


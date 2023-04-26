// 전역 객체 선언
window.coupon = {}; 

window.coupon.path = "<%=request.getContextPath()%>";

window.onload = function() {
    const couponDownload = document.querySelector('#season_coupon_download_btn');
    couponDownload.addEventListener('click', function() {
        alert("확인");
    });
};

// 전역 객체 선언
window.coupon = {}; 
window.coupon.path = "<%= request.getContextPath() %>";
window.coupon.loginMember = '<%= session.getAttribute("loginMember") %>';

if (typeof window.coupon.loginMember === 'object' && window.coupon.loginMember !== null) {
    // loginMember가 객체이고, null이 아닐 때
    console.log(window.coupon.loginMember.nickname);
} else {
    console.log('loginMember가 존재하지 않습니다.');
}



window.onload = function() {
    const couponDownload = document.querySelector('#season_coupon_download_btn');
    couponDownload.addEventListener('click', function() {
    	if (window.coupon.loginMember) {
    		alert(window.coupon.loginMember.no + "님 쿠폰 다운로드 되었습니다.");
    		
    	
    	} else {
    		alert("로그인이 필요한 서비스입니다.");
    		
    	}
    	
    });
};



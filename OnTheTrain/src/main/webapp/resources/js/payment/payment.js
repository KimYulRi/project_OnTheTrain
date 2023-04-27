// 전역 객체 선언
window.payment = {}; 

window.payment.path = '<%=request.getContextPath()%>';


window.payment.requestPay = function () {
  // 함수 내용
  var IMP = window.IMP; // 생략 가능
  IMP.init("imp17133480"); // 예:imp1234xxxxx
	
  IMP.request_pay({
    pg : 'html5_inicis.INIpayTest',
    pay_method : 'card',
    merchant_uid: "57008833-330078", 
    name : '공기 한 줌',
    amount : 100,
    buyer_email : 'maybe0047@gmail.com',
    buyer_name : '수수께끼의 개발자',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 강남구 역삼동',
    buyer_postcode : '123-456'
  }, function (rsp) { // callback
    if (rsp.success) {
      var msg = '결제가 완료되었습니다.';
      alert(msg);
      
      var waitingNos;
      
      
      
    } else {
      console.log(rsp);
      var msg = '결제에 실패하였습니다.';
      msg += '에러내용 : ' + rsp.error_msg;
      alert(msg);
    }
  });
};


window.onload = function() {
  const modalOpenBtn = document.getElementById("modal_open_btn");
  const modalCloseBtn = document.getElementById("modal_close_btn");
  const modal = document.querySelector(".modal");

  modalOpenBtn.addEventListener("click", function() {
    modal.style.display = "flex";

    const myCoupon = "my_coupon_value"; // myCoupon 값 명시

    const loadCouponList = function(page) {
      let pageInfo; // pageInfo 먼저 정의

      $.ajax({
        type: "GET",
        url: window.payment.path + "/payment/myCoupon?myCoupon=" + myCoupon + "&page=" + pageInfo.currentPage,
        dataType: "json",
        data: {
          myCoupon: myCoupon, // myCoupon 값 전달
          page: page // 페이지 번호 전달
        },
        success: function(data) {
          console.log(data);

          pageInfo = data.pageInfo; // pageInfo 할당

          const couponList = data.myCouponList;

          const couponListElem = document.getElementById("coupon_list");
          couponListElem.innerHTML = "";

          for (let i = 0; i < couponList.length; i++) {
            const coupon = couponList[i];
            const liElem = document.createElement("li");
            liElem.innerText = coupon.name;
            couponListElem.appendChild(liElem);
          }

          const paginationElem = document.getElementById("pagination");
          paginationElem.innerHTML = "";

          for (let i = pageInfo.startPage; i <= pageInfo.endPage; i++) {
            const pageNumElem = document.createElement("a");
            pageNumElem.href = "#";
            pageNumElem.innerText = i;

            if (i === pageInfo.currentPage) {
              pageNumElem.classList.add("active");
            }

            pageNumElem.addEventListener("click", function() {
              // 페이지 번호를 클릭하면 해당 페이지로 이동하도록 처리
              loadCouponList(i);
            });

            paginationElem.appendChild(pageNumElem);
          }
        },
        error: function(error) {
          console.log(error);
        }
      });
    };

    loadCouponList(1); // 첫 페이지 로드

  });

  modalCloseBtn.addEventListener("click", function() {
    modal.style.display = "none";
  });
};

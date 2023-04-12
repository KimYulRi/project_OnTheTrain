window.payment = {}; // 전역 객체 선언

window.payment.path = "<%=request.getContextPath()%>"; // path 변수를 자바스크립트에서 사용할 수 있는 형태로 변환
console.log(payment.path); // path 변수 값 출력

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
      console.log(rsp);
      var msg = '결제가 완료되었습니다.';
      alert(msg);
      
      
      
      
      
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
  });

  modalCloseBtn.addEventListener("click", function() {
    modal.style.display = "none";
  });
};





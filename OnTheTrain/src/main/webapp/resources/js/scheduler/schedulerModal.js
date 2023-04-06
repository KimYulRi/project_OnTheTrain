/**
 * 
 */

// 모달창 열기 버튼 클릭 시
document.querySelector('.open-modal-button').addEventListener('click', function() {
  // 모달창 열기
  document.querySelector('.modal').classList.add('show');
  // 배경 어둡게
  document.querySelector('body').classList.add('modal-open');
});

// 모달창 닫기 버튼 클릭 시
document.querySelector('.close-modal-button').addEventListener('click', function() {
  // 모달창 닫기
  document.querySelector('.modal').classList.remove('show');
  // 배경 원래대로
  document.querySelector('body').classList.remove('modal-open');
});

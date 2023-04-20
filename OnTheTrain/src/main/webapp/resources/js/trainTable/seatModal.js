// 저장된 상태를 불러오는 함수
function loadState() {
  let carriages = document.querySelectorAll('.carriage');
  let seats = document.querySelectorAll('.seat');

  // carriage의 선택 상태를 불러오기
  for (let i = 0; i < carriages.length; i++) {
    if (localStorage.getItem(`carriage_${i}`) === 'true') {
      carriages[i].classList.add('selected');
    }
  }

  // seat의 선택 상태를 불러오기
  for (let i = 0; i < seats.length; i++) {
    if (localStorage.getItem(`seat_${i}`) === 'true') {
      seats[i].classList.add('selected');
    }
  }
}

// 저장된 상태를 저장하는 함수
function saveState() {
  let carriages = document.querySelectorAll('.carriage');
  let seats = document.querySelectorAll('.seat');

  // carriage의 선택 상태를 저장하기
  for (let i = 0; i < carriages.length; i++) {
    localStorage.setItem(`carriage_${i}`, carriages[i].classList.contains('selected'));
  }

  // seat의 선택 상태를 저장하기
  for (let i = 0; i < seats.length; i++) {
    localStorage.setItem(`seat_${i}`, seats[i].classList.contains('selected'));
  }
}

// 페이지 로드 시 저장된 상태 불러오기
loadState();

// 버튼 클릭 시 선택 상태 저장하기
let carriages = document.querySelectorAll('.carriage');
carriages.forEach(carriage => {
  carriage.addEventListener('click', () => {
    carriage.classList.toggle('selected');
    saveState();
  });
});

let seats = document.querySelectorAll('.seat');
seats.forEach(seat => {
  seat.addEventListener('click', () => {
    seat.classList.toggle('selected');
    saveState();
  });
});


	 // 좌석 요소들
const maxAdults = seats.length; // 좌석 수

const adultSelect = document.querySelector('#adult');
adultSelect.addEventListener('change', function() {
  const selectedAdults = parseInt(adultSelect.value); // 선택한 어른 수
  
  if (selectedAdults > maxAdults) {
    alert(`선택한 어른의 수가 좌석 수보다 많습니다. 최대 ${maxAdults}명까지 예약 가능합니다.`);
    adultSelect.value = 0; // 어른 인원 수를 0명으로 초기화
  }
});
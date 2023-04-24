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
 

 function resetSelectedSeat() {
   $(".seat.selected, .seat.seated").removeClass("selected seated");
}


 
		// 버튼 클릭 시 선택 상태 저장하기
		let selectedCarriage = null;
		let carriages = document.querySelectorAll('.carriage');
		let selectedSeats = 0;
		let seats = document.querySelectorAll('.seat');
	  
 function carriageClicked(carriage) {
		  if (selectedCarriage !== carriage) {
		    if (selectedCarriage !== null) {
		     // 이전에 선택된 carriage에서 선택된 좌석 초기화
		      let selectedSeatsInCarriage = selectedCarriage.querySelectorAll('.seat.selected');
		      selectedSeatsInCarriage.forEach(seat => {
		      
		        seat.classList.remove('selected');
		    });
		      
		      selectedSeats = 0;
		      selectedSeatsInCarriage = []; 
		      selectedCarriage.classList.remove('selected');
		   }

		    selectedCarriage = carriage;
		    carriage.classList.add('selected');
		    selectedSeats = 0;
		    saveState();
		  }
		}

	
function seatClicked(event) {
	    // 현재 선택된 좌석 수
	      let currentSelectedSeats = document.querySelectorAll('.seat.selected').length;
	    // 선택 가능한 최대 좌석 수
	      let maxAdultSeats = parseInt(document.getElementById('adult').value);
		  let maxChildSeats = parseInt(document.getElementById('child').value);
		  let maxSeniorSeats = parseInt(document.getElementById('senior').value);
		  let maxSeats = maxAdultSeats + maxChildSeats + maxSeniorSeats;
		
		 // 선택된 좌석 수와 선택 가능한 최대 좌석 수를 비교하여 경고 메시지를 띄움
		  if (currentSelectedSeats >= maxSeats) {
		    alert('요청하신 승객수를 초과하였습니다. 다시 선택해주세용');
		    return;
		  } else {
		    selectedSeats = currentSelectedSeats;
		     event.target.classList.toggle('selected');
	    	 saveState();	
			  }
		} 
		carriages.forEach(carriage => {
		  carriage.addEventListener('click', () => {
		    carriageClicked(carriage);
		    resetSelectedSeat();
		  });
		});
			seats.forEach(seat => {
		  	seat.addEventListener('click', seatClicked);
	});


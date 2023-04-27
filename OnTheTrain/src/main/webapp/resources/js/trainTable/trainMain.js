$("#traintable_btn").on({
click: (event) =>
    $.ajax({
    method: "GET",
    url: "https://cors-anywhere.herokuapp.com/http://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo",
    data: {
        serviceKey:
            "gmS8oJCD4iJ/Qtk/BRoulaCXaZsf3t7Cp/lgUGBdLlB7MeMJ7NGSbyM64g837jMxFpopfo6k2VpAhod/vcvyJQ==",
        pageNo: "1",
        numOfRows: "10",
        _type: "json",
        depPlaceId: $("#depPlaceId").val(),
        // depPlaceId: "NAT010000",
       	arrPlaceId: $("#arrPlaceId").val(),
        // arrPlaceId: "NAT014445",
        depPlandTime: $("#depPlandTime").val(),
        // depPlandTime: "20230403",
        trainGradeCode: "00",
        async:false
        },
    }).done(function (data) {
        $("#train").empty();
        const json = JSON.stringify(data);
         
      // document.write(json);
        console.log(data);
        let rows = data["response"]["body"]["items"]["item"];
        
        if(!rows || !rows.length) {
            let imgSrc = "../images/trainTable/searchNone.png";
            let $non =  $("<div>").append($("<img>").attr("src", imgSrc));
            $("#none").empty().append($non);
            $("#none").show();
            $("#hr").show();
            $("#checkBack").show();
			
        } else {
        	$("#hr").hide();
        	$("#none").hide();
        	$("#checkBack").hide();
        	
         let html = `
         			<table border="1px" align="center" id="myTable">
			        <thead id="tableHead">
			        <tr>
			            <th width="30px">구분</th>
			            <th width="50px">열차 번호</th>
			            <th width="50px">출발역</th>
			            <th width="50px">도착역</th>
			            <th width="30px">특실</th>
			            <th width="30px">일반실</th>
			            <th width="50px">운임요금</th>
			            <th width="50px">소요시간</th>
			            <th width="50px">출발시간</th>
			            <th width="50px">도착시간</th>
			        </tr>
			        </thead>
			        <tbody id="tableBody">
			         `;	
        	
        	
        for (let i = 0; i < rows.length; i++) {
            let tr = document.createElement("tr");
            let charge = rows[i]["adultcharge"];
            let arrplace = rows[i]["arrplacename"];
            let arrtime = rows[i]["arrplandtime"];
            let train = rows[i]["traingradename"];
            let depname = rows[i]["depplacename"];
            let deptime = rows[i]["depplandtime"];
            let no = rows[i]["trainno"];
            let depDateString = deptime.toString();
            let depDate = `${depDateString.substring(0,8)}`;
            
			let deptimeString = deptime.toString(); // deptime을 문자열로 변환
            let deptimeFormatted = `${deptimeString.substring(8, 10)}:${deptimeString.substring(10, 12)}`;
            let depTime = `${deptimeString.substring(8, 12)}`;
			
            let arrtimeString = arrtime.toString(); // deptime을 문자열로 변환
            let arrtimeFormatted = `${arrtimeString.substring(8, 10)}:${arrtimeString.substring(10, 12)}`;
            let arrTime = `${arrtimeString.substring(8, 12)}`;
            
            let duration = parseInt((arrtime - deptime) / 100); // 분 단위로 변환
            let hours = Math.floor(duration / 60); // 시간 계산
            let minutes = duration % 60; // 분 계산
            
            // 시간과 분을 문자열로 변환
            let durationString = `${hours}시간 ${minutes}분`;

            // 만약 분이 0분이면 "시간"이라는 단어를 생략합니다.
            if (minutes === 0) {
                durationString = `${hours}시간`;
            }

            if (hours === 0) {
                durationString = `${minutes}분`
            }
            
            let reservation = {};

			function reserve() {
			  $.ajax({
			    url: "/reservation",
			    type: "POST",
			    data: JSON.stringify(reservation),
			    contentType: "application/json",
			    success: function(data) {
			      // 성공 시 처리할 코드
			    },
			    error: function(jqXHR, textStatus, errorThrown) {

			    }
			  });
			}
			
			$('.carriage').on("click", function() {
			  var selectedCarriage = $(this).attr('value');
			  reservation.carriage = selectedCarriage; // 선택한 차량 값을 예약 정보 객체에 추가
			  			  reserve();
			  
			});
			
			$('.seat').on("click", function() {
			  var selectedSeat = $(this).attr('value');
			  reservation.seat = selectedSeat; // 선택한 좌석 값을 예약 정보 객체에 추가
			  reserve();
			});
			
			$('.apply-button').on("click", function() {
			  reservation = {
			    train: train, 
			    no: no, 
			    depname: depname, 
			    arrplace: arrplace, 
			    charge: charge, 
			    depDate: depDate, 
			    depTime: deptimeFormatted, 
			    arrTime: arrtimeFormatted 
			  };
			  reserve();
			});
			
			
            
            
		html += `<tr>
			          <td>${train}</td>
			          <td>${no}</td>
			          <td>${depname}</td>
			          <td>${arrplace}</td>
			          <td>
			            <input type="submit" id="sSeat" class="seatbtn" value="좌석선택" style="cursor: pointer;">
			            <br>
			            <input type="submit" id="sRes" value="예약하기" value="예약하기" style="cursor: pointer;">
			          </td>
			          <td>
			            <input type="submit" id="nSeat" class="seatbtn" value="좌석선택" style="cursor: pointer;">
			            <br>
			            <input type="submit" id="nRes" value="예약하기" style="cursor: pointer;">
			          </td>
			          <td>
			          ${charge}원
			          </td>
			          <td>${durationString}</td>
			          <td>${deptimeFormatted}</td>
			          <td>${arrtimeFormatted}</td>
			          </tr>`;
        
        
        }
        
		html += `</tbody></table>`;
        $("#train").append(html);
        
        
        
          
		let openModalButton = document.querySelectorAll('.seatbtn');
		
		openModalButton.forEach(button => {
		
		
		button.addEventListener('click', () => {
			$.ajax({
				    url: 'seatModal',
				    type: 'GET',
				    dataType: 'html',
				    success: function(data) {
				      // 모달 창 내용 추가
				      
				
				      // 모달 창 이벤트 리스너 등록
				      const modal = document.querySelector('#modal');
				      const modalBackdrop = modal.querySelector('.modal-backdrop');
				      const cancelButton = modal.querySelector('.cancel-button');
				
				      modal.style.display = 'block';
				
				      modalBackdrop.addEventListener('click', () => {
				        modal.style.display = 'none';
				        
				      });
				
				     cancelButton.addEventListener('click', () => {
					  modal.style.display = '';
					  const selectedButtons = modal.querySelectorAll('.selected');
					  selectedButtons.forEach(button => {
					    button.classList.remove('selected');
					  });
					});
				    },
				    error: function(jqXHR, textStatus, errorThrown) {
				      console.log(textStatus, errorThrown);
				    }
				  });
				});
				});
				
				      }
				      console.log(rows);
				    }),
				});
				
				
				
		$("#checkBack").click(function() {
			  // 다시 조회하기 버튼 클릭 시, 이미지와 hr 태그를 숨기고, 기존에 숨겨져 있던 내용을 다시 보여줌
			  $("#none").hide();
			  $("#hr").hide();
			  $("#checkBack").hide();
			  // 기존에 숨겨져 있던 내용을 보여줌
			});




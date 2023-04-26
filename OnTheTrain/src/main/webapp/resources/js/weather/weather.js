function getWeather(event) {
  event.preventDefault();

  const city = document.getElementById('city').value;
  const citySelect = document.getElementById('city');
  const selectedOption = citySelect.options[citySelect.selectedIndex];
  const cityName = selectedOption.dataset.name;
  const date = document.getElementById('datepicker').value;
  const dateObj = new Date(date);
  const year = dateObj.getFullYear();
  const month = (dateObj.getMonth() + 1).toString().padStart(2, '0');
  const day = dateObj.getDate().toString().padStart(2, '0');
  const formattedDate = `${year}년 ${month}월 ${day}일`;

  const url = `https://api.openweathermap.org/data/2.5/forecast?q=${city}&appid=31274de68eb077bb441d28ad914faa16`;

  $.ajax({
    url: url,
    dataType: 'json',
    success: function(data) {
      let weatherData = null;
      for (let i = 0; i < data.list.length; i++) {
        const dateTime = data.list[i].dt_txt.split(' ')[0];
        if (dateTime === date) {
          weatherData = data.list[i];
          break;
        }
      }
      if (weatherData !== null) {
        const celsiusTemp = weatherData.main.temp - 273.15;
        const celsiusMaxTemp = weatherData.main.temp_max - 273.15;
        const celsiusMinTemp = weatherData.main.temp_min - 273.15;

        // Get cloudiness information from weather data
        const clouds = weatherData.weather[0].description;

        let cloudinessIcon;
        let cloud;
        if (clouds.includes('few clouds')) {
          cloudinessIcon = 'brightness-high';
          cloud = '구름 없이 맑은 날씨가 예상됩니다.';
        } else if (clouds.includes('scattered clouds')) {
          cloudinessIcon = 'cloud-sun';
          cloud = '구름이 조금 있는 맑은 날씨가 예상됩니다.'
        } else if (clouds.includes('broken clouds')) {
          cloudinessIcon = 'cloud';
          cloud = '구름이 조금 많이 있는 날씨가 예상됩니다.'
        } else if (clouds.includes('overcast clouds')) {
          cloudinessIcon = 'cloud-haze2-fill';
          cloud = '구름이 매우 많은 날씨가 예상됩니다.'
        } else {
          cloudinessIcon = 'brightness-high';
          cloud = '구름 없이 맑은 날씨가 예상됩니다.';
        }

        const cloudinessHTML = `
          <i width : 100px, height : 100px class="bi bi-${cloudinessIcon}"></i>
        `;

        const resultHTML = `
          <p id="icon" >${cloudinessHTML}</p>
          <p id="dateCity" >${formattedDate} ${cityName}의 날씨는 다음과 같습니다.</p>
          <p id="weatherText" >평균온도는 ${celsiusTemp.toFixed(1)}°C 로 예상이 되며 습도는 ${weatherData.main.humidity}%로 예상됩니다.</p>
          <p id="cloud" >${cloud}</p>
        `;
        $('#result').html(resultHTML);
      } else {
        $('#result').html('해당하는 날짜의 날씨 정보를 찾을 수 없습니다.');
      }

    },
    error: function(xhr, status, error) {
      alert('예상치 못한 오류 발생.' + error);
    }
  });
}





 $(function() {
       //input을 datepicker로 선언
       $("#datepicker").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-0D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       });                    
       
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
   });

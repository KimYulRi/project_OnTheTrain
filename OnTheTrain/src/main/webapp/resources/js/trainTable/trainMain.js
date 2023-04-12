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
        // arrPlaceId: "NAT010415",
        depPlandTime: $("#depPlandTime").val(),
        // depPlandTime: "20230403",
        trainGradeCode: "00",
        },
    }).done(function (data) {
        $("#train").empty();
        const json = JSON.stringify(data);
      // document.write(json);
        console.log(data);
        let rows = data["response"]["body"]["items"]["item"];
        let tbody = document.getElementById("table-data");

        for (let i = 0; i < rows.length; i++) {
            let tr = document.createElement("tr");
            let charge = rows[i]["adultcharge"];
            let arrplace = rows[i]["arrplacename"];
            let arrtime = rows[i]["arrplandtime"];
            let train = rows[i]["traingradename"];
            let depname = rows[i]["depplacename"];
            let deptime = rows[i]["depplandtime"];
            let no = rows[i]["trainno"];
            let time = arrtime - deptime;

        // let chiCharge = charge*(1-10/100) ;
        // let oldCharge = charge*(1-20/100) ;

        let html = `<table border="1px" align="center" id="myTable">
        <thead>
        <tr>
            <th width="50px">구분</th>
            <th width="100px">열차 번호</th>
            <th width="80px">출발역</th>
            <th width="80px">도착역</th>
            <th>특실</th>
            <th>일반실</th>
            <th width="100px">요금</th>
            <th width="150px">시간</th>
            <th width="100px">출발시간</th>
            <th width="100px">도착시간</th>
        </tr>
        </thead>
        <tbody>
          <tr>
          <td>${train}</td>
          <td>${no}</td>
          <td>${depname}</td>
          <td>${arrplace}</td>
          <td>
            <input type="submit" value="좌석선택" style="cursor: pointer;">
            <br>
            <input type="submit" value="예약하기" style="cursor: pointer;">
          </td>
          <td>
            <input type="submit" value="좌석선택" style="cursor: pointer;">
            <br>
            <input type="submit" value="예약하기" style="cursor: pointer;">
          </td>
          <td>${charge}</td>
          <td>${time}</td>
          <td>${arrtime}</td>
          <td>${deptime}</td>
          </tr>
        </tbody>
      </table>`;

        $("#train").append(html);
      }
      console.log(rows);
    }),
});

window.onload = function () {
  buildCalendar();
}; // 웹 페이지가 로드되면 buildCalendar 실행

let nowMonth = new Date(); // 현재 달을 페이지를 로드한 날의 달로 초기화
let today = new Date(); // 페이지를 로드한 날짜를 저장
today.setHours(0, 0, 0, 0); // 비교 편의를 위해 today의 시간을 초기화

// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
function buildCalendar() {
  let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1); // 이번달 1일
  let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0); // 이번달 마지막날

  let tbody_Calendar = document.querySelector(".Calendar > tbody");
  document.getElementById("calYear").innerText = nowMonth.getFullYear(); // 연도 숫자 갱신
  document.getElementById("calMonth").innerText = leftPad(
    nowMonth.getMonth() + 1
  ); // 월 숫자 갱신

  while (tbody_Calendar.rows.length > 0) {
    // 이전 출력결과가 남아있는 경우 초기화
    tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
  }

  let nowRow = tbody_Calendar.insertRow(); // 첫번째 행 추가

  for (let j = 0; j < firstDate.getDay(); j++) {
    // 이번달 1일의 요일만큼
    let nowColumn = nowRow.insertCell(); // 열 추가
  }

  for (
    let nowDay = firstDate;
    nowDay <= lastDate;
    nowDay.setDate(nowDay.getDate() + 1)
  ) {
    // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복

    let nowColumn = nowRow.insertCell(); // 새 열을 추가하고

    let newDIV = document.createElement("p");
    newDIV.innerHTML = leftPad(nowDay.getDate()); // 추가한 열에 날짜 입력
    nowColumn.appendChild(newDIV);

    if (nowDay.getDay() == 6) {
      // 토요일인 경우
      nowRow = tbody_Calendar.insertRow(); // 새로운 행 추가
    }

    if (nowDay < today) {
      // 지난날인 경우
      newDIV.className = "pastDay";
    } else if (
      nowDay.getFullYear() == today.getFullYear() &&
      nowDay.getMonth() == today.getMonth() &&
      nowDay.getDate() == today.getDate()
    ) {
      // 오늘인 경우
      newDIV.className = "today";
      newDIV.onclick = function () {
        choiceDate(this);
      };
    } else {
      // 미래인 경우
      newDIV.className = "futureDay";
      newDIV.onclick = function () {
        choiceDate(this);
      };
    }
  }
}

// 날짜 선택
function choiceDate(newDIV) {
  if (document.getElementsByClassName("choiceDay")[0]) {
    // 기존에 선택한 날짜가 있으면
    document
      .getElementsByClassName("choiceDay")[0]
      .classList.remove("choiceDay"); // 해당 날짜의 "choiceDay" class 제거
  }
  newDIV.classList.add("choiceDay"); // 선택된 날짜에 "choiceDay" class 추가
}

// 이전달 버튼 클릭
function prevCalendar() {
  nowMonth = new Date(
    nowMonth.getFullYear(),
    nowMonth.getMonth() - 1,
    nowMonth.getDate()
  ); // 현재 달을 1 감소
  buildCalendar(); // 달력 다시 생성
}
// 다음달 버튼 클릭
function nextCalendar() {
  nowMonth = new Date(
    nowMonth.getFullYear(),
    nowMonth.getMonth() + 1,
    nowMonth.getDate()
  ); // 현재 달을 1 증가
  buildCalendar(); // 달력 다시 생성
}

// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
function leftPad(value) {
  if (value < 10) {
    value = "0" + value;
    return value;
  }
  return value;
}

 var ctx = getContextPath();
  function getContextPath() {
  return sessionStorage.getItem("contextpath");
}

// select 태그의 값이 변경될 때마다 실행되는 함수
    $("select[name='locationCode']").on('change', function(){
        var locationCode = $(this).val(); // 선택된 값 가져오기
        $.ajax({
            type: "GET",
            url: ctx + "/api/scheduler/events",
            data: { locationCode: locationCode }, // 선택된 값 전달
            dataType: "json",
            success: function(response){
                // 가져온 데이터를 이용해 이벤트 리스트를 만듦
                var eventList = "";
                for(var i=0; i<response.length; i++){
                    eventList += "<div class='card'>" +
                                    "<div class='cardThumbnail'><img src='" + response[i].firstimage + "'></div>" +
                                    "<div class='cardBrief'>" +
                                        "<div class='cardTitle'>" + response[i].title + "</div>" +
                                        "<div class='cardRequiredDetail'>" + response[i].addr1 + "</div>" +
                                        "<div class='cardOptionalDetail'>" + response[i].optionalDetail + "</div>" +
                                    "</div>" +
                                "</div>";
                }
                $("#eventList").html(eventList); // 이벤트 리스트 업데이트
            },
            error: function(){
                alert("API로 이벤트를 가져오는 중에 문제가 발생했습니다.");
            }
        });
    });


// 각 카드에 대해 마우스 이벤트 리스너 추가
$(".card").on("mouseenter", function(){
    var tooltip = $("<div class='tooltip'></div>"); // 툴팁을 담을 요소 생성
    var title = $(this).find(".cardTitle").text(); // 카드의 제목 가져오기
    var address = $(this).find(".cardRequiredDetail").text(); // 카드의 주소 가져오기
    var optionalDetail = $(this).find(".cardOptionalDetail").text(); // 카드의 추가 정보 가져오기

    // 툴팁에 제목, 주소, 추가 정보를 추가
    tooltip.append("<div class='tooltipTitle'>" + title + "</div>");
    tooltip.append("<div class='tooltipAddress'>" + address + "</div>");
    tooltip.append("<div class='tooltipOptionalDetail'>" + optionalDetail + "</div>");

    // 툴팁을 카드에 추가
    $(this).append(tooltip);

}).on("mouseleave", function(){
    $(this).find(".tooltip").remove(); // 마우스가 벗어나면 툴팁 삭제
});


<!-- 추가 대기 중인 요소에 요소 추가 -->
const addCardButton = document.getElementById('addCard');
const waitComponentList = document.getElementById('waitComponentList');

addCardButton.addEventListener('click', () => {
  const newCard = document.createElement('div');
  newCard.classList.add('card');

  const cardThumbnail = document.createElement('div');
  cardThumbnail.classList.add('cardThumbnail');
  newCard.appendChild(cardThumbnail);

  const cardBrief = document.createElement('div');
  cardBrief.classList.add('cardBrief');
  newCard.appendChild(cardBrief);

  const cardTitle = document.createElement('div');
  cardTitle.classList.add('cardTitle');
  cardTitle.textContent = 'cardTitle';
  cardBrief.appendChild(cardTitle);

  const cardRequiredDetail = document.createElement('div');
  cardRequiredDetail.classList.add('cardRequiredDetail');
  cardRequiredDetail.textContent = 'cardRequiredDetail';
  cardBrief.appendChild(cardRequiredDetail);

  const cardOptionalDetail = document.createElement('div');
  cardOptionalDetail.classList.add('cardOptionalDetail');
  cardOptionalDetail.textContent = 'cardOptionalDetail';
  cardBrief.appendChild(cardOptionalDetail);

  waitComponentList.appendChild(newCard);
});

/* calender */

const dp = new DayPilot.Calendar("dp", {
    theme: "onthetrain_theme",
    viewType: "Week",
    startDate: "2022-03-21",
    
    columnWidth: 200,
    eventDeleteHandling: "Update",
    headerDateFormat: "dddd",

    onEventClick: async (args) => {
      const colors = [
        { name: "Blue", id: "#3c78d8" },
        { name: "Green", id: "#6aa84f" },
        { name: "Yellow", id: "#f1c232" },
        { name: "Red", id: "#cc0000" },
      ];

      const form = [
        { name: "Text", id: "text" },
        { name: "Start", id: "start", type: "datetime" },
        { name: "End", id: "end", type: "datetime" },
        { name: "Color", id: "barColor", type: "select", options: colors },
      ];

      const modal = await DayPilot.Modal.form(form, args.e.data);

      if (modal.canceled) {
        return;
      }

      dp.events.update(modal.result);
    },
    onBeforeEventRender: (args) => {
      args.data.barBackColor = "transparent";
      if (!args.data.barColor) {
        args.data.barColor = "#333";
      }
    },
    onTimeRangeSelected: async (args) => {
      const form = [{ name: "Name", id: "text" }];

      const data = {
        text: "Event",
      };

      const modal = await DayPilot.Modal.form(form, data);
      dp.clearSelection();

      if (modal.canceled) {
        return;
      }

      dp.events.add({
        start: args.start,
        end: args.end,
        id: DayPilot.guid(),
        text: modal.result.text,
        barColor: "#3c78d8",
      });
    },
    onHeaderClick: (args) => {
      console.log("args", args);
    },
  });

  dp.init();

  const events = [
    {
      start: "2022-03-21T11:00:00",
      end: "2022-03-21T14:00:00",
      id: 1,
      text: "Event 1",
      barColor: "#3c78d8",
    },
    {
      start: "2022-03-22T12:00:00",
      end: "2022-03-22T15:00:00",
      id: 2,
      text: "Event 2",
      barColor: "#6aa84f",
    },
    {
      start: "2022-03-23T10:00:00",
      end: "2022-03-23T15:00:00",
      id: 3,
      text: "Event 3",
      barColor: "#f1c232",
    },
    {
      start: "2022-03-24T12:00:00",
      end: "2022-03-24T16:00:00",
      id: 4,
      text: "Event 4",
      barColor: "#cc0000",
    },
  ];
  dp.update({ events});
var ctx = getContextPath();
function getContextPath() {
  return sessionStorage.getItem("contextpath");
}

// card 아이디 생성 함수
function getCardId(index) {
  return "searchCard_" + index;
}

// select 태그의 값이 변경될 때마다 실행되는 함수
$("select[name='locationCode']").on("change", function () {
  var locationCode = $(this).val(); // 선택된 값 가져오기
  $.ajax({
    type: "GET",
    url: ctx + "/api/scheduler/events",
    data: { locationCode: locationCode }, // 선택된 값 전달
    dataType: "json",
    success: function (response) {
      if (response.length === 0) {
        // 반환값이 빈 객체리스트인 경우
        // 결과가 없음을 알리는 영역 표시
        $("#eventList").empty();
        $("#eventList").css("min-height", "unset");
        $("#noResultArea").show();
        return;
      }
      // 가져온 데이터를 이용해 이벤트 리스트를 만듦
      var eventList = "";
      $("#noResultArea").hide();
      for (var i = 0; i < response.length; i++) {
        // firstimage가 없는 경우 기본 이미지로 대체
        var imageUrl = response[i].firstimage
          ? response[i].firstimage
          : ctx + "/images/common/OnTheTrain_Logo.png";

        eventList +=
          "<div class='card' id='" +
          getCardId(i) +
          "'>" +
          "<div class='cardThumbnail'><img src='" +
          imageUrl +
          "'></div>" +
          "<div class='cardBrief'>" +
          "<div class='cardTitle'>" +
          response[i].title +
          "</div>" +
          "<div class='cardRequiredDetail'>" +
          response[i].addr1 +
          "</div>" +
          "<div class='cardOptionalDetail'>" +
          response[i].optionalDetail +
          "</div>" +
          "</div>" +
          "</div>";
      }
      $("#eventList").html(eventList); // 이벤트 리스트 업데이트

      // 카드에 마우스가 올라갈 때와 내려갈 때 툴팁을 생성하고 제거하는 이벤트 처리
      $(".card").hover(
        function () {
          // 마우스가 올라갔을 때
          // 기존 CardBrief 영역 숨기기
          $(this).find(".cardBrief").hide();

          var tooltip =
            "<div class='cardTooltip'>" +
            "<div class='cardTitle cardTooltip'>" +
            $(this).find(".cardTitle").text() +
            "</div>" +
            "<div class='cardRequiredDetail cardTooltip'>" +
            $(this).find(".cardRequiredDetail").text() +
            "</div>" +
            "<div class='cardOptionalDetail cardTooltip'>" +
            $(this).find(".cardOptionalDetail").text() +
            "</div>" +
            "</div>";
          $(this).append(tooltip);
        },
        function () {
          // 마우스가 내려갔을 때
          // 기존 CardBrief 영역 보이기
          $(this).find(".cardBrief").show();

          $(this).find(".cardTooltip").remove();
        }
      );
    },
    error: function () {
      alert("API로 이벤트를 가져오는 중에 문제가 발생했습니다.");
    },
  });
});

// 추가 대기 중인 요소에 요소 추가
const addCardButton = document.getElementById("addCard");
const waitComponentList = document.getElementById("waitComponentList");

addCardButton.addEventListener("click", () => {
  const newCard = document.createElement("div");
  newCard.classList.add("card");

  const cardThumbnail = document.createElement("div");
  cardThumbnail.classList.add("cardThumbnail");
  newCard.appendChild(cardThumbnail);

  const cardBrief = document.createElement("div");
  cardBrief.classList.add("cardBrief");
  newCard.appendChild(cardBrief);

  const cardTitle = document.createElement("div");
  cardTitle.classList.add("cardTitle");
  cardTitle.textContent = "cardTitle";
  cardBrief.appendChild(cardTitle);

  const cardRequiredDetail = document.createElement("div");
  cardRequiredDetail.classList.add("cardRequiredDetail");
  cardRequiredDetail.textContent = "cardRequiredDetail";
  cardBrief.appendChild(cardRequiredDetail);

  const cardOptionalDetail = document.createElement("div");
  cardOptionalDetail.classList.add("cardOptionalDetail");
  cardOptionalDetail.textContent = "cardOptionalDetail";
  cardBrief.appendChild(cardOptionalDetail);

  waitComponentList.appendChild(newCard);
});

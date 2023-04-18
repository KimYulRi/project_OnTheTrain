var ctx = getContextPath();
function getContextPath() {
  return sessionStorage.getItem("contextpath");
}

let waitDeleteMode = false;

// 요소 클릭 시 해당 요소와 관련된 내용을 표시하도록 하는 함수
$(".componentText").click(function () {
  var component = $(this).data("component");
  $.ajax({
    url: ctx + "/scheduler/component",
    type: "GET",
    data: { component: component },
    success: function (result) {
      // 세션에 currentComponent 값 저장
      sessionStorage.setItem("currentComponent", result.component);

      // 표시 요소 변경
      $(".componentName").text(result.name);

      // 아무 것도 없을 때 이미지 변경
      let imgUrl;

      switch (result.component) {
        case "event":
          imgUrl = "/images/scheduler/noEvent.png";
          break;
        case "accommodation":
          imgUrl = "/images/scheduler/noAccommodation.png";
          break;
        case "ticket":
          imgUrl = "/images/scheduler/noTicket.png";
          break;
      }

      $(".noComponentImg").css("background-image", "url(" + ctx + imgUrl + ")");
    },
    error: function () {
      alert("요청에 실패했습니다.");
    },
  });
});

// locationCode가 바뀔 때마다 실행되는 함수
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
          "<div class='card'>" +
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
    },
    error: function () {
      alert("API로 이벤트를 가져오는 중에 문제가 발생했습니다.");
    },
  });
});

// 삭제 모드 버튼 클릭 이벤트
const deleteModeBtn = $("#waitDeleteMode-button");
deleteModeBtn.on("click", () => {
  waitDeleteMode = !waitDeleteMode;
  if (waitDeleteMode) {
    $("#waitDeleteMode-button").text("삭제모드ON").addClass("delete-buttonOn");
  } else {
    $("#waitDeleteMode-button").text("삭제모드").removeClass("delete-buttonOn");
  }

  // 추가 대기 중인 요소 카드에 필터 추가
  const waitComponentCards = $("#waitComponentList .card");
  waitComponentCards.each((index, card) => {
    if (waitDeleteMode) {
      const filter = $("<div>")
        .addClass("componentFilter")
        .on("click", (event) => {
          event.stopPropagation();
          $(card).remove();
        });
      $(card).addClass("filtered");
      $(card).append(filter);
    } else {
      $(card).removeClass("filtered");
      $(card).find(".componentFilter").remove();
    }
  });

  // #noAddedComponentArea나 #addedComponent에 .card가 드래그앤 드롭되었을 때 이벤트 발생
  $("#noAddedComponentArea, #addedComponent").on("drop", function (event) {
    event.preventDefault();
    const card = event.originalEvent.dataTransfer.getData("text");
    if ($("#waitComponentList").has(`#${card}`).length) {
      $(document).trigger("cardDropped", card);
    }
  });

  // #noAddedComponentArea나 #addedComponent에 .card가 드래그앤 드롭되었을 때 기본 이벤트 제거
  $("#noAddedComponentArea, #addedComponent").on("dragover", function (event) {
    event.preventDefault();
  });
});

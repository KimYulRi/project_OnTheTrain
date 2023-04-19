import { createNewCard, addNewCardtoArea } from "./schedulerModalModule.js";

import { waitEvents } from "./schedulerComponent/schedulerEventModule.js";

const addedComponentList = $("#addedComponent");
const waitComponentList = $("#waitComponentList");
const addcard_btn = $("#addCard");
const noComponentArea = $("#noAddedComponentArea");

function getContextPath() {
  return sessionStorage.getItem("contextpath");
}

function getCurrentComponent() {
  return sessionStorage.getItem("currentComponent");
}

function getWaitEvents() {
  return sessionStorage.getItem("waitEvents");
}

const ctx = getContextPath();

// 삭제 모드 버튼
export var waitDeleteMode = false;
const waitDeleteModeBtn = $("#waitDeleteMode-button");

$(document).ready(function () {
  let currentComponent = getCurrentComponent();
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

        $(".noComponentImg").css(
          "background-image",
          "url(" + ctx + imgUrl + ")"
        );
      },
      error: function () {
        alert("요청에 실패했습니다.");
      },
    });
  });

  // (일정) locationCode가 바뀔 때마다 실행되는 함수
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

  // 추가 대기 중인 요소 삭제 모드 버튼 클릭 이벤트
  const deleteModeBtn = $("#waitDeleteMode-button");
  waitDeleteModeBtn.on("click", () => {
    waitDeleteMode = !waitDeleteMode;
    if (waitDeleteMode) {
      $("#waitDeleteMode-button")
        .text("삭제모드ON")
        .addClass("delete-buttonOn");
      $("#deleteAllWait-button").show();
    } else {
      $("#waitDeleteMode-button")
        .text("삭제모드OFF")
        .removeClass("delete-buttonOn");
      $("#deleteAllWait-button").hide();
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
  });

  // 삭제 모드 활성화시 추가 대기 중인 요소 모두 삭제
  $("#deleteAllWait-button").on("click", () => {
    if (confirm("정말로 모든 대기 중인 항목을 삭제하시겠습니까?")) {
      $(".filtered").remove();
      return;
    } else {
      return;
    }
  });

  // 추가된 일정에 일정을 추가하는 함수
  // waitComponent 에 등록된 요소를 찾아 내용을 가져오는 함수
  function findIndexById(arr, id) {
    for (let i = 0; i < arr.length; i++) {
      if (arr[i].id === id) {
        return i;
      }
    }
    return -1; // 해당 id 값을 가진 요소가 없을 경우 -1 반환
  }

  function findComponentByID(currentComponent, id) {
    if (currentComponent === "event") {
      let we = getWaitEvents();

      let component = events[findIndexById(we, id)];
      return component;
    } else if (currentComponent === "accommodation") {
      console.log("숙박 구현 중");
    } else {
      console.log("승차권 구현중");
    }
    return;
  }

  function findEventById(id) {
    const event = waitEvents.find((event) => event.id === id);
    return event ? { ...event } : null;
  }

  function addedComponentListVisable() {
    noComponentArea.hide();
    addedComponentList.show();
  }

  function noComponentAreaVisable() {
    noComponentArea.show();
  }

  $(document).on("DOMNodeInserted", ".card", function () {
    // 새로운 요소가 생성될 때마다 실행되는 이벤트 처리 함수

    // 드래그 앤드 드롭 처리
    $("#waitComponentList .card").draggable({
      revert: true, // 드래그가 취소될 경우 원래 위치로 이동
      zIndex: 100, // 드래그 중인 요소의 z-index 값
      cursor: "move", // 드래그 커서 모양
      start: function (event, ui) {
        addedComponentListVisable();
      
      },
      stop: function (event, ui) {
        // 드래그가 종료될 때 실행될 콜백 함수

        if (addedComponentList.find(".card").length === 0) {
          // card 클래스를 가진 요소가 없는 경우
          noComponentAreaVisable();
        }
      },
    });

    $("#noAddedComponentArea, #addedComponent, #waitComponentList").droppable({
      drop: function (event, ui) {
        let draggable = ui.draggable; // 드래그한 요소
        let droppable = $(this); // 드롭 대상 요소

        // 드래그한 요소를 드롭 대상 요소의 자식으로 추가
        draggable.appendTo(droppable);
      },
    });

    $(this).click(function () {
      // 클릭 이벤트 처리
      let eventId = $(this).attr("id"); // id 속성값 가져오기
      console.log(eventId);
      let selectedEvent = findEventById(eventId);

      if (selectedEvent) {
        console.log(selectedEvent.title);
      } else {
        console.log("해당 id를 가진 이벤트를 찾을 수 없습니다.");
      }
    });
  });
});

export { ctx, getCurrentComponent };

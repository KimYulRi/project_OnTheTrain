// 스케줄러 생성 페이지를 그리는 데 쓰이는 코드들입니다.

import {
  addModalModule,
  addNewCardtoArea,
  createNewCard,
} from "./schedulerModalModule.js";

import {
  addSchedulerComponent,
  deleteSchedulerComponent,
} from "./calender/schedulerCreateCalender.js";

const ctx = getContextPath();
const noComponentArea = $("#noAddedComponentArea");
const waitDeleteModeBtn = $("#waitDeleteMode-button");
const waitComponentList = $("#waitComponentList");
const addedComponentList = $("#addedComponent");
const schedulerCreateModule = {};

// 추가 대기 중인 요소 삭제 모드
let waitDeleteMode = false;

// 콘텍스트 패스 값을 세션에 저장하고 가져오기
function getContextPath() {
  return sessionStorage.getItem("contextpath");
}

// 현재 페이지에 표시될 요소 선택하기
function getCurrentComponent() {
  return sessionStorage.getItem("currentComponent");
}

// 추가된 요소 영역과 관련된 함수
// 하나라도 요소가 추가되면 noComponent 가리기
function addedComponentListVisable() {
  noComponentArea.hide();
  addedComponentList.show();
}

// 요소가 없으면 noComponent 보이기
function noComponentAreaVisable() {
  noComponentArea.show();
}

/**
 * 조회 시 날짜 데이터 포맷을 YYYYMMDD으로 변환하기 위한 함수
 * @param {string}  "date 포맷"
 */
function dateToYYYYMMDD(unformattedDate) {
  let date = new Date(unformattedDate);
  let year = date.getFullYear().toString();
  let month = (date.getMonth() + 1).toString().padStart(2, "0");
  let day = date.getDate().toString().padStart(2, "0");
  let formattedDate = year + month + day;

  return formattedDate;
}

// id 값으로 요소 객체 배열에서 요소 찾기
function findIndexFromArrayById(arr, id) {
  for (let i = 0; i < arr.length; i++) {
    if (arr[i].id === id) {
      return i;
    }
  }
  // 해당 id 값을 가진 요소가 없을 경우 -1 반환
  return -1;
}

$(document).ready(function () {
  // 현재 표시할 요소 관련 함수
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

  // 일정 조회 함수
  $("#searchEvent-button").on("click", function () {
    let locationCode = $("#eventSearch select").val();
    let eventStartDate = dateToYYYYMMDD($("#eventStartDate").val());
    let eventEndDate = $("eventEndDate").val();
    let resultCount = 0;

    /* API2 호출 */
    $.ajax({
      type: "GET",
      url: ctx + "/api/scheduler/events/2",
      data: { locationCode: locationCode, startDate: eventStartDate }, // 선택된 값 전달
      dataType: "json",
      success: function (response) {
        resultCount += response.length;
        let currentComponent = getCurrentComponent();

        // 가져온 데이터를 이용해 이벤트 리스트를 만듦
        $("#noResultArea").hide();

        $.each(response, function (i, item) {
          //객체 만들어 배열에 넣어두기
          let imageUrl = item.firstimage
            ? item.firstimage
            : ctx + "/images/common/OnTheTrain_Logo.png";

          let componentObj = addModalModule.createAPIComponentObject(
            currentComponent,
            item,
            imageUrl
          );
          addModalModule.getAPIItemList(currentComponent).push(componentObj);

          let newCard = createNewCard(
            componentObj.id,
            imageUrl,
            componentObj.title,
            componentObj.addr1,
            componentObj.tel
          );
          addNewCardtoArea($("#itemList"), newCard);
        });
        $("#itemList .card").draggable("destroy");
      },
      error: function () {
        alert("API로 이벤트를 가져오는 중에 문제가 발생했습니다.");
      },
    });

    /* API1 호출(구버전) */
    /*
    $.ajax({
      type: "GET",
      url: ctx + "/api/scheduler/events",
      data: { locationCode: locationCode }, // 선택된 값 전달
      dataType: "json",
      success: function (response) {
        resultCount += response.length;
        // 가져온 데이터를 이용해 이벤트 리스트를 만듦
        var eventList = "";
        $("#noResultArea").hide();
        for (var i = 0; i < response.length; i++) {
          // 일정 객체 만들어 배열에 넣어두기
          let imageUrl = response[i].firstimage
            ? response[i].firstimage
            : ctx + "/images/common/OnTheTrain_Logo.png";

          let eventObj = addModalModule
            .getAddModalComponents()
            ["event"].createObject(
              response[i].title,
              response[i].addr1,
              "",
              "",
              0,
              response[i].tel,
              imageUrl
            );

          addModalModule
            .getAddModalComponents()
            ["event"].searchList.push(eventObj);
          // firstimage가 없는 경우 기본 이미지로 대체

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
        $("#itemList").html(eventList); // 이벤트 리스트 업데이트
      },
      error: function () {
        alert("API로 이벤트를 가져오는 중에 문제가 발생했습니다.");
      },
    });

    */
    if (resultCount === 0) {
      // 반환값이 빈 객체리스트인 경우
      // 결과가 없음을 알리는 영역 표시
      //$("#itemList").empty();
      $("#itemList").css("min-height", "unset");
      $("#noResultArea").show();
      return;
    }
  });

  // 드래그 앤드 드롭 처리
  function setCardDraggable(card) {
    card.draggable({
      revert: true, // 드래그가 취소될 경우 원래 위치로 이동
      zIndex: 100, // 드래그 중인 요소의 z-index 값
      cursor: "move", // 드래그 커서 모양
      helper: "original",
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
  }

  function editCard(id) {
    let component = getCurrentComponent();
    let obj = addModalModule.findComponentById(component, id);
    let cardToedit = $(".card#" + id);

    cardToedit.find(".img").attr("src", obj.image);
    cardToedit.find(".cardTitle").text(obj.title);
    cardToedit.find(".cardRequiredDetail").text(obj.location);
    cardToedit.find(".cardOptionalDetail").text(obj.price);
  }

  // 드롭 이벤트 발생 시 처리 함수
  $("#noAddedComponentArea, #addedComponent, #waitComponentList").droppable({
    drop: function (event, ui) {
      event.stopPropagation();
      let draggable = $(ui.helper[0]);
      let droppable = $(event.target);
      let currentComponent = getCurrentComponent();
      let componentid = draggable.attr("id");
      let dropType = null; // droppable 된 영역을 구분할 변수

      // droppable된 영역에 따라 dropType 값을 설정
      if (droppable.is("#addedComponent")) {
        dropType = "addedComponent";
      } else if (droppable.is("#waitComponentList")) {
        dropType = "waitComponentList";
      } else if (droppable.is("#noAddedComponentArea")) {
        dropType = "noAddedComponentArea";
      }

      // dropType에 따라 다른 처리 실행
      if (
        dropType === "addedComponent" ||
        dropType === "noAddedComponentArea"
      ) {
        addModalModule.toAddedList(currentComponent, componentid);
        addSchedulerComponent(
          addModalModule.findComponentById(currentComponent, componentid)
        );
      } else if (dropType === "waitComponentList") {
        addModalModule.toWaitList(currentComponent, componentid);
        deleteSchedulerComponent(componentid);
      }

      console.log(
        addModalModule.getAddModalComponents()[currentComponent].addedList
      );
      console.log(
        addModalModule.getAddModalComponents()[currentComponent].waitList
      );

      // 드래그한 요소를 드롭 대상 요소의 자식으로 추가
      draggable.appendTo(droppable);
    },
    helper: "original",
  });

  // 추가 대기 중인 요소 삭제 모드 버튼 클릭 이벤트
  waitDeleteModeBtn.on("click", () => {
    waitDeleteMode = !waitDeleteMode;
    if (waitDeleteMode) {
      $("#waitDeleteMode-button")
        .text("삭제모드ON")
        .addClass("delete-buttonOn");
      $("#deleteAllWait-button").show();
      $("#deleteAllWait-button").css("display", "inline-block");
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
            let component = getCurrentComponent();
            let componentId = $(card).attr("id");
            // 객체 배열에서도 삭제
            addModalModule.removeFromArray(
              component,
              addModalModule.getAddModalComponents()[component].waitList,
              componentId
            );
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

  // 삭제 모드 활성화시 추가 대기 중인 요소 모두 삭제 버튼 이벤트
  $("#deleteAllWait-button").on("click", () => {
    if (confirm("정말로 모든 대기 중인 항목을 삭제하시겠습니까?")) {
      $(".filtered").remove();
      let component = getCurrentComponent();
      addModalModule.getAddModalComponents()[component].waitList.length = 0;
      return;
    } else {
      return;
    }
  });

  schedulerCreateModule.setCardDraggable = setCardDraggable;
  schedulerCreateModule.editCard = editCard;
});

export {
  ctx,
  waitDeleteMode,
  waitComponentList,
  addedComponentList,
  schedulerCreateModule,
  getCurrentComponent,
  findIndexFromArrayById,
  noComponentAreaVisable,
  addedComponentListVisable,
};

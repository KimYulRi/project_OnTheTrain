import { ctx } from "../schedulerCreate.js";

import { findIndexById } from "../schedulerCreate.js";

// event 객체를 관리할 배열 생성
const addedEvents = [];
const waitEvents = [];
const searchEvents = [];

// event 객체의 ID값을 관리할 함수 정의
function createEventId() {
  return "event_" + Date.now() + Math.floor(Math.random() * 1000);
}

// id로 이벤트 찾기
function findEventById(arr, eventId) {
  return arr[findIndexById(arr, eventId)];
}

function findAPIResultEventById(arr, eventId) {
  let idx = -1;
  $.each(arr, function (index, element) {
    if (element.id === eventId) {
      idx = index;
    }
  });

  if (idx !== -1) {
    return arr[idx];
  }
  console.log("찾는 event 정보가 사라졌습니다.");
}

// 추가된 일정으로 이벤트 객체를 옮기는 함수
function toAddedEvent(id) {
  let arrayfrom = addedEvents;
  // 해당 요소가 있었던 곳 찾기
  let idx = findIndexById(addedEvents, id);
  if (idx === -1) {
    arrayfrom = waitEvents;
    idx = findIndexById(waitEvents, id);
  }
  let targetEvent = arrayfrom.splice(idx, 1)[0];
  addedEvents.push(targetEvent);
}

// 대기 중인 일정으로 이벤트 객체를 옮기는 함수
function toWaitEvent(id) {
  let arrayfrom = addedEvents;
  // 해당 요소가 있었던 곳 찾기
  let idx = findIndexById(addedEvents, id);
  if (idx === -1) {
    arrayfrom = waitEvents;
    idx = findIndexById(waitEvents, id);
  }

  let targetEvent = arrayfrom.splice(idx, 1)[0];
  waitEvents.push(targetEvent);
}
// 추가된 일정이나 대기 중인 일정에서 이벤트 객체를 제거하는 함수
function removeEventFromArray(arr, id) {
  let idx = findIndexById(arr, id);

  if (idx !== -1) {
    arr.splice(idx, 1);
  }
}

// createEventObject 함수 정의
function createEventObject(title, location, start, end, price, details, image) {
  const event = {
    id: createEventId(),
    component: "event",
    title: title,
    location,
    start,
    end,
    price,
    details,
    image,
  };
  return event;
}

// resetModal 함수 정의
function resetEventModal() {
  $("#event-title").val("");
  $("#event-location").val("");
  $("#event-start-time").val("");
  $("#event-end-time").val("");
  $("#event-price").val("");
  $("#event-details").val("");
  $(".image-upload").val("");
  $("#schedulerEventModal .preview-image").attr(
    "src",
    ctx + "/images/common/OnTheTrain_Logo.png"
  );
  $("#schedulerEventModal .image-caption").text("이미지 등록");
}

//renderEventOnModal 함수 정의
function renderEventOnModal(event) {
  // 모달 창에 필드 값을 입력.
  $("#eventTitle_view").text(event.title || "내용 없음");
  $("#eventLocation_view").text(event.location || "내용 없음");
  $("#eventStartTime_view").text(event.start || "내용 없음");
  $("#eventEndTime_view").text(event.end || "내용 없음");
  $("#eventPrice_view").text(event.price || "내용 없음");
  $("#eventDetails_view").text(event.details || "내용 없음");

  // 이미지 미리보기를 설정
  if (event.image) {
    $("#preview-image_view").attr("src", event.image);
  }
}

function renderAPIResultOnModal(event) {
  // 모달 창에 필드 값을 입력.
  $("#eventTitle_view").text(event.title || "내용 없음");
  $("#eventLocation_view").text(event.location || "내용 없음");
  $("#eventStartTime_view").text(event.start || "내용 없음");
  $("#eventEndTime_view").text(event.end || "내용 없음");
  $("#eventPrice_view").text(event.price || "내용 없음");
  $("#eventDetails_view").text(event.details || "내용 없음");

  if (event.image) {
    $("#preview-image_view").attr("src", event.image);
    $("#schedulerEventModalView .image-caption a").attr({
      href: event.image,
      target: "_blank",
    });
  } else {
    $("#schedulerEventModalView .image-caption a").attr("href", "#");
  }
}

export {
  waitEvents,
  addedEvents,
  searchEvents,
  toWaitEvent,
  toAddedEvent,
  createEventId,
  findEventById,
  resetEventModal,
  createEventObject,
  renderEventOnModal,
  removeEventFromArray,
  renderAPIResultOnModal,
  findAPIResultEventById,
};

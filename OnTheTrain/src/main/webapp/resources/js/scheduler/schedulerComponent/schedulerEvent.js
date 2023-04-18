// event 객체를 관리할 배열 생성
const addedEvents = [];
const waitEvents = [];

// event 객체의 ID값을 관리할 함수 정의
function createEventId() {
  return "event_" + Date.now() + Math.floor(Math.random() * 1000);
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

export {
  addedEvents,
  waitEvents,
  createEventId,
  createEventObject,
  resetEventModal,
};

// event 객체를 관리할 배열 생성
const addedEvents = [];
const waitEvents = [];

// event 객체의 ID값을 관리할 함수 정의
  function createEventId() {
	 return	 "event_" + Date.now() + Math.floor(Math.random() * 1000);
   }
   
// createEventObject 함수 정의
function createEventObject(title, location, start, end, price, details, image) {
  const event = {
    id: createEventId(),
    component: "event",
    title,
    location,
    start,
    end,
    price,
    details,
    image,
  };

  // addedEvents 배열에 추가
  addedEvents.push(event);

  return event;
}

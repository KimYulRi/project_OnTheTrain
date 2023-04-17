// event 객체를 관리할 배열 생성
const events = [];

// createEventObject 함수 정의
function createEventObject(title, location, start, end, price, details, image) {
  const event = {
    id: Date.now() + Math.floor(Math.random() * 1000),
    component: "event",
    title,
    location,
    start,
    end,
    price,
    details,
    image,
  };

  // events 배열에 추가
  events.push(event);

  return event;
}

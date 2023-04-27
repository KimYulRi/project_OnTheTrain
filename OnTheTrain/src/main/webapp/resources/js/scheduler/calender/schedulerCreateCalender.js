import {
  addModalModule,
  schedulerComponents,
} from "../schedulerModalModule.js";

import {
  getCurrentComponent,
  noComponentAreaVisable,
} from "../schedulerCreate.js";
import { viewModalMoudule } from "../schedulerModalViewModule.js";
/* calender */

function getContextPath() {
  return sessionStorage.getItem("contextpath");
}
let ctx = getContextPath();
let serverDate = getStartDateFromServer();
let keyDate = getSundayDate(new Date());
const schedulerCalender = {};
let currentComponent = getCurrentComponent();

let schedulerTitle = $("#schedulerTitle").text();

// 캘린더 시작 일자 설정 관련 함수
function getSundayDate(inputDate) {
  // 입력된 날짜의 주의 시작하는 일요일을 계산 ; key값이 됨
  const sundayDate = new Date(inputDate);
  sundayDate.setDate(sundayDate.getDate() - sundayDate.getDay());
  return sundayDate;
}
function addSecondsIfNeeded(dateTimeStr) {
  if (dateTimeStr.length === 16) {
    dateTimeStr += ":00";
  }
  return dateTimeStr;
}
// 캘린더 요소 더하기
function addSchedulerComponent(obj) {
  let st = obj.startTime;
  let ed = obj.endTime;

  dp.events.add({
    start: addSecondsIfNeeded(st),
    end: addSecondsIfNeeded(ed),
    id: obj.id,
    text: obj.title,
    barColor: "#3c78d8",
  });
}
// 캘린더 요소 빼기
function deleteSchedulerComponent(id) {
  dp.events.remove(id);
}
// 캘린더 내에서 일정이 옮겨지거나 시간이 변경되었을 때 요소 오브젝트에 적용함
function handleEventChange(args) {
  args.preventDefault();
  let componentId = args.e.data.id;
  let newStartTime = args.newStart;
  let newEndTime = args.newEnd;
  let componentObj = addModalModule.findComponentById(
    currentComponent,
    componentId
  );
  componentObj.startTime = newStartTime;
  componentObj.endTime = newEndTime;
}

function getStartDateFromServer() {
  $.ajax({
    url: ctx + "/scheduler/getStartDate",
    type: "GET",
    success: function (response) {
      keyDate = response;
      dp.update();
    },
    error: function (xhr) {
      console.error(xhr.responseText);
    },
  });
}

function saveScheduler() {
  let schedulerInfo = {
    schedulerTitle: schedulerTitle,
    schedulerComponents: schedulerComponents,
  };

  console.log( JSON.stringify(schedulerInfo));
  console.log(ctx + "/scheduler/saveScheduler");

  $.ajax({
    type: "POST",
    url: ctx + "/scheduler/saveScheduler",
    contentType: "application/json; charset=UTF-8",
    dataType: "text",
    data: JSON.stringify(schedulerInfo),
    success: function (response) {
      alert(response);
    },
    error: function (xhr) {
      console.error(xhr.responseText);
    },
  });
}

const dp = new DayPilot.Calendar("dp", {
  theme: "onthetrain_theme",
  viewType: "Week",
  startDate: keyDate,
  columnWidth: 200,
  eventDeleteHandling: "Update",

  onTimeRangeSelected: async (args) => {
    args.preventDefault();
    addModalModule.showAddModal(currentComponent);
    addModalModule.resetModalContent(currentComponent);
    addModalModule.showDirectAddButton();
    dp.clearSelection();
  },

  onEventClick: async (args) => {
    args.preventDefault();
    let componentId = args.e.data.id;
    let cardToRemove = $(".card#" + componentId);
    let componentObj = addModalModule.findComponentById(
      currentComponent,
      componentId
    );

    viewModalMoudule.openViewModal(
      currentComponent,
      componentObj,
      cardToRemove
    );
  },

  onEventMoved: async (args) => {
    handleEventChange(args);
  },

  onEventResized: async (args) => {
    handleEventChange(args);
  },

  onEventDeleted: async (args) => {
    let componentId = args.e.data.id;
    let addedList =
      addModalModule.getAddModalComponents()[currentComponent].addedList;
    addModalModule.removeFromArray(currentComponent, addedList, componentId);
    $("#" + componentId).remove();

    if (addedList.length === 0) {
      noComponentAreaVisable();
    }
  },
});

dp.headerDateFormat = "yyyy년 MM월 dd일";
dp.height = 700;
dp.init();

const events = [
  {
    start: "2023-04-23T11:00:00",
    end: "2023-04-23T14:00:00",
    id: 1,
    text: "Event 1",
    barColor: "#3c78d8",
  },
];

dp.update({ events });

$(document).ready(() => {
  // 버튼 클릭 시 표시되는 주 바꾸기
  $("#previousWeek-Button").on("click", () => {
    const previousWeekStartDate = dp.startDate.addDays(-7);
    dp.startDate = previousWeekStartDate;
    dp.update();
  });

  $("#nextWeek-Button").on("click", () => {
    const nextWeekStartDate = dp.startDate.addDays(7);
    dp.startDate = nextWeekStartDate;
    dp.update();
  });

  $("#save-Button").on("click", () => {
    alert("save버튼 클릭");
    saveScheduler();
  });
});

export { addSchedulerComponent, deleteSchedulerComponent, keyDate };

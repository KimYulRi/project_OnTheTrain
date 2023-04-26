import { addModalModule } from "../schedulerModalModule.js";

import { getCurrentComponent } from "../schedulerCreate.js";
/* calender */

function getSundayDate(inputDate) {
  // 입력된 날짜의 주의 시작하는 일요일을 계산
  const sundayDate = new Date(inputDate);
  sundayDate.setDate(sundayDate.getDate() - sundayDate.getDay());
  return sundayDate;
}

// 예시: 2023년 4월 26일이 입력된 경우
const inputDate = new Date(2023, 3, 26); // 월은 0부터 시작하므로 3은 4월을 나타냄
const sundayDate = getSundayDate(inputDate);
console.log(sundayDate); // 출력 결과: 2023-04-23T00:00:00.000Z


function getStartDate() {
  return $(".onthetrain_theme_colheader_inner").val();
}

$(document).ready(() => {});

const dp = new DayPilot.Calendar("dp", {
  theme: "onthetrain_theme",
  viewType: "Week",
  startDate: "2023-04-23",
  columnWidth: 200,
  eventDeleteHandling: "Update",

  onTimeRangeSelected: async (args) => {
    args.preventDefault();
    let component = getCurrentComponent();
    addModalModule.showAddModal(component);
    addModalModule.showDirectAddButton();
    dp.clearSelection();
    console.log(getStartDate());

    /*
    dp.events.add({
      start: args.start,
      end: args.end,
      id: DayPilot.guid(),
      text: args.result.text,
      barColor: "#3c78d8",
    });
    */
  },

  onEventClick: async (args) => {},

  /*
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

    onHeaderClick: (args) => {
      console.log("args", args);
    },
    */
});

dp.headerDateFormat = "yyyy년 MM월 dd일"
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

/*
// Events can be added to the Calendar using events.add() method.
var e = new DayPilot.Event({ start: new DayPilot.Date(), end: (new DayPilot.Date()).addHours(5), value: DayPilot.guid(), text: "New Event", resource: 'E' });
dpc.events.add(e);

//Event updating
var e = dpc.events.find('123'); dpc.text('New Event Name');
// update the event textdpc.client.innerHTML('New Event Name');  // update the event HTML
dpc.events.update(e);

// Event removing
// Events can be removed using events.remove() method.
// The object representing the event must be acquired using events.find() or event.findRecurrent().
var e = dpc.events.find('123');
dpc.events.remove(e);

//DayPilot.Calendar.events.add
DayPilot.Calendar.events.add(e, data);
*/

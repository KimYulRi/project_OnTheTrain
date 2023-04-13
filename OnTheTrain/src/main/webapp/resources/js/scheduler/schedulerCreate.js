
<!-- 추가 대기 중인 요소에 요소 추가 -->

const addCardButton = document.getElementById('addCard');
const waitComponentList = document.getElementById('waitComponentList');

addCardButton.addEventListener('click', () => {
  const newCard = document.createElement('div');
  newCard.classList.add('card');

  const cardThumbnail = document.createElement('div');
  cardThumbnail.classList.add('cardThumbnail');
  newCard.appendChild(cardThumbnail);

  const cardBrief = document.createElement('div');
  cardBrief.classList.add('cardBrief');
  newCard.appendChild(cardBrief);

  const cardTitle = document.createElement('div');
  cardTitle.classList.add('cardTitle');
  cardTitle.textContent = 'cardTitle';
  cardBrief.appendChild(cardTitle);

  const cardRequiredDetail = document.createElement('div');
  cardRequiredDetail.classList.add('cardRequiredDetail');
  cardRequiredDetail.textContent = 'cardRequiredDetail';
  cardBrief.appendChild(cardRequiredDetail);

  const cardOptionalDetail = document.createElement('div');
  cardOptionalDetail.classList.add('cardOptionalDetail');
  cardOptionalDetail.textContent = 'cardOptionalDetail';
  cardBrief.appendChild(cardOptionalDetail);

  waitComponentList.appendChild(newCard);
});


/* calender */

const dp = new DayPilot.Calendar("dp", {
    theme: "onthetrain_theme",
    viewType: "Week",
    startDate: "2022-03-21",
    
    columnWidth: 200,
    eventDeleteHandling: "Update",
    headerDateFormat: "dddd",

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
    onTimeRangeSelected: async (args) => {
      const form = [{ name: "Name", id: "text" }];

      const data = {
        text: "Event",
      };

      const modal = await DayPilot.Modal.form(form, data);
      dp.clearSelection();

      if (modal.canceled) {
        return;
      }

      dp.events.add({
        start: args.start,
        end: args.end,
        id: DayPilot.guid(),
        text: modal.result.text,
        barColor: "#3c78d8",
      });
    },
    onHeaderClick: (args) => {
      console.log("args", args);
    },
  });

  dp.init();

  const events = [
    {
      start: "2022-03-21T11:00:00",
      end: "2022-03-21T14:00:00",
      id: 1,
      text: "Event 1",
      barColor: "#3c78d8",
    },
    {
      start: "2022-03-22T12:00:00",
      end: "2022-03-22T15:00:00",
      id: 2,
      text: "Event 2",
      barColor: "#6aa84f",
    },
    {
      start: "2022-03-23T10:00:00",
      end: "2022-03-23T15:00:00",
      id: 3,
      text: "Event 3",
      barColor: "#f1c232",
    },
    {
      start: "2022-03-24T12:00:00",
      end: "2022-03-24T16:00:00",
      id: 4,
      text: "Event 4",
      barColor: "#cc0000",
    },
  ];
  dp.update({ events});
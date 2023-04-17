/* calender */

const dp = new DayPilot.Calendar("dp", {
  theme: "onthetrain_theme",
  viewType: "Week",
  startDate: "2022-03-21",
  columnWidth: 200,
  eventDeleteHandling: "Update",

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
];
dp.update({ events });


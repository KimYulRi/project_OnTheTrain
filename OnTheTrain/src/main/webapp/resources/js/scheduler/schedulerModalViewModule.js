import {
  getCurrentComponent,
  addedComponentList,
  waitComponentList,
} from "./schedulerCreate.js";

import {
  addedEvents,
  waitEvents,
  searchEvents,
  renderAPIResultOnModal,
  findAPIResultEventById,
} from "./schedulerComponent/schedulerEventModule.js";

import {
  renderEventOnModal,
  findEventById,
} from "./schedulerComponent/schedulerEventModule.js";

let component = getCurrentComponent();
const eventList = $("#eventList");

$(document).ready(() => {
  // currentComponent 값에 따라 각 모달 창을 띄우기 위한 요소 지정 코드
  const componentsView = {
    event: {
      modal: $("#schedulerEventModalView"),
      confirmButton: $("#schedulerEventModalView .confirm-button"),
      editButton: $("#schedulerEventModalView .edit-button"),
      deleteButton: $("#schedulerEventModalView .modalDelete-button"),
      imageUploadInput: $("#schedulerEventModalView .image-upload")[0],
      previewImage: $("#schedulerEventModalView .preview-image")[0],
      imageCaption: $("#schedulerEventModalView .image-caption")[0],
      titleField: $("#event-title_view"),
      locationField: $("#event-location_view"),
      startTimeField: $("#event-start-time_view"),
      endTimeField: $("#event-end-time_view"),
      priceField: $("#event-price_view"),
      detailsField: $("#event-details_view"),
      modalBackdrop: $("#schedulerEventModalView .modal-backdrop"),
    },
  };

  // view 모달을 열고 닫는 기능
  function showModal(component) {
    $(componentsView[component].modal).show();
  }

  // 모달 열기
  function showModal(component, cardToRemove) {
    let modal = componentsView[component].modal;
    modal.show();

    // 모달 내 삭제버튼 누를 시, 카드 사라짐
    componentsView[component].deleteButton.on("click", () => {
      cardToRemove.remove();
      hideModal(component);
    });
  }

  function hideModal(component) {
    componentsView[component].modal.hide();
    // 모달이 닫힐 때, delete 버튼의 클릭 이벤트를 초기화
    componentsView[component].deleteButton.off("click");
  }

  function addModalViewEventListeners(component) {
    componentsView[component].modalBackdrop.on("click", () => {
      hideModal(component);
    });

    componentsView[component].confirmButton.on("click", () => {
      hideModal(component);
    });

    componentsView[component].deleteButton.on("click", () => {});
  }

  addModalViewEventListeners("event");

  // 카드 클릭시 해당 정보를 담은 모달 열기
  waitComponentList.add(addedComponentList).on("click", ".card", () => {
    let eventId = $(this).attr("id");

    if (findEventById(addedEvents, eventId)) {
      let selectedEvent = findEventById(addedEvents, eventId);
      renderEventOnModal(selectedEvent);
    } else if (findEventById(waitEvents, eventId)) {
      let selectedEvent = findEventById(waitEvents, eventId);
      renderEventOnModal(selectedEvent);
    } else {
      console.log("해당 id를 가진 이벤트를 찾을 수 없습니다.");
    }

    let cardToRemove = $(".card#" + eventId);
    let component = getCurrentComponent();

    showModal(component, cardToRemove);
  });

  eventList.on("click", ".card", function () {
    let eventId = $(this).attr("id");
    let selectedEvent = findAPIResultEventById(searchEvents, eventId);
    renderAPIResultOnModal(selectedEvent);

    let cardToRemove = $(".card#" + eventId);
    let component = getCurrentComponent();

    showModal(component, cardToRemove);
  });
});

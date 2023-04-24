import {
  getCurrentComponent,
  addedComponentList,
  waitComponentList,
} from "./schedulerCreate.js";

import {
  findEventById,
  renderEventOnModal,
  renderAPIEventOnModal,
  findEventFromArrayById,
} from "./schedulerComponent/schedulerEventModule.js";

import { addModalModule } from "./schedulerModalModule.js";

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
      renderAPIResultOnModal: renderAPIEventOnModal,
      findComponentById: findEventById,
      renderOnModal: renderEventOnModal,
      findComponentFromArrayById: findEventFromArrayById,
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

  // 특정 요소 객체를 id값으로 찾아 반환
  function findComponentById(component, id) {
    let componentObj = componentsView[component].findComponentById(id);
    return componentObj;
  }

  // 특정 요소 객체의 값을 바탕으로 modalView를 구성함
  function renderOnModal(component, componentObj) {
    componentsView[component].renderOnModal(componentObj);
  }

  // 카드 클릭시 해당 정보를 담은 모달 열기
  waitComponentList.add(addedComponentList).on("click", ".card", function () {
    let componentId = $(this).attr("id");
    let cardToRemove = $(".card#" + componentId);
    let component = getCurrentComponent();
    let componentObj = findComponentById(component, componentId);

    renderOnModal(component, componentObj);

    showModal(component, cardToRemove);

    componentsView[component].editButton.on("click", function () {
      editModal(component, componentObj, cardToRemove);
    });
  });

  // 수정 하기
  function editModal(currentComponent, componentObj, cardToRemove) {
    // view모달 숨기기
    hideModal(currentComponent);

    // add모달 열고, 내용 초기화
    addModalModule.resetModalContent(currentComponent);
    addModalModule.showModal(currentComponent);

    // 전달받는 id로 내용 그리기
    addModalModule.setAddModalByComponent(currentComponent, componentObj);

    // addButton에 대한 remove 이벤트 핸들러 등록
    function removeEventHandler() {
      if (confirm("기존 카드를 삭제합니까?")) {
        cardToRemove.remove();
      } else {
        return;
      }
    }
    let addButton =
      addModalModule.getAddModalComponents()[currentComponent].addButton;

    addButton.off("click");

    addButton.on("click", () => {
      removeEventHandler();
    });

    // editModal이 닫히기 전에 remove 이벤트 핸들러 제거
    addModalModule
      .getAddModalComponents()
      [currentComponent].modal.on("hide", () => {
        addModalModule
          .getAddModalComponents()
          [currentComponent].addButton.off("click", removeEventHandler);
      });
  }

  // API열기
  eventList.on("click", ".card", function () {
    let id = $(this).attr("id");
    let currentComponent = getCurrentComponent();
    let APIList = addModalModule.getAPIItemList(currentComponent);
    let selectedComponent = componentsView[
      currentComponent
    ].findComponentFromArrayById(APIList, id);
    addModalModule.renderAPIResultOnModal(currentComponent, selectedComponent);

    let cardToRemove = $(".card#" + id);

    showModal(currentComponent, cardToRemove);
  });
});

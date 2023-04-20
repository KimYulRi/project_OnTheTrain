// 스케줄러 카드 생성 모달과 관련된 내용입니다.

import { getCurrentComponent, schedulerCreateModule } from "./schedulerCreate.js";

import {
  waitEvents,
  addedEvents,
  toWaitEvent,
  toAddedEvent,
  findEventById,
  resetEventModal,
  createEventObject,
  renderEventOnModal,
  removeEventFromArray,
} from "./schedulerComponent/schedulerEventModule.js";


const waitComponentList = $("#waitComponentList");
const addcard_btn = $("#addCard");
const addModalModule = {};

// 카드를 추가하는 함수
// 카드 div 생성 함수
function createNewCard(id, imgSrc, title, requiredDetail, optionalDetail) {
  // 아이디와 속성값 부여, 스타일을 위한 카드 클래스 부여
  const newCard = $("<div>").addClass("card").attr("id", id);
  schedulerCreateModule.setCardDraggable(newCard);

  const cardThumbnail = $("<div>").addClass("cardThumbnail");
  const img = $("<img>").attr("src", imgSrc);
  cardThumbnail.append(img);
  newCard.append(cardThumbnail);

  const cardBrief = $("<div>").addClass("cardBrief");
  newCard.append(cardBrief);

  const cardTitle = $("<div>").addClass("cardTitle").text(title);
  cardBrief.append(cardTitle);

  const cardRequiredDetail = $("<div>")
    .addClass("cardRequiredDetail")
    .text(requiredDetail);
  cardBrief.append(cardRequiredDetail);

  const cardOptionalDetail = $("<div>")
    .addClass("cardOptionalDetail")
    .text(optionalDetail);
  cardBrief.append(cardOptionalDetail);

  return newCard;
}
// 특정 위치에 카드 추가
function addNewCardtoArea(area, card) {
  area.append(card);
}

$(document).ready(() => {
  // currentComponent 값에 따라 각 모달 창을 띄우기 위한 요소 지정 코드
  const components = {
    event: {
      modal: $("#schedulerEventModal"),
      cancelButton: $("#schedulerEventModal .cancel-button"),
      addButton: $("#schedulerEventModal .add-button"),
      resetButton: $("#schedulerEventModal .reset-button"),
      imageUploadInput: $("#schedulerEventModal .image-upload")[0],
      previewImage: $("#schedulerEventModal .preview-image")[0],
      imageCaption: $("#schedulerEventModal .image-caption")[0],
      titleField: $("#event-title"),
      locationField: $("#event-location"),
      startTimeField: $("#event-start-time"),
      endTimeField: $("#event-end-time"),
      priceField: $("#event-price"),
      detailsField: $("#event-details"),
      modalBackdrop: $("#schedulerEventModal .modal-backdrop"),
      waitList: waitEvents,
      addedList: addedEvents,
      resetModal: resetEventModal,
      toWaitList: toWaitEvent,
      toAddedList: toAddedEvent,
      findById: findEventById,
      rederOnModal: renderEventOnModal,
      removeFromArray: removeEventFromArray,
    },
    accommodation: {
      modal: $("#schedulerAccommodationModal"),
      resetButton: $("#schedulerAccommodationModal .reset-button"),
      cancelButton: $("#schedulerAccommodationModal .cancel-button"),
      imageUploadInput: $("#schedulerAccommodationModal .image-upload")[0],
      previewImage: $("#schedulerAccommodationModal .preview-image")[0],
      imageCaption: $("#schedulerAccommodationModal .image-caption")[0],
      modalBackdrop: $("#schedulerAccommodationModal .modal-backdrop"),
    },
    ticket: {
      modal: $("#schedulerTicketModal"),
      resetButton: $("#schedulerTicketModal .reset-button"),
      cancelButton: $("#schedulerTicketModal .cancel-button"),
      modalBackdrop: $("#schedulerTicketModal .modal-backdrop"),
    },
  };

  // 카드 생성 모달을 열고 닫는 기능
  function showModal(component) {
    $(components[component].modal).show();
  }

  function hideModal(component) {
    $(components[component].modal).hide();
  }

  // 모달창 초기화 버튼 기능
  function resetModalContent(component) {
    components[component].resetModal();
  }

  function addModalEventListeners(component) {
    // 백드롭 클릭 시 모달 닫기
    components[component].modalBackdrop.on("click", () => {
      hideModal(component);
    });
    // 캔슬 버튼 클릭 시 모달 닫기
    components[component].cancelButton.on("click", () => {
      hideModal(component);
    });
    // 초기화 버튼 클릭 시 모달 input 초기화
    components[component].resetButton.on("click", () => {
      resetModalContent(component);
    });
  }

  addModalEventListeners("event");
  addModalEventListeners("accommodation");
  addModalEventListeners("ticket");

  // addCard를 눌렀을 때 모달창 열기
  addcard_btn.on("click", function () {
    let currentComponent = getCurrentComponent();
    showModal(currentComponent);
    resetModalContent(currentComponent);

    if (currentComponent === "event" || currentComponent === "accommodation") {
      addModalimagePreview(currentComponent);
    }
  });

  //  카드 생성 모달 내 이미지 미리보기
  function addModalimagePreview(component) {
    $(components[component].imageUploadInput).on("change", function (upload) {
      const file = upload.target.files[0];
      const reader = new FileReader();

      reader.onload = function (upload) {
        $(components[component].previewImage).attr("src", upload.target.result);
      };

      reader.readAsDataURL(file);
      $(components[component].imageCaption).text(file.name);
    });
  }

  // 일정 등록하기 (요소, 객체)
  components.event.addButton.on("click", () => {
    let {
      titleField,
      locationField,
      startTimeField,
      endTimeField,
      priceField,
      detailsField,
      previewImage,
    } = components.event;

    let title = titleField.val();
    let location = locationField.val();
    let startTime = startTimeField.val();
    let endTime = endTimeField.val();
    let price = priceField.val();
    let details = detailsField.val();
    let image = previewImage.src;

    let event = createEventObject(
      title,
      location,
      startTime,
      endTime,
      price,
      details,
      image
    );

    // 대기 중인 요소에 추가
    addNewCardtoArea(
      waitComponentList,
      createNewCard(
        event.id,
        event.image,
        event.title,
        event.location,
        event.price
      )
    );

    waitEvents.push(event);
    hideModal("event");
    resetModalContent("event");
  });

  // 특정 요소를 Waitlist 객체 배열로 보냄
  function toWaitList(component, id) {
    components[component].toWaitList(id);
  }

  // 특정 요소를 toAddedList 객체 배열로 보냄
  function toAddedList(component, id) {
    components[component].toAddedList(id);
  }

  // 특정 요소 객체를 id값으로 찾아 반환
  function findById(component, id) {
    let componentObj = components[component].findById(id);
    return componentObj;
  }

  // 특정 요소 객체의 값을 바탕으로 modalView를 구성함
  function rederOnModal(component, componentObj) {
    components[component].renderOnModal(componentObj);
  }

  // 특정 객체를 아이디값으로 찾아 배열에서 제거함
  function removeFromArray(component, arr, id) {
    components[component].removeFromArray(arr, id);
  }

  // 다른 파일에서 현재 파일의 함수들을 사용하기 위한 함수
  function getAddModalComponents() {
    return components;
  }

  addModalModule.getAddModalComponents = getAddModalComponents;
  addModalModule.showModal = showModal;
  addModalModule.hideModal = hideModal;
  addModalModule.toWaitList = toWaitList;
  addModalModule.toAddedList = toAddedList;
  addModalModule.findById = findById;
  addModalModule.rederOnModal = rederOnModal;
  addModalModule.removeFromArray = removeFromArray;
});

export { createNewCard, addNewCardtoArea, addModalModule };

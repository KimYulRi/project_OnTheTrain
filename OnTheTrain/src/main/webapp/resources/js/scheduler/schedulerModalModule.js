// 스케줄러 카드 생성 모달과 관련된 내용입니다.
import {
  getCurrentComponent,
  schedulerCreateModule,
} from "./schedulerCreate.js";

import {
  waitEvents,
  addedEvents,
  toWaitEvent,
  searchEvents,
  toAddedEvent,
  findEventById,
  resetEventModal,
  createEventObject,
  renderEventOnModal,
  removeEventFromArray,
  setAddModalByEvent,
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
  // currentComponent 값에 따라 다른 코드 실행을 위한 요소 지정 코드
  const components = {
    event: {
      modal: $("#schedulerEventModal"),
      cancelButton: $("#schedulerEventModal .cancel-button"),
      addButton: $("#schedulerEventModal .add-button"),
      resetButton: $("#schedulerEventModal .reset-button"),
      imageUploadInput: $("#schedulerEventModal .image-upload"),
      previewImage: $("#schedulerEventModal .preview-image")[0],
      imageCaption: $("#schedulerEventModal .image-caption"),
      fields: {
        title: $("#event-title"),
        location: $("#event-location"),
        startTime: $("#event-start-time"),
        endTime: $("#event-end-time"),
        price: $("#event-price"),
        details: $("#event-details"),
      },
      modalBackdrop: $("#schedulerEventModal .modal-backdrop"),
      addedList: addedEvents,
      waitList: waitEvents,
      searchList: searchEvents,
      findComponentById: findEventById,
      createObject: createEventObject,
      toAddedList: toAddedEvent,
      toWaitList: toWaitEvent,
      resetModalContent: resetEventModal,
      removeFromArray: removeEventFromArray,
      setAddModalByComponent: setAddModalByEvent,
      creatComponentObject : createEventObject,
    },
    accommodation: {
      modal: $("#schedulerAccommodationModal"),
      cancelButton: $("#schedulerAccommodationModal .cancel-button"),
      addButton: $("#schedulerAccommodationModal .add-button"),
      imageUploadInput: $("#schedulerAccommodationModal .image-upload"),
      previewImage: $("#schedulerAccommodationModal .preview-image")[0],
      imageCaption: $("#schedulerAccommodationModal .image-caption"),
      fields: {
        title: $("#accommodation-title"),
        location: $("#accommodation-location"),
        startTime: $("#accommodation-start-time"),
        endTime: $("#accommodation-end-time"),
        stars: $("#accommodation-stars"),
        price: $("#accommodation-price"),
        details: $("#accommodation-details"),
      },
      modalBackdrop: $("#schedulerAccommodationModal .modal-backdrop"),
    },
    ticket: {
      modal: $("#schedulerTicketModal"),
      cancelButton: $("#schedulerTicketModal .cancel-button"),
      addButton: $("#schedulerTicketModal .add-button"),
      imageUploadInput: $("#schedulerTicketModal .image-upload"),
      previewImage: $("#schedulerTicketModal .preview-image")[0],
      imageCaption: $("#schedulerTicketModal .image-caption"),
      fields: {
        title: $("#ticket-title"),
        location: $("#ticket-location"),
        startTime: $("#ticket-start-time"),
        endTime: $("#ticket-end-time"),
        price: $("#ticket-price"),
        details: $("#ticket-details"),
      },
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
    components[component].resetModalContent();
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
    // add버튼 활성화
    components[component].addButton.on("click", addComponentButtonOn);
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

  function addComponent(component) {
    let {
      title,
      location,
      startTime,
      endTime,
      price,
      details,
      previewImage,
      stars,
    } = component.fields;

    let obj;

    obj = components[component].creatComponentObject(component.fields);

    /*
    if (component.type === "event") {
      obj = createEventObject(
        title.val(),
        location.val(),
        startTime.val(),
        endTime.val(),
        price.val(),
        details.val(),
        previewImage.src
      );
    } else if (component.type === "accommodation") {
      obj = createAccommodationObject(
        title.val(),
        location.val(),
        startTime.val(),
        endTime.val(),
        stars.val(),
        price.val(),
        details.val(),
        previewImage.src
      );
    } else if (component.type === "ticket") {
      obj = createTicketObject(
        title.val(),
        location.val(),
        startTime.val(),
        endTime.val(),
        price.val(),
        details.val(),
        previewImage.src
      );
    }
    */

    return obj;
  }

  // 카드 등록하기 (요소, 객체)
  function addComponentButtonOn(component) {
    // 값으로 요소 생성
    let componentObj = addComponent(component);

    // 대기 중인 요소에 추가
    addNewCardtoArea(
      waitComponentList,
      createNewCard(
        componentObj.id,
        componentObj.image,
        componentObj.title,
        componentObj.location,
        componentObj.price
      )
    );

    components[component].waitList.push(componentObj);
    hideModal(component);
    resetModalContent(component);
  }

  // 특정 요소를 Waitlist 객체 배열로 보냄
  function toWaitList(component, id) {
    components[component].toWaitList(id);
  }

  // 특정 요소를 toAddedList 객체 배열로 보냄
  function toAddedList(component, id) {
    components[component].toAddedList(id);
  }

  // 특정 요소 객체를 id값으로 찾아 반환
  function findComponentById(component, id) {
    let componentObj = components[component].findComponentById(id);
    return componentObj;
  }

  // 특정 객체를 아이디값으로 찾아 배열에서 제거함
  function removeFromArray(component, arr, id) {
    components[component].removeFromArray(arr, id);
  }

  // 다른 파일에서 현재 파일의 함수들을 사용하기 위한 함수
  function getAddModalComponents() {
    return components;
  }

  // 특정 아이디값을 가진 객체를 수정함.
  function setAddModalByComponent(component, componentObj) {
    return components[component].setAddModalByComponent(componentObj);
  }

  addModalModule.showModal = showModal;
  addModalModule.hideModal = hideModal;
  addModalModule.toWaitList = toWaitList;
  addModalModule.toAddedList = toAddedList;
  addModalModule.removeFromArray = removeFromArray;
  addModalModule.findComponentById = findComponentById;
  addModalModule.resetModalContent = resetModalContent;
  addModalModule.getAddModalComponents = getAddModalComponents;
  addModalModule.setAddModalByComponent = setAddModalByComponent;
  addModalModule.addComponentButtonOn = addComponentButtonOn;
});

export { createNewCard, addNewCardtoArea, addModalModule };

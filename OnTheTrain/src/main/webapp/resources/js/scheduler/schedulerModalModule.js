import { ctx, getCurrentComponent, } from "./schedulerCreate.js";

import {
  addedEvents,
  waitEvents,
  createEventId,
  createEventObject,
  resetEventModal,
} from "./schedulerComponent/schedulerEventModule.js";

const addedComponentList = $("#addedComponent");
const waitComponentList = $("#waitComponentList");
const addcard_btn = $("#addCard");
const deleteAllWait_btn = $("#deleteAllWait-button")

// 카드를 추가하는 함수
// 카드 div 생성 함수
function createNewCard(id, imgSrc, title, requiredDetail, optionalDetail) {
  // 아이디와 속성값 부여, 스타일을 위한 카드 클래스 부여
  const newCard = $("<div>").addClass("card").attr("id", id).draggable();

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
      resetButton: $("#schedulerEventModal .reset-button")[0],
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
      resetModal: resetEventModal(),
    },
    accommodation: {
      modal: $("#schedulerAccommodationModal"),
      cancelButton: $("#schedulerAccommodationModal .cancel-button"),
      imageUploadInput: $("#schedulerAccommodationModal .image-upload")[0],
      previewImage: $("#schedulerAccommodationModal .preview-image")[0],
      imageCaption: $("#schedulerAccommodationModal .image-caption")[0],
      modalBackdrop: $("#schedulerAccommodationModal .modal-backdrop"),
    },
    ticket: {
      modal: $("#schedulerTicketModal"),
      cancelButton: $("#schedulerTicketModal .cancel-button"),
      modalBackdrop: $("#schedulerTicketModal .modal-backdrop"),
    },
  };

  // 모달을 열고 닫는 기능
  function showModal(component) {
    $(components[component].modal).show();
  }

  function hideModal(component) {
    $(components[component].modal).hide();
  }

  function addModalEventListeners(component) {
    components[component].modalBackdrop.on("click", () => {
      hideModal(component);
    });

    components[component].cancelButton.on("click", () => {
      hideModal(component);
    });
  }

  addModalEventListeners("event");
  addModalEventListeners("accommodation");
  addModalEventListeners("ticket");

  // addCard를 눌렀을 때 모달창 열기
  addcard_btn.on("click", function () {
    let currentComponent = getCurrentComponent();
    showModal(currentComponent);

    if (currentComponent === "event" || currentComponent === "accommodation") {
      addModalimagePreview(currentComponent);
    }
  });

  // add모달 창 이미지 미리보기
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

  // 모달창 초기화 버튼 기능
  function resetModalContent(component) {
    components[component].resetModal;
  }

  // 일정 등록하기
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
    console.log(waitEvents);

    hideModal("event");
  });

});

export { createNewCard, addNewCardtoArea, };

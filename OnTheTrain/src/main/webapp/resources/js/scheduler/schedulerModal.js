const ctx = getContextPath();

function getContextPath() {
  return sessionStorage.getItem("contextpath");
}

const deleteModeBtn = $("#waitDeleteMode-button");
function getCurrentComponent() {
  return sessionStorage.getItem("currentComponent");
}

import {
  addedEvents,
  waitEvents,
  createEventId,
  createEventObject,
  resetEventModal,
} from "./schedulerComponent/schedulerEvent.js";

$(document).ready(() => {
  // 추가된 요소
  const addedComponentList = $("#addedComponent");
  // 추가 대기 중인 요소
  const waitComponentList = $("#waitComponentList");

  // 추가 대기 중인 요소에 요소 추가
  function createNewCard(
    id,
    waitComponentList,
    imgSrc,
    title,
    requiredDetail,
    optionalDetail
  ) {
    const newCard = $("<div>").addClass("card").attr("id", id);

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

    waitComponentList.append(newCard);
  }

  // currentComponent 값에 따라 각 모달 창을 띄우기 위한 요소 지정 코드
  const components = {
    event: {
      modal: $("#schedulerEventModal"),
      modalBackdrop: $("#schedulerEventModal .modal-backdrop")[0],
      cancelButton: $("#schedulerEventModal .cancel-button")[0],
      addButton: $("#schedulerEventModal .add-button")[0],
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
      resetModal: resetEventModal(),
    },
    accommodation: {
      modal: $("#schedulerAccommodationModal"),
      modalBackdrop: $("#schedulerAccommodationModal .modal-backdrop")[0],
      cancelButton: $("#schedulerAccommodationModal .cancel-button")[0],
      imageUploadInput: $("#schedulerAccommodationModal .image-upload")[0],
      previewImage: $("#schedulerAccommodationModal .preview-image")[0],
      imageCaption: $("#schedulerAccommodationModal .image-caption")[0],
    },
    ticket: {
      modal: $("#schedulerTicketModal"),
      modalBackdrop: $("#schedulerTicketModal .modal-backdrop")[0],
      cancelButton: $("#schedulerTicketModal .cancel-button")[0],
    },
  };

  // 모달을 열고 닫는 기능
  function showModal(component) {
    $(components[component].modal).show();
  }
  function hideModal(component) {
    $(components[component].modal).hide();
  }

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

  // addCard를 눌렀을 때 모달창 열기
  $("#addCard").on("click", function () {
    let currentComponent = getCurrentComponent();
    showModal(currentComponent);

    if (currentComponent === "event" || currentComponent === "accommodation") {
      addModalimagePreview(currentComponent);
    }
  });

  // 모달창 초기화 버튼 기능
  function resetModalContent(component) {
    component.resetModal;
  }

  // 일정 등록하기
  $(components.event.addButton).on("click", () => {
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

    // waitEvent에 저장(페이지 유지를 위한)
    waitEvents.push(event);

    // 대기 중인 요소에 추가
    createNewCard(
      event.id,
      $("#waitComponentList"),
      event.image,
      event.title,
      event.location,
      event.price
    );
    hideModal("event");
    console.log(event);
  });

  // 이벤트 모달
  components.event.modalBackdrop.addEventListener("click", () => {
    hideModal("event");
  });

  components.event.cancelButton.addEventListener("click", () => {
    hideModal("event");
  });

  components.event.resetButton.addEventListener("click", () => {
    resetModalContent("event");
    showModal("event");
  });

  // 숙박 모달
  components.accommodation.modalBackdrop.addEventListener("click", () => {
    hideModal("accommodation");
  });

  components.accommodation.cancelButton.addEventListener("click", () => {
    hideModal("accommodation");
  });

  // 티켓 모달
  components.ticket.modalBackdrop.addEventListener("click", () => {
    hideModal("ticket");
  });

  components.ticket.cancelButton.addEventListener("click", () => {
    hideModal("ticket");
  });
});

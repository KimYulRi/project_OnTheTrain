// 스케줄러 요소 생성 모달과 관련된 내용입니다.
import {
  getCurrentComponent,
  schedulerCreateModule,
} from "./schedulerCreate.js";

import {
  APIEvents,
  waitEvents,
  addedEvents,
  toWaitEvent,
  toAddedEvent,
  findEventById,
  resetEventModal,
  createEventObject,
  setAddModalByEvent,
  createAPIEventObject,
  removeEventFromArray,
  renderAPIEventOnModal,
  findEventFromArrayById,
  getEventArrayAndIndexById,
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
  // currentComponent 값에 따라 다른 코드 실행, 함수 공통 관리를 위한 코드
  const components = {
    event: {
      modal: $("#schedulerEventModal"),
      cancelButton: $("#schedulerEventModal .cancel-button"),
      addButton: $("#schedulerEventModal .add-button"),
      resetButton: $("#schedulerEventModal .reset-button"),
      editCompleteButton: $("#schedulerEventModal .editComplete-button"),
      imageUploadInput: $("#schedulerEventModal .image-upload"),
      imageCaption: $("#schedulerEventModal .image-caption"),
      modalBackdrop: $("#schedulerEventModal .modal-backdrop"),
      fields: {
        previewImage: $("#schedulerEventModal .preview-image"),
        title: $("#event-title"),
        location: $("#event-location"),
        startTime: $("#event-start-time"),
        endTime: $("#event-end-time"),
        price: $("#event-price"),
        details: $("#event-details"),
      },
      addedList: addedEvents,
      waitList: waitEvents,
      APIItemList: APIEvents,
      toWaitList: toWaitEvent,
      toAddedList: toAddedEvent,
      createObject: createEventObject,
      findComponentById: findEventById,
      resetModalContent: resetEventModal,
      removeFromArray: removeEventFromArray,
      setAddModalByComponent: setAddModalByEvent,
      renderAPIResultOnModal: renderAPIEventOnModal,
      createAPIComponentObject: createAPIEventObject,
      findComponentFromArrayById: findEventFromArrayById,
      getComponentArrayAndIndexById: getEventArrayAndIndexById,
      creatComponentObject() {
        return createEventObject(this.fields);
      },
    },
    accommodation: {
      modal: $("#schedulerAccommodationModal"),
      cancelButton: $("#schedulerAccommodationModal .cancel-button"),
      editCompleteButton: $("#schedulerEventModal .editComplete-button"),
      addButton: $("#schedulerAccommodationModal .add-button"),
      resetButton: $("#schedulerAccommodationModal .reset-button"),
      imageUploadInput: $("#schedulerAccommodationModal .image-upload"),
      imageCaption: $("#schedulerAccommodationModal .image-caption"),
      modalBackdrop: $("#schedulerAccommodationModal .modal-backdrop"),
      fields: {
        previewImage: $("#schedulerAccommodationModal .preview-image"),
        title: $("#accommodation-title"),
        location: $("#accommodation-location"),
        startTime: $("#accommodation-start-time"),
        endTime: $("#accommodation-end-time"),
        stars: $("#accommodation-stars"),
        price: $("#accommodation-price"),
        details: $("#accommodation-details"),
      },
    },
    ticket: {
      modal: $("#schedulerTicketModal"),
      cancelButton: $("#schedulerTicketModal .cancel-button"),
      editCompleteButton: $("#schedulerEventModal .editComplete-button"),
      addButton: $("#schedulerTicketModal .add-button"),
      resetButton: $("#schedulerTicketModal .reset-button"),
      imageUploadInput: $("#schedulerTicketModal .image-upload"),
      previewImage: $("#schedulerTicketModal .preview-image")[0],
      imageCaption: $("#schedulerTicketModal .image-caption"),
      modalBackdrop: $("#schedulerTicketModal .modal-backdrop"),
      fields: {
        title: $("#ticket-title"),
        location: $("#ticket-location"),
        startTime: $("#ticket-start-time"),
        endTime: $("#ticket-end-time"),
        price: $("#ticket-price"),
        details: $("#ticket-details"),
      },
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
    components[component].addButton.on("click", () => {
      addComponent(component);
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

  // 적용 버튼을 눌렀을 때, obj 생성
  function addComponent(currentComponent) {
    let componentObj = components[currentComponent].creatComponentObject();

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

    components[currentComponent].waitList.push(componentObj);
    console.log(components[currentComponent].waitList);
    hideModal(currentComponent);
    resetModalContent(currentComponent);
  }

  // 특정 요소를 Waitlist 객체 배열로 보냄
  function toWaitList(component, id) {
    components[component].toWaitList(id);
  }

  // 특정 요소를 toAddedList 객체 배열로 보냄
  function toAddedList(component, id) {
    components[component].toAddedList(id);
  }

  // API로 가져오는 객체를 보관하는 배열 가져오기
  function getAPIItemList(component) {
    return components[component].APIItemList;
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

  /** 
   API로 가져오는 정보를 객체로 만들기
   @param {component} 현재 컴포넌트
   @param {item} 전달되는 API JSON객체
   @param {ImgUrl} 그림 주소
   @returns {componentObj} 요소 객체
   * */
  function createAPIComponentObject(component, APIitem, ImgURL) {
    return components[component].createAPIComponentObject(APIitem, ImgURL);
  }

  /**
   * API 객체 view에 그리기
   */
  function renderAPIResultOnModal(component, APIitem) {
    return components[component].renderAPIResultOnModal(APIitem);
  }

  /**
   * id값으로 해당 component의 배열과 인덱스를 찾을 수 있는 함수
   * @param {component} component
   * @param {componentId} id
   */
  function getComponentArrayAndIndexById(component, id) {
    components[component].getComponentArrayAndIndexById(id);
  }

  addModalModule.showModal = showModal;
  addModalModule.hideModal = hideModal;
  addModalModule.toWaitList = toWaitList;
  addModalModule.toAddedList = toAddedList;
  addModalModule.addComponent = addComponent;
  addModalModule.getAPIItemList = getAPIItemList;
  addModalModule.removeFromArray = removeFromArray;
  addModalModule.findComponentById = findComponentById;
  addModalModule.resetModalContent = resetModalContent;
  addModalModule.getAddModalComponents = getAddModalComponents;
  addModalModule.renderAPIResultOnModal = renderAPIResultOnModal;
  addModalModule.setAddModalByComponent = setAddModalByComponent;
  addModalModule.createAPIComponentObject = createAPIComponentObject;
  addModalModule.getComponentArrayAndIndexById = getComponentArrayAndIndexById;
});

export { createNewCard, addNewCardtoArea, addModalModule };

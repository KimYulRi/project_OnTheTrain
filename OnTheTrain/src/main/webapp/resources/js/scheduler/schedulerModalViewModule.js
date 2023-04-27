import {
  noComponentAreaVisable,
  getCurrentComponent,
  addedComponentList,
  waitComponentList,
  schedulerCreateModule,
} from "./schedulerCreate.js";

import {
  findEventById,
  renderEventOnModal,
  transAPIobjToEvent,
  renderAPIEventOnModal,
  findEventFromArrayById,
} from "./schedulerComponent/schedulerEventModule.js";

import { addModalModule } from "./schedulerModalModule.js";

import { deleteSchedulerComponent } from "./calender/schedulerCreateCalender.js";

const itemList = $("#itemList");
const viewModalMoudule = {};

$(document).ready(() => {
  // currentComponent 값에 따라 각 모달 창을 띄우기 위한 요소 지정 코드
  const componentsView = {
    event: {
      modal: $("#schedulerEventModalView"),
      confirmButton: $("#schedulerEventModalView .confirm-button"),
      editButton: $("#schedulerEventModalView .edit-button"),
      deleteButton: $("#schedulerEventModalView .modalDelete-button"),
      imageUploadInput: $("#schedulerEventModalView .image-upload"),
      addToWaitButton: $("#schedulerEventModalView .addToWait-button"),
      previewImage: $("#schedulerEventModalView .preview-image"),
      imageCaption: $("#schedulerEventModalView .image-caption"),
      componentIdField: $("#schedulerEventModalView .componentId"),
      titleField: $("#event-title_view"),
      locationField: $("#event-location_view"),
      startTimeField: $("#event-start-time_view"),
      endTimeField: $("#event-end-time_view"),
      priceField: $("#event-price_view"),
      detailsField: $("#event-details_view"),
      modalBackdrop: $("#schedulerEventModalView .modal-backdrop"),
      findComponentById: findEventById,
      renderOnModal: renderEventOnModal,
      transAPIobjToObj: transAPIobjToEvent,
      renderAPIResultOnModal: renderAPIEventOnModal,
      findComponentFromArrayById: findEventFromArrayById,
    },
  };

  // view모달 열기
  function showViewModal(component, cardToRemove) {
    let modal = componentsView[component].modal;
    modal.show();

    // 모달 내 삭제버튼 누를 시, 카드 사라짐
    componentsView[component].deleteButton.on("click", () => {
      cardToRemove.remove();
      if (addedComponentList.find(".card").length === 0) {
        // card 클래스를 가진 요소가 없는 경우
        noComponentAreaVisable();
      }
      hideModal(component);
      let id = componentsView[component].componentIdField.text();
      addModalModule.removeComponentById(component, id);
    });
  }

  // view 모달 닫기
  function hideModal(component) {
    componentsView[component].modal.hide();
    // 모달이 닫힐 때, delete 버튼의 클릭 이벤트를 초기화
    componentsView[component].deleteButton.off("click");
  }

  // 공통 함수 등록
  function addModalViewEventListeners(component) {
    componentsView[component].modalBackdrop.on("click", () => {
      hideModal(component);
    });

    componentsView[component].confirmButton.on("click", () => {
      hideModal(component);
    });
  }

  addModalViewEventListeners("event");

  // 기본 버튼 보이기
  function showBasicbuttons() {
    let component = getCurrentComponent();
    componentsView[component].addToWaitButton.hide();
    componentsView[component].editButton.show();
    componentsView[component].deleteButton.show();
    componentsView[component].componentIdField.show();
  }

  // API 객체 클릭시 관련 버튼 보이기
  function showAPIbuttons() {
    let component = getCurrentComponent();
    componentsView[component].editButton.hide();
    componentsView[component].deleteButton.hide();
    componentsView[component].componentIdField.hide();
    componentsView[component].addToWaitButton.show();
    componentsView[component].addToWaitButton.css("display", "inline-block");
  }

  // 특정 요소 객체를 id값으로 찾아 반환
  function findComponentById(component, id) {
    let componentObj = componentsView[component].findComponentById(id);
    return componentObj;
  }

  /*
  // 기존 카드를 삭제하며 요소 객체도 같이 삭제
  function removeOriginalCard(cardToRemove, id) {
    if (confirm("기존의 카드를 삭제합니까?")) {
      cardToRemove.remove();
      let component = getCurrentComponent();
      deleteSchedulerComponent(id);
      addModalModule.removeComponentById(component, id);
    }
  }
  */
  // 특정 요소 객체의 값을 바탕으로 modalView를 구성함
  function renderOnModal(component, componentObj) {
    componentsView[component].renderOnModal(componentObj);
  }

  /**
   * - 수정완료 버튼 활성화 기능
   * 수정완료 버튼은 추가 버튼과 동일한 기능을 하며, 추가적으로 수정 대상이 된 카드를 삭제할 것인지 묻는다.
   * @param {component} 현재컴포넌트
   * @param {card} 삭제할카드
   * @param {id} 삭제될id
   * */
  function activateEditCompleteButton(component, componentObj) {
    let editCompleteButton =
      addModalModule.getAddModalComponents()[component].editCompleteButton;
    let addButton = addModalModule.getAddModalComponents()[component].addButton;
    let id = componentObj.id;

    addButton.hide();
    editCompleteButton.show();
    editCompleteButton.css("display", "inline-block");

    editCompleteButton.off("click");
    editCompleteButton.on("click", () => {
      addModalModule.editComponent(component,componentObj);
      schedulerCreateModule.editCard(id);
      addModalModule.hideAddModal(component);
      addModalModule.resetModalContent(component);
    });
  }

  /**
   * - 수정완료 버튼 비활성화 기능
   */
  function DisabledEditCompleteButton() {
    let component = getCurrentComponent();
    let editCompleteButton =
      addModalModule.getAddModalComponents()[component].editCompleteButton;
    let addButton = addModalModule.getAddModalComponents()[component].addButton;

    addButton.show();
    editCompleteButton.hide();
    editCompleteButton.off("click");
  }

  /**
   *
   * @param {*} component 현재 컴포넌트
   * @param {*} componentObj 컴포넌트 오브젝트
   * @param {*} cardToRemove 지울 카드
   */
  //

  // 카드 클릭시 해당 정보를 담은 모달 열기
  waitComponentList.add(addedComponentList).on("click", ".card", function () {
    let componentId = $(this).attr("id");
    let cardToRemove = $(".card#" + componentId);
    let component = getCurrentComponent();
    let componentObj = findComponentById(component, componentId);

    openViewModal(component, componentObj, cardToRemove);
  });

  

  // 캘린더에서 클릭 시 모달 열기
  function openViewModal(component, componentObj, cardToRemove) {
    // 출력될 요소 설정
    showBasicbuttons();
    renderOnModal(component, componentObj);
    showViewModal(component, cardToRemove);

    addModalModule.getAddModalComponents()[component].modal.on("hide", () => {
      DisabledEditCompleteButton();
    });
    componentsView[component].editButton.on("click", function () {
      editModal(component, componentObj);
    });
  }

  // 카드 클릭 시 API 요소 보기
  itemList.on("click", ".card", function () {
    let id = $(this).attr("id");
    let currentComponent = getCurrentComponent();
    let APIList = addModalModule.getAPIItemList(currentComponent);
    let selectedComponent = componentsView[
      currentComponent
    ].findComponentFromArrayById(APIList, id);
    addModalModule.renderAPIResultOnModal(currentComponent, selectedComponent);
    let cardToRemove = $(".card#" + id);

    //addToWaitButton 이벤트 추가
    componentsView[currentComponent].addToWaitButton.on("click", function () {
      apiObjtoWaitList(currentComponent, selectedComponent);
    });

    showViewModal(currentComponent, cardToRemove);
    showAPIbuttons();
  });

  /**
   * 수정하기 기능
   * @param {string} currentComponent 열 모달을 결정
   * @param {obj} componentObj 그릴 내용을 결정
   * @param {card} cardToRemove 수정 전 내용을 유지할 때 사용
   */
  function editModal(currentComponent, componentObj) {
    // view모달 숨기기
    hideModal(currentComponent);
    activateEditCompleteButton(currentComponent, componentObj);

    // add모달 열고, 내용 초기화
    addModalModule.resetModalContent(currentComponent);
    addModalModule.showAddModal(currentComponent);

    // 전달받는 id로 내용 그리기
    addModalModule.setAddModalByComponent(currentComponent, componentObj);
  }

  /**
   * API로 가져온 객체를 객체로 변환하며 수정
   */
  function apiObjtoWaitList(component, apiObj) {
    let obj = componentsView[component].transAPIobjToObj(apiObj);
    hideModal(component);
    addModalModule.resetModalContent(component);
    addModalModule.showAddModal(component);
    addModalModule.setAddModalByComponent(component, obj);
  }

  // 외부에서 ViewModalComponent 변수와 함수를 사용하기 위한 함수
  function getViewModalComponents() {
    return componentsView;
  }

  viewModalMoudule.getViewModalComponents = getViewModalComponents;
  viewModalMoudule.apiObjtoWaitList = apiObjtoWaitList;
  viewModalMoudule.openViewModal = openViewModal;
});

export { viewModalMoudule };

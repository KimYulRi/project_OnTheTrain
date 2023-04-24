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
const viewModalMoudule = {};

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

  // view모달 열기
  function showViewModal(component, cardToRemove) {
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

  function removeOriginalCard(cardToRemove, id) {
    if (confirm("기존의 카드를 삭제합니까?")) {
      cardToRemove.remove();
      removeOriginalComponent(id);
    }
  }

  /**
   * id값을 주면 배열에서 해당하는 id를 가진 component를 삭제한다.
   * @param {string} componentId
   */
  function removeOriginalComponent(componentId) {
    let currentComponent = getCurrentComponent();
    let arrayAndIndex = addModalModule.getComponentArrayAndIndexById(
      currentComponent,
      componentId
    );

    if ($(arrayAndIndex)) {
      // arrayAndIndex와 arrayAndIndex.array가 모두 있는지 확인
      let array = arrayAndIndex.array;
      let index = arrayAndIndex.index;

      array.splice(index, 1);
    } else {
      console.log(`해당 id를 가진 일정이 없습니다`);
    }
  }

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
  function activateEditCompleteButton(component, cardToRemove, id) {
    let editCompleteButton =
      addModalModule.getAddModalComponents()[component].editCompleteButton;
    let addButton = addModalModule.getAddModalComponents()[component].addButton;

    addButton.hide();
    editCompleteButton.show();
    editCompleteButton.off("click");
    editCompleteButton.on("click", () => {
      removeOriginalCard(cardToRemove, id);
      addModalModule.addComponent(component);
      addModalModule.hideModal(component);
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

  // 카드 클릭시 해당 정보를 담은 모달 열기
  waitComponentList.add(addedComponentList).on("click", ".card", function () {
    let componentId = $(this).attr("id");
    let cardToRemove = $(".card#" + componentId);
    let component = getCurrentComponent();
    let componentObj = findComponentById(component, componentId);

    renderOnModal(component, componentObj);
    showViewModal(component, cardToRemove);

    addModalModule.getAddModalComponents()[component].modal.on("hide", () => {
      DisabledEditCompleteButton();
    });
    componentsView[component].editButton.on("click", function () {
      editModal(component, componentObj, cardToRemove);
    });
  });

  /**
   * 수정하기 기능
   * @param {string} currentComponent 열 모달을 결정
   * @param {obj} componentObj 그릴 내용을 결정
   * @param {card} cardToRemove 수정 전 내용을 유지할 때 사용
   */
  function editModal(currentComponent, componentObj, cardToRemove) {
    // view모달 숨기기
    hideModal(currentComponent);
    activateEditCompleteButton(currentComponent, cardToRemove, componentObj.id);

    // add모달 열고, 내용 초기화
    addModalModule.resetModalContent(currentComponent);
    addModalModule.showAddModal(currentComponent);

    // 전달받는 id로 내용 그리기
    addModalModule.setAddModalByComponent(currentComponent, componentObj);
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

    showViewModal(currentComponent, cardToRemove);
  });
});

export { viewModalMoudule };

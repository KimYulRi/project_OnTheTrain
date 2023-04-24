const qnaModalButton = document.querySelector('.qnaModal');
const qnaModal = document.querySelector('#modal');
const qnaModalBackdrop = qnaModal.querySelector('.qnamodal-backdrop');
const qnaModalCancelButton = qnaModal.querySelector('.cancel-button');

qnaModalButton.addEventListener('click', () => {
  qnaModal.style.display = 'block';
});

qnaModalBackdrop.addEventListener('click', () => {
  qnaModal.style.display = 'none';
});

qnaModalCancelButton.addEventListener('click', () => {
  qnaModal.style.display = 'none';
});

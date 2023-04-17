const memberShipModalButton = document.querySelector('.memberShipModal');
const memberShipModal = document.querySelector('#memberShipModal');
const memberShipModalBackdrop = memberShipModal.querySelector('.modal-backdrop');
const memberShipModalCancelButton = memberShipModal.querySelector('.cancel-button');

memberShipModalButton.addEventListener('click', () => {
  memberShipModal.style.display = 'block';
});

memberShipModalBackdrop.addEventListener('click', () => {
  memberShipModal.style.display = 'none';
});

memberShipModalCancelButton.addEventListener('click', () => {
  memberShipModal.style.display = 'none';
});

const pwdModalButton = document.querySelector('.pwdModal');
const pwdModal = document.querySelector('#pwdModal');
const pwdModalBackdrop = pwdModal.querySelector('.modal-backdrop');
const pwdModalCancelButton = pwdModal.querySelector('.cancel-button');

pwdModalButton.addEventListener('click', () => {
  pwdModal.style.display = 'block';
});

pwdModalBackdrop.addEventListener('click', () => {
  pwdModal.style.display = 'none';
});

pwdModalCancelButton.addEventListener('click', () => {
  pwdModal.style.display = 'none';
});

$(document).ready(() => {

  <!--   EventModal   -->
  const openEventModalButton = document.querySelector('[data-modal-target="#schedulerEventModal"]');
  const eventModal = document.querySelector('#schedulerEventModal');
  const eventModalBackdrop = eventModal.querySelector('.modal-backdrop');
  const cancelEventButton = eventModal.querySelector('.cancel-button');

  openEventModalButton.addEventListener('click', () => {
    eventModal.style.display = 'block';
  });

  eventModalBackdrop.addEventListener('click', () => {
    eventModal.style.display = 'none';
  });

  cancelEventButton.addEventListener('click', () => {
    eventModal.style.display = 'none';
  });


  <!--   AccommodationModal   -->
  const openAccommodationModalButton = document.querySelector('[data-modal-target="#schedulerAccommodationModal"]');
  const accommodationModal = document.querySelector('#schedulerAccommodationModal');
  const accommodationModalBackdrop = accommodationModal.querySelector('.modal-backdrop');
  const cancelAccommodationButton = accommodationModal.querySelector('.cancel-button');

  openAccommodationModalButton.addEventListener('click', () => {
    accommodationModal.style.display = 'block';
  });

  accommodationModalBackdrop.addEventListener('click', () => {
    accommodationModal.style.display = 'none';
  });

  cancelAccommodationButton.addEventListener('click', () => {
    accommodationModal.style.display = 'none';
  });


  <!--   TicketModal   -->
  const openTicketModalButton = document.querySelector('[data-modal-target="#schedulerTicketModal"]');
  const ticketModal = document.querySelector('#schedulerTicketModal');
  const ticketModalBackdrop = ticketModal.querySelector('.modal-backdrop');
  const cancelTicketButton = ticketModal.querySelector('.cancel-button');

  openTicketModalButton.addEventListener('click', () => {
    ticketModal.style.display = 'block';
  });

  ticketModalBackdrop.addEventListener('click', () => {
    ticketModal.style.display = 'none';
  });

  cancelTicketButton.addEventListener('click', () => {
    ticketModal.style.display = 'none';
  });
});

$(document).ready(() => {
  //  EventModal
  const eventModal = document.querySelector("#schedulerEventModal");
  const eventModalBackdrop = eventModal.querySelector(".modal-backdrop");
  const cancelEventButton = eventModal.querySelector(".cancel-button");

  eventModalBackdrop.addEventListener("click", () => {
    $(eventModal).hide();
  });

  cancelEventButton.addEventListener("click", () => {
    $(eventModal).hide();
  });

  //   AccommodationModal
  const accommodationModal = document.querySelector(
    "#schedulerAccommodationModal"
  );
  const accommodationModalBackdrop =
    accommodationModal.querySelector(".modal-backdrop");
  const cancelAccommodationButton =
    accommodationModal.querySelector(".cancel-button");

  accommodationModalBackdrop.addEventListener("click", () => {
    $(accommodationModal).hide();
  });

  cancelAccommodationButton.addEventListener("click", () => {
    $(accommodationModal).hide();
  });

  //   TicketModal
  const ticketModal = document.querySelector("#schedulerTicketModal");
  const ticketModalBackdrop = ticketModal.querySelector(".modal-backdrop");
  const cancelTicketButton = ticketModal.querySelector(".cancel-button");

  ticketModalBackdrop.addEventListener("click", () => {
    $(ticketModal).hide();
  });

  cancelTicketButton.addEventListener("click", () => {
    $(ticketModal).hide();
  });
});

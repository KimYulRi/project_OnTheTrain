
const openModalButton = document.querySelector('#charge_btn');
		const modal = document.querySelector('#modal');
		const modalBackdrop = modal.querySelector('.modal-backdrop');
		const cancelButton = modal.querySelector('.cancel-button');

		openModalButton.addEventListener('click', () => {
			modal.style.display = 'block';
		});

		modalBackdrop.addEventListener('click', () => {
			modal.style.display = 'none';
		});

		cancelButton.addEventListener('click', () => {
			modal.style.display = 'none';
		});
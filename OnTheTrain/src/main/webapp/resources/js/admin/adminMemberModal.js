
const openModalButton1 = document.querySelector('.infoadminbtn');
		const modal1 = document.querySelector('#modal1');
		const modalBackdrop1 = modal1.querySelector('#modal-backdrop1');
		const cancelButton1 = modal1.querySelector('#cancel-button1');
		var nameInput =  document.getElementById("#userId");

		openModalButton1.addEventListener('click', (event) => {
			modal1.style.display = 'block';
			nameInput.value = $(event.relatedTarget).data('no');
		});

		modalBackdrop1.addEventListener('click', () => {
			modal1.style.display = 'none';
		});

		cancelButton1.addEventListener('click', () => {
			modal1.style.display = 'none';
		});
		
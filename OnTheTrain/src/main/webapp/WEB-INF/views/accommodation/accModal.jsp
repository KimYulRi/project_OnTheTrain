<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>accModal</title>
</head>
<body>

	<button class="open-modal-button">작성하기</button>
	
	<div id="modal" class="modal">
		<div class="modal-backdrop"></div>
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title">Modal Title</div>
				</div>
				<div class="modal-body">
					<p>Modal content goes here.</p>
				</div>
				<div class="modal-footer">
					<button class="apply-button">Apply</button>
					<button class="cancel-button">Cancel</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
 var ctx = getContextPath();
  function getContextPath() {
  return sessionStorage.getItem("contextpath");
}
 

// 아이디찾기
$(document).ready(() => {
	
	$('#submitBtn').on('click', () => {
		$('#submitBtn').prop('disabled',true);
		var name = $('#name').val();
		var email1 = $("#email1").val();
	    var email2 = $("#email2").val();
	    var email = email1+"@"+email2;
	    var email1RegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*$/;
	    var email2RegExp = /^([0-9a-z]+\.)+[a-z]{2,3}$/;
	    const body = document.querySelector('#body');
	    const body_after = document.querySelector('#after_body');
        
     	// 이름 유효성 검사
        if(name ==''){
            alert("이름을 입력해주세요.");
            $("#name").focus();
            return false;
        }
	  	//이메일 유효성검사
       if(!email1RegExp.test(email1)){
           alert("올바른 이메일 형식이 아닙니다.");
           $("#email1").focus();
           return false;
       }
       if(!email2RegExp.test(email2)){
           alert("올바른 이메일 형식이 아닙니다.");
           $("#email2").focus();
           return false;
       }
		
		$.ajax({
			type: 'POST',
			url: ctx + '/login/find',
			dataType: 'json',
			data: {
				name, email
			},
			success: (data) => {
				if(data.id!=null){
					$('#result_name').append(name); 
					$('#result_id').append(data.id); 
					body.style.display = 'none';
					body_after.style.display = 'block';
				} else {
					alert("아이디를 찾을 수 없습니다.");
					$('#submitBtn').prop('disabled',false);
				}
				
			},
			error: (error)=> {
				alert(error);
			}
			
		});
		
	});
});
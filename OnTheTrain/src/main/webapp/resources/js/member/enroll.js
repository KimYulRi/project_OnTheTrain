	 var ctx = getContextPath();
	  function getContextPath() {
	  return sessionStorage.getItem("contextpath");
	}
 
	// 주소찾기
	function findAddr(){
		new daum.Postcode({
			oncomplete: function(data) {
				
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var jibunAddr = data.jibunAddress; // 지번 주소 변수
	
				document.getElementById('zipcode').value = data.zonecode;
				if(roadAddr !== ''){
					document.getElementById("address1").value = roadAddr;
				} 
				else if(jibunAddr !== ''){
					document.getElementById("address1").value = jibunAddr;
				}
			}
		}).open();
	}
	
	
	// 약관동의 - 체크박스 전체 선택
	const agreeAllCheckbox = document.getElementById('agreeAll');
	const requiredCheckboxes = document.querySelectorAll('.agree');
	
	agreeAllCheckbox.addEventListener('change', function() {
		  const isChecked = agreeAllCheckbox.checked;
		  requiredCheckboxes.forEach(function(checkbox) {
		    checkbox.checked = isChecked;
		  });
		});
		
	
	// 주소 선택시 #address 값을 변경해주는 이벤트
	var addressOutput = document.getElementById("address");
	var address1 = document.getElementById("address1");
	var address2 = document.getElementById("address2");
	
	address1.addEventListener('change', function() {
		if($('#address2').val().trim()== ''){
		addressOutput.value = $('#address1').val();
		}else{
		addressOutput.value = $('#address1').val() + ", " + $('#address2').val().trim();
		}
	});
	
	address2.addEventListener('change', function() {
		if($('#address2').val().trim()== ''){
			addressOutput.value = $('#address1').val();
			}else{
			addressOutput.value = $('#address1').val() + ", " + $('#address2').val().trim();
			}
	});
	
	
	// 닉네임 중복확인 여부
	var isNicknameChecked=false; 
	var nicksuccessmessage = document.querySelector('#nicksucc');
		

	// checkDuplicate2 닉네임 중복검사
	$(document).ready(() => {
		
		$('#checkDuplicate2').on('click', () => {
			var nickname = $('#nickname').val();
	        var nickRegExp = /^[a-zA-Z0-9가-힣]{2,10}$/;
		    
		  	// 닉네임 유효성검사
	        if(!nickRegExp.test(nickname)){ 
	            alert("닉네임은 2자 이상 10자 이하의 한글, 영문, 숫자를 이용하여 입력하여 주세요.");        
	            $("#nickname").focus();
	            return false;
	        }
			
			$.ajax({
				type: 'POST',
				url: ctx + '/nicknameCheck',
				data: {
					nickname
				},
				// 닉네임이 없으면 true, 있으면 false
				success: (data) => {
					if(data){
						alert("사용 가능한 닉네임입니다");
						$('#checkDuplicate2').prop('disabled',true);
						$('#checkDuplicate2').css('background-color', '#D9D9D9');
						isNicknameChecked=true;
						nicksuccessmessage.style.display = 'block';
					} else {
						alert("이미 사용 중인 닉네임입니다");
					}
					
				},
				error: (error)=> {
					alert(error);
				}
				
			});
			
		});
	});
	
	// 닉네임 중복확인 후 hover 적용 
	$('#checkDuplicate2').on('mouseenter', function() {
		  $(this).css('background-color', '#00008B'); // hover 스타일 적용
		}).on('mouseleave', function() {
		  $(this).css('background-color', '#596180'); // hover 스타일 해제
		});
	
	// 닉네임 입력창에 글자를 입력할 때 이벤트
	var inputUserNickname = document.querySelector('#nickname');
	
	inputUserNickname.onkeyup = function () {
		// 중복확인을 이미 했다면 안한 상태로 변경
		if(isNicknameChecked){
			isNicknameChecked=false;
	        $('#checkDuplicate2').prop('disabled',false);
	        $('#checkDuplicate2').css('background-color', '#596180');
	        nicksuccessmessage.style.display = 'none';
			}
	
	}
	
	// 유효성검사 - 네이버
	function ValidationN(){
	        
	        // 닉네임 유효성 검사
	        if(isNicknameChecked==false){
	            alert("닉네임 중복확인을 해주세요");
	            $("#nickname").focus();
	            return false;
	        }
	      
	    }
	    
	// 유효성검사 - 카카오
	function ValidationK(){
	        // 이름
	        var name = $("#name").val();
	    	var nameRegExp = /^[가-힣]{2,10}$/;
	        // 휴대전화 번호
	        var phone1 = $("#phone1").val();
	        var phone2 = $("#phone2").val();
	        var phone3 = $("#phone3").val();
	        var phone1RegExp = /^[0-9]{1,3}$/;
	        var phone2RegExp = /^[0-9]{3,4}$/;
	        var phone3RegExp = /^[0-9]{4,4}$/;
	        
	        
	        // 닉네임 유효성 검사
	        if(isNicknameChecked==false){
	            alert("닉네임 중복확인을 해주세요");
	            $("#nickname").focus();
	            return false;
	        }
	        
	        // 이름 유효성 검사
	        if(name ==''){
	            alert("이름을 입력해주세요.");
	            $("#name").focus();
	            return false;
	        }
	        if(!nameRegExp.test(name)){
	            alert("이름은 2자 이상 10자 이하의 한글만 입력하여 주세요.");
	            $("#name").focus();
	            return false;
	        }
	        
	        
	     	// 휴대전화 유효성 검사
	        if(phone1 == ''){
	            alert("휴대전화번호를 입력해주세요.");
	            $("#phone1").focus();
	            return false;
	        }
	        if(phone2 == ''){
	            alert("휴대전화번호를 입력해주세요.");
	            $("#phone2").focus();
	            return false;
	        }
	        if(phone3 == ''){
	            alert("휴대전화번호를 입력해주세요.");
	            $("#phone3").focus();
	            return false;
	        }
	        
	        if(!phone1RegExp.test(phone1)){
	            alert("올바른 휴대전화번호 형식이 아닙니다.");
	            $("#phone1").focus();
	            return false;
	        }
	        if(!phone2RegExp.test(phone2)){
	            alert("올바른 휴대전화번호 형식이 아닙니다.");
	            $("#phone2").focus();
	            return false;
	        }
	        if(!phone3RegExp.test(phone3)){
	            alert("올바른 휴대전화번호 형식이 아닙니다.");
	            $("#phone3").focus();
	            return false;
	        }
	      
	    }
	
	
	// 핸드폰 입력창에 글자를 입력할 때 이벤트
	var inputphone1 = document.querySelector('#phone1');
	var inputphone2 = document.querySelector('#phone2');
	var inputphone3 = document.querySelector('#phone3');
	var phoneOutput = document.getElementById("phone");
	
	inputphone1.onkeyup = function () {
		phoneOutput.value = $('#phone1').val()+ "-" + $('#phone2').val() + "-" + $('#phone3').val();
	}
	inputphone2.onkeyup = function () {
		phoneOutput.value = $('#phone1').val()+ "-" + $('#phone2').val() + "-" + $('#phone3').val();
	}
	inputphone3.onkeyup = function () {
		phoneOutput.value = $('#phone1').val()+ "-" + $('#phone2').val() + "-" + $('#phone3').val();
	}
	
	
	
	// 아이디 중복확인 여부
	var isIdChecked=false;
	var idsuccessmessage = document.querySelector('#idsucc');
	
	// 이메일 중복확인 여부
	var isEmailChecked=false; 
	var emailsuccessmessage = document.querySelector('#emailsucc');
	
	// 유효성검사
	function Validation(){
	        // 비밀번호
	        var pw = $("#password1").val();
	        var pw2 = $("#password2").val();
	        var num = pw.search(/[0-9]/g);
	        var eng = pw.search(/[a-z]/ig);
	        var spe = pw.search(/[^\w\s]/gi);
	        // 이름
	        var name = $("#name").val();
	    	var nameRegExp = /^[가-힣]{2,10}$/;
	        // 휴대전화 번호
	        var phone1 = $("#phone1").val();
	        var phone2 = $("#phone2").val();
	        var phone3 = $("#phone3").val();
	        var phone1RegExp = /^[0-9]{1,3}$/;
	        var phone2RegExp = /^[0-9]{3,4}$/;
	        var phone3RegExp = /^[0-9]{4,4}$/;
	        
	        // 아이디 유효성 검사
	        if(isIdChecked==false){
	            alert("아이디 중복확인을 해주세요");
	            $("#userId").focus();
	            return false;
	        }
	
	        // 비밀번호 유효성 검사
	        if(pw==''){
	            alert("비밀번호를 입력해주세요.");
	            $("#password1").focus();
	            return false;
	        }
	        
	        if(pw.length < 6 || pw.length > 16){
	        	  alert("비밀번호는 6자리 ~ 16자리 이내로 입력해주세요.");
		          $("#password1").focus();
	        	  return false;
		 	}else if(pw.search(/\s/) != -1){
	        	  alert("비밀번호는 공백 없이 입력해주세요.");
	        	  $("#password1").focus();
	        	  return false;
	    	 }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
	        	  alert("비밀번호는 영문, 숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
	        	  $("#password1").focus();
	        	  return false;
	    	 }
	        // 비밀번호와 비밀번호확인이 동일한지 검사
	        if(pw2!=pw){
	            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
	            $("#password2").focus();
	            return false;
	        }
	        
	        // 닉네임 유효성 검사
	        if(isNicknameChecked==false){
	            alert("닉네임 중복확인을 해주세요");
	            $("#nickname").focus();
	            return false;
	        }
	        
	        // 이름 유효성 검사
	        if(name ==''){
	            alert("이름을 입력해주세요.");
	            $("#name").focus();
	            return false;
	        }
	        if(!nameRegExp.test(name)){
	            alert("이름은 2자 이상 10자 이하의 한글만 입력하여 주세요.");
	            $("#name").focus();
	            return false;
	        }
	        
	        // 이메일 유효성 검사
	        if(isEmailChecked==false){
	            alert("이메일 중복확인을 해주세요");
	            $("#email1").focus();
	            return false;
	        }
	        
	        
	     // 휴대전화 유효성 검사
	        if(phone1 == ''){
	            alert("휴대전화번호를 입력해주세요.");
	            $("#phone1").focus();
	            return false;
	        }
	        if(phone2 == ''){
	            alert("휴대전화번호를 입력해주세요.");
	            $("#phone2").focus();
	            return false;
	        }
	        if(phone3 == ''){
	            alert("휴대전화번호를 입력해주세요.");
	            $("#phone3").focus();
	            return false;
	        }
	        
	        if(!phone1RegExp.test(phone1)){
	            alert("올바른 휴대전화번호 형식이 아닙니다.");
	            $("#phone1").focus();
	            return false;
	        }
	        if(!phone2RegExp.test(phone2)){              
	            alert("올바른 휴대전화번호 형식이 아닙니다.");
	            $("#phone2").focus();
	            return false;
	        }
	        if(!phone3RegExp.test(phone3)){
	            alert("올바른 휴대전화번호 형식이 아닙니다.");
	            $("#phone3").focus();
	            return false;
	        }
	      
	    }
	    
	// 생년월일 select 선택시 글자색과 #birth 값을 변경해주는 이벤트
	var birthOutput = document.getElementById("birth");
	var daySelectElement1 = document.getElementById('birth1');
	
	daySelectElement1.addEventListener('change', function() {
	  var selectedOption1 = daySelectElement1.options[daySelectElement1.selectedIndex];
	  if (selectedOption1.disabled) {
	  } else {
	    daySelectElement1.style.color = 'black';
		birthOutput.value = $('#birth1').val()+ "-" + $('#birth2').val() + "-" + $('#birth3').val();
			
	  }
	});
	
	var daySelectElement2 = document.getElementById('birth2');
	
	daySelectElement2.addEventListener('change', function() {
	  var selectedOption2 = daySelectElement2.options[daySelectElement2.selectedIndex];
	  if (selectedOption2.disabled) {
	  } else {
	    daySelectElement2.style.color = 'black';
	   	birthOutput.value = $('#birth1').val()+ "-" + $('#birth2').val() + "-" + $('#birth3').val();
	  }
		
	});
	
	var daySelectElement3 = document.getElementById('birth3');
	
	daySelectElement3.addEventListener('change', function() {
	  var selectedOption3 = daySelectElement3.options[daySelectElement3.selectedIndex];
	  if (selectedOption3.disabled) {
	  } else {
	    daySelectElement3.style.color = 'black';
	    birthOutput.value = $('#birth1').val()+ "-" + $('#birth2').val() + "-" + $('#birth3').val();
		
	  }
	});
	
	
	// 아이디 중복확인 후 hover 적용 
	$('#checkDuplicate1').on('mouseenter', function() {
		  $(this).css('background-color', '#00008B'); // hover 스타일 적용
		}).on('mouseleave', function() {
		  $(this).css('background-color', '#596180'); // hover 스타일 해제
		});
	
	// 아이디 입력창에 글자를 입력할 때 이벤트
	var inputUserId = document.querySelector('#userId');
	
	inputUserId.onkeyup = function () {
		// 중복확인을 이미 했다면 안한 상태로 변경
		if(isIdChecked){
	        isIdChecked=false;
	        $('#checkDuplicate1').prop('disabled',false);
	        $('#checkDuplicate1').css('background-color', '#596180');
	        idsuccessmessage.style.display = 'none';
			}
	
	}
	

	// 이메일 중복확인 후 hover 적용 
	$('#checkDuplicate3').on('mouseenter', function() {
		  $(this).css('background-color', '#00008B'); // hover 스타일 적용
		}).on('mouseleave', function() {
		  $(this).css('background-color', '#596180'); // hover 스타일 해제
		});
	
	// 이메일 입력창(1)에 글자를 입력할 때 이벤트
	var inputUserEmail1 = document.querySelector('#email1');
	
	inputUserEmail1.onkeyup = function () {
		// 중복확인을 이미 했다면 안한 상태로 변경
		if(isEmailChecked){
			isEmailChecked=false;
	        $('#checkDuplicate3').prop('disabled',false);
	        $('#checkDuplicate3').css('background-color', '#596180');
	        emailsuccessmessage.style.display = 'none';
			}
	
	}
	// 이메일 입력창(2)에 글자를 입력할 때 이벤트
	var inputUserEmail2 = document.querySelector('#email2');
	
	inputUserEmail2.onkeyup = function () {
		// 중복확인을 이미 했다면 안한 상태로 변경
		if(isEmailChecked){
			isEmailChecked=false;
	        $('#checkDuplicate3').prop('disabled',false);
	        $('#checkDuplicate3').css('background-color', '#596180');
	        emailsuccessmessage.style.display = 'none';
			}
	
	}

	// checkDuplicate1 아이디 중복검사
	$(document).ready(() => {
		
		$('#checkDuplicate1').on('click', () => {
			var userId = $('#userId').val();
		    var idRegExp = /^[a-zA-Z0-9]{4,12}$/;
		    
		  	// 아이디 유효성검사
			if(!idRegExp.test(userId)){ 
	            alert("아이디는 4자 이상 12자 이하의 영문 혹은 영문과 숫자 조합으로 입력하여 주세요.");        
	            $("#userId").focus();
	            return false;
	        }
			
			$.ajax({
				type: 'POST',
				url: ctx + '/idCheck',
				data: {
					userId
				},
				// 아이디가 없으면 true, 있으면 false
				success: (data) => {
					if(data){
						alert("사용 가능한 아이디입니다");
						$('#checkDuplicate1').prop('disabled',true);
						$('#checkDuplicate1').css('background-color', '#D9D9D9');
						isIdChecked=true;
						idsuccessmessage.style.display = 'block';
					} else {
						alert("이미 사용 중인 아이디입니다");
					}
					
				},
				error: (error)=> {
					alert(error);
				}
				
			});
			
		});
	});

	// checkDuplicate3 이메일 중복검사
	$(document).ready(() => {
		
		$('#checkDuplicate3').on('click', () => {
			 var email1 = $("#email1").val();
		     var email2 = $("#email2").val();
		     var email = email1+"@"+email2;
		     var email1RegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*$/;
		     var email2RegExp = /^([0-9a-z]+\.)+[a-z]{2,3}$/;
		     var emailOutput = document.getElementById("email");
		    
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
				url: ctx + '/emailCheck',
				data: {
					email
				},
				//이메일이 없으면 true, 있으면 false
				success: (data) => {
					if(data){
						alert("사용 가능한 이메일입니다");
						$('#checkDuplicate3').prop('disabled',true);
						$('#checkDuplicate3').css('background-color', '#D9D9D9');
						isEmailChecked=true;
						emailsuccessmessage.style.display = 'block';
						emailOutput.value = $('#email1').val()+ "@" + $('#email2').val();
					} else {
						alert("이미 사용 중인 이메일입니다.");
					}
					
				},
				error: (error)=> {
					alert(error);
				}
				
			});
			
		});
	});
	
		

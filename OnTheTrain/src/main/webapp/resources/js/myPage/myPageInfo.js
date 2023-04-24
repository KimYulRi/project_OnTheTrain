var ctx = getContextPath();

function getContextPath() {
  var contextPath = sessionStorage.getItem("contextpath");
  if (!contextPath) {
    contextPath = "/onthetrain"; // 기본값으로 설정할 경로를 입력해주세요.
  }
  return contextPath;
}
	

	  const id = $('#infoidbody input[name="id"]').val();
	  const nickname =  $('#infoidbody input[name="nickname"]').val();
	
	
	
	
		function findAddr() {
		  new daum.Postcode({
		    oncomplete: function(data) {
		      var roadAddr = data.roadAddress; // 도로명 주소 변수
		      var jibunAddr = data.jibunAddress; // 지번 주소 변수
		
		      document.getElementById('zipcode').value = data.zonecode;
		      if (roadAddr !== '') {
		        document.getElementById("address1").value = roadAddr;
		      } 
		      else if (jibunAddr !== '') {
		        document.getElementById("address1").value = jibunAddr;
		      }
		    }
		  }).open();
		}
	
		// 아이디 중복확인 후 hover 적용 
	$('#checkDuplicate1').on('mouseenter', function() {
		  $(this).css('background-color', '#00008B'); // hover 스타일 적용
		}).on('mouseleave', function() {
		  $(this).css('background-color', '#596180'); // hover 스타일 해제
		});
	
	// 아이디 입력창에 글자를 입력할 때 이벤트
	var inputUserId = document.querySelector('#id');
	
		// 아이디 중복확인 여부
	var isIdChecked=false;
	var idsuccessmessage = document.querySelector('#idsucc');
		// 닉네임 중복확인 여부
	var isNicknameChecked=false; 
	var nicksuccessmessage = document.querySelector('#nicksucc');

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
				url: ctx + '/myPage/myPageIdCheck',
				data: {
					userId: $('input[name="userId"]').val()
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
			

	
		// 닉네임 중복확인 여부
	var isNicknameChecked=false; 
	var nicksuccessmessage = document.querySelector('#nicksucc');
		

	// checkDuplicate2 닉네임 중복검사
	$(document).ready(() => {
		
		$('#checkDuplicate2').on('click', () => {
			var nickname = $('input[name="nickname"]').val()
	        var nickRegExp = /^[a-zA-Z0-9가-힣]{2,10}$/;
			console.log(nickname);
		    
		  	// 닉네임 유효성검사
	        if(!nickRegExp.test(nickname)){ 
	            alert("닉네임은 2자 이상 10자 이하의 한글, 영문, 숫자를 이용하여 입력하여 주세요.");        
	            $("#nickname").focus();
	            return false;
	        }
			
			$.ajax({
				type: 'POST',
				url: ctx + '/myPage/myPageNicknameCheck',
				data: {
					 nickname: $('input[name="nickname"]').val()
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

				function Validation(){
			    // 비밀번호
			    var pw = $("#newPwd").val();
			    var pw2 = $("#checkPwd").val();
			    var num = pw.search(/[0-9]/g);
			    var eng = pw.search(/[a-z]/ig);
			    var spe = pw.search(/[^\w\s]/gi);
			
			    if(pw.length < 6 || pw.length > 16){
			        alert("비밀번호는 6자리 ~ 16자리 이내로 입력해주세요.");
			        $("#newPwd").focus();
			        return false;
			    } else if(pw.search(/\s/) != -1){
			        alert("비밀번호는 공백 없이 입력해주세요.");
			        $("#newPwd").focus();
			        return false;
			    } else if((num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0)){
			        alert("비밀번호는 영문, 숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
			        $("#newPwd").focus();
			        return false;
			    }
			
			    // 비밀번호와 비밀번호확인이 동일한지 검사
			    if(pw2!=pw){
			        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			        $("#newPwd").focus();
			        return false;
			    }
			
			    return true;
			}
			
			$(document).ready(function() {
			    $("#pwdForm").submit(function(e) {
			        if (!Validation()) {
			            e.preventDefault();
			        }
			    });
			});

	
	$("#infosubmit").prop("disabled", true); // 수정 버튼을 비활성화시킴
	$("#infosubmit").prop("disabled", false); // 수정 버튼을 활성화시킴
	
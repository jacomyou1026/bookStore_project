<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
<meta charset="UTF-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>회원가입 화면 샘플 - Bootstrap</title> 
<!-- Bootstrap CSS --> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> 
<style> body { min-height: 100vh; 
			   background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c)); 
			   background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); 
			   background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); 
			   background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); 
			   background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%); } 
.input-form { max-width: 680px; 
			  margin-top: 80px; 
			  padding: 32px; 
			  background: #fff; 
			  -webkit-border-radius: 10px; 
			  -moz-border-radius: 10px; 
			  border-radius: 10px; 
			  -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
			  -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
			  box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15) } 
		
</style>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script> 
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.3.1.min.js"></script>
</head> 
<body> 
<div class="container"> 
<div class="input-form-backgroud row"> 
	<div class="input-form col-md-12 mx-auto"> 
		<h4 class="mb-3">회원가입</h4> 
		<form class="validation-form" id="login_form" novalidate> 
			<div class="row"> 
				<div class="col-md-6 mb-3"> 
					<label for="id">ID</label> 
					<input type="text" class="form-control" name="id" id="id" placeholder=""required> 
					<div class="invalid-feedback"> ID를 입력해주세요. </div> 
				</div>
				
				<div class="col-md-6 mb-5" >
					<input type="button" style="background: #429dff;" class="form-control" 
						   value="중복검사" placeholder="" onclick="id_check(this.form);" required>
				</div>
				
				<div class="col-md-6 mb-3"> 
					<label for="pwd">비밀번호</label> 
					<input type="password" class="form-control" id="pwd"  name = "pwd" placeholder="" required> 
					<div class="invalid-feedback"> 비밀번호를 입력해주세요. </div> 
				</div> 
			</div>
				
			<div class="row"> 
			<div class="col-md-6 mb-3"> 
					<label for="name">이름</label> 
					<input type="text" class="form-control" name="name" id="name"  value="" required> 
					<div class="invalid-feedback"> 이름을 입력해주세요. </div> 
				</div>
				<div class="col-md-6 mb-3"> 
					<label for="nickname">별명</label> 
					<input type="text" class="form-control" id="nickname" name="nickname" placeholder="id랑 똑같아도 됩니다" required> 
					<div class="invalid-feedback"> 별명을 입력해주세요. </div> 
				</div> 
			</div>
			
				<div class="col-md-6 mb-3"> 
					<label for="tel">전화번호</label>
					<select id="tel1" name="tel1" size="1" class="col-md-4 mb-3">
						<option value="010">02</option>
						<option value="010">010</option>
						<option value="010">011</option>
						<option value="010">012</option>
					</select>
					<div class="row">
					<div class="col-md-6 mb-3"> 
					<input type="text" class="form-control" id="tel2"  name = "tel2" placeholder="1111" value="" required> 
					</div>
					<div class="col-md-6 mb-3"> 
					<input type="text" class="form-control" id="tel3"  name = "tel3" placeholder="2222" value="" required> 
					</div>
					<div class="invalid-feedback"> 전화번호를 입력해주세요. </div> 
				</div>
				</div>
				
				<div class="mb-3"> 
					<label for="email">이메일</label> 
					<input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" value="" required> 
					<div class="invalid-feedback"> 이메일을 입력해주세요. </div> 
				</div> 
				
				<div class="row">
					
					
					<div class="col-md-3 mb-3"> 
							<label for="postcode">우편번호</label> 
							<input type="text" class="form-control" name="postcode" id="postcode" value=""  placeholder=""  readonly="readonly" required> 
							<div class="invalid-feedback"> 우편번호를 입력해주세요. </div> 
					</div> 
					
				</div>
					
				<div class="mb-3"> 
					<input type="text" class="form-control" id="address1" name="address1" placeholder="" value="" readonly="readonly" required> 
					<div class="invalid-feedback"> 주소를 입력해주세요. </div> 
				</div> 
					<div class="mb-1"> 
						<label for="address2">상세주소
						</label> 
						<input type="text" class="form-control" id="address2" name="address2" value="" placeholder=""> 
					</div>
					
				<div class="col-xs-3 mb-5">
					<label for="postcode"></label> 
					<div class="address_button" onclick="execution_daum_address();">
						<input type="button"  value="주소 찾기">
					</div>
				</div>
					
					<div class="row"> 
						<div class="col-md-3 mb-3"> 
							<label for="jumin1">주민번호(앞자리)</label> 
							<input type="text" class="form-control" name="jumin1" id="jumin1" value="" placeholder="920910" required> 
							<div class="invalid-feedback"> 주민번호를 입력해주세요. </div> 
						</div> 
						<div class="col-md-3 mb-3"> 
						<label for="jumin2">(뒷자리)</label> 
						<input type="password" class="form-control" name="jumin2" id="jumin2" value="" placeholder="2112122" required> 
							<div class="invalid-feedback"> 뒷자리를 입력해주세요. </div> 
						</div>
						</div>
						
						<div class="col-md-3 mb-3"> 
						<label for="gender">성별</label><br> 
						<div style="font-size: 40px;">
						<input type="checkbox" name="gender" value="male" required><i class="fas fa-male" style="margin-right:60px"></i>
						<input type="checkbox" name="gender" value="female" required><i class="fas fa-female"></i>
						</div>
					</div> 
					
					
					
					<hr class="mb-4"> 
						<div class="custom-control custom-checkbox"> 
							<input type="checkbox" class="custom-control-input" id="aggrement" required> 
							<label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label> 
							</div> <div class="mb-4"></div> 
							<button class="btn btn-primary btn-lg btn-block" type="submit" onclick="send(this.form)">가입 완료</button> 
					</form> 
				</div> 
			</div> 
			<p class="mb-1">&copy; 2021 YD</p> </footer> 
		</div> 
		<script>
		
		function send(f){
			//check
			//var tel_pattern = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			var email_pattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			
			var id = f.id.value.trim();
			var pwd = f.pwd.value.trim();
			var name = f.name.value.trim();
			var nickname = f.nickname.value.trim();
			
			var jumin1 = f.jumin1.value;
			var jumin2 = f.jumin2.value;
			
			var tel1 = f.tel1.value;
			var tel2 = f.tel2.value;
			var tel3 = f.tel3.value;
			
			var postcode = f.postcode.value;
			var address1 = f.address1.value.trim();
			var address2 = f.address2.value.trim();
			var email = f.email.value.trim();
			var gender = f.gender.value;
			
			///유효성 체크
			if(id == ""){
				alert("아이디를 입력하셔야 합니다");
				return;
			}else if(id.length < 5){
				alert("6자리 이상 입력하셔야 합니다." )
			}
			
			if(pwd == ""){
				alert("비밀번호를 입력하셔야 합니다");
				return;
			}
			if(name == ""){
				alert("이름을 입력하셔야 합니다");
				return;
			}
			if(nickname == ""){
				alert("별명을 입력하셔야 합니다");
				return;
			}
			if(jumin1==""){
				alert("주민번호를 입력해");
				return;
			}
			if(jumin2==""){
				alert("뒷자리 입력해");
				return;
			}
			
			
			if(!email_pattern.test(email)){
				alert("입력된 값은 이메일이 아닙니다.");
				return;
			}
			
			
			f.method = "post";
			f.action = "insert.do";
			f.submit();
		}
		

		 
		/* 다음 주소 연동 */
		function execution_daum_address(){
			new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            
		        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	 
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	 
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    addr += extraAddr;
	                
	                } else {
	                	document.getElementById("address2").value = '';
	                    addr += ' ';
	                }
	 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                 //$(".postcode").val(data.zonecode);
		             $("[name=postcode]").val(data.zonecode);    // 대체가능
		             //$(".address1").val(addr);
		             $("[name=address1]").val(addr);            // 대체가능
		             
		             // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
		             document.getElementById("address2").focus();
		 
		        }
		    }).open();  
		}
		
		function var id_check(f){
			var id = f.id.value.trim();
			
			if(id == ""){
				alert("아이디를 입력하셔야 합니다");
				return;
			}else if(id.length < 5){
				alert("6자리 이상 입력하셔야 합니다." )
			}
			
			
			
		}
		</script>
	</body> 
</html>

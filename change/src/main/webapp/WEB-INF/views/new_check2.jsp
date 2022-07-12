<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<DOCTYPE HTML5>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="./style.css">
    <style>
    *{
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;

}

body {
  background-color: #34495e;
}

.loginForm {
  position:absolute;
  width:300px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:50%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.loginForm h2{
  text-align: center;
  margin: 30px;
}

.idForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.passForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn:hover {
  background-position: right;
}

.bottomText {
  text-align: center;
}
    </style>
  </head>
  
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js	"></script>
<script>
function send(f){
	var name = f.name.value.trim();
	var tel = f.tel.value.trim();
	var tel_pattern = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	
	if(name==""){
		alert("이름을 입력해주세요");
		return;
	}
	if(tel==""){
		alert("전화번호를 입력해주세요");
		return;
	}
	if(!tel_pattern.test(tel)){
		alert("-없이 입력해주세요");
		return;
	}
	

	
	var url = "check.do";
	var param = "name="+name+"&tel="+ tel;
	sendRequest(url, param, result, "POST");
}

function result(){
	if(xhr.readyState == 4 && xhr.status == 200){
		//삭제 성공 여부에 따라서 경고창을 띄우자 
		var name = document.getElementById("name").value;
		var tel = document.getElementById("tel").value;
		var data = xhr.responseText; //"no" or "yes"
		var tel1 = tel.substr(0, 3);
		var tel2 = tel.substr(3, 4);
		var tel3 = tel.substr(7, 4);
		
		if(data == 'no'){
			alert("가입하신 아이디가 있습니다.");
			return;
		}else{
			alert("가입하실수 있습니다.");
		}
		location.href="new.do?name="+ name + "&tel1=" + tel1 + "&tel2=" + tel2 + "&tel3=" + tel3;
		//list.do?page="?name="+ name + "&tel2=" + tel2 + "&tel3=" + tel3"
	}
}
  </script>
  <body width="100%" height="100%">
    <form action="index.html" method="post" class="loginForm">
      <h2>회원가입</h2>
      <div class="idForm">
        <input type="text" class="id" id="name" name = "name" placeholder="Name">
      </div>
      <div class="passForm">
        <input type="text" class="pw" id="tel" name="tel" placeholder="Tel">
      </div>
      <button type="button" class="btn" onclick="send(this.form);">
        sign in
      </button>
    </form>
  </body>
</html>
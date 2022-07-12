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
		var id = f.id.value.trim();
		var pwd = f.pwd.value.trim();
		
		if(id==""){
			alert("아이디를 입력해주세요")
			return;
		}
		if(pwd==""){
			alert("비밀번호를 입력해주세요")
			return;
		}
		
		
		var url = "login.do";
		var param = "id="+id+"&pwd="+ encodeURIComponent(pwd);
		sendRequest(url, param, resultFn, "POST");
		
	}
	
	function resultFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			//삭제 성공 여부에 따라서 경고창을 띄우자 
			var data = xhr.responseText; //"no" or "yes"
			if(data == 'no'){
				alert("로그인 실패");
				alert("아이디, 비밀번호를 똑바로 입력하세요");
				return;
			}else{
				alert("로그인 성공");
			}
			opener.document.location.href="main.do";
			self.close();
		}
	}
	
  </script>
  <body width="100%" height="100%">
    <form action="index.html" method="post" class="loginForm">
      <h2>Login</h2>
      <div class="idForm">
        <input type="text" class="id" name = "id" placeholder="ID">
      </div>
      <div class="passForm">
        <input type="password" class="pw" name="pwd" placeholder="PW">
      </div>
      <button type="button" class="btn" onclick="send(this.form);">
        LOG IN
      </button>
      <div class="bottomText">
        <a href="search_id.do">아이디 / 비밀번호 찾기 </a>
      </div>
    </form>
  </body>
</html>

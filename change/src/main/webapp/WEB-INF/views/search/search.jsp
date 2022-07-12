<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>로그인 / 회원가입 폼 템플릿</title>
        <link rel="stylesheet" href="style.css">
        <style>
        * {
    margin: 0;
    padding: 0;
    font-family: sans-serif;
}
.wrap {
    height: 100%;
    width: 100%;
    background-color: #34495e;
    background-position: center;
    background-size: cover;
    position: absolute;
}
.form-wrap {
    width: 380px;
    height: 480px;
    position: relative;
    margin: 6% auto;
    background: #fff;
    padding: 5px;
    overflow: hidden;
  	border-radius: 15px;
}
.button-wrap {
    width: 230px;
    margin: 35px auto;
    position: relative;
    box-shadow: 0 0 600px 9px #6c5ce7;
    border-radius: 30px;
}
.togglebtn {
    padding: 10px 30px;
    cursor: pointer;
    background: transparent;
    border: 0;
    outline: none;
    position: relative;
}
#btn {
    top: 0;
    left: 0;
    position: absolute;
    width: 110px;
    height: 100%;
    background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
    border-radius: 30px;
    transition: .5s;
}

.input-group {
    top: 180px;
    position: absolute;
    width: 280px;
    transition: .5s;
}
.input-field {
    width: 100%;
    padding: 10px 0;
    margin: 5px 0;
    border: none;
    border-bottom: 1px solid #999;
    outline: none;
    background: transparent;
}
.submit {
    width: 85%;
    padding: 10px 30px;
    cursor: pointer;
    display: block;
    margin: 60px auto;
    background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
    border: 0;
    outline: none;
    border-radius: 30px;
}
.checkbox {
    margin: 30px 10px 30px 0;
}
span {
    color: #777;
    font-size: 12px;
    bottom: 68px;
    position: absolute;
}
#login {
    left: 50px;
}
#register {
    left: 450px;
}
        </style>
    </head>
    <body>
        <div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">아이디</button>
                    <button type="button" class="togglebtn" onclick="register()">비밀번호</button>
                </div>
                <form id="login" action="" class="input-group">
                    <input type="text" name="name" class="input-field" placeholder="User name" required>
                    <input type="text" name="email" class="input-field" placeholder="email" required>
                    <input type="text" name="tel" class="input-field" placeholder="Phone number" required>
                    
                    <button class="submit" onclick="send_id(this.form);">Search</button>
                </form>
                <form id="register" action="" class="input-group">
                    <input type="text" name="id" class="input-field" placeholder="ID" required>
                    <input type="text" name="name" class="input-field" placeholder="Name" required>
                    <input type="email" name="email" class="input-field" placeholder="Email" required>
                    <button class="submit" onclick="send_pwd(this.form);">Search</button>
                </form>
            </div>
        </div>
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
            
            function send_id(f){
        		var name = f.name.value.trim();
        		var email = f.email.value.trim();
        		var tel = f.tel.value.trim();
        		
        		if(name==""){
        			alert("이름을 입력해주세요")
        			return;
        		}
        		if(email==""){
        			alert("이메일을 입력해주세요")
        			return;
        		}
        		if(tel==""){
        			alert("전화번호를 입력해주세요")
        			return;
        		}
        		
        		f.method = "post";
        		f.action = "id.do";
        		f.submit();
        		
        		/* var url = "id.do";
        		var param = "name="+name+"&email="+email+"&tel="+tel;
        		sendRequest(url, param, resultFn, "POST"); */
        		
        	}
            
            function send_pwd(f){
            	var id = f.id.value.trim();
            	var name = f.name.value.trim();
            	var email = f.email.value.trim();
            	
            	if(id==""){
            		alert("아이디을 입력해주세요")
            		return;
            	}
            	if(name==""){
            		alert("이름을 입력해주세요")
            		return;
            	}
            	if(email==""){
            		alert("이메일을 입력해주세요")
            		return;
            	}
            	
            	f.method = "post";
            	f.action = "pwd.do";
            	f.submit();
            	
            	/* var url = "id.do";
            	var param = "name="+name+"&email="+email+"&tel="+tel;
            	sendRequest(url, param, resultFn, "POST"); */
            	
            }
        </script>
    </body>
</html> 
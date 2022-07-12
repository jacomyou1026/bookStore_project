<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	h1{margin-top: 20px;
	   margin-bottom: 70px;
	   text-shadow: 3px 3px 5px lightblue;
	   }
		
	p{margin:10px 0px 10px 0px;}
	input {
			  width:400px;
			  height:30px;
			  font-size:20px;
			}
	#i1{align : center;
		margin:10px 10px 20px 10px;
		width: 130px;
		height: 50px;
		background-color: #09a6f7;
		text-shadow: 3px 3px 5px lightblue;}
		
		  
</style>
<link rel="stylesheet" href="resources/css/main.css">
</head>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script>
	function send(f){
		var name = f.name.value.trim();
		var email = f.email.value.trim();
		var tel = f.tel.value.trim();
		
		if(name==""){
			alert("아이디를 입력해주세요")
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
	/* 
	function resultFn(){
		if(xhr.readyState == 4 && xhr.status ==200){
			var data = xhr.responseText;
			
			if(data == 'no'){
				alert("아이디, 비밀번호를 똑바로 입력하세요");
				return;
			}
			
			location.href = data;
		}
	}*/
	
</script>
<body style="overflow:hidden" align="center">
<div class="content_area">
		<div class="wrap1">
			<h1>아이디 찾기</h1>
			<form>
			<p><input name= "name" placeholder="이름을 입력하세요"></p>
			<br>
			<p><input name="email" placeholder="이메일을 입력하세요"></p>
			<br>
			<p><input name="tel" placeholder="휴대폰번호를 입력하세요"></p>
			<input type="button" value="아이디 찾기" id="i1" onclick="send(this.form);">
			</form>
			<br>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrap1{
	    /* margin-top: 100px;
	    margin-left: 300px;
	    margin-right: 300px; */
	    margin: 100px 400px 100px 400px;
	    height: 600px;
	    border-style: outset;
	    /* background-color: #000 */
	    text-align : center;
	    
	    }  
	h1{margin-top: 70px;
	   margin-bottom: 70px;
	   text-shadow: 3px 3px 5px lightblue;
	   }
		
	p{margin:20px 0px 20px 0px;}
	input {
			  width:400px;
			  height:30px;
			  font-size:20px;
			}
	#i1{margin:30px 10px 20px 10px;
		width: 130px;
		height: 50px;
		background-color: #09a6f7;
		text-shadow: 3px 3px 5px lightblue;}
</style>
<link rel="stylesheet" href="resources/css/main.css">
</head>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js	"></script>
<script type="text/javascript">
	function searchid(){
		var _width = '650';
	    var _height = '380';
	 
	    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	    var _left = Math.ceil(( window.screen.width - _width )/2);
	    var _top = Math.ceil(( window.screen.height - _height )/2); 

		
		window.open("search_id.do", "search", 'width='+ _width +
											  ', height='+ _height +
											  ', left=' + _left + 
											  ', top='+ _top );
	}
	function searchpwd(){
		var _width = '650';
	    var _height = '380';
	 
	    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	    var _left = Math.ceil(( window.screen.width - _width )/2);
	    var _top = Math.ceil(( window.screen.height - _height )/2); 

		
	    window.open("search_pwd.do", "search", 'width='+ _width +
				  ', height='+ _height +
				  ', left=' + _left + 
				  ', top='+ _top );
	}
</script>
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
			
			location.href="main.do";
		}
	}
	
</script>
<body>
<%@include file="include/header.jsp" %>	
<div class="content_area">
		<div class="wrap1">
			<h1>로그인</h1>
			<form>
			<p><input name= "id" placeholder="아이디를 입력하세요"></p>
			<br>
			<p><input type="password" name="pwd" placeholder="비밀번호를 입력하세요"></p>
			<input type="button" value="로그인" id="i1" onclick="send(this.form);">
			
			<input type="button" value="회원가입" onclick="location.href='new.do'" id="i1">
			</form>
			<br>
			<p><a href="javascript:searchid()">아이디를 잊으셨나영?</a></p>
			<p><a href="javascript:searchpwd()">비밀번호를 잊으셨나영?</a></p>
		</div>
	</div>
<%@include file="include/footer.jsp" %>	
</body>
</html>
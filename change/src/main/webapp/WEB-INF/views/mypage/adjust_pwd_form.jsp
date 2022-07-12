<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	 <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/mypage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage/css/sb-admin-2.min.css">
	
	<link rel="stylesheet" href="resources/css/main.css">
</head>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js	"></script>
<script>
	function send_a(f){
		var pwd = f.pwd.value.trim();
		if(pwd==""){
			alert("비밀번호를 입력하세요");
			return;
		}
		
		if(pwd.length < 6){
			alert("비밀번호는 6자 이상으로 하셔야합니다");
			return;
		}
		
		f.method="post";
		f.action = "adjust_pwd.do";
		f.submit();
	}
	
</script>
<body>
<%@include file="../include/header.jsp" %>
  <div class="wrapper">
    <div class="content_area">
    <%@include file="../include/mypage_sidebar.jsp" %>
    	<form>
    	<div class="container" style="font-size: 20px;" >
    	<br><br><br><br><br><br><br><br><br>
    	<table style="margin:0px 0px 450px 400px; width:500px; text-align: center; text-size: 70px; color: blue;">
    		<tr style="height:100px;">
    			<td>변경하실 비밀번호를 입력하세요</td>
    		</tr>
    		<tr style="height:100px;">
    			<td><input type="password" name="pwd" style="width: 300px; height:30px;">
    			<input type="button" value="확인" onclick="send_a(this.form);">
    		</tr>
    	</table>
		</div>
    	</form>
		<%@include file="../include/footer.jsp" %>
		</div>
    </div>
  
  
  <!-- Bootstrap core JavaScript-->
    
	 <script src="${pageContext.request.contextPath}/resources/mypage/vendor/jquery/jquery.min.js"></script>
	 <script src="${pageContext.request.contextPath}/resources/mypage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	 <script src= "${pageContext.request.contextPath}/resources/mypage/vendor/jquery-easing/jquery.easing.min.js"></script>
	 <script src= "${pageContext.request.contextPath}/resources/mypage/js/sb-admin-2.min.js"></script>
	 
</body>
</html>
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
	function send_b(f){
		var id = f.id.value.trim();
		var pwd = f.pwd.value.trim();
		if(id==""){
			alert("아이디를 입력하세요");
			return;
		}
		
		if(pwd==""){
			alert("비밀번호를 입력하세요");
			return;
		}
		
		
		var url = "delete_check.do";
		var param = "id=" + id + "&pwd="+ encodeURIComponent(pwd);
		sendRequest(url, param, resultFn, "POST");
		
	}
	
	function resultFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			
			var data = xhr.responseText; //"no" or "yes"
			if(data == 'no'){
				alert("아이디, 비밀번호를 똑바로 입력하세요");
				return;
			}else if(data == 'yes'){
				
			}
			
			location.href="delete_form.do";
		}
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
    	<table style="border:1px solid; margin:0px 0px 450px 400px; width:500px; text-align: center; 
    				  text-size: 70px; color: blue; box-shadow: 0px 0px 20px #000;">
    		<tr  style="height:100px;">
    			<td>ID</td>
    			<td><input name="id"></td>
    		</tr>
    		<tr  style="height:100px;">
    			<td>Password</td>
    			<td><input type="password" name="pwd">
    		</tr>
    		
    		<tr>
    			<td colspan="2">
    				<input type="button" value="확인" onclick="send_b(this.form);" style="width:300px; margin-bottom: 70px;">
   				</td>
   			</tr>
    	</table>
    	</div>
    	</form>
    </div>
  </div>
<!-- Bootstrap core JavaScript-->

  
<script src="${pageContext.request.contextPath}/resources/mypage/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/mypage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src= "${pageContext.request.contextPath}/resources/mypage/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src= "${pageContext.request.contextPath}/resources/mypage/js/sb-admin-2.min.js"></script>
	 
<%@include file="../include/footer.jsp" %>
</body>
</html>
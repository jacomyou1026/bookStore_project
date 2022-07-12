<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	form{align : center;
    	 font-size: 20px;
   	 	 font-weight: 400;}
 	p{margin:20px 0px 20px 0px;}
	input {
			  width:400px;
			  height:30px;
			  font-size:20px;
			}
</style>
</head>
<body>
<form>
	<h3>당신의 아이디는</h3>
	<table>
		<tr>
			<td>
			ID :
			</td>
			<td>${vo.id}</td>
		</tr>
	</table>
	<p><input type="button" value="비밀번호 찾기" id="i1" onclick="location.href='search_pwd.do'"></p>
	<p><input type="button" value="로그인" id="i1" onclick="location.href='login_form.do'"></p>
</form>
</body>
</html>
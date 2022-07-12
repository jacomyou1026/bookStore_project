<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		function send_check(){
			//var f = document.getElementById("f");
			var f = document.ff; // ff라는 name을 가진 form태그를 검색 
							   	//this.form 으로 가져오는것 다음으로 제일많이 쓰는 것
			//유효성체크
			
			//insert.do?subject=제목&name=작성자명&content=내용&pwd=1111
				f.submit();
		}
	</script>
	
</head>
<body>
	<h1 align="center">:::새글작성:::</h1>  
	<form name="ff" id="f" method="post" action="insert.do">
		<table border="1" width="700" align="center">
			<tr>
				<td width="120">제목</td>
				<td><input name="subject" style="width:250px;"></td>
			</tr>
			<tr>
				<td width="120">작성자</td>
				<td><input name="name" style="width:250px;"></td>
			</tr>
			<tr>
				<td width="120">내용</td>
				<!-- 값을 가지고 오고 싶으면 value 대신 <textarea></textarea> 사이값이 가져올수있는 내용(value).. -->
				<!-- rows 줄 cols 글자수 -->
				<td><textarea name="content" rows="10" cols="80"></textarea></td>
			</tr>
			<tr>
				<td width="120">비밀번호</td>
				<td><input name="pwd" type="password" style="width:250px;"></td>
			</tr>
			<tr>
				<td colspan="2">
				<!-- form 태그가 공식적으로 자식으로 지정한 태그 (상속관계) 는 input태그 뿐.. img는 아님
						그래서 this.form 으로 넘길 수 없음  -> 그래서 form 태그에 id를 따로 준것 !!
						->그런데 form 태그에 name을 줘서 쓰는걸 더 많이 쓰기도 함 !!
						send_check(); 메서드로 가는건 가능
						send_check(this.form); form 태그 가지고 가는건 불가능 !! -->
					<img src="${pageContext.request.contextPath}/resources/img/btn_reg.gif" style="cursor: pointer;" onclick="send_check();">
					
					<img src="${pageContext.request.contextPath}/resources/img/btn_back.gif" style="cursor: pointer;" onclick="location.href='list.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
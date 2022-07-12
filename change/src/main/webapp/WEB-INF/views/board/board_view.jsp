<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
	<script>
	
		/* 게시글 삭제  */
		function del(){
		
			if( !confirm("삭제하시겠습니까?")){
				return;
			}
			
			var f = document.ff;
			var c_pwd = f.c_pwd.value.trim();
			
			if(${vo.pwd} != c_pwd){
				alert("비밀번호 불일치");
				return;
			}
			
			var url = "del.do";
			var param="idx=${vo.idx}";
			sendRequest(url,param,delResult,"post");
		}
		
		function delResult(){
			if(xhr.readyState==4 && xhr.status==200){
				var data = xhr.responseText;
				
				if(data==1){
					alert("삭제 성공");
				}else{
					alert("삭제 실패. 관리자에게 문의하세요");
				}
				
				location.href="list.do?page=${param.page}";
			}
		}
		
		/* 댓글 */
		function reply(){
			
			var f = document.ff;
			f.action="reply_form.do";
			f.submit();
		}
	</script>
</head>
<body>
	<h1 align="center">:::상세정보:::</h1>
	
	<form name="ff" method="post">
	<table width="700" border="1" align="center">
		<tr>
			<th width="120">제목</th>
			<td>${vo.subject }</td>
		</tr>
		<tr>
			<th width="120">작성자</th>
			<td>${vo.name }</td>
		</tr>
		<tr>
			<th width="120">작성일</th>
			<td>${vo.regdate }</td>
		</tr>
		<tr>
			<th width="120">내용</th>
			<td width="580"><pre>${vo.content }</pre></td>
		</tr>
		<tr>
			<th width="120">ip</th>
			<td>${vo.ip }</td>
		</tr>
		<!-- 삭제를 위한 비밀번호 -->
		<tr>
			<th width="120">비밀번호</th>
			<td><input type="passward" name="c_pwd"></td>
		</tr>
		<tr>
			<td colspan="2">
				<!-- img는 form태그의 자식객체 아니므로 this.form 넘기는게 의미가없음.. -->
				<img src="${pageContext.request.contextPath}/resources/img/btn_list.gif" onclick="location.href='list.do?page=${param.page}'" style="cursor:pointer;">
				
				<c:if test="${vo.depth eq 0 }">
					<!-- 댓글달기 -->
					<img src="${pageContext.request.contextPath}/resources/img/btn_reply.gif" onclick="reply();" style="cursor:pointer;">
				</c:if>
				<!-- 글삭제 -->
				<!-- 댓글은 완전히 db에서 삭제되지않음 . 삭제된것처럼.. 대댓글이 레퍼런스를 참조해야 하기때문에 -->
				<img src="${pageContext.request.contextPath}/resources/img/btn_delete.gif" onclick="del();" style="cursor: pointer;">
			</td>
		</tr>
	</table>
	<input type="hidden" name="idx" value="${vo.idx }">
	<input type="hidden" name="page" value="${param.page }">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Ajax사용을 위한 준비 -->
	<script src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
	<script>
		
		window.onload=function(){
			//현재 페이지가 로드되면 자동으로 가장 실행되는 메서드 
			//body보다 먼저 호출됨
			testApi();
		}
	
		function testApi(){
			var url="http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbskgusslarj1715002&QueryType=ItemNewAll&MaxResults=100&start=1&SearchTarget=Book&output=js&Version=20131101&Cover=Big&outofStockfilter=1&CategoryId=51065";
			var param="";
			sendRequest(url,param,resultFn,"get");
			
			
		}
		
		//콜백
		function resultFn(){
				
			if(xhr.readyState==4 && xhr.status==200){
				
				var data=xhr.responseText;
				alert(data);
				//외부에서 가지고온 json은 배열로 묶여있지 않으면 처리를 잘 못함	
				var json = eval("["+data+"]"); //배열형태 만들어주기
				
				//title= json[0].item.title;
				document.getElementById("title").innerHTML = json[0].item[0].title;
				location.href="db_detail.do?json="+json;
			}
		}
	</script>
</head>
<body>
<p id="title"></p>
<table border="1">
	<tr>
		<th>제목</th>
		<th>저자</th>
		<th>출판사</th>
		<th>출판일</th>
		<th>가격</th>
		<th>설명</th>
		<th>재고</th>
		<th>img</th>
		<th>categoryNum</th>
	</tr>
	
</table>
${titles }
</body>
</html>
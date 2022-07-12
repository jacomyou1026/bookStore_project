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
	<style>
		#table1{border-top: 2px dashed #4fb9ff;
				border-bottom: 2px dashed #4fb9ff;}
		#table_1{width:1090px;
				margin: 30px 0px 30px 0px;}
		#table2{border: 2px solid gray;
				}
		.contents{margin: 20px 0px 0px 50px;}
		#td1{}
		#td2{padding-left: 60px;}
		#radio{margin-left: 50px;
			   margin-bottom: 20px;}
	    #input_text{width: 600px;}
	    .delete_end{float: right;
	    			width: 200px;
	    			heigt: 200px;}
	</style>
</head>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js	"></script>
<script>
</script>
<body>
<%@include file="../include/header.jsp" %>
  <div class="wrapper">
    <div class="content_area">
   		 <%@include file="../include/mypage_sidebar.jsp" %>
    	<div class="container">
	    <div class="jumbotron" style="margin-top: 30px;">
	    <form>
		    <h3>코리아서점을 이용해 주셔서 감사합니다.</h3>
		    <br>
		    	<ul>
		    		<li>회원탈퇴 시 모든 회원정보와 쿠폰, 포인트, 구매내역 등이 자동으로 삭제 처리되며, 복구가 불가합니다.</li>
		    		<li>회원 ID에 대해서는 서비스 이용의 혼선 방지, 법령에서 규정하는 회원 거래 정보의 보존 기간 동안의 보관 의무의 이행, 
		    			기타 안정적인 서비스 제공을 위하여 필요한 정보이므로 탈퇴 후 동일 ID로의 재가입은 허용되지 않습니다.</li>
		    	</ul>
    	</div>
	    	<div class="table" id="table1">
	    	<table border="1" id="table_1" >
	    		<tr>
	    			<td colspan="2" align="center">진행중 주문</td>
	    			<td colspan="2" align="center">중고장터 서비스</td>
	    			<td align="center">충전금 내역</td>
	    			<td align="center">포인트 내역</td>
	    		</tr>
	    		
	    		<tr>
	    			<td id="td1" align="center">주문중 상품</td>
	    			<td id="td2">0개</td>
	    			<td id="td1" align="center">판매중 상품</td>
	    			<td id="td2">0개</td>
	    			<td rowspan="2" align="center">0원</td>
	    			<td rowspan="2" align="center">0원</td>
	    		</tr>
	    		
	    		<tr>
	    			<td align="center">교환/반품</td>
	    			<td id="td2">0개</td>
	    			<td align="center">진행중 상품</td>
	    			<td id="td2">0개</td>
	    		</tr>
	    	</table>
	    	
	    	<br>
		    	<ul>
		    		<li>현금환불이 가능한 경우</li>
		    		 	- 예치금 : 환불신청을 해주시면, 접수일로부터 익일(평일기준) 오후 6시 이전까지 해당계좌로 입금됩니다.
		    		 	- 코리아e캐시 : 고객센터(1111-2222)로 환불신청을 해주시면, 예치금으로 환불 됩니다.
		    		<li>현금환불이 불가능한 경우</li>
		    		    - 할인쿠폰, 통합포인트, 마일리지, 교환권, 교보캐시 등은 탈퇴와 동시에 자동 소멸됩니다.
		    	</ul>
	    	</div>
	    	
	    	<div class="table" id="table2">
	    		<div class="contents">
		    		저희 서비스를 이용하시면서 느꼈던 불편사항을 지적해 주십시오.<br>
		    		향후 보다 나은 서비스 제공을 위해 소중한 자료로 반영하겠습니다.
	    		</div>
	    		<br>
	    		<input type="radio" id="radio">도서정보 마비
	    		<input type="radio" id="radio">도서검색 불편
	    		<input type="radio" id="radio">시스템 불편
	    		<input type="radio" id="radio">가격불만, 우송료불만
	    		<input type="radio" id="radio">배송 지연<br>
	    		<input type="radio" id="radio">서비스 불만
	    		<input type="radio" id="radio">회원혜택 빈약
	    		<input type="radio" id="radio">원하지 않는 메일 수신
	    		<input type="radio" id="radio">Off-line 불만
	    		<input type="radio" id="radio">서비스 불만<br>
	    		<input type="radio" id="radio">기타
	    		<input type="text" id="input_text">
	    	</div>
	    	
	    	<div class="delete_end">
	    		<input type="button" value="탈퇴하기" onclick="location.href='delete.do'">
	    	</div>
	    	</form>
	    </div>
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
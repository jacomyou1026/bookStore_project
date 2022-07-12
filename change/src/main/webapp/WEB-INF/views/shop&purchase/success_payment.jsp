<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>


<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/success_payment.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/main.css">

<!-- Ajax를 위한 httpRequest.js참조 -->
<script
	src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="payment.css">
<title>Document</title>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>


<script>
	$(document).ready(function() {
		setTotalInfo();

	});

	function setTotalInfo() {
		let totalCount = 0; // 총 갯수
		let totalKind = 0; // 총 종류

		$(".cart_info").each(function(index, element) {

		
			//총 개수
			totalCount += parseInt($(element).find(".bookCount_input").val());

			/* 총 종류 */
			totalKind += 1;
		});

		//총 종류
		$(".totalKind_span").text(totalKind);

		// 총 갯수
		$(".totalCount_span").text(totalCount);

	}

	function order_list(f) {
		window.open(
						"detail_page.do",
						"상세페이지", "width=700 height=800 left=400 top =350");
	}

	function check(f) {
		f.action = "main.do";
		f.submit();
	}
</script>

</head>
<body>
	<%@include file="../include/shop&order_header.jsp"%>
	<form action="">
		<div class="mainbox">

			<header>
				<img
					src="${ pageContext.request.contextPath }/resources/img/success.PNG"
					alt="">
			</header>
			<main>
				<div class="header_img">
					<img
						src="http://bangsojung.com/work/petlove/coding_html/images/sub/i_receipt.png"
						alt="http://bangsojung.com/work/petlove/coding_html/images/sub/i_receipt.png">
				</div>
				<div class="thank">
					<h2>감사합니다.</h2>
					<h2>주문 및 결제가 완료되었습니다.</h2>
				</div>
			</main>
			<c:forEach var="vo" items="${totalbookcnt}">
				<span class="cart_info" style="display:none"> 
					<input type="hidden" class="bookCount_input" value="${vo}">
				</span>
			</c:forEach>
			<div style="text-align: center; margin-top: 63px; font-weight: 600;">
				<span>상품개수 : </span>
				<span class="totalKind_span"></span>종
				<span class="totalCount_span"></span>개
			</div>
			<div class="point">
				<span>구매 확정 시 적립 포인트 : </span> <span
					style="color: red; font-size: 28px;">${savePoint}</span>
			</div>
			<div style="text-align: center; margin-top: 40px;">
				<input type="button" value="주문 상세 내역"
					onclick="order_list(this.form);">

				<!-- 메인으로 가기 -->
				<input type="button" value="확인" onclick="check(this.form);">

			</div>
		</div>

	</form>
	<%@include file="../include/footer.jsp"%>
</body>
</html>
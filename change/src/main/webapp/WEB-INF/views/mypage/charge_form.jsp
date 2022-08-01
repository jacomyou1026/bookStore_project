<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Cards</title>
	<!-- <style>
		@import url("resources/css/main.css");
	</style> -->
	
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/mypage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage/css/sb-admin-2.min.css">

	<!-- 카카오톡 -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>


		<!-- Ajax를 위한 httpRequest.js참조 -->
		<script src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>


			<!-- jQuery -->
			<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


</head>
<script>

	function send(f) {
				
						var IMP = window.IMP;
						IMP.init("imp14917305");
						// getter

						var form =  document.forms[f];
						var money =  form.money.value;

						IMP.request_pay({
							pg: 'kakaopay',
							merchant_uid: 'merchant_' + new Date().getTime(),
							pay_method: 'kakaopay',
							name: '주문명 :${user.name}',
							amount: money,
							buyer_email: '${user.email}',
							buyer_name: '${user.name}',
							buyer_tel: '${user.tel1} ${user.tel2} ${user.tel3} ',
							buyer_addr: '${user.address1} ${user.address2}',
							buyer_postcode: '${user.postcode} '
						}, function (rsp) {
							console.log(rsp);
							if (rsp.success) {
								var msg = money+'원 결제가 완료되었습니다.';

								var url = "chargePoint.do";
								var param = "amount=" + money;
								sendRequest(url, param, resultFn, "post");


							} else {
								var msg = '결제에 실패하였습니다.';
								//msg += '에러내용 : ' + rsp.error_msg;
							}
							alert(msg);

						});
					}



					//문제 수정 요함
					function resultFn() {
						if (xhr.readyState == 4 && xhr.status == 200) {
							var data = xhr.responseText;//"no" or "yes"

							if (data == 'no') {
								alert("실패. 관리자에게 문의하세요");
							}
							window.location.reload();


						}
					}


</script>
<body>

<div class="container">
	<form>
		<div class="col-xl-3 col-md-3 mb-4">
		    <div class="card border-left-success shadow h-100 py-2" type="button" onclick="send(0);" > 
		        <div class="card-body">
		            <div class="row no-gutters align-items-center">
		                <div class="col mr-2">
		                    <div class="h5 mb-0 font-weight-bold text-gray-800">￦10,000</div>
		                    <input type="hidden" name="money" value="10000">
		                </div>
		                <div class="col-auto">
		                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		</form>
		
		<form>
		<div class="col-xl-3 col-md-3 mb-4">
		    <div class="card border-left-success shadow h-100 py-2" type="button" onclick="send(1);">
		        <div class="card-body">
		            <div class="row no-gutters align-items-center">
		                <div class="col mr-2">
		                    <div class="h5 mb-0 font-weight-bold text-gray-800">￦30,000</div>
		                    <input type="hidden" name="money"  value="30000">
		                </div>
		                <div class="col-auto">
		                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		</form>
		
		<form>
		<div class="col-xl-3 col-md-3 mb-4">
		    <div class="card border-left-success shadow h-100 py-2" type="button" onclick="send(2);">
		        <div class="card-body">
		            <div class="row no-gutters align-items-center">
		                <div class="col mr-2">
		                    <div class="h5 mb-0 font-weight-bold text-gray-800">￦50,000</div>
		                    <input type="hidden" name="money" value="50000">
		                </div>
		                <div class="col-auto">
		                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		</form>
		
		<form>
		<div class="col-xl-3 col-md-3 mb-4">
		    <div class="card border-left-success shadow h-100 py-2" type="button" onclick="send(3);">
		        <div class="card-body">
		            <div class="row no-gutters align-items-center">
		                <div class="col mr-2">
		                    <div class="h5 mb-0 font-weight-bold text-gray-800">￦70,000</div>
		                    <input type="hidden" name="money" value="70000">
		                </div>
		                <div class="col-auto">
		                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		</form>
		
		<form>
		<div class="col-xl-3 col-md-3 mb-4">
		    <div class="card border-left-success shadow h-100 py-2" type="button" onclick="send(4);">
		        <div class="card-body">
		            <div class="row no-gutters align-items-center">
		                <div class="col mr-2">
		                    <div class="h5 mb-0 font-weight-bold text-gray-800">￦100,000</div>
		                    <input type="hidden" name="money" value="100000">
		                </div>
		                <div class="col-auto">
		                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		</form>
</div>
	<!--부트 스트랩  -->
 	 <script src="${pageContext.request.contextPath}/resources/mypage/vendor/jquery/jquery.min.js"></script>
	 <script src="${pageContext.request.contextPath}/resources/mypage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	 <script src= "${pageContext.request.contextPath}/resources/mypage/vendor/jquery-easing/jquery.easing.min.js"></script>
	 <script src= "${pageContext.request.contextPath}/resources/mypage/js/sb-admin-2.min.js"></script>
</body>
</html>
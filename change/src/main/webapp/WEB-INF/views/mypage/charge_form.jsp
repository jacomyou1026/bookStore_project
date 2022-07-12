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

</head>
<script>
	function send(f){
		var money = f.money.value;
		alert(money);
	}
</script>
<body>

<div class="container">
	<form>
		<div class="col-xl-3 col-md-3 mb-4">
		    <div class="card border-left-success shadow h-100 py-2" type="button" onclick="send(this.form);" > 
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
		    <div class="card border-left-success shadow h-100 py-2" type="button" onclick="send(this.form);">
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
		    <div class="card border-left-success shadow h-100 py-2" type="button" onclick="send(this.form);">
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
		    <div class="card border-left-success shadow h-100 py-2" type="button" onclick="send(this.form);">
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
		    <div class="card border-left-success shadow h-100 py-2" type="button" onclick="send(this.form);">
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
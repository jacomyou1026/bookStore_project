<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta http-equiv="X-UA-Compatible" content="ie=edge"> 
<title>BookStore</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/main.css">
<style> 
.carousel-inner > .carousel-item > img{ 
										width: 340px; 
										height: 300px; 
										}
</style>
</head>
<body>
		
    <%@include file="include/header.jsp" %>
    		
		<div class="content_area">
			<div class="container">
			<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			 crossorigin="anonymous">
			</script> 
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
			integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" 
			crossorigin="anonymous">
			</script> 
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
			 integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" 
			 crossorigin="anonymous">
			</script> 
			
			<script> $('.carousel').carousel({ interval: 2000 }) </script> 
			<div class="container" style="algin:center;">
				<h3></h3>
			</div> 
			<div id="demo" class="carousel slide" data-ride="carousel"> 
				<div class="carousel-inner"> 
				<!-- 슬라이드 쇼 --> 
					<div class="carousel-item active"> 
					<!--가로--> 
						<img class="d-block w-100" src="http://image.kyobobook.co.kr/ink/images/prom/2022/banner/220117/bnC_we01.jpg" alt="First slide"> 
						<div class="carousel-caption d-none d-md-block"> 
						<!-- <h5>TEST</h5> 
						<p>testtesttest</p>  -->
						</div> 
						</div>
							<div class="carousel-item"> 
							<img class="d-block w-100" src="http://image.kyobobook.co.kr/ink/images/prom/2022/book/220114_challenge/bn/bnO_w01_f6c1c1.jpg" alt="Second slide"> 
							</div> 
							<div class="carousel-item"> 
							<img class="d-block w-100" src="http://image.kyobobook.co.kr/newimages/adcenter/IMAC/creatives/2022/01/27/54745/new_book.jpg" alt="Third slide"> 
							</div>
							<div class="carousel-item"> 
							<img class="d-block w-100" src="http://image.kyobobook.co.kr/newimages/adcenter/IMAC/creatives/2022/01/21/51660/3.jpg" alt="Third slide"> 
							</div>
							<div class="carousel-item"> 
							<img class="d-block w-100" src="http://image.kyobobook.co.kr/ink/images/prom/2022/banner/220124/bnU_we01.jpg" alt="Third slide"> 
							</div>
							<div class="carousel-item"> 
							<img class="d-block w-100" src="http://image.kyobobook.co.kr/newimages/adcenter/IMAC/creatives/2022/01/25/68215/1newlyreleased.jpg" alt="Third slide"> 
							</div>
						 
						<!-- / 슬라이드 쇼 끝 --> 
						<!-- 왼쪽 오른쪽 화살표 버튼 --> 
						<a class="carousel-control-prev" href="#demo" data-slide="prev"> 
						<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
						<!-- <span>Previous</span> --> 
						</a> 
						<a class="carousel-control-next" href="#demo" data-slide="next"> 
						<span class="carousel-control-next-icon" aria-hidden="true"></span> 
						<!-- <span>Next</span> --> 
						</a> 
						<!-- / 화살표 버튼 끝 --> 
						<!-- 인디케이터 --> 
						<ul class="carousel-indicators"> 
						<li data-target="#demo" data-slide-to="0" class="active"></li> 
						<!--0번부터시작--> 
						<li data-target="#demo" data-slide-to="1"></li> 
						<li data-target="#demo" data-slide-to="2"></li> 
						<li data-target="#demo" data-slide-to="3"></li> 
						<li data-target="#demo" data-slide-to="4"></li> 
						<li data-target="#demo" data-slide-to="5"></li> 
						<li data-target="#demo" data-slide-to="6"></li> 
						</ul> <!-- 인디케이터 끝 --> 
						</div> 
			</div> 
			<!-- 코르세어 끝 -->
			<table border="0" style="margin-top:20px; margin-left:70px; ">
				<tr>
					<td>
						<img src="http://image.kyobobook.co.kr/newimages/adcenter/IMAC/creatives/2022/02/03/66416/1.jpg">
					</td>
					<td>
						<img src="http://image.kyobobook.co.kr/newimages/adcenter/IMAC/creatives/2021/12/31/70245/mid.png">
					</td>
					<td>
						<img src="http://image.kyobobook.co.kr/newimages/adcenter/IMAC/creatives/2022/01/27/54745/W_right.jpg">
					</td>
				</tr>
				
				<tr>
					<td>
						<img src="http://image.kyobobook.co.kr/newimages/adcenter/IMAC/creatives/2022/01/27/46781/welcome_mid.jpg">
					</td>
					<td>
						<img src="http://image.kyobobook.co.kr/newimages/adcenter/IMAC/creatives/2022/01/28/61174/wleft1.jpg">
					</td>
					<td>
						<img src="http://image.kyobobook.co.kr/newimages/adcenter/IMAC/creatives/2022/01/27/54745/W_R.jpg">
					</td>
				</tr>
			</table>

			
			
<!-- 			<script>

			
			var ca1 = Math.floor(Math.random()*11);
			var ca2 = Math.floor(Math.random()*11+10);
			var ca3 = Math.floor(Math.random()*11+20);
			var ca4 = Math.floor(Math.random()*11+30);
			var ca5 = Math.floor(Math.random()*11+40);
			var ca6 = Math.floor(Math.random()*11+50);	
		
			</script> -->
						
			<!-- 카드형식 -->
			<div class="row" style="margin-top:80px;">
			<div class="card col-md-3" >
			<img class="card-img-top"  src="${list[0].img }" alt="Card image" style="height:330px;">
				<div class="card-body">
					<h4 class="card-title" style="height:40px; overflow:hidden; 	white-space: nowrap; text-overflow: ellipsis;">${list[0].subject}</h4><!-- 책 제목 -->
					<p class="card-text" style="height:40px; overflow:hidden; 	white-space: nowrap; text-overflow: ellipsis;">${list[0].intro}</p> <!-- 책 내용 -->
					<a href="#" class="btn btn-primary">책 보러가기</a>
				</div>
			</div>
			
			<div class="card col-md-3" >
			<img class="card-img-top"  src="${list[1].img }" alt="Card image"  style="height:330px;">
				<div class="card-body">
					<h4 class="card-title" style="height:40px; overflow:hidden; 	white-space: nowrap; text-overflow: ellipsis;">${list[1].subject}</h4><!-- 책 제목 -->
					<p class="card-text" style="height:40px; overflow:hidden; 	white-space: nowrap; text-overflow: ellipsis;">${list[1].intro}</p> <!-- 책 내용 -->
					<a href="#" class="btn btn-primary">책 보러가기</a>
				</div>
			</div>
			
			<div class="card col-md-3" >
			<img class="card-img-top"  src="${list[2].img }" alt="Card image" style="height:330px;">
				<div class="card-body">
					<h4 class="card-title" style="height:40px; overflow:hidden; 	white-space: nowrap; text-overflow: ellipsis;">${list[2].subject}</h4><!-- 책 제목 -->
					<p class="card-text" style="height:40px; overflow:hidden; 	white-space: nowrap; text-overflow: ellipsis;">${list[2].intro}</p> <!-- 책 내용 -->
					<a href="#" class="btn btn-primary">책 보러가기</a>
				</div>
			</div>
			
			<div class="card col-md-3" >
			<img class="card-img-top"  src="${list[3].img }" alt="Card image" style="height:330px;">
				<div class="card-body">
					<h4 class="card-title" style="height:40px; overflow:hidden; 	white-space: nowrap; text-overflow: ellipsis;">${list[3].subject}</h4><!-- 책 제목 -->
					<p class="card-text" style="height:40px; overflow:hidden; 	white-space: nowrap; text-overflow: ellipsis;">${list[3].intro}</p> <!-- 책 내용 -->
					<a href="#" class="btn btn-primary">책 보러가기</a>
				</div>
			</div>
			
			<div class="card col-md-3" style="margin-top:30px;" >
			<img class="card-img-top"  src="${list[4].img }" alt="Card image" style="height:330px;">
				<div class="card-body">
					<h4 class="card-title" style="height:40px; overflow:hidden; 	white-space: nowrap; text-overflow: ellipsis;">${list[4].subject}</h4><!-- 책 제목 -->
					<p class="card-text" style="height:40px; overflow:hidden; 	white-space: nowrap; text-overflow: ellipsis;">${list[4].intro}</p> <!-- 책 내용 -->
					<a href="#" class="btn btn-primary">책 보러가기</a>
				</div>
			</div>
			
			<div class="card col-md-3" style="margin-top:30px;">
			<img class="card-img-top"  src="${list[5].img }" alt="Card image" style="height:330px;">
				<div class="card-body">
					<h4 class="card-title" style="height:40px; overflow:hidden; 	white-space: nowrap; text-overflow: ellipsis;">${list[5].subject}</h4><!-- 책 제목 -->
					<p class="card-text" style="height:40px; overflow:hidden; 	white-space: nowrap; text-overflow: ellipsis;">${list[5].intro}</p> <!-- 책 내용 -->
					<a href="#" class="btn btn-primary">책 보러가기</a>
				</div>
			</div>
			
			<div class="card col-md-3"style="margin-top:30px;" >
			<img class="card-img-top"  src="${list[6].img }" alt="Card image" style="height:330px;">
				<div class="card-body">
					<h4 class="card-title" style="height:40px; overflow:hidden; 	white-space: nowrap; text-overflow: ellipsis;">${list[6].subject}</h4><!-- 책 제목 -->
					<p class="card-text" style="height:40px; overflow:hidden; 	white-space: nowrap; text-overflow: ellipsis;">${list[6].intro}</p> <!-- 책 내용 -->
					<a href="#" class="btn btn-primary">책 보러가기</a>
				</div>
			</div>
			
			<div class="card col-md-3" style="margin-top:30px;">
			<img class="card-img-top"  src="${list[7].img }" alt="Card image" style="height:330px;">
				<div class="card-body">
					<h4 class="card-title" style="height:40px; overflow:hidden; 	white-space: nowrap; text-overflow: ellipsis;">${list[7].subject}</h4><!-- 책 제목 -->
					<p class="card-text" style="height:40px; overflow:hidden; 	white-space: nowrap; text-overflow: ellipsis;">${list[7].intro}</p> <!-- 책 내용 -->
					<a href="#" class="btn btn-primary">책 보러가기</a>
				</div>
			</div>
	
			</div><!-- row클래스  -->
			
			</div>
		</div>
	<%-- <%@include file="include/rightside.jsp" %> --%>
    <%@include file="include/footer.jsp" %>	

<script>
$(document).ready(function(){
	
					    
	$("#searchBtn").click(function() {
	const keyword = $("#keywordInput").val();
	const condition = $("#condition option:selected").val();
		location.href="bookListSearch?page="+ ${pc.paging.page} + "&countPerPage="+${pc.paging.countPerPage} + "&keyword=" + keyword + "&condition="+condition;
	}); 
				
					
	//엔터키 입력 이벤트
	$("#keywordInput").keydown(function (key) {
		 
        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
        	$("#searchBtn").click();
        }
 
    });		
					
					

});
</script>

</body>
</html>
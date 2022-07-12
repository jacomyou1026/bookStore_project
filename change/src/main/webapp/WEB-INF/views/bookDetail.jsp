<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/book_detail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/star.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>

 <script>
        $(document).ready(function(){
        	 
            $(".info").click(function(){
            	
                var offset = $('.info_content').offset();
				
                $('html,body').animate({scrollTop:offset.top-70}, 450);

            }) ;
            
            $(".review").click(function(){

                var offset = $('.review_content').offset();

                $('html,body').animate({scrollTop:offset.top-70}, 450);

            }) ;
            
            $(".refund").click(function(){

                var offset = $('.refund_content').offset();

                $('html,body').animate({scrollTop:offset.top-70}, 450);

            }) ;

        });
        
        function shopping_basket(f){
      	  var num = f.num.value;
      	  var bookNum = f.bookNum.value;
      	  var uid = '<%=(String)session.getAttribute("id")%>';
      	  
	      	if(uid=="null"){
				 alert("로그인 후 이용 가능합니다.");
				 return;
			 }
			 
      		f.action="shoppingCart_insert.do?";
			/* f.method="post"; */
			f.submit();
        }

	function gotopayone(){
	  var uid = '<%=(String)session.getAttribute("id")%>';

		var num  = $("[name=num]").val();
		var bookNum  = $("input[name=bookNum]").val();

		alert(num+"-"+bookNum);
    	if(confirm("바로구매로 이동하시겠습니까?")){
			 if(uid=="null"){
			 	alert("로그인 후 이용하세요.");
				return;
			 }
			 
			location.href = "purchase.do?orders%5B0%5D.bookNum="+bookNum+"&orders%5B0%5D.bookCnt="+num;
    	}
		
  }
      
    </script>
</head>
<body>
    <%@include file="include/header.jsp" %>	

    			<br><br><br>
		<!-- <div class="content_area"> -->
            <!-- main -->
            
            <div id = "main_box">
            
             	<div id="book_top_box">
	                 <!-- 책 이미지 -->
	                 <div id="book_img_box">
	                 	<p style="text-align: center;">
	                  	  <img src="${book_vo.img}"
								width="200">
						</p>
	                 </div>
	
					<!-- 책 상세 페이지 -->
	                <div id="detail_box">
	                <form>
	                    <h1 align="center">${book_vo.subject}</h1>
	                    
	                    <div id="content_box">
	                  	     	<strong>작가:</strong> ${book_vo.author}
			                    <div id="rateing">
			                    	<strong >평점:</strong> &nbsp; ${rating}
			                    </div>
			                    <br><br>
			                    <strong>정가:</strong> ${book_vo.price} <br>
			                    <strong id="sale">판매가:</strong> 
			                    <font id="sale_con">
									<fmt:formatNumber type="number"  pattern="0" value="${book_vo.price*0.9 }" />
			                    </font> <br><br>
			                    <strong>배송비:</strong> 무료 <br>
			
			                    <strong>주문수량 : </strong>
				                    <select name="num">
				                        <option value="1">1</option>
				                        <option value="2">2</option>
				                        <option value="3">3</option>
				                        <option value="4">4</option>
				                        <option value="5">5</option>
				                        <option value="6">6</option>
				                        <option value="7">7</option>
				                        <option value="8">8</option>
				                        <option value="9">9</option>
				                    </select>
		                    <br><br>
						</div>
	                    <div align="center">
							<input type="hidden" value="${book_vo.bookNum}" name="bookNum">
	                        <input class="styled" type="button" name="basket" value="장바구니" size="10" onclick="shopping_basket(this.form);">
						</form>
								<input id="btn_pay" type="button" name="basket" value="바로구매" class="gotopay" onclick="gotopayone(this.form);">
	                    </div>
	             	
	                </div><!-- detail_box -->
                </div>
                
                <!-- 상세정보, 리뷰 리스트 -->
                <div class="tab_detail_content">
                    <ul class="list">
                        <li><a href="#" class="info">상품정보</a></li>
                        <li><a href="#" class="review">회원리뷰</a></li>               
                        <li><a href="#" class="refund">교환/반품/품절</a></li>
                     </ul>                
                </div> <!-- tab_detail_content -->

				<!-- 상세정보, 리뷰 내용 -->
				<div class="detail_content">
					<!-- 1. 상품정보 -->
					<div class="info_content">
						<h2>상품정보</h2>
						<pre>
							<strong>${book_vo.intro }</strong>
						</pre>
					</div>
					<!-- 2. 회원리뷰 -->
					<div class="review_content">
						<%@include file="board/review_list.jsp" %>			
					</div>
					
					<!-- 3. 교환/반품/품절 -->
					<div class="refund_content">
						<%@include file="bookDetail/refund.jsp" %>			
					</div>			
            	</div> <!-- detail_content -->
            	
            	<!-- ************************************************* -->
            	
            </div><!-- main_box -->
      <!--   </div>content_area -->
    <%@include file="include/footer.jsp" %>	
</body>
</html>
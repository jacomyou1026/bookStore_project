<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>BookStore</title>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
			
	
				<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/bookList/bookList.css">
<script>
function shopping_basket(bookNum){
	  var num = 1;
	  var uid = '<%=(String)session.getAttribute("id")%>';
	  

    	if(confirm("장바구니로 이동하시겠습니까?")){
			 if(uid=="null"){
				 alert("로그인 후 이용하세요.");
				 return;
			 }
			 location.href="shoppingCart_insert.do?num=1&bookNum="+bookNum;
    	}
		
  }
  function gotopayone(bookNum){
	  var num = 1;
	  var uid = '<%=(String)session.getAttribute("id")%>';
	  
    	if(confirm("바로구매로 이동하시겠습니까?")){
			 if(uid=="null"){
			 	alert("로그인 후 이용하세요.");
				return;
			 }
			 
			 location.href="payone_insert.do?num=1&bookNum="+bookNum;
			 
    	}
		
  }
</script>
</head>
<body>


						
    <%@include file="../include/header.jsp" %>	
    
    
    			
		<div class="content_area">
    		 <%@include file="../include/aside2.jsp" %>	
						  <div class ="content">
                            <div id ="main_box">
   					 <%@include file="../include/booklist_nav2.jsp" %>      
		  <form role="form" method="get"> 
		 
		 						<c:if test="${list.size() <= 0}">
		 						<div class="nosearch">
							<span id="no_search">책이 없습니다.</span>
								</div>
								</c:if>
							<c:if test="${list.size() > 0}">
                   <c:forEach items="${list}" var="list">
                                      <input type="hidden" name="bookNum" value="${list.bookNum}">
                                    <div class="booklist">
                                            <div class="list_image">
                                                <img id="list_image" src=${list.img }>
                                            </div>
                                            <div class="list_detail">
                                            	
                                            	
                                                <a id="title" href="bookDetail.do?num=${list.bookNum}">${list.subject}</a> <span id="catenamed">	&#91;${list.cateName}&#93;</span>
                                                <div class="list_etc"> <span id="gray">${list.author } |</span> <span id="gray"> ${list.publisher } |</span> 
                                                <span id="gray"><fmt:formatDate value="${list.publishDate}" pattern="yyyy-MM-dd"/>
                                                </span>
                                                </div>
                                                <div class="list_price">
                                                    <span id="price">
                                                    	<fmt:formatNumber type="number"  pattern="0" value="${list.price*0.9 }" />[10%할인]
                                                    </span> 
                                                      <span style="font-size: 11px"> |</span> 
                                                      <span id="point">
                                                      	<fmt:formatNumber type="number"  pattern="0" value="${list.price*0.05 }" /> [5%] 적립
                                                      </span>
                                                </div>
                                                <div class="list_intro">${list.intro}</div>
                                                <div class="rating"></div>
                                                <div class="order"><span id ="gray">[당일배송]</span>
                                                <span id="blue">지금 주문하면</span> <span id="blue" style="font-weight: bold">오늘</span> <span id="blue">도착 예정</span>
                                                </div>

                                            </div>
                                            <div class="list_button">
                                                    <input id="btn_cart" type="button" name="basket" value="장바구니" onclick="shopping_basket('${list.bookNum}');">
													<input id="btn_pay" type="button" name="basket" value="바로구매" onclick="gotopayone('${list.bookNum}');">
                                            </div>
                                            <div class="clearfix"></div>    

                                    </div>
                                </c:forEach>
                                </c:if>
                                
                         						<c:if test="${list.size() > 0}">      
							<div class="col-md-offset-3">
						<ul class="pagination">
							<c:if test="${pc.prev}">
								<li><a href="bookList2?c=${param.c}&t=${param.t}&page=${pc.startPage - 1}&countPerPage=${pc.paging.countPerPage}">이전</a></li>
							</c:if> 
							
							<c:forEach begin="${pc.startPage}" end="${pc.endPage}" var="idx">
								<li <c:out value="${pc.paging.page == idx ? 'class=active' : ''}" />>
								<a href="bookList2?c=${param.c}&t=${param.t}&page=${idx}&countPerPage=${pc.paging.countPerPage}">${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pc.next && pc.endPage > 0}">
								<li><a href="bookList2?c=${param.c}&t=${param.t}&page=${pc.endPage + 1}&countPerPage=${pc.paging.countPerPage}">다음</a></li>
							</c:if> 
						</ul>
					</div>
					</c:if>
                            	
                 </form>            	
                            
                            
                            
                            
                            
                            
                            
                            
                            </div> 
                        </div>
                <div class="clearfix"></div>  

		</div>


    <%@include file="../include/footer.jsp" %>	



<script>
$(document).ready(function(){
	
	//검색 버튼 이벤트 처리
	$("#searchBtn").click(function() {
		const keyword = $("#keywordInput").val();
		const condition = $("#condition option:selected").val();
		location.href="bookListSearch?page=1&countPerPage="+${pc.paging.countPerPage} + "&keyword=" + keyword + "&condition="+condition;
		
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
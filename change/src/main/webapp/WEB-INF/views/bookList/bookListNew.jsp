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
</head>
<body>


						
    <%@include file="../include/header.jsp" %>	
    
    			
		<div class="content_area">
    		 <%@include file="../include/asideNew.jsp" %>	
						  <div class ="content">
                            <div id ="main_box">
		  <form role="form" method="get">    
		 
					               <div class="bookList_desc">
                                        <span>신간도서</span>
                                        <p>신간 도서 코너는 출판된 지 14일 이내의 새로운 책이나 출판 예정인 책들을 볼 수 있는 코너입니다.</p>
                                    </div>
		 						<c:if test="${list.size() <= 0}">
		 						<div class="nosearch">
							<span id="no_search">책이 없습니다</span>
								</div>
								</c:if>
						<c:if test="${list.size() > 0}">
                   <c:forEach items="${list}" var="list">
		 					<c:if test="${list.newMark == true}">    
                                    <div class="booklist">
                                            <div class="list_image">
													<span class="badge">new</span>
                                                 <img id="list_image" src="${list.img }">
                                            </div>
                                            <div class="list_detail">
                                                <a href="bookDetail.do?num=${list.bookNum}" id="title">${list.subject}</a> <span id="catenamed">	&#91;${list.cateName}&#93;</span>
                                                <div class="list_etc"> <span id="gray">${list.author } |</span> <span id="gray"> ${list.publisher } |</span> 
                                                <span id="gray"><fmt:formatDate value="${list.publishDate}" pattern="yyyy-MM-dd"/>
                                                </span>
                                                </div>
                                                <div class="list_price">
                                                    <span id="price">${list.price } [10%할인]  </span> <span style="font-size: 11px"> |</span> <span id="point">500p [5%] 적립</span>
                                                </div>
                                                <div class="list_intro">${list.intro}</div>
                                                <div class="rating">★★★★★</div>
                                                <div class="order"><span id ="gray">[당일배송]</span>
                                                <span id="blue">지금 주문하면</span> <span id="blue" style="font-weight: bold">오늘</span> <span id="blue">도착 예정</span>
                                                </div>
                                            </div>
                                            <div class="list_button">
                                                    <button id="btn_cart" >장바구니</button>
                                                    <button id ="btn_buy">바로구매</button>
                                            </div>
                                            <div class="clearfix"></div>    

                                    </div>
                                    </c:if>
                                </c:forEach>
                                </c:if>
                     <c:if test="${list.size() > 0}">      
					<div 	class="col-md-offset-3">
						<ul class="pagination">
							<c:if test="${pc.prev}">
								<li><a href="bookListNew?c=${param.c}&t=${param.t}&page=${pc.startPage - 1}&countPerPage=${pc.paging.countPerPage}">이전</a></li>
							</c:if> 
							
							<c:forEach begin="${pc.startPage}" end="${pc.endPage}" var="idx">
								<li <c:out value="${pc.paging.page == idx ? 'class=active' : ''}" />>
								<a href="bookListNew?c=${param.c}&t=${param.t}&page=${idx}&countPerPage=${pc.paging.countPerPage}">${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pc.next && pc.endPage > 0}">
								<li><a href="bookListNew?c=${param.c}&t=${param.t}&page=${pc.endPage + 1}&countPerPage=${pc.paging.countPerPage}">다음</a></li>
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
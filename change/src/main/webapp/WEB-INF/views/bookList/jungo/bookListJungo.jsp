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
<link rel="stylesheet" href="resources/css/bookList/jungo/bookListJungo.css">
</head>
<body>


						
    <%@include file="../../include/jungoheader.jsp" %>	
    
    			
		<div class="content_area">
		
    		<%@include file="../../include/jungo_nav.jsp" %>   
    					 
    		 <%@include file="../../include/asideJungo.jsp" %>	
						  <div class ="content">
                            <div id ="main_box">
		  <form role="form" method="get">    
		 
		 						<c:if test="${list.size() <= 0}">
		 						<div class="nosearch">
							<span id="no_search">책이 없습니다</span>
								</div>
								</c:if>
						<c:if test="${list.size() > 0}">
                   <c:forEach items="${list}" var="list">
                                    <div class="booklist">
                                            <div class="list_image">
                                                 <img id="list_image" src="${list.jimg }">
                                            </div>
                                            <div class="list_detail">
                                               <a href="/jungoview?JbookNum=${list.jbookNum}&c=${param.c}&t=${param.t}&page=${pc.paging.page}&countPerPage=${pc.paging.countPerPage}" id="title">${list.jsubject}</a> <span id="catenamed">	&#91;${list.cateName}&#93;</span><span id="jungo_desc">${list.id} 님의 중고도서</span>                                   
                                                <div class="list_etc"> <span id="gray">${list.jauthor } |</span> <span id="gray"> ${list.jpublisher } |</span> 
                                                <span id="gray"><fmt:formatDate value="${list.jpublishDate}" pattern="yyyy-MM-dd"/>
                                                </span>
                                                </div>
                                                <div class="list_price">
                                                    <span id="price">${list.jprice } [10%할인]  </span> <span style="font-size: 11px"> |</span> <span id="point">500p [5%] 적립</span>
                                                </div>
                                                <div class="list_intro">${list.jintro}</div>
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
                                </c:forEach>
                                </c:if>
                     <c:if test="${list.size() > 0}">      
					<div 	class="col-md-offset-3">
						<ul class="pagination">
							<c:if test="${pc.prev}">
								<li><a href="bookListJungo?c=${param.c}&t=${param.t}&page=${pc.startPage - 1}&countPerPage=${pc.paging.countPerPage}">이전</a></li>
							</c:if> 
							
							<c:forEach begin="${pc.startPage}" end="${pc.endPage}" var="idx">
								<li <c:out value="${pc.paging.page == idx ? 'class=active' : ''}" />>
								<a href="bookListJungo?c=${param.c}&t=${param.t}&page=${idx}&countPerPage=${pc.paging.countPerPage}">${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pc.next && pc.endPage > 0}">
								<li><a href="bookListJungo?c=${param.c}&t=${param.t}&page=${pc.endPage + 1}&countPerPage=${pc.paging.countPerPage}">다음</a></li>
							</c:if> 
						</ul>
					</div>
					</c:if>

                            	
                   </form>         	
                            
                            
                            
                            
                            
                            
                            
                            
                            </div> 
                        </div>
                <div class="clearfix"></div>  

		</div>


    <%@include file="../../include/footer.jsp" %>	



<script>
$(document).ready(function(){
	
    
		
		//검색 버튼 이벤트 처리
		$("#searchBtn").click(function() {
			const keyword = $("#keywordInput").val();
			const condition = $("#condition option:selected").val();
			location.href="jungoSearch?page=1&countPerPage="+${search.countPerPage} + "&keyword=" + keyword + "&condition="+condition;						
		}); 


//엔터키 입력 이벤트
$("#keywordInput").keydown(function (key) {
	 
       if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
       	$("#searchBtn").click();
       }

   });		


	
	
    	
	let eResult = '<c:out value="${enroll_result}"/>';
	
	checkResult(eResult);
	
	function checkResult(result){
		
		if(result === ''){
			return;
		}
		
		alert("상품'"+ eResult +"'을 등록하였습니다.");
		
    	}

	
	  const msg = "${msg}";
	  if(msg === "deleteSuccess") {
	  	alert("삭제 완료!");
	  }	    
	
    });
   </script>
</body>
</html>
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
<link rel="stylesheet" href="resources/css/bookList/jungo/sellerPage.css">
</head>
<body>


						
    <%@include file="../../include/jungoheader.jsp" %>	
    
    			
		<div class="content_area">
		
		
    		<%@include file="../../include/jungo_nav.jsp" %>   
                        
                        
						  <div class ="content">
                            <div id ="main_box">
                            	
                              <div class="p_intro">
                                    <div class="p_intro_detail">
                                            <span id="seller"><%out.print(session.getAttribute("id") + "님"); %>	</span>
                                            <div class="p_detailSum">
                                                <div class="p_detail_1">
                                                    <span>판매등급</span>
                                                    <span>판매자 구분</span>
                                                    <span>구매만족도</span>
                                                    <span>평균출고일</span>
                                                    <span>품절통보율</span>
                                                    <span>---------</span>
                                                    <span>구매후기</span>
                                                    <span>1:1문의</span>
                                                </div>
                                                <div class="p_detail_2">
                                                    <span>새싹</span>
                                                    <span>일반</span>
                                                    <span>★★★★★</span>
                                                    <span>1일이내</span>
                                                    <span>0%</span>
                                                    <span>---------</span>
                                                    <span>0건</span>
                                                    <span>0건</span>                                                    
                                                </div>
                                            </div>
                                    </div>
                               </div>

                               <div class="p_content">
                                    <div class="p_content_detail">
                                            <div class="c_detail1">
                                                <div class="c_detail1_first_p">
                                                    <span>판매관리</span>
                                                </div>
                                                
												<div class="c_detail1_first">
                                                    <span></span>
                                                </div>
                                                
                                                <div class="c_detail1_first">
                                                    <span></span>
                                                </div>
                                                
                                                <div class="c_detail1_first_p">
                                                    <span></span>
                                                </div>
                                                
                                                 <div class="c_detail1_two_p">
                                                    <span>취소/반품 관리</span>
                                                </div>
                                                
                                                 <div class="c_detail1_two">
                                                    <span></span>
                                                </div>
                                                
                                                 <div class="c_detail1_two">
                                                    <span></span>
                                                </div>

                                            </div>
                                            <div class="c_detail2">
                                                <div class="c_detail2_first">
                                                    <span>등록상품</span> <span id="c_detail2_first_gun">${uc}건</span><a id = jungo_register href="/jungoregister">상품 등록하기</a>
                                                </div>
                                                
                                                <div class="c_detail2_first">
                                                    <span>주문확인요청</span> <span id="c_detail2_first_gun">0 건</span>
                                                </div>
                                                
                                                <div class="c_detail2_first">
                                                    <span>배송요청(신규)</span> <span id="c_detail2_first_gun">0 건</span>
                                                </div>
                                                
                                                <div class="c_detail2_first">
                                                    <span>배송진행 중</span> <span id="c_detail2_first_gun">0 건</span>
                                                </div>
                                                
                                                <div class="c_detail2_first">
                                                    <span>주문취소</span> <span id="c_detail2_first_gun">0 건</span>
                                                </div>
                                                
                                                <div class="c_detail2_first">
                                                    <span>반품요청</span> <span id="c_detail2_first_gun">0 건</span>
                                                </div>
                                                
                                                <div class="c_detail2_first">
                                                    <span>반품처리</span> <span id="c_detail2_first_gun">0 건</span>
                                                </div>
                                            </div>
                                             <div class="clearfix"></div>    
                                    
                                    </div>
                                    

                               </div>
                            
                            
                            
                            
                            
                            
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

 });
   </script>
</body>
</html>
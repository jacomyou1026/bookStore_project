<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
	//리뷰삭제
	function review_delete(step, num){  
			
			if(!confirm("리뷰를 삭제하시겠습니까?")){
				alert(step);
				alert(num);
				
				return;
			}
			
			var url="review_delete.do";
			var param="step="+step+"&reviewNum="+num;
			sendRequest(url,param,result_deletefn,"post");
	
	} 
	//리뷰삭제
	function result_deletefn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			
			if(data=="no"){
				alert("관리자에게 문의하세요.");
				return;
			}
			if(data=="yes1"){
				alert("삭제가 완료되었습니다.");
				location.href="bookDetail.do?num=${book_vo.bookNum}"; 
			}
			if(data=="yes2"){
				alert("대댓글까지 모두 삭제되었습니다.");
				location.href="bookDetail.do?num=${book_vo.bookNum}"; 
			}
		}
	} 
	
	//대댓글 창
	function comment(a){
		var review_div = document.getElementById("nonComment"+a);
		if(review_div.style.display =='none')
			review_div.style.display = 'block';
		else if(review_div.style.display == 'block')
			review_div.style.display ='none';	 
		
	}
	
	//댓글 수정 textarea
	 function review_update_form(a){
		var review_pre = document.getElementById("pre_comment"+a);
		var review_textarea = document.getElementById("textarea_comment"+a);
		var up_form_btn = document.getElementById("up_form_btn"+a);
		var up_btn = document.getElementById("up_btn"+a);
		var delete_btn = document.getElementById("delete_btn"+a);
		var comment_btn = document.getElementById("comment_btn"+a);
		
			review_pre.style.display ='none';	
			review_textarea.style.display ='block';	
			
			up_btn.style.display ='block';	
			up_form_btn.style.display ='none';
			delete_btn.style.display ='none';
			comment_btn.style.display ='none';	
	}
	 
	//리뷰 수정하기
	function review_update(num){  
		
		var update_text = document.getElementById("textarea_comment"+num).value;
		
		if(confirm("리뷰를 수정하시겠습니까?")){
			if(update_text=="") {
				alert("리뷰를 작성하세요.");
				return;
			}
			var url="review_update.do";
			var param="reviewNum="+num+"&update_text="+update_text;
			sendRequest(url,param,result_updatefn,"post");

		}
		
		
	} 
	//리뷰수정
	function result_updatefn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			
			if(data=="no"){
				alert("관리자에게 문의하세요.");
				return;
			}
			if(data=="yes1"){
				location.href="bookDetail.do?num=${book_vo.bookNum}"; 
			}
			if(data=="yes2"){
				location.href="bookDetail.do?num=${book_vo.bookNum}"; 
			}
		}
	} 

</script>
	<style>
		a{text-decoration: none;}
	</style>
	<div class="rievew_all">
		<h2>회원리뷰</h2>
		<%@include file="review_write.jsp" %>	
		<ul class="board_list">
				<li>
					<c:if test="${review_list ne null}">
					<c:forEach var="vo" items="${review_list}" varStatus="a">
						<input type="hidden" name="check" value="${vo.reviewNum }">
						<!-- 대댓글 색상표기 -->
						<div class="comment_wrap"style="<c:if test="${ vo.depth ne 0}">background-color:rgb(247,247,253); float:clear;</c:if>">
						<!-- 댓글 들여쓰기 -->
							<c:forEach begin="1" end="${vo.depth }" >	
								<div style="float:left;">
									&nbsp;ㄴ &nbsp;
								</div>
							</c:forEach>
								
							 <dl class="review_dl">
									<dd class="id">${vo.id}</dd>
									<dd class="date">${vo.regdate}	</dd>
									<dd class="rating"><%@include file="static_star-rating.jsp" %> </dd>
									
									
									<dd id="comment">						
											<pre id="pre_comment${vo.reviewNum}" style="display:block;">${vo.content}</pre>
											<textarea id="textarea_comment${vo.reviewNum}" rows="" cols="" style="display:none;">${vo.content}</textarea>
									</dd>
								
									<c:if test="${vo.id eq id }">
										<dd class="dd_btn"><input type="button" id="up_form_btn${vo.reviewNum}" name="up_form_btn" value="댓글수정" style="display:block;" onclick="review_update_form(${vo.reviewNum});" ></dd>	
										<dd class="dd_btn"><input type="button" id="up_btn${vo.reviewNum}" name="up_btn" value="댓글수정!!" style="display:none;" onclick="review_update(${vo.reviewNum});" ></dd>	
									</c:if>
									<c:if test="${vo.id eq id }">
										<dd class="dd_btn"><input type="button" id="delete_btn${vo.reviewNum}" value="댓글삭제" style="display:block;" onclick="review_delete(${vo.step},${vo.reviewNum});" ></dd>	
									</c:if>
									<c:if test="${vo.rating ne 0 }">
										<dd class="dd_btn">
										 <input type="button" id="comment_btn${vo.reviewNum}" 
										 value="댓글달기" 
										 style="display:block;" 
										 onclick="comment('${vo.reviewNum }');" >
										</dd>	
									</c:if>
								</dl>
							
						</div>
						<!-- 대댓글 창 -->
						<div class="big_comment_wrap">	
								<dl>
									<dd id="nonComment${vo.reviewNum}" style="display:none;padding:10px"> 
										ㄴ ${vo.id}님의 대한 댓글
										<%@include file="review_write.jsp" %>	
									</dd>
								</dl>
						</div>
					</c:forEach>
					</c:if>
				</li>
				<li >
					<div id ="pageMenu" style="text-align:center;">
						${ pageMenu }
					</div>
				</li>
		</ul>
	</div>
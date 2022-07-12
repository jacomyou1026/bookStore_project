<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<script>
		function write2(f){
			var content = f.content.value;
			var vo = f.vo.value;
			var rating = f.rating.value;
			var star_rating = document.getElementsByClassName("star-rating");
			var check = f.check.value;
		
			var uid = '<%=(String)session.getAttribute("id")%>';
			//원 댓글 인덱스
			//var reviewNum = check.value;
			 if(confirm("리뷰를 등록하시겠습니까?")){
					 if(uid=="null"){
						 alert("로그인 후 리뷰를 등록하세요.");
						 return;
					 }
					 
					 if(content=="") {
							alert("리뷰를 작성하세요.");
							return;
						}  
					//댓글일 경우 (대댓글x)
					if(check==0){
						if(rating==""){
							alert("별점을 선택해 주세요.");
							return;
						}
					var url="review_write.do";
					var param="bookNum="+${book_vo.bookNum}+"&id="+uid+"&content="+content+"&rating="+rating;
					sendRequest(url,param,resultfn,"post");
				
					}
					//대댓글일 경우
					 else{
						var url="comment_write.do";
						var param="bookNum="+${book_vo.bookNum}+"&id="+uid+"&content="+content+"&rating="+rating+"&reviewNum="+check;
						sendRequest(url,param,resultfn,"post");
					} 
				
			 }
		}
		
		 function resultfn(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				
				if(data=="no"){
					alert("관리자에게 문의하세요.");
					return;
				}
				
				location.href="bookDetail.do?num=${book_vo.bookNum}"; 
			}

		} 
	</script>
<body>
	<form>
			<input type="hidden" name="check" value="${vo.reviewNum }">
			<input type="hidden" name="vo" value="${book_vo}">
			<input type="hidden" name="id" value="${id}">
			<div class="review_write_box">
				<div class="profile_box">
					<span id="id_box">${id}</span>
					<%@include file="dynamic_star-rating.jsp" %>
				</div>
				<div>
					<textarea name="content" rows="4" placeholder="<c:if test="${ id eq null}">로그인 후 리뷰를 작성 하세요.</c:if><c:if test="${ id ne null}">리뷰를 작성하세요.</c:if>"></textarea>
				</div>
				
				<input type="button" class="review_submit" value="등록" onclick="write2(this.form)">
			</div>
	</form>
</body>
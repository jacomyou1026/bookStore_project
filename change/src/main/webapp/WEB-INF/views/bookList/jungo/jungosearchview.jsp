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
<link rel="stylesheet" href="resources/css/bookList/jungo/jungoview.css">
<link rel="stylesheet" href="resources/css/bookList/jungo/jungoreply.css">

   <script> 
  function replyList(){
 var JbookNum = ${jungobook.jbookNum};
 $.getJSON("/jungoreplyList" + "?JbookNum=" + JbookNum, function(data){
  var str = "";
  
  $(data).each(function(){
   
   console.log(data);
   
   var JreplyRegdate = new Date(this.jreplyRegdate);
   JreplyRegdate = JreplyRegdate.toLocaleDateString("ko-US")
   
   str += "<li data-rno='" + this.jrno + "'>"
     + "<div class='userInfo'>"
     + "<span class='memberId'>" + this.id + "님의 댓글</span>"
     + "<span class='date'>" + JreplyRegdate + "</span>"
     + "</div>"
     + "<div class='replyContentDiv'>" + this.jreplyContent + "</div>"
     + "<div class='replyButtonDiv'>"
     + "<button type='button' class='modify' data-rno='" + this.jrno + "'>수정</button>"
     + "<button type='button' class='delete' data-rno='" + this.jrno + "'>삭제</button>"
     + "</div>"
     + "</li>";           
  });
  
  $(".replyList ol").html(str);
 });
  }
</script>  
</head>
<body>


						
    <%@include file="../../include/jungoheader.jsp" %>	
    
    			
		<div class="content_area">
		
    		<%@include file="../../include/jungo_nav.jsp" %>   
    					 
    		 <%@include file="../../include/asideJungo.jsp" %>	
						  <div class ="content">
                            <div id ="main_box">
                            
						<form role="form" method="post" autocomplete="off" name="contentForm">
					<input type="hidden" id="JbookNum" name="JbookNum" value="${jungobook.jbookNum}" />
					<input type="hidden" id="page" name="page" value="${search.page}"> 
  					<input type="hidden" id="countPerPage" name="countPerPage" value="${search.countPerPage}"> 
    				<input type="hidden" id="c" name="c" value="${param.c}">
    				<input type="hidden" id="t" name="t" value="${param.t}">					 
                                    <div class="jungo_view">
                                            <div class="view_image">
                                                <img src="${jungobook.jimg }" id = "view_image_id" >
                                            </div>
                                            <div class="view_content">
                                                        <div class="view_area">
                                                            <span id="view_subject">${jungobook.jsubject}</span>
                                                        </div>
                                                        <div class="view_area">  
                                                            <span id="view_3">${jungobook.jauthor}</span><span>|</span> 
                                                            <span id="view_3">${jungobook.jpublisher}</span><span>|</span>
                                        				<span id="view_3"><fmt:formatDate value="${jungobook.jpublishDate}" pattern="yyyy-MM-dd"/></span>	 
                                                        </div>
                                                        <div class="view_area"> 
																<span id="view_subject_desc">판매자 : ${jungobook.id} 님</span>
														</div>
                                                        <div class="view_area">    
                                                        <span id="view_price"><fmt:formatNumber pattern="###,###,###" value="${jungobook.jprice }" /> 원</span>
                                                        </div>    
                                                         <div class="view_area">   
                                                        <span id="view_stock">재고 : <fmt:formatNumber pattern="###,###,###" value="${jungobook.jstock }" /> 개</span>
                                                         </div>
                                                        <div class="view_area">   
                                                            <span id="view_count">구입 수량   </span>                                                    
                                                         <button type="button" class="plus">+</button>
                                                         <input type="number" class="numBox" min="1" max="${jungobook.jstock}" value="1" readonly="readonly"/>
                                                         <button type="button" class="minus">-</button> 
                                                         </div>
                                                         
                                                         
                                                </div>

                                                  <div class="clearfix"></div>
														<div class="intro_box">
															<span>상품정보</span>
														</div>
                                                        <div class="view_intro">  
                                                            <span id="view_intro_detail">${jungobook.jintro}</span>
                                                        </div>
                                                        <div class="view_purchase">
                                                                <div class="list_button">
                                                                        <button id="btn_cart" >장바구니</button>
                                                                        <button id ="btn_buy">바로구매</button>
                                                                </div>
                                                        </div>

                                    </div>   
                                    
                                                  <div class="jungo_button_area">
												          <c:if test="${id == jungobook.id}">
                                                           <button type="button" class="mf_Btn"id="modify_Btn" >수정</button>
                                                           <button type="button" class="mf_Btn" id="delete_Btn" >삭제</button>
                                                          </c:if> 
                                                           <button type="button" class="mf_Btn" id="cancel_Btn" 
                                                           onclick="location.href= '/jungoSearch?page=${search.page}&countPerPage=${search.countPerPage}&keyword=${search.keyword}&condition=${search.condition}';">목록</button> 
                                                  </div>       
                                                  
                                                  
                                                  
                                                  
                                                  
                                                                   
					</form>	
                <div class="clearfix"></div>
                <div class="cross-line"></div>                            
<div id="reply">

 
 <c:if test="${id != null}">
 <div class="replyForm">
  <form role="form" method="post" autocomplete="off">
  
  <input type="hidden" name="JbookNum" id="JbookNum"value="${jungobook.jbookNum}">
   <div class="rep1">
    <textarea name="JreplyContent" id="JreplyContent"></textarea>
   </div>
   <div class="rep2">
    <button type="button" id="reply_btn">댓글등록</button>
   </div>
   
  </form>
 </div>
 </c:if>
 
<div class="replyList">
 <ol>
   
  </ol>
  <script>
 replyList();
</script>


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
					
					

						

// 상품 수량정하기
   $(".plus").click(function(){
    var num = $(".numBox").val();
    var plusNum = Number(num) + 1;
    
    if(plusNum > "${jungobook.jstock}") {
     $(".numBox").val(num);
    } else {
     $(".numBox").val(plusNum);          
    }
   });
   
   $(".minus").click(function(){
    var num = $(".numBox").val();
    var minusNum = Number(num) - 1;
    
    if(minusNum <= 0) {
     $(".numBox").val(num);
    } else {
     $(".numBox").val(minusNum);          
    }
   });
				    

 

   $("#delete_Btn").click(function(){
		var formObj = $("form[name='contentForm']");
  var con = confirm("정말로 삭제하시겠습니까?");
  
  if(con) {      
   formObj.attr("action", "/jungosearchdelete");
   formObj.submit();
  }
 });  

  
  $("#modify_Btn").click(function(){
		var formObj = $("form[name='contentForm']");  
   formObj.attr("action", "/jungosearchmodify");
   formObj.attr("method", "get")
   formObj.submit();
  });
  

	
  const msg = "${msg}";
  if(msg === "modifySuccess") {
  	alert("상품 수정 완료!");
  }	   
	
  if(msg === "deletefail") {
  	alert("작성자 본인만 삭제 가능합니다");
  }	   

  if(msg === "modifyfail") {
	  	alert("작성자 본인만 수정 가능합니다");
	  }	    
  
  

  $("#reply_btn").click(function(){
   
   var formObj = $(".replyForm form[role='form']");
   var JbookNum = $("#JbookNum").val();
   var JreplyContent = $("#JreplyContent").val();
   var data = {
		   JbookNum : JbookNum,
 	 JreplyContent : JreplyContent
     };
   
   $.ajax({
    url : "/jungoregistReply",
    type : "post",
    data : data,
    success : function(){
 	   alert("댓글 작성 완료")
     replyList();
     $("#JreplyContent").val("");

    }
   });
  });
  $(document).on("click", ".delete", function(){
	  
		 var dconfirm = confirm("정말로 삭제 하시겠습니까?");
		 if (dconfirm){
	  var data = {Jrno : $(this).attr("data-rno")};
		  $.ajax({
			  url : "/jungodeleteReply",
			  type : "post",
			  data : data,
			  success : function(result){
			   
			   if(result == 1) {
			    replyList();
			    alert("댓글 삭제 완료")
			   } else {
			    alert("작성자 본인만 할 수 있습니다.");    
			   }
			  },
			  error : function(){
			   alert("로그인이 필요합니다.")
			  }
			 });
		 }
	 });
 	
 });
 </script>
	 <div class="replyModal">

 <div class="modalContent">
  
  <div>
   <textarea class="modal_repCon" name="modal_repCon"></textarea>
  </div>
  
  <div>
   <button type="button" class="modal_modify_btn">수정</button>
   <button type="button" class="modal_cancel">취소</button>
  </div>
  
 </div>

 <div class="modalBackground"></div>
 
</div>
<script>
// 댓글  수정


$(document).on("click", ".modify", function(){
	 $(".replyModal").attr("style", "display:block;");
	 
	 var Jrno = $(this).attr("data-rno");
	 var JreplyContent = $(this).parent().parent().children(".replyContentDiv").text();
	 
	 $(".modal_repCon").val(JreplyContent);
	 $(".modal_modify_btn").attr("data-rno", Jrno);
	 

	 
	});



$(".modal_cancel").click(function(){
$(".replyModal").attr("style", "display:none;");
});



$(".modal_modify_btn").click(function(){
var modifyConfirm = confirm("정말로 수정하시겠습니까?");
if(modifyConfirm) {
 var data = {
    Jrno : $(this).attr("data-rno"),
    JreplyContent : $(".modal_repCon").val()
   };  // ReplyVO 형태로 데이터 생성
 $.ajax({
  url : "/jungomodifyReply",
  type : "post",
  data : data,
  success : function(result){
   
   if(result == 1) {
    replyList();
    $(".replyModal").attr("style", "display:none;");
    	alert("댓글 수정 완료!");
   } else {
    alert("작성자 본인만 할 수 있습니다.");       
   }
  },
  error : function(){
   alert("로그인하셔야합니다.")
  }
 });
}

});



</script>			    
</body>
</html>
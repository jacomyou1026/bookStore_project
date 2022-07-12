<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>


/* 검색 박스 영역 */
.search_area{
	width: 50%;
	height: 100%;
	float:left;	
}


.search_select{
	float: left;

	width: 20%;
	height: 100%;

}
#condition{
	display: block;
	width: 70px;
	height: 45px;
	margin-top: 50px;
	margin-left:70px;
}
.search_content{
	float: left;
	width: 80%;
	height: 100%;

}
.search_box{
	margin-top: 50px;
	width: 378px;
	height: 45px;
border: 1px solid #1b5ac2;

}



#keywordInput{
	font-size: 16px;
	width: 320px;
	padding: 10px;
	border: 0px;
	outline: none;
	float: left;
	height : 43px;
}

#searchBtn{
	width: 50px;
	height: 43px;
	border: 0px;
	background :#6482FF;
	outline: none;
	float: right;
	color: #ffffff;

}
</style>





<div class="wrapper" style="overflow: auto;">
	<div class="wrap">

		<%@include file="nav.jsp"%>
		<div class="top_area">
			<div class="logo_area">
				<a href="/main.do"> 
					<img src="${pageContext.request.contextPath}/resources/img/Logo.jpg">
				</a>
			</div>
			<div class="search_area">
							
							 
				<div class="search_select">
					   <select id="condition"  name="condition" style="width:100px; text-align:center; background-color:#6478FF; color:white;">    
						   <option style="color:white;"value="subject" ${param.condition == 'subject' ? 'selected' : ''}>제목</option>
						   <option style="color:white;"value="publisher" ${param.condition == 'publisher' ? 'selected' : ''}>출반사</option>
						   <option style="color:white;"value="author" ${param.condition == 'author' ? 'selected' : ''}>지은이</option>
					   </select>
			   </div>
		   
			   <div class="search_content">
							   <div class ="search_box" style="width:600px;">
								   <input type="text" name="keyword" id="keywordInput" value="${param.keyword}"  placeholder="검색어 입력">
								   <button id="searchBtn"  type="button">검색</button>
							   </div>
			   </div>
		   
   
		</div>
	</div>
</div>


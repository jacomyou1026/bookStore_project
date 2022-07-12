<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>Insert subject here</title>
	
	<!-- Ajax사용을 위한 준비 -->
	<script src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
	
	
	<script>
		
/* 		window.onload=function(){
			//현재 페이지가 로드되면 자동으로 가장 실행되는 메서드 
			//body보다 먼저 호출됨
			testApi();
			
		} */
	 
		function testApi(){
			var url="https://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbskgusslarj1715002&QueryType=ItemNewAll&MaxResults=100&start=1&SearchTarget=Foreign&output=js&Version=20131101&Cover=Big&outofStockfilter=1"+
					"&CategoryId=51065";
			var param="";
			sendRequest(url,param,resultFn,"get");
			
			
		}
		
		//콜백
		function resultFn(){

			
			if(xhr.readyState==4 && xhr.status==200){
				
				var data=xhr.responseText;
				//외부에서 가지고온 json은 배열로 묶여있지 않으면 처리를 잘 못함	
				var json = eval("["+data+"]"); //배열형태 만들어주기
				
				var subject =json[0].item[2].title;
				var author =json[0].item[2].author;
				var publishDate =json[0].item[2].pubDate;
				var stock =json[0].item[2].stockStatus;
				var categoryNum =json[0].item[2].categoryId;
				var publisher =json[0].item[2].publisher;
				var img = json[0].item[2].cover;
				var price =json[0].item[2].priceStandard;
				var intro =json[0].item[2].description;
				
				//카테고리 번호 수정
				categoryNum = 101005;
					
				// 날짜 db에 맞게 조정
				publishDate = publishDate.replace(/\-/g,'/');
				console.log(Object.keys(json[0].item).length);				
				if(stock =="")
					{
					stock=20;
					}
				
				
				$('input[name=subject]').attr('value',subject);
				$('input[name=author]').attr('value',author);
				$('input[name=publishDate]').attr('value',publishDate);
				$('input[name=stock]').attr('value',stock);
				$('input[name=categoryNum]').attr('value',categoryNum);
				$('input[name=publisher]').attr('value',publisher);
				$('input[name=price]').attr('value',price);
				$('input[name=img]').attr('value',img);				
				$('input[name=intro]').attr('value',intro);		
			
				var formObj = $("form[name='writeForm']");
				$(".write_btn").on("click", function(){
					formObj.attr("action", "/write");
					formObj.attr("method", "post");
					formObj.submit();
					
				
				});
				
			}
		}
		

	</script>
</head>
<body>
	
	
	
					<form name="writeForm" method="post" action="/write" id="writeForm">
					<table>
						<tbody>
						
							<tr>
								<td>
									<label for="subject">제목</label><input type="text" name="subject" id="subject"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="author">작가</label><input type="text" id="author" name="author"  />
								</td>
							</tr>
							<tr>
								<td>
									<label for="publishDate">출판일</label><input type="text" id="publishDate" name="publishDate"  />
								</td>
							</tr>
							<tr>
								<td>
									<label for="intro">책소개</label><input type="text" id="intro" name="intro"  />
								</td>
							</tr>
							<tr>
								<td>
									<label for="stock">재고</label><input type="text" id="stock" name="stock"  />
								</td>
							</tr>
							<tr>
								<td>
									<label for="">카테고리번호</label><input type="text" id="categoryNum" name="categoryNum"  />
								</td>
							</tr>
							<tr>
								<td>
									<label for="">가격</label><input type="text" id="price" name="price"  />
								</td>
							</tr>
							<tr>
								<td>
									<label for="">출판사</label><input type="text" id="publisher" name="publisher"  />
								</td>
							</tr>							
								
							<tr>
								<td>
									<label for="">이미지</label><input type="text" id="img" name="img"  />
								</td>
							</tr>	


							<tr>
								<td>						
									<button class="write_btn" type="submit">작성</button>
								</td>
							</tr>
						
						</tbody>			
					</table>
				</form>
	<button type="button" onclick="location.href='bookList1?c=100000&t=1';">국내도서확인하기</button>
	<button type="button" onclick="location.href='bookList1?c=200000&t=1';">외국도서확인하기</button>
	<button type="button" onclick="location.href='bookList1?c=300000&t=1';">신간도서확인하기</button>
	<button type="button" onclick="location.href='bookList1?c=400000&t=1';">베스트셀러도서확인하기</button>		
	<script>
		
		
		testApi();
		
/* 		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function(){
			console.log(a);
			formObj.attr("action", "/write");
			formObj.attr("method", "post");
			formObj.submit();
		});
		 */
		
		
		
		
	</script>
</body>
</html> 
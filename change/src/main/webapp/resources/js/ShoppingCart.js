/**
 * 
 */
	
 /**
 * 
 */
 
  
  	/* stock가지고와서 해야함 */
	  function cntup(upcnts,up,stock){
		var upcnt = document.getElementById(upcnts);
 
	   var intstock = parseInt(stock);
 
		if(upcnt.value>intstock ){
 
			 alert('재고가 없습니다.');
			 return;
		 }
		 
		upcnt.value++;
 
	 } 
 
	 function cntdown(down){
		 var cnt = document.getElementById(down);
		 
		 if(cnt.value<=1){
			 alert('수량을 확인해주세요');
			 return;
		 }
		 cnt.value--;
	 }  
 

   

function changeCnt(cnt,num){
	var	bookCnt = document.getElementById(cnt).value;
	var url = "UpdateCnt.do";
	var param ="bookCnt="+bookCnt+"&shopnum="+num;


	sendRequest(url,param,changeResult,"POST");
}



function changeResult(){
		if(xhr.readyState ==4 && xhr.status ==200){
			var data = xhr.responseText;
			if(data ==1){
				alert('수량변경 성공');
			
			}else{
				alert('변경 실패, 관리자에게 문의하세요');
			}
			
			location.href='shoppingCart.do';
		}	
	}


	
	//체크한 장바구니 상품 비우기
		 function checkdel(){

			var valueArr = new Array();
			 var list =$('.individual_cart_checkbox');
			for (let i = 0; i < list.length; i++) {
				if(list[i].checked){
					valueArr.push(list[i].value);
				}
			} 
							


			if(valueArr.length == 0){
				alert('선택된 상품이 없습니다.');
			}
			if(!confirm('삭제하겠습니까?')){
					return;
				}
			var url = "checkdel.do";

				$.ajax({
				    url : url,                    // 전송 URL
				    type : 'POST',                // GET or POST 방식
				    traditional : true,
				    data : {
				    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
				    },
	                success: function(jdata){
	                    if(jdata = 1) {
	                        alert("삭제 성공");
	                        location.replace("shoppingCart.do")
	                    }
	                    else{
	                        alert("삭제 실패");
	                    }
	                }
				});


			}

		
		//삭제하나
		function delone(num){
			
			if(!confirm("삭제 하시겠습니까?")){
				return;
			}
				var url = "delone.do";
				var param ="shopnum="+num;
				sendRequest(url,param,delOneResult,"POST");
		}


		function delOneResult(){
			if(xhr.readyState ==4 && xhr.status ==200){
				var data = xhr.responseText;
				if(data ==1){
					alert('삭제 성공');
					
				}else{ 
					alert('삭제 실패, 관리자에게 문의하세요');
				}
				
				location.href="shoppingCart.do";
			}	
		}
	 
		function payone(f){
			f.action = "payone.do";
			f.submit();
		}

		

		function checkorder(){
			let form_contents ='';
			let orderNumber = 0;

		
			
			$(".cart_info").each(function(index, element) {

				if($(element).find(".individual_cart_checkbox").is(":checked") === true){
					//price,subject
					let shopnum = $(element).find(".individual_shopnum_input").val();
					let id = $(element).find(".individual_id_input").val();
					let bookNum = $(element).find(".individual_booknum_input").val();
					
					let bookCnt = $(element).find(".individual_bookCnt_input").val();
					let price  = $(element).find(".bookprice_input").val();
					let  subject = $(element).find(".individual_subject").val();





					let id_input = 	"<input name='orders[" + orderNumber + "].id' type='hidden' value='" + id + "'>";
					form_contents += id_input;

					let shopnum_input = "<input name='orders[" + orderNumber + "].shopnum' type='hidden' value='" + shopnum + "'>";
				
					form_contents += shopnum_input;

					let booknum_input = "<input name='orders[" + orderNumber + "].bookNum' type='hidden' value='" + bookNum + "'>";
					form_contents += booknum_input;

					let bookCnt_input = "<input name='orders[" + orderNumber + "].bookCnt' type='hidden' value='" + bookCnt + "'>";
					form_contents += bookCnt_input;

					let price_input = "<input name='orders[" + orderNumber + "].price' type='hidden' value='" + price + "'>";
					form_contents += price_input;

					let subject_input = "<input name='orders[" + orderNumber + "].subject' type='hidden' value='" + subject + "'>";
					form_contents += subject_input;

 
					 orderNumber+=1; 
					
				

				}
			});

			
			$(".order_form").html(form_contents);
			$(".order_form").submit();

		}
	

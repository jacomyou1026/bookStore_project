<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page session="false" %>

        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Insert title here</title>
                <link rel="stylesheet" type="text/css"
                    href="${ pageContext.request.contextPath }/resources/css/detail.css">
                <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

                <script>


                    $(document).ready(function () {
                        /* 주문 조합정보란 최신화 */
                        setTotalInfo();

                    });

                    function setTotalInfo() {

                        let totalPrice = 0;				// 총 가격
                        let totalCount = 0;				// 총 갯수
                        let totalKind = 0;				// 총 종류
                        let totalPoint = 0;				// 총 마일리지
                        let usePoint = 0;				// 사용 포인트(할인가격)
                        let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)	

                        $(".cart_info").each(function (index, element) {

                            /* 총 갯수 */
                            totalCount = document.getElementsByClassName('tr_back').length;

                            totalPrice += parseInt($(element).find(".totalpriceinput").val());
                            console.log(totalPrice+ "통합");




                            // 총 종류
                            totalKind += 1;



                        })
                        if ( totalPrice>= 30000) {
						deliveryPrice = 0;
						} else {
							deliveryPrice = 3000;
						} 

                        finalTotalPrice = totalPrice+deliveryPrice - ${delivery.usePoint};



                        // 총 갯수
                        $(".totalCount_span").text(totalCount);

                        // 총 종류
                        $(".totalKind_span").text(totalKind);

                        $(".totalPrice_span").text(totalPrice.toLocaleString());

						$(".delivery_price").text(deliveryPrice);

                        $(".conten_2").text(finalTotalPrice);



                    }

            


                </script>

            </head>

            <body>
                <div class="view">
                    <span>주문내역상세보기</span>
                </div>
                <div class="list">
                    <span>주문상품내역</span>
                    <span style="    color: red;" class="totalKind_span"></span>종
                    <span style="    color: red;" class="totalCount_span"></span>개
                </div>
                <div>
                    <table style="   width: 100%;
        margin-top: 20px; overflow: auto;">
                        <tr class="head_table">
                            <th>날짜</th>
                            <th>주문자</th>
                            <th style="    padding: 7px; ">상품정보</th>
                            <th>수량</th>
                            <th>상품금액</th>
                            <th>합계</th>
                            <th>배송 정보</th>
                        </tr>
                        <c:forEach var="vo" items="${order}">
                            <tr class="tr_back">
                                        <span class="cart_info">
                                        <input type="hidden" value="${vo.totalPrice}" class="totalpriceinput">
                                        <td>${date}</td>
                                        <td>${delivery.addressee}</td>
                                        <td style=" padding: 9px;">
                                            <input type="hidden" class="bookCount_input" value="${vo.bookcnt }">
                                        </span>
                                            <div>${vo.subject} </div>
                                            <div>${vo.author}</div>
                                            <div>${vo.publishdate}</div>
                                            <div>${vo.publisher}</div>
                                        </td>
                                        
                                        <td> ${vo.bookcnt }</td>
                                        
                                    <td>
                                        <fmt:formatNumber type="number" maxFractionDigits="0" value="${vo.price* 0.9}" />
                                    </td>
                                    <td> ${vo.totalPrice }</td>
                                    <td> 배송중</td>
                                </tr>
                            </c:forEach>
                    </table>
                    <div class="contetent_back">
                        <span class="conten_1">
                            (총 주문금액 
                            <span class="totalPrice_span"></span> )+ (배송료 :<span class="delivery_price"></span> ) - (할인금액
                            :${delivery.usePoint}) =

                        </span>
                        <span class="conten_2"></span>원
                    </div>
                </div>
            </body>

            </html>`
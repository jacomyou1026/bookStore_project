<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Insert title here</title>
                <link rel="stylesheet" type="text/css"
                    href="${ pageContext.request.contextPath }/resources/css/openMyPage.css">
                <link rel="stylesheet" href="my.css">
                <link rel="stylesheet" type="text/css"
                    href="${ pageContext.request.contextPath }/resources/css/font-awesome.min.css">
                <link rel="stylesheet" href="my.css">
                <link rel="preconnect" href="https://fonts.googleapis.com">

                <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css"
                    integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw=="
                    crossorigin="anonymous" referrerpolicy="no-referrer" />

                <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500;700&display=swap"
                    rel="stylesheet">
                <script type="text/javascript"
                    src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
                <script src="https://code.jquery.com/jquery-3.6.0.slim.js"
                    integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
                <script src="https://kit.fontawesome.com/4c1ea28292.js" crossorigin="anonymous"></script>


                <script>


                    $(document).ready(function (e) {
                        mergeRowspan("orderdel");
                        mergeRowspan("orderstate");

                    });


                    function mergeRowspan(className) {
                        $("." + className).each(function () {
                            var rows = $("." + className + ":contains('" + $(this).text() + "')");
                            if (rows.length > 1) {
                                rows.eq(0).attr("rowspan", rows.length);
                                rows.not(":eq(0)").remove();
                            }
                        });
                    }




                    $(document).ready(function () {
                        /* 주문 조합정보란 최신화 */
                        setTotalInfo();



                    });

                    function setTotalInfo() {

                        let totalPrice = 0;				// 총 가격
                        let totalCount = 0;				// 총 갯수
                        let totalKind = 0;				// 총 종류
                        let totalPoint = 0;				// 총 마일리지
                        let saleprice = 0;				// 세일금액
                        let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)	
                        let saletotalres = 0; 		// 전체 할인 금액
                        let booksprice = 0; 		// 전체 할인 금액


                        $(".cart_info").each(function (index, element) {

                            totalPrice += parseInt($(element).find(".totalPrice").val());
                            saleprice += parseInt($(element).find(".saleprice").val());

                            //책가격
                            booksprice += parseInt($(element).find(".bookprice").val());
                            console.log(booksprice + "책가격");

                            console.log(totalPrice);

                            /* 총 갯수 */
                            totalCount = document.getElementsByClassName('tr_back').length;
                            // 총 종류
                            totalKind += 1;

                        })

                        usepoint = parseInt($(".usepoint").text());

                        console.log(usepoint);

                        saletotalres = usepoint + saleprice



                        totalPrice + ${ order.deliveryCost };

                        $(".firstorder").text(totalPrice.toLocaleString());


                        //책가격
                        $(".bookspricespan").text(booksprice.toLocaleString());


                        $(".discountres").text(saletotalres.toLocaleString());

                        // 총 갯수
                        $(".totalCount_span").text(totalCount);

                        // 총 종류
                        $(".totalKind_span").text(totalKind);

                        $(".salepriceres").text(saleprice);

                    }




                    function payback(num) {


                        if (!confirm("환불 하시겠습니까?")) {
                            return;
                        }
                        // //할인금액 -- 사용 포인트 원래대로 회수 
                        // // 받은 포인트 회수
                        // //주문 금액 을 교보코인으로 환불


                        var url = "refund.do";
                        var param = "orderId=" + num;
                        sendRequest(url, param, delOneResult, "POST");
                    }

                    function delOneResult() {
                        if (xhr.readyState == 4 && xhr.status == 200) {
                            var data = xhr.responseText;
                            if (data == 'true') {
                                alert('환불되었습니다.');

                            } else {
                                alert('삭제 실패, 관리자에게 문의하세요');
                            }
                            opener.parent.location.reload();
                            window.location.reload();
                        }
                    }

                    function okay() {
                        window.close();
                    }





                </script>

            </head>

            <body>
                <div class="view">
                    <span>주문내역상세보기</span>
                </div>

                <section>

                    <div class="list" style="    font-size: 29px;
                margin-bottom: 15px;
            ">
                        <span class="orderlistfont">주문상품내역</span>
                        <span style="    color: red;" class="totalKind_span">0</span>종
                        <span style="    color: red;" class="totalCount_span">0</span>개
                    </div>
                    <div class="orderhead">
                        <div style="    margin-right: 9%;">
                            <span style="    margin-right: 10px;">주문일자</span>
                            <span>${order.orderDate}</span>
                        </div>
                        <div>
                            <span style="    margin-right: 10px;">주문번호</span>
                            <span class="orderId">${order.orderId}</span>
                        </div>
                    </div>
                    <div>

                        <div style="    margin-top: 9px; 
            ">
                            <span class="delinfo"> 배송지 정보</span>
                            <div class="delivery_info">
                                <div class="delname">
                                    <span>수령인</span>
                                    <span>주소</span>
                                    <span style="width: 70px;">주문 날짜</span>
                                    <span style="    width: 102px;">수령인 연락처</span>
                                </div>
                                <div class="delresult">
                                    <span>${order.addressee}</span>
                                    <span>(${order.memberAddr1}) ${order.memberAddr2} ${order.memberAddr3}</span>
                                    <span>${order.orderDate}</span>
                                    <span>${order.deliverytel1} ${order.deliverytel2} ${order.deliverytel3}</span>
                                </div>
                            </div>
                        </div>
                        <div style="    width: 100%;">
                            <div class="orderlistfonts" style="    margin-top: 9px;">
                                주문 내역
                            </div>
                            <div class=orderdiv>
                                <table border="1px" cellspacing="0" style="border-collapse:collapse;">
                                    <tr>
                                        <td style="width: 395px;">상품정보</td>
                                        <td style="text-align: center; width: 23px;">가격</td>
                                        <td style=" text-align: center;
        
                                           ">배송비</td>
                                        <td style="    padding-right: 0px;
                                               text-align: center;
                                        padding-left: 0;">진행상태</td>
                                    </tr>
                                    <c:forEach var="vo" items="${item}" varStatus="status">
                                        <div class="cart_info">
                                            <div style="display: none;">
                                                <input type="hidden" class="saleprice"
                                                    value="${vo.bookcnt * (vo.price * 0.1)}"><br>
                                                <input type="hidden" class="totalPrice"
                                                    value="${vo.bookcnt * vo.price + order.deliveryCost}"><br>
                                                <input type="hidden" class="bookprice" value="${vo.price}"><br>
                                            </div>
                                            <tr class="tr_back">
                                                <td style="
                                                display: flex;
                                                border: none;
                                                border-bottom: 1px solid ;
                                            ">
                                                    <div>
                                                        <span>
                                                            <img src=${vo.img} alt="">
                                                        </span>
                                                    </div>
                                                    <div class="bookcontent">

                                                        <span> ${vo.subject}</span>
                                                        <div>
                                                            <span> ${vo.author}</span>
                                                        </div>
                                                        <div>
                                                            <span> ${vo.bookcnt}</span>
                                                            <span>권</span> 
                                                        </div>
                                                        <span>출판일 : </span><span> ${vo.publisher}</span>
                                                        <span>
                                                            <fmt:formatDate pattern="yyyy-MM-dd"
                                                            value="${vo.publishdate}" />
                                                        </span>
                                                    </div>

                                                </td>
                                        </div>
                                        <td style="    text-align: center;">
                                            <span class="prices"> ${vo.price}</span>
                                        </td>
                                        <td class="orderdel" style="text-align: center;">
                                            ${order.deliveryCost}</td>
                                        <td class="orderstate" style="text-align: center;">
                                            ${order.orderState}</td>
                                        </tr>
                                    </c:forEach>

                                </table>
                            </div>
                        </div>
                    </div>

                    <div style="
                    margin-top: 13px;">
                        <span class="deldetailfonts">주문 금액 상세</span>
                        <div>
                            <div style="    display: flex;
                            width: 100%;
                            justify-content: space-evenly">
                                <div class="deldetailinfo">
                                    <div class="orders">
                                        <span class="orderpayfont">주문금액</span>
                                        <span class="under" style="    margin-top: 4px;">└ 상품가격</span>
                                        <span class="under" style="    margin-top: 4px;">└ 배송비</span>
                                    </div>
                                    <div class="results">
                                        <span class="firstorder">???</span>
                                        <span style="
                                    margin-top: 4px;" class="bookspricespan"></span>
                                        <span style="
                                    margin-top: 4px;">${order.deliveryCost}</span>
                                    </div>
                                </div>

                                <div style="    display: flex;
                                align-items: center;">
                                    <span style="    font-size: 31px;
                                color: #456BD8;">
                                        <i class="fa fa-minus-circle" aria-hidden="true"></i>
                                    </span>
                                </div>

                                <div class="point_pay">
                                    <div class="pay_one">
                                        <span class="orderpayfonts">할인금액</span>
                                        <span class="under" style="display: flex;
                                flex-direction: column;">└ 포인트</span>
                                        <span class="under">└ 할인 금액</span>
                                    </div>


                                    <div style="    display: flex;
                            flex-direction: column;">
                                        <span class="discountres"></span>
                                        <span class="usepoint">${order.usePoint}</span>
                                        <span class="salepriceres"></span>
                                    </div>
                                </div>
                            </div>
                            <div style="    text-align: center;
                            margin-top: 20px;">

                                <div>
                                    <span>적립 포인트</span>
                                    <span> ${order.savePoint}원</span>
                                </div>
                                <div>
                                    <span class="totalfonts">총 주문금액
                                    </span>
                                    <span class="fontres">
                                        ${order.orderFinalSalePrice} 원
                                    </span>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </section>
                <footer>
                    <div class="foot">
                        <div onclick="okay()">확인</div>

                        <c:if test="${order.orderState eq '배송준비' || order.orderState eq '주문완료'}">
                            <div id="refund_click" onclick="payback('${order.orderId}')">환불하기</div>
                        </c:if>


                    </div>

                </footer>


            </body>

            </html>
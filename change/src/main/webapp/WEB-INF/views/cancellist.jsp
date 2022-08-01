<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <script type="text/javascript"
                src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
            <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css"
                integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />


            <script>
                    function i_click(f) {
                    var url = "<c:url value='openMyPage.do?orderId='/>" + f

                    window.open(
                        url,
                        "상품정보", "width=700 height=800 left=400 top =350");
                }
                $(document).ready(function () {
						setTotalInfo('${vo.orderDate}');
						/* 체크여부에따른 종합 정보 변화 */

					});
                    
                function setTotalInfo(date) {
                    var arr = date.split('-');
                    var date = new Date();
                    var dat1 = new Date(arr[0], arr[1] - 1, arr[2]); //14일 후 날짜 - 환불 불가
                    var dat2 = new Date(arr[0], arr[1] - 1, arr[2]); //14일 후 날짜 - 환불 불가
                    dat2.setDate(dat2.getDate() + 14);

                    alert(num);


                    //오늘 날짜가
                    //14일이 지나면 환불불가

                    if (date > dat2) {
                        $(".delete_btn").attr("disabled",true);
                    }
                    



                }

            function refundorder(num,date) {
                if (!confirm("반품 취소 하시겠습니까?")) {
                    return;
                }
                // //할인금액 -- 사용 포인트 원래대로 회수 
                // // 받은 포인트 회수
                // //주문 금액 을 교보코인으로 환불



                var url = "payback.do";
                var param = "orderId=" + num+"&url=cancelreq";

                sendRequest(url, param, canceldone, "POST");
            }

                function canceldone() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var data = xhr.responseText;
                    if (data == 'Yes') {
                        alert('반품취소 하였습니다.');

                    } else if(data=="no"){
                        alert("돈이 부족합니다..");
                    }
                    else{
                        alert('삭제 실패, 관리자에게 문의하세요');
                    }
                    window.location.reload(true);

                }
            }
            </script>
            <style>
                @import url("${pageContext.request.contextPath}/resources/css/main.css");
                @import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");

                * {
                    font-family: "Noto Sans KR", sans-serif;
                }
                

                button {
                    /* 생략 */
                    margin: 0;
                    font-weight: 400;
                    text-align: center;
                    text-decoration: none;
                    display: inline-block;
                    width: auto;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                }

                .delete_btn {
                    background-color: #dc3545;
                    font-family: "Noto Sans KR", sans-serif;
                    color: white;
                    box-shadow: 0 4px 6px -1px rgb(0 0 0/ 10%), 0 2px 4px -1px rgb(0 0 0/ 6%);
                    border-radius: 4px;
                    padding: 7px;
                    appearance: none;
                    font-size: 1rem;
                    padding: 0.2rem 1rem;
                }
            </style>

        </head>

        <body>
            <%@include file="include/header.jsp" %>

                <%@include file="include/mypage_sidebar.jsp" %>
                    <div class="container" style="margin-top: 50px; margin-left: 270px;">
                        <h2>취소/교환 반품조회</h2>
                        <span>(주문확정 후 6일 동안 반품취소 요청을 할 수 있습니다.)</span>


                        <table border="1" style="width: 100%;">

                            <tr style=" text-align: center; color: blue;">
                                <td>주문번호</td>
                                <td>받는이</td>
                                <td>주소</td>
                                <td>주문날짜</td>
                                <td>주문상태</td>
                                <td>주문상품</td>
                                <td>취소</td>
                            </tr>

                            <c:if test="${listCheck != 'empty'}">
                                <c:forEach var="vo" items="${list}" varStatus="status">
                                    <tr>
                                        <td>${vo.orderId}</td>
                                        <td>${vo.addressee}</td>
                                        <td>(${vo.memberAddr1}) <br> ${vo.memberAddr2} ${vo.memberAddr3}
                                        </td>
                                        <td class="orderdate">${vo.orderDate} </td>

                                        <td>
                                            ${vo.orderState}

                                        </td>
                                        <td>
                                            <div style="    color: #456BD8; font-size: 21px; "
                                                onclick="i_click('${vo.orderId}')">
                                                <i class="fa-solid fa-circle-plus">
                                                </i>
                                            </div>

                                        </td>
                                        <td style="width: 80.162;">
                                            <c:if test="${vo.orderState eq '주문취소'}">
                                                <button onclick="refundorder('${vo.orderId}','${vo.orderDate}')"
                                                    class="delete_btn" data-orderid= "${vo.orderId}">취소</button>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="7" align="center">
                                        ${pageMenu}
                                    </td>
                                </tr>
                            </c:if>
                        </table>
                        <c:if test="${listCheck == 'empty'}">
                            <div se="tyl    text-align: center;">
                                안녕
                            </div>
                        </c:if>


                    </div>

        </body>

        </html>
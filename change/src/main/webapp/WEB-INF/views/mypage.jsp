<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            	var uid = '<%=(String)session.getAttribute("id")%>';
                if(uid=="null"){
                    alert('로그인 후 이용 가능한 페이지 입니다.');
                    location.href ="login_form.do";
                }


                
         </script>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

            <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css"
                integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
            





            <meta name="description" content="">
            <meta name="author" content="">

            <title>SB Admin 2 - Cards</title>
            <style>
                @import url("resources/css/main.css");
                @import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");

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
                    box-shadow: 0 4px 6px -1px rgb(0 0 0 / 10%), 0 2px 4px -1px rgb(0 0 0 / 6%);
                    border-radius: 4px;
                    padding: 7px;
                    appearance: none;
                    font-size: 1rem;
                    padding: 0.2rem 1rem;

                }

            
            </style>
            


            <style>
                .container {
                    margin: 50px 0px 0px 0px;
                    margin-left: 270px;
                }
            </style>

        </head>
        <script>


            function i_click(f) {
                var url = "<c:url value='openMyPage.do?orderId='/>"+f

                window.open(
                        url,
						"상품정보", "width=700 height=800 left=400 top =350");
            }

            function send() {
                var _width = '750';
                var _height = '600';

                // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
                var _left = Math.ceil((window.screen.width - _width) / 2);
                var _top = Math.ceil((window.screen.height - _height) / 2);


                window.open("charge.do", "charge", 'width=' + _width +
                    ', height=' + _height +
                    ', left=' + _left +
                    ', top=' + _top);
            }

            function refundorder(num){
                if (!confirm("환불 하시겠습니까?")) {
                            return;
                        }
                        // //할인금액 -- 사용 포인트 원래대로 회수 
                        // // 받은 포인트 회수
                        // //주문 금액 을 교보코인으로 환불


                        var url = "refund.do";
                        var param = "orderId="+num;
                        sendRequest(url, param, refundone, "POST");
            }

            function refundone() {
                        if (xhr.readyState == 4 && xhr.status == 200) {
                            var data = xhr.responseText;
                            if (data == 'true') {
                                alert('환불되었습니다.');
                                
                            } else {
                                alert('삭제 실패, 관리자에게 문의하세요');
                            }
                            window.location.reload(true);
                            
                        }
                    }
        </script>

        <body id="page-top">
            <%@include file="include/header.jsp" %>
                <div class="wrapper">
                    <div class="content_area">
                        <%@include file="include/mypage_sidebar.jsp" %>
                            <div class="container" style="margin-left: 270px;
                            ">
                                <!-- Earnings (Monthly) Card Example -->
                                <!-- Page Heading -->
                                <div class="jumbotron">
                                    <h1 class="h3 mb-0 mt-5 text-gray-800">반갑습니다...
                                        <%out.print(session.getAttribute("name")); %>님
                                    </h1>
                                </div>

                                <div class="row" style="margin-top:50px;	">

                                    <div class="col-xl-6 col-md-6 mb-4">
                                        <div class="card border-left-primary shadow h-100 py-2">
                                            <div class="card-body">
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col mr-2">
                                                        <div
                                                            class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                            금액</div>
                                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                            <%out.print(session.getAttribute("money")); %>
                                                        </div>
                                                    </div>
                                                    <div class="col-auto">
                                                    </div>
                                                    <input type="button" value="충전하기" onclick="send();">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Earnings (Annual) Card Example -->
                                    <div class="col-xl-6 col-md-6 mb-4">
                                        <div class="card border-left-success shadow h-100 py-2">
                                            <div class="card-body">
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col mr-2">
                                                        <div
                                                            class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                            포인트</div>
                                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                            <%out.print(session.getAttribute("point")); %>
                                                        </div>
                                                    </div>
                                                    <div class="col-auto">
                                                        <i class="fa-solid fa-circle-plus"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div><!-- card 끝 -->



                                    <table border="1" style="width:1090px; height:200px;">
                                        <tr style="text-align: center; color: blue;">
                                            <td>주문번호</td>
                                            <td>받는이</td>
                                            <td>주소</td>
                                            <td>주문날짜</td>
                                            <td>주문상태</td>
                                            <td>주문상품</td>
                                            <td>환불</td>
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
                                                        <div style="    color: #456BD8; font-size: 21px; " onclick="i_click('${vo.orderId}')">
                                                            <i class="fa-solid fa-circle-plus">
                                                            </i>
                                                        </div>


                                                    </td>
                                                    <td style="width: 80.162;">
                                                        <c:if test="${vo.orderState eq '배송준비' || vo.orderState eq '주문완료'}">
                                                            <button onclick="refundorder('${vo.orderId}')" class="delete_btn" data-orderid="${vo.orderId}">환불</button>
                                                        </c:if>
                                                        <c:if test="${vo.orderState eq '구매확정'}">
                                                            <span style=" 
                                                            font-size: 20px; color: #dc3545; width: 80.162;">
                                                                <i class="fa-solid fa-ban"></i>
                                                            </span>
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
                                        <tr>
                                            <td>
                                                <img src="${ pageContext.request.contextPath }/resources/img/텅.PNG">
                                            </td>
                                        </tr>
                                    </c:if>



                            </div>
                    </div>

                    <%@include file="include/footer.jsp" %>

                        <!-- Bootstrap core JavaScript-->

                        <script
                            src="${pageContext.request.contextPath}/resources/mypage/vendor/jquery/jquery.min.js"></script>
                        <script
                            src="${pageContext.request.contextPath}/resources/mypage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                        <script
                            src="${pageContext.request.contextPath}/resources/mypage/vendor/jquery-easing/jquery.easing.min.js"></script>
                        <script src="${pageContext.request.contextPath}/resources/mypage/js/sb-admin-2.min.js"></script>

        </body>

        </html>
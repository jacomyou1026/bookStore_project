<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    		               <div class="jungo_nav">
                                <ul class="jungo_nav_list"> 
                                    <li>
                                        <a href="/bookListJungo?c=500000&t=1">중고장터</a>
                                    </li>
                                    <li>
                                        <a href="/bookListJungo?c=500000&t=1">중고책 리스트</a><span id = jungo_a>|</span>
                                    </li>                                    
                                    <li>
                                        <a href="/sellerPage?id=<%=session.getAttribute("id")%>">판매자 페이지</a><span id = jungo_a>|</span>
                                    </li>
                                    <li >
                                        <a href="">공지사항</a><span id = jungo_a></span>
                                    </li> 
                                </ul> 
                       		 </div>
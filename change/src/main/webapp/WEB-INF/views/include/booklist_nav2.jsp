<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


                                 <div class="booklist_nav">
                                        <div class="booklist_ul">
                                             <span>홈 > 외국도서</span> 
                       			   					<c:if test="${param.c == 201000}">
                                            			<span> > 경제/경영</span>
                                            		</c:if>
		                                            		<c:if test="${param.c == 201001}">
		                                            			<span> > 경제/경영 > 일반</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 201002}">
		                                            			<span> > 경제/경영 > 교육</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 201003}">
		                                            			<span> > 경제/경영 > 구매</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 201004}">
		                                            			<span> > 경제/경영 > 노동</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 201005}">
		                                            			<span> > 경제/경영 > 마케팅</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 201006}">
		                                            			<span> > 경제/경영 > 세금</span>
		                                            		</c:if>                                            		
                                            		<c:if test="${param.c == 202000}">
                                            			<span> > 법률 </span>
                                            		</c:if>
		                                            		<c:if test="${param.c == 202001}">
		                                            			<span> > 법률 > 민법</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 202002}">
		                                            			<span> > 법률 > 형법</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 202003}">
		                                            			<span> > 법률 > 환경법</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 202004}">
		                                            			<span> > 법률 > 국제법</span>
		                                            		</c:if>	
                                            		<c:if test="${param.c == 203000}">
                                            			<span> > 인문/사회 </span>
                                            		</c:if>
		                                            		<c:if test="${param.c == 203001}">
		                                            			<span> > 인문/사회 > 민족학</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 203002}">
		                                            			<span> > 인문/사회 > 조직범죄</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 203003}">
		                                            			<span> > 인문/사회 > 언어</span>
		                                            		</c:if>		                                            	                                            		
                                             		<c:if test="${param.c == 204000}">
                                            			<span> > 여행 </span>
                                            		</c:if>
		                                            		<c:if test="${param.c == 204001}">
		                                            			<span> > 여행 > 레스토랑</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 204002}">
		                                            			<span> > 여행 > 리조트/스파</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 204003}">
		                                            			<span> > 여행 > 미국</span>
		                                            		</c:if>	
                                            		<c:if test="${param.c == 205000}">
                                            			<span> > 역사 </span>
                                            		</c:if>
		                                            		<c:if test="${param.c == 205001}">
		                                            			<span> > 역사 > 그리스</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 205002}">
		                                            			<span> > 역사 > 로마</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 205003}">
		                                            			<span> > 역사 > 이집트</span>
		                                            		</c:if>	
		                                            <c:if test="${param.c == 206000}">
                                            			<span> > 의학 </span>
                                            		</c:if>
		                                            		<c:if test="${param.c == 206001}">
		                                            			<span> > 의학 > 가정간호</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 206002}">
		                                            			<span> > 의학 > 간병</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 206003}">
		                                            			<span> > 의학 > 간호학</span>
		                                            		</c:if>
		                                            <c:if test="${param.c == 207000}">
                                            			<span> > 자연과학 </span>
                                            		</c:if>
		                                            		<c:if test="${param.c == 207001}">
		                                            			<span> > 자연과학 > 식물</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 207002}">
		                                            			<span> > 자연과학 > 동물</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 207003}">
		                                            			<span> > 자연과학 > 계절</span>
		                                            		</c:if>			                                            					                                            		                                           		
                                        </div>
                                       	<div class="booklist_sub">
                                            <span>도서 목록</span>
                                        </div>
                                    </div>  
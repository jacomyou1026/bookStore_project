<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


                                 <div class="booklist_nav">
                                        <div class="booklist_ul">
                                             <span>홈 > 국내도서</span> 
                       			   					<c:if test="${param.c == 101000}">
                                            			<span> > 소설/시/희곡</span>
                                            		</c:if>
		                                            		<c:if test="${param.c == 101001}">
		                                            			<span> > 소설/시/희곡 > 한국 추리/미스터리소설</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 101002}">
		                                            			<span> > 소설/시/희곡 > 한국 판타지/환상소설</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 101003}">
		                                            			<span> > 소설/시/희곡 > 한국 과학소설</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 101004}">
		                                            			<span> > 소설/시/희곡 > 비평론</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 101005}">
		                                            			<span> > 소설/시/희곡 > 한국시론</span>
		                                            		</c:if>
                                            		
                                            		<c:if test="${param.c == 102000}">
                                            			<span> > 에세이</span>
                                            		</c:if>
		                                            		<c:if test="${param.c == 102001}">
		                                            			<span> > 에세이 > 방송연예인에세이</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 102002}">
		                                            			<span> > 에세이 > 한국에세이</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 102003}">
		                                            			<span> > 에세이 > 독서에세이</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 102004}">
		                                            			<span> > 에세이 > 명언/잠언록</span>
		                                            		</c:if>
                                            		<c:if test="${param.c == 103000}">
                                            			<span> > 경제/경영</span>
                                            		</c:if>
		                                            		<c:if test="${param.c == 103001}">
		                                            			<span> > 경제/경영 > 경영일반</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 103002}">
		                                            			<span> > 경제/경영 > 국내 기업/경영자</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 103003}">
		                                            			<span> > 경제/경영 > 광고/홍보/PR</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 103004}">
		                                            			<span> > 경제/경영 > 부동산/경매</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 103005}">
		                                            			<span> > 경제/경영 > 세금</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 103006}">
		                                            			<span> > 경제/경영 > 주식/펀드</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 103007}">
		                                            			<span> > 경제/경영 > 창업정보</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 103008}">
		                                            			<span> > 경제/경영 > 취업정보</span>
		                                            		</c:if>
		                                            <c:if test="${param.c == 104000}">
                                            			<span> > 만화</span>
                                            		</c:if>
		                                            		<c:if test="${param.c == 104001}">
		                                            			<span> > 만화 > 소년만화</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 104002}">
		                                            			<span> > 만화 > 가족만화</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 104003}">
		                                            			<span> > 만화 > 교양만화</span>
		                                            		</c:if>
		                                            <c:if test="${param.c == 105000}">
                                            			<span> > 어린이</span>
                                            		</c:if>
		                                            		<c:if test="${param.c == 105001}">
		                                            			<span> > 어린이 > 어린이 한자</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 105002}">
		                                            			<span> > 어린이 > 초등 전학년</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 105003}">
		                                            			<span> > 어린이 > 어린이 영어</span>
		                                            		</c:if>
		                                            <c:if test="${param.c == 106000}">
                                            			<span> > 과학</span>
                                            		</c:if>
		                                            		<c:if test="${param.c == 106001}">
		                                            			<span> > 과학 > 농업</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 106002}">
		                                            			<span> > 과학 > 물리학</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 106003}">
		                                            			<span> > 과학 > 수학</span>
		                                            		</c:if>
		                                            		
		                                            <c:if test="${param.c == 107000}">
                                            			<span> > 종교/역학</span>
                                            		</c:if>
		                                            		<c:if test="${param.c == 107001}">
		                                            			<span> > 종교/역학 > 가톨릭</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 107002}">
		                                            			<span> > 종교/역학 > 기독교</span>
		                                            		</c:if>
		                                            		<c:if test="${param.c == 107003}">
		                                            			<span> > 종교/역학 > 불교</span>
		                                            		</c:if> 		                                            		                                                		
                                            		
                                        </div>
                                         <div class="booklist_sub">
                                            <span>도서 목록</span>
                                        </div>
                                    </div>  
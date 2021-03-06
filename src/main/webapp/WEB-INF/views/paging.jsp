<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="paging">
		<c:set var="search"/>
		<c:set var="category"/>
		<c:choose>
			<c:when test="${param.board_category eq 'N' }">
				<c:if test="${param.notice_search_category eq 'title' or param.notice_search_category eq 'nicname' or param.notice_search_category eq 'content+title' }">
					<c:url var="action" value="board_notice_search.do"/>
					<c:set var="search" value="&search_category=${param.notice_search_category }&search_keyword=${param.search_keyword }" />
				</c:if>
				<c:if test="${param.notice_search_category eq null }">
				<c:url var="action" value="board_notice_list.do" />
				</c:if>
			</c:when>
			
			<c:when test="${param.board_category eq 'Q' && param.from == null}">
				<c:if test="${param.qna_search_category eq 'title' or param.qna_search_category eq 'nicname' or param.qna_search_category eq 'content+title' }">
					<c:url var="action" value="board_qna_search.do"/>
					<c:set var="search" value="&search_category=${param.qna_search_category }&search_keyword=${param.search_keyword }" />
				</c:if>
				<c:if test="${param.qna_search_category eq null }">
				<c:url var="action" value="board_qna_list.do" />
				</c:if>
				
			</c:when>
			
			<c:when test="${param.board_category eq 'Q' && param.from eq 'admin' }">
				<c:url var="action" value="adminBoard.do" />
			</c:when>
			
			<c:when test="${param.board_category eq 'payment' && param.from eq 'mypage' }">
				<c:url var="action" value="mypage_payment.do" />
			</c:when>
			
			<c:when test="${param.board_category eq 'qna' && param.from eq 'mypage' }">
				<c:url var="action" value="mypage_board.do" />
			</c:when>
			
			<c:when test="${param.board_category eq 'class' && param.from eq 'mypage' }">
				<c:url var="action" value="mypage_class.do" />
			</c:when>
			
			<c:when test="${param.board_category eq 'review' && param.from eq 'mypage' }">
				<c:url var="action" value="mypage_review.do" />
			</c:when>
			
			<c:when test="${param.store_list eq 'S' }">
				<c:choose>
					<c:when test="${param.product_category != '' }">
						<c:url var="action" value="store_category.do" />
						<c:set var="category" value="&category=${param.product_category }"/>
					</c:when>
					<c:when test="${empty param.search_keyword }">
						<c:url var="action" value="store.do" />
					</c:when>
					<c:otherwise>
						<c:url var="action" value="store_search.do" />
						<c:set var="search" value="&search_keyword=${param.search_keyword }"/>
					</c:otherwise>
				</c:choose>	
			</c:when>
			
			<c:when test="${param.class_list eq 'C' }">
				<c:choose>
					<c:when test="${param.class_search_category != ''}">
						<c:url var="action" value="class_search.do"/>
						<c:set var="search" value="&search_category=${param.class_search_category }&search_keyword=${param.search_keyword }" />
					</c:when>
					<c:when test="${param.class_category == ''}">
						<c:url var="action" value="classList.do" />
					</c:when>
					<c:when test="${param.class_category != ''}">
						<c:url var="action" value="class_category.do" />
						<c:set var="category" value="&category=${param.class_category }"/>
					</c:when>
				</c:choose>
			</c:when>
			
			<c:when test="${param.review_category eq 'R'}">
				<c:url var="action" value="review_list.do" />
			</c:when>
			<c:when test="${param.map_category eq 'M' }">
				<c:url var="action" value="map.do"/>
			</c:when>
			<c:otherwise>
				<c:url var="action" value="admin${param.board_category }.do" />
			</c:otherwise>
		</c:choose>

		<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination">
	        	<li class="page-item">
	        		
	            	<a href="${action}?nowPage=${param.nowBlock > 1 ? param.blockBegin-1 : 1}${search}" class="page-link" aria-label="Previous">
	                	<i class="ti-angle-left"></i>
	                </a>
	            </li>
	            <li class="page-item d-flex">
	            	<c:forEach begin="${param.blockBegin}" end="${param.blockEnd}" var="index">
						<c:choose>
							<c:when test="${param.nowPage == index}">
								     <a class="page-link">${index}</a>
							    </c:when>
							<c:otherwise>
								<a class="page-link" href="${action}?nowPage=${index}${search}${category}">${index}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
	            </li>
	            
	            <li class="page-item">
	            	<a href="${action}?nowPage=${param.nowBlock < param.totalBlock ? param.blockEnd+1 : param.blockEnd}${search}" class="page-link" aria-label="Next">
	                	<i class="ti-angle-right"></i>
	                </a>
	            </li>
	        </ul>
	    </nav>
		
	</div>
	
	
	
	
	
	
</body>
</html>
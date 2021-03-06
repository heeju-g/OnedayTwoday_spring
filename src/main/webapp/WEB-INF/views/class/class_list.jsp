<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Class</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/js/sockjs.min.js"></script>
<script type="text/javascript" src="resources/js/class.js"></script>
<script type="text/javascript">	
	function ranking(){
		if(checked){
			let list = ['class', $("[name='search_keyword']:eq(0)").val()]
			sock.send(list);		
		}
	}
	// 나가기 버튼
	function exit(){
		sock.close();
	}		
	
	let sock = new SockJS("${pageContext.request.contextPath}/rank");		
	// 연결끊기면 
	sock.onclose = function(e){
		console.log(e);
		$(location).attr('href',"classList.do?nowPage=1");
	}	
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="slider-area" style="margin-bottom: 150px;">
		<div class="single-slider slider-height2 d-flex align-items-center">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center">
							<c:choose>
								<c:when test="${empty category }">
									<h2>Class</h2>
								</c:when>
								<c:otherwise>
									<h2>${category }</h2>
								</c:otherwise>
							</c:choose>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<main class="container mb-100">
		<div class="row product-btn justify-content-between mb-40">
        	<div class="properties__button">
            	<!--Nav Button  -->
                <nav>                                                      
                	<div class="nav nav-tabs" id="nav-tab" >
                    	<a class="nav-item nav-link" id="nav-home-tab" href="classList.do?nowPage=1">All</a>
                        <a class="nav-item nav-link" id="nav-handmade-tab" href="class_category.do?category=handmade&nowPage=1">handmade</a>
                        <a class="nav-item nav-link" id="nav-cooking-tab"href="class_category.do?category=cooking&nowPage=1">cooking</a>
                        <a class="nav-item nav-link" id="nav-flower-tab" href="class_category.do?category=flower&nowPage=1">flower</a>
                        <a class="nav-item nav-link" id="nav-drawing-tab" href="class_category.do?category=drawing&nowPage=1">drawing</a>
                        <a class="nav-item nav-link" id="nav-music-tab" href="class_category.do?category=music&nowPage=1">music</a>
                        <a class="nav-item nav-link" id="nav-yoga-tab" href="class_category.do?category=yoga&nowPage=1">yoga</a>
                    </div>
                </nav>
            </div>
        </div>
		<section class="blog_area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mb-5 mb-lg-0">
                        <div class="blog_left_sidebar">
                        	<c:choose>
                        		<c:when test="${empty list }">
									<p>--------등록된 클래스가 없습니다.---------</p>
								</c:when>
		
								<c:otherwise>
									<c:forEach items="${list }" var="dto">
										<article class="blog_item">
			                                <div class="blog_item_img">
			                                    <img class="card-img rounded-0" src="resources/upload/${dto.file_new_name }" alt="상품">
			                                </div>
			
			                                <div class="blog_details">
			                                    <a class="d-inline-block" href="classSelect.do?class_no=${dto.class_no }">
			                                       	<h2>${dto.class_title }</h2>	
			                                    </a>
			                                    <p>${dto.class_desc }</p>
			                                    <ul class="blog-info-link">
			                                        <li><a href="#"><i class="bi bi-tag-fill"></i> ${dto.class_category }</a></li>
			                                        <li><a href="#"><i class="bi bi-geo-alt"></i> ${dto.class_loc } </a></li>
			                                    </ul>
			                                    
			                                    <c:if test="${dto.member_id eq mDto.member_id }">
													<button
														onclick="location.href='classDelete.do?class_no=${dto.class_no}'"
														type="button" class="btn btn-warning">삭제</button>
												</c:if>
			                                </div>
		                            	</article>
	                            	</c:forEach>
								</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                    
                    <div class="col-lg-4">
                        <div class="blog_right_sidebar">
	                    	<c:if test="${mDto.member_grade eq '강사회원' }">
								<button type="button" class="genric-btn primary-border mb-4" style="width:100%;" onclick="location.href='classInsert.do'"><i class="bi bi-pencil-fill"></i> 클래스 등록</button>
							</c:if>
						
                            <aside class="single_sidebar_widget search_widget">
                            
                            	<div class="switch-wrap d-flex justify-content-start">
                            		<input type="hidden" id="member_auto" value="${mDto.member_auto }" />
									<p>자동완성</p>
									
									<c:choose>
										<c:when test="${mDto != null and mDto.member_auto == 'Y' }">
											<p id="on" name="on_off">ON</p><p id="off" name="on_off" style="display:none;">OFF</p>
										</c:when>
										<c:otherwise>
											<p id="off" name="on_off">OFF</p><p id="on" name="on_off" style="display:none;">ON</p>
										</c:otherwise>
									</c:choose>
									
									<div class="primary-switch mt-1 ml-2">
										<input type="checkbox" id="default-switch" name="onoff">
										<label for="default-switch"></label>
									</div>
								</div>
                                
                                <form action="class_search.do" method="post">
                                	<input type="hidden" name="nowPage" value="1">
                                    <div class="form-group">  
	                                    <div class="default-select" id="default-select">
											<select class="shipping_select" id="search_category" name="search_category">
												<option value="nickname" selected>닉네임</option>
												<option value="title+desc+category">클래스명+설명+내용</option>
											</select>
											
										</div>
										
                                        <div id="searchInput" class="input-group ">
                                            <input type="text" class="position-relative form-control border-right" name="search_keyword" placeholder="Search term..." autocomplete=off
                                                onfocus="this.placeholder = ''"
                                                onblur="this.placeholder = 'Search term...'">
                                                
                                            <i id="close" class="bi bi-x-lg position-absolute" style="cursor:pointer; top: 25%; right: 5%;"></i>
                                        </div>
                                        
                                        <div id="auto_result">
                                        	
                                        </div>
                                    </div>
                                    <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                        type="submit" onclick="ranking()">Search</button>
                                </form>
                            </aside>
                        </div>
                    </div>
                    
                </div>
            </div>
        </section>
					<jsp:include page="/WEB-INF/views/paging.jsp">
						<jsp:param value="C" name="class_list" />
						<jsp:param value="${pDto.class_category }" name="class_category" />
						<jsp:param value="${pDto.search_category }" name="class_search_category" />
						<jsp:param value="${pDto.search_keyword }" name="search_keyword"/>
						<jsp:param value="${pDto.nowBlock}" name="nowBlock" />
						<jsp:param value="${pDto.blockBegin }" name="blockBegin" />
						<jsp:param value="${pDto.blockEnd }" name="blockEnd" />
						<jsp:param value="${pDto.nowPage}" name="nowPage" />
						<jsp:param value="${pDto.blockBegin}" name="blockBegin" />
						<jsp:param value="${pDto.blockEnd}" name="blockEnd" />
						<jsp:param value="${pDto.totalBlock}" name="totalBlock" />
					</jsp:include>
	</main>

	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>
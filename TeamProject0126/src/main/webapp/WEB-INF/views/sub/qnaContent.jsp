<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700,900|Rubik:300,400,700" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

<!-- Style css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

<!-- script -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/magnific-popup-options.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</head>
<body>
<!-- header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- //header -->

<!-- sub_banner -->
<section class="site-hero overlay" data-stellar-background-ratio="0.5" style="background-image: url(${pageContext.request.contextPath}/resources/images/sub_banner.jpg);">
	<div class="container">
		<div class="row align-items-center site-hero-inner justify-content-center">
			<div class="col-md-12 text-center">
				<div class="mb-5 element-animate">
					<h1>QnA</h1>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- //sub_banner -->

<!-- body -->
<div class="content">
	<div class="sub_wrapper">
	<h2 style="color: #9F8562; font-size: 40px; text-align: center; margin: 40px 0px 60px 0px;">QNA Content</h2>
		<input type="hidden" name="qna_seq" value="${qnaBoardDTO.qna_seq }" />
		<table class="board_table" style="text-align: center;">
        	 <tr><td>번호</td><td>${qnaBoardDTO.qna_idx }</td><td>구분</td><td>${qnaBoardDTO.qna_category}</td></tr>
        	 <tr><td>작성자</td><td>${qnaBoardDTO.member_id }</td></tr>
        	 <tr><td>제목</td><td colspan="1">${qnaBoardDTO.qna_subject }</td><td>날짜</td><td><fmt:formatDate value="${qnaBoardDTO.qna_date}" pattern="yyyy.MM.dd"/></td></tr>
        	 <tr><td width="200px">내용</td><td colspan="3" height="350px"><textarea name="qna_content" rows="8" cols="110" readonly="readonly" style="margin: 20px 0px 20px 0px; border: none;">${qnaBoardDTO.qna_content }</textarea></td></tr>
     	 </table>
     	 <c:choose>
     	 	<c:when test="${sessionScope.member_id eq 'admin'}">
     	 		<c:choose>
     	 			<c:when test="${qnaBoardDTO.qna_seq eq 0}">
     	 				<a href="${pageContext.request.contextPath}/sub/qnaReply?qna_idx=${qnaBoardDTO.qna_idx }" class="btn btn-primary btn-outline-primary btn-sm" style="margin-top: 30px; float: left;">Reply</a>
     	 			</c:when>
     	 		</c:choose>
     	 	</c:when>
     	 </c:choose>
		<div class="button-wrapper" style="margin-top:30px; display: flex; justify-content: right;" >
		<c:choose>
			<c:when test="${sessionScope.member_id eq 'admin'}">
				<a href="${pageContext.request.contextPath}/sub/qnaUpdate?qna_idx=${qnaBoardDTO.qna_idx }" class="btn btn-primary btn-outline-primary btn-sm" style=" display: block; ">update</a>
				<a href="${pageContext.request.contextPath}/sub/qnaDeletePro?qna_idx=${qnaBoardDTO.qna_idx }" class="btn btn-primary btn-outline-primary btn-sm" style="  display: block; margin-left: 20px; ">delete</a>
			</c:when>
			<c:when test="${sessionScope.member_id eq qnaBoardDTO.member_id}">
				<a href="${pageContext.request.contextPath}/sub/qnaUpdate?qna_idx=${qnaBoardDTO.qna_idx }" class="btn btn-primary btn-outline-primary btn-sm" style=" display: block; ">update</a>
				<a href="${pageContext.request.contextPath}/sub/qnaDeletePro?qna_idx=${qnaBoardDTO.qna_idx }" class="btn btn-primary btn-outline-primary btn-sm" style="  display: block; margin-left: 20px; ">delete</a>
			</c:when>
		</c:choose>
		
			
			<a href="${pageContext.request.contextPath}/sub/qna" class="btn btn-primary btn-outline-primary btn-sm" style="  display: block; margin-left: 20px; ">list</a>
		</div>	
	</div>
</div>
<!-- //body -->

<!-- footer -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- //footer -->

<!-- loader -->
<div id="loader" class="show fullscreen">
	<svg class="circular" width="48px" height="48px">
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
		<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#f4b214"/>
	</svg>
</div>
<!-- //loader -->

</body>
</html>
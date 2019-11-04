<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <title>게시판</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
        <style>
            .mouseOverHighlight {
                   border-bottom: 1px solid blue;
                   cursor: pointer !important;
                   color: blue;
                   pointer-events: auto;
                }
        </style>
    </head>
    <body>
    <div class="container">
		<div class="navbar-header">
			<button class="navbar-toggle" type="button" data-toggle="collapse" date-target="#navbar-main">
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/Main.do">Blog</a>
		</div>

	</div>
        <form class="form-inline" id="frmSearch" >
            <div align="center">
                <table width="1200px">
                <table border="1" width="1200px">
 	<thead>
		<tr>
					<th style="test-align:center;">자산종류</th>
					<th style="test-align:center;">품목명</th>
					<th style="test-align:center;">제품사양</th>
					<th style="test-align:center;">구매일</th>
					<th style="test-align:center;">사용자</th>
					<th style="test-align:center;">자산상태</th>
				</tr>			
			<c:choose>
			<c:when test="${fn:length(listMap) > 0}">
				 <c:forEach items="${listMap}" var="result" varStatus="status">
                  	<tr>
                    	<td>${result.DeviceVO.device_which}</td>
                    	<td><a href="/SelectBoardDetailForm.do?device_no=${result.DeviceVO.device_no}">${result.DeviceVO.device_modelname}</a></td>
                    	<td>${result.DeviceVO.device_specification}</td>
                    	<td>${result.DeviceVO.device_buydate}</td>
                    	<td>${result.DeviceVO.device_user}</td>
                    	<td>${result.DeviceVO.device_state}</td>            
                  	</tr>	
                  </c:forEach>
                  </c:when>
                  <c:otherwise>
				<tr>
					<td colspan="4">조회된 결과가 없습니다.</td>
				</tr>
				</c:otherwise>
			</c:choose>
			</thead>
			</table>
		</table>
		<hr/>
		<div class="text-center">
			<ul class="pagination">
				<c:choose>
					<c:when test="${ pagingVO.prevCheck() }" >
						<li><a href="#" onClick="paging('1')">처음</a><li>
						<li><a href="#" onClick="paging('${pagingVO.prev()}')">이전</a><li>
					</c:when>
				</c:choose>
				<c:forEach var="idx" begin="${pagingVO.startPage}" end="${pagingVO.endPage}">
					<c:choose>
						<c:when test="${ idx eq pagingVO.pageNo }">
							<li><a href="#" onClick="paging('${idx}')">${idx}</a><li>
						</c:when>
						<c:otherwise>
							<li><a href="#" onClick="paging('${idx}')">${idx}</a><li>
						</c:otherwise>
					</c:choose>
				</c:forEach>    
				<c:choose>
					<c:when test="${ pagingVO.nextCheck() }" >
						<li><a href="#" onClick="paging('${pagingVO.next()}')">다음</a><li>
						<li><a href="#" onClick="paging('${pagingVO.totalPage()}')">끝</a><li>
					</c:when>
				</c:choose>
                 <input type="button" class="btn btn-lg btn-success btn-block" value="글 작성" align="right" onclick="location='InsertBoardDeviceView.do'" />
			</ul>
		</div>		       
	</div>		
	
	
</body>


<script type="text/javascript">
function paging(pageNo) {
	location.href="/SelectBoardListForm.do?pageNo="+pageNo;		
}

</script>

</html>
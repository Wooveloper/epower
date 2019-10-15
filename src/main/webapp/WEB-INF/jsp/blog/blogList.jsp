<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>first</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
<h2>게시판 목록</h2>
<table style="border:1px solid #ccc">
	<colgroup>
		<col width="10%"/>
		<col width="*"/>
		<col width="15%"/>
		<col width="20%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col">글번호</th>
			<th scope="col">제목</th>
			<th scope="col">조회수</th>
			<th scope="col">작성일</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(listMap) > 0}">
				<c:forEach items="${listMap}" var="result" varStatus="status">
					<tr>
						<td>${result.BoardVO.board_no}</td>
						<td>${result.BoardVO.board_title}</td>
						<td>${result.BoardVO.board_read_count}</td>
						<td>${result.BoardVO.board_regist_date}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
							<c:choose>
                        <c:when test="${pagingVO.prevCheck()}" >
                            <a href="#" class="bu" onClick="fn_dprkPaging('1')">
                                <span class="ppre" /> 
                            </a>
                            <a href="#" class="bu" onClick="fn_dprkPaging('${pagingVO.prev}')">
                                <span class="pre" />
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="#" class="bu off">
                                <span class="ppre"></span>                                
                            </a>
                            <a href="#" class="bu off">                                
                                <span class="pre"></span>                                
                            </a>
                        </c:otherwise>  
                    </c:choose>
                    <c:forEach var="idx" begin="${pagingVO.startPage}" end="${pagingVO.endPage}">
                        <c:choose>
                            <c:when test="${ idx eq pagingVO.pageNo }">
                                <a href="#" class="on" onClick="fn_dprkPaging('${idx}')"><span class="num">${idx}</span></a>                                
                            </c:when>
                            <c:otherwise>
                                <a href="#" onClick="fn_dprkPaging('${idx}')"><span class="num">${idx}</span></a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>                                                           
                    <c:choose>
                        <c:when test="${ pagingVO.nextCheck() }">                  
                            <a href="#" class="bu" onClick="fn_dprkPaging('${pagingVO.next}')">
                                <span class="next" />
                            </a>
                            <a href="#" class="bu" onClick="fn_dprkPaging('${pagingVO.totalPage}')">
                                <span class="nnext" /> 
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="#" class="bu off">
                                <span class="next"></span>
                            </a>                    
                            <a href="#" class="bu off">
                                <span class="nnext"></span>
                            </a>                        
                        </c:otherwise>
                    </c:choose>
	
	</tbody>
</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>



<html>
    <head>
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
        <form class="form-inline" id="frmSearch" >
            <div align="center">
                <table width="1200px">
                    <tr>
                        <td align="right">
                              <input type="button" class="btn btn-lg btn-success btn-block" value="글 작성" onclick="location='InsertBoardDeviceView.do'" />
                        </td>
                    </tr>
                </table>
                <table border="1" width="1200px">
                    <tr>
			<th scope="col">글번호</th>
			<th scope="col">제목</th>
			<th scope="col">조회수</th>
			<th scope="col">작성일</th>
                    </tr>
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
                </table>
                <br>
                <div id="pagination"></div>
            </div>
        </form>
    </body>
</html>
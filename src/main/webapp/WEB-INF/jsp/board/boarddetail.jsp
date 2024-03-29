<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


 <%@include file="../../jsp/member/head.jsp" %>
 <%@include file="../../jsp/member/plugin_js.jsp" %>
 <script>
  src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
  integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="
  crossorigin="anonymous"
 </script>
  <body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-3" style="width: 50%">
                <div class="login-panel panel panel-default" style="margin-top: 10%; margin-bottom: 10%;">
                    <div class="panel-heading">
                        <h3 class="panel-title">조회  Device register</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" method="post" name="form">
                        <!-- <form role="form"> -->
                            <fieldset>
                            <c:forEach items="${listMap}" var="result" varStatus="status">
                            		<label>자산종류</label>
								<input class="form-control" value="${result.DeviceVO.device_which}" type="text" readonly />
								<br>
                            	<div class="form-group">
                            		<label>품목명</label>
                            		<input class="form-control" value="${result.DeviceVO.device_modelname}" type="text" readonly />
                            	</div>
                            	<div class="form-group">
                            		<label>제품사양</label>
                            		<input class="form-control" value="${result.DeviceVO.device_specification}" type="text" readonly />
                            	</div>
                            	<div class="form-group">
                            		<label>구매일</label>
                            		<input class="form-control" value="${result.DeviceVO.device_buydate}" type="text" readonly />
                            	</div>
                            	<div class="form-group">
                            		<label>관리자</label>
                            		<input class="form-control" value="${result.DeviceVO.device_manager}" type="text" readonly />
                            	</div>
                            	<div class="form-group">
                            		<label>사용자</label>
                            		<input class="form-control" value="${result.DeviceVO.device_user}" type="text" readonly />
                            	</div>
                            	<div class="form-group">
                            	 <label>자산상태</label>
                            		<input class="form-control" value="${result.DeviceVO.device_state}" type="text" readonly />
								<br>
                            	<div class="form-group">
									<label>비고</label>
									<input class="form-control" value="${result.DeviceVO.device_etc}" type="text" readonly />
									<input type="hidden" value="${result.DeviceVO.device_no}"  />
								</div>
								<div>
								</div>
								<input type="submit" value="목록으로" onclick="javascript: form.action='/SelectBoardListForm.do';"/>
								<input type="submit" value="수정" onclick="javascript: form.action='/SelectDetailForm.do?device_no=${result.DeviceVO.device_no}';"/>
								
								</c:forEach>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>

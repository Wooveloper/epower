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
                        <form role="form" method="post">
                        <!-- <form role="form"> -->
                            <fieldset>
                            <c:forEach items="${listMap}" var="result" varStatus="status">
                            		<label>자산종류</label>
                            		<select class="form-control" id="device_which" name="device_which" />
                            		<option value="${result.DeviceVO.device_which}" selected>${result.DeviceVO.device_which}</option>
									<option value="모니터" >모니터</option>
									<option value="데스크탑" >데스크탑</option>
									<option value="노트북" >노트북</option>
								</select>
								<br>
                            	<div class="form-group">
                            		<label>품목명</label>
                            		<input class="form-control" name="device_modelname" id="device_modelname" value="${result.DeviceVO.device_modelname}" type="text"  />
                            	</div>
                            	<div class="form-group">
                            		<label>제품사양</label>
                            		<input class="form-control" name="device_specification" id="device_specification" value="${result.DeviceVO.device_specification}" type="text"  />
                            	</div>
                            	<div class="form-group">
                            		<label>구매일</label>
                            		<input class="form-control" name="device_buydate" id="device_buydate" value="${result.DeviceVO.device_buydate}" type="text"  />
                            	</div>
                            	<div class="form-group">
                            		<label>관리자</label>
                            		<input class="form-control" name="device_manager" id="device_manager" value="${result.DeviceVO.device_manager}" type="text"  />
                            	</div>
                            	<div class="form-group">
                            		<label>사용자</label>
                            		<input class="form-control" name="device_user" id="device_user" value="${result.DeviceVO.device_user}" type="text"  />
                            	</div>
                            	<div class="form-group">
                            	 <label>자산상태</label>
                            		<select class="form-control" name="device_state" id="device_state"  type="text" select option[value='${result.DeviceVO.device_state}'.remove(); />
                            		<option value="${result.DeviceVO.device_state}" selected>${result.DeviceVO.device_state}</option>
                            		<option value="대여" option[value='${result.DeviceVO.device_state}'.remove();>대여</option>
									<option value="재고">재고</option>									
									<option value="수리중">수리중</option>
									<option value="불용">불용 </option>
                 				</select>
								<br>
                            	<div class="form-group">
								<label>비고</label>
									<input class="form-control" name="device_etc" id="device_etc" value="${result.DeviceVO.device_etc}" type="text"  />
								</div>
								<input type="hidden" name="device_no1" id="device_no1" value="${result.DeviceVO.device_no}"  />
								</div>
								  <input type="submit" value="뒤로가기" onclick="javascript: form.action='/SelectBoardDetailForm.do?device_no=${result.DeviceVO.device_no}';"/>
								  <input type="button" name="Update" value="수정" onclick='DaUpdate();'/>
  								  <input type="button" name="Delete" value="삭제" onclick='Dadelete();'/>
								</c:forEach>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
<script type="text/javascript">

function Dadelete() {
		var device_no = $("#device_no1").val();
		
		location.href="/DeleteDetailForm.do?device_no="+$("#device_no1").val();
		
}

function DaUpdate() {
	
	var device_which = $("#device_which").val();
	var device_modelname = $("#device_modelname").val();
	var device_specification = $("#device_specification").val();
	var device_buydate = $("#device_buydate").val();
	var device_manager = $("#device_manager").val();
	var device_user = $("#device_user").val();
	var device_stats = $("#device_stats").val();
	var device_etc = $("#device_etc").val();
	var device_no = $("#device_no1").val();
	
	
   	location.href="/UpdateDetailForm.do?device_which="+$("#device_which").val()+
		"&device_modelname="+$("#device_modelname").val()+
		"&device_specification="+$("#device_specification").val()+
		"&device_buydate="+$("#device_buydate").val()+
		"&device_manager="+$("#device_manager").val()+
		"&device_user="+$("#device_user").val()+
		"&device_state="+$("#device_state option:selected").val()+
		"&device_etc="+$("#device_etc").val()+
		"&device_no="+$("#device_no1").val();
   	
   	}
   	

</script>


</html>

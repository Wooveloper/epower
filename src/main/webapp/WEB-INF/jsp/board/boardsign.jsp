<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


 <%@include file="../../jsp/member/head.jsp" %>
 <%@include file="../../jsp/member/plugin_js.jsp" %>
 <script
  src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
  integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="
  crossorigin="anonymous"></script>
  
<script type="text/javascript">

	function DosignUp() {
		
		var device_which = $("#device_which option:selected").val();
		var device_no = $("#device_no").val();
		var device_modelname = $("#device_modelname").val();
		var device_specification = $("#device_specification").val();
		var device_buydate = $("#device_buydate").val();
		var device_manager = $("#device_manager").val();
		var device_user = $("#device_user").val();
		var device_stats = $("#device_stats option:selected").val();
		var device_etc = $("#device_etc").val();
	
		var buydate = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		
		if(device_modelname.length == 0){alert("품목명을 기재해주세요."); $("#device_modelname").focus(); return;}
		if(!buydate.test($("#device_buydate").val())){
			alert("구매일을 2020-월-일 형식으로 기재해주세요.");$ ("#device_buydate").focus(); return false;
		}


		
	   	location.href="/InsertBoardDeviceForm.do?device_which="+$("#device_which").val()+
			"&device_no="+$("#device_no").val()+
			"&device_modelname="+$("#device_modelname").val()+
			"&device_specification="+$("#device_specification").val()+
			"&device_buydate="+$("#device_buydate").val()+
			"&device_manager="+$("#device_manager").val()+
			"&device_user="+$("#device_user").val()+
			"&device_state="+$("#device_state option:selected").val()+
			"&device_etc="+$("#device_etc").val();
	   	}
	
</script>


<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-3" style="width: 50%">
                <div class="login-panel panel panel-default" style="margin-top: 10%; margin-bottom: 10%;">
                    <div class="panel-heading">
                        <h3 class="panel-title">New Device register</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action=InsertBoardDeviceForm.do method="post">
                        <!-- <form role="form"> -->
                            <fieldset>
                            <label>자산종류</label>
                            	<select class="form-control" id="device_which" name="device_which" />
									<option value="모니터" selected>모니터</option>
									<option value="데스크탑" >데스크탑</option>
									<option value="노트북" >노트북</option>
								</select>
								<br>
                            	<div class="form-group">
                            		<label>품목명</label>
                            		<input class="form-control" placeholder="품목명" name="device_modelname" id="device_modelname" type="text" />
                            	</div>
                            	<div class="form-group">
                            		<label>제품사양</label>
                            		<input class="form-control" placeholder="제품사양" name="device_specification" id="device_specification" type="text" />
                            	</div>
                            	<div class="form-group">
                            		<label>구매일</label>
                            		<input class="form-control" placeholder="구매일" name="device_buydate" id="device_buydate" type="text" />
                            	</div>
                            	<div class="form-group">
                            		<label>관리자</label>
                            		<input class="form-control" placeholder="관리자" name="device_manager" id="device_manager" type="text" />
                            	</div>
                            	<div class="form-group">
                            		<label>사용자</label>
                            		<input class="form-control" placeholder="사용자" name="device_user" id="device_user" type="text" />
                            	</div>
                            	 <label>자산상태</label>
                            	<select class="form-control" id="device_state" name="device_state" />
									<option value="주장비" selected>주장비</option>
									<option value="대여">대여</option>
									<option value="재고">재고</option>									
									<option value="수리중">수리중</option>
									<option value="불용">불용 </option>
								</select>
								<br>
                            	<div class="form-group">
									<label>비고</label>
									<input class="form-control" placeholder="비고" name="device_etc" id="device_etc" type="text" />
								</div>
								<div class="form-group">
                            		<input class="form-control" placeholder="자산번호" name="device_no" id="device_no" type="hidden" />
                            	</div>
                            	<input type="button" class="btn btn-lg btn-success btn-block" value="회원가입" onclick="DosignUp();" />
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>

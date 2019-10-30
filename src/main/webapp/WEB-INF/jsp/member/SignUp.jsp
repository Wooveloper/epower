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
	var isCheckId = 0;
	function duplicationId () {
		var member_id = $("#member_id").val();
		console.log(member_id);
		$.ajax({
			async: false,
			type: "post",
			url: "SelectIdCheck.do",
			//dataType : "json",
			//contentType : "application/json; charset=UTF-8",
			data: {"member_id":member_id},
			success: function (data) 
			{
				if(member_id.length == 0) { alert("아이디를 입력해 주세요."); $("#member_id").focus(); return; }
				if(data == 1 ) {
					alert("사용가능한 아이디입니다.");
					
					$("#divInputId").addClass("has-success");
					$("#divInputId").removeClass("has-error");
					$("#member_id").prop('readonly',true);
					$("#member_password").focus();
					isCheckId = 1;
				} else {
					alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
					
					$("#divInputId").addClass("has-error");
					$("#divInputId").removeClass("has-success");
					$("#member_id").focus();
				}
			},
			error: function(req, status, errThrown) {
				alert("Error");
			}
		});
	}
</script>
<script type="text/javascript">
	function DosignUp(member_id,member_password) {
		
		var member_id = $("#member_id").val();
		var member_password = $("#member_password").val();
		var member_passwordcfm = $("#member_passwordCfm").val();
		var member_name = $("#member_name").val();
		var member_phone = $("#member_phone").val();
		var member_email = $("#member_email").val();
	    var checkNumber = member_password.search(/[0-9]/g);
	    var checkEnglish = member_password.search(/[a-z]/ig);
		var passRule = /^[A-Za-z0-9]{6,12}$/;//숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식
		
		if(member_id.length == 0) { alert("아이디를 입력해 주세요."); $("#member_id").focus(); return; }
		if(member_id == 0) { alert("아이디 중복 체크를 해주세요."); $("#member_id").focus(); return; }
		
		if(member_password.length == 0) { alert("비밀번호를 입력해 주세요."); $("#member_password").focus(); return; }
		if(member_password != member_passwordcfm) { alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); $("#member_password").focus(); return; }
		
		if(member_name.length == 0) { alert("회사명을 입력해 주세요."); $("#member_name").focus(); return; }
		
		if(member_phone.length == 0) { alert("전화번호를 입력해 주세요."); $("#member_phone").focus(); return; }
		
		if(member_email.length == 0) { alert("이메일을 입력해 주세요."); $("#member_email").focus(); return; }
		
		//if(inputCpnNo.length == 0) { alert("사업자번호를 입력해 주세요."); $("#signUpUserCompanyNo").focus(); return; }
		
		//if(inputCpnAddr1.length == 0 || inputCpnAddr2.length == 0 || inputCpnAddr3.length == 0) { 
		//	alert("주소를 입력해 주세요."); $("#signUpUserCompanyAddressDetail").focus();  return;
		//}

		//	if(confirm("회원가입을 하시겠습니까?")) {
		//	alert("가입!");
			
		//	location.href="/InsertSignUpForm.do?
		//			member_id="+$("#signUpUserId").val()+
		//			"&member_password="+$("#signUpUserPwd").val()+
		//			"&member_name="+$("#signUpUserCompanyName").val()+
		//			"&member_phone="+$("#signUpUserTelNo").val()+
		//			"&member_email="+$("#signUpUserEmail").val();-->
			
 
			if(!passRule.test($('#member_password').val())) {
			alert("숫자와 문자 포함 형태의 6~12자리 이내의 암호여야 합니다.");
 			   return false;
			}

			if(checkNumber <0 || checkEnglish <0){
			    alert("숫자와 영문자를 혼용하여야 합니다.");
			    $('#member_password').val('').focus();
			    return false;
			}
		
		if(confirm("회원가입을 하시겠습니까?")){
	        if(isCheckId == 0){
	            alert('아이디 중복체크를 해주세요');
	            return false;
	        }else{
	        alert("회원가입을 축하합니다");
	    	location.href="/InsertSignUpForm.do?member_id="+$("#member_id").val()+
				"&member_password="+$("#member_password").val()+
				"&member_name="+$("#member_name").val()+
				"&member_phone="+$("#member_phone").val()+
				"&member_email="+$("#member_email").val();
	        }
	    }
	}
	
</script>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-3" style="width: 50%">
                <div class="login-panel panel panel-default" style="margin-top: 10%; margin-bottom: 10%;">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign Up</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action=InsertSignUpForm.do method="post">
                        <!-- <form role="form"> -->
                            <fieldset>
                            	<div class="form-group" id="divInputId">
                            		<label>아이디</label>
                            		<input class="form-control" style="margin-bottom: 5px;" placeholder="아이디" name="member_id" id="member_id" type="text" />
                            		<input type="button" class="btn btn-default" style="width: 30%;" value="중복확인" onclick="duplicationId();" />
                            	</div>
                            	<div class="form-group">
                            		<label>비밀번호</label>
                            		<input class="form-control" placeholder="비밀번호" name="member_password" id="member_password" type="password" />
                            	</div>
                            	<div class="form-group">
                            		<label>비밀번호 확인</label>
                            		<input class="form-control" placeholder="비밀번호 확인" name="member_passwordCfm" id="member_passwordCfm" type="password" />
                            	</div>
                            	<div class="form-group">
                            		<label>이름</label>
                            		<input class="form-control" placeholder="이름" name="member_name" id="member_name" type="text" />
                            	</div>
                            	<div class="form-group">
                            		<label>전화번호</label>
                            		<input class="form-control" placeholder="전화번호" name="member_phone" id="member_phone" type="text" />
                            	</div>
                            	<div class="form-group">
                            		<label>이메일</label>
                            		<input class="form-control" placeholder="이메일" name="member_email" id="member_email" type="text" />
                            	</div>
                            	<!-- <div class="form-group">
                            		<label>사업자번호</label>
                            		<input class="form-control" placeholder="사업자번호" name="signUpUserCompanyNo" id="signUpUserCompanyNo" type="text" />
                            	</div>
                            	<div class="form-group">
                            		<label style="display: block;" >회사주소</label>
                            		<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="signUpUserPostNo" id="signUpUserPostNo" type="text" readonly="readonly" >
                            		<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
                            		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                                <div class="modal-dialog">
	                                    <div class="modal-content">
	                                        <div class="modal-header">
	                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                                            <h4 class="modal-title" id="myModalLabel">우편번호 서비스</h4>
	                                        </div>
	                                        <div class="modal-body">
	                                        	<label>주소 입력</label>
	                                        	<div class="form-group input-group">
		                                           <input type="text" class="form-control" name="dlgSearchAddress" onclick="execPostCode();">
			                                           <span class="input-group-btn">
			                                               <button class="btn btn-default" type="button"><i class="fa fa-search"></i>
			                                               </button>
			                                           </span>
		                                       </div>
	                                            <p class="help-block">아래와 같은 조합으로 검색을 하시면 더욱 정확한 결과가 검색됩니다.</p>
	                                            <p class="help-block">도로명 + 건물번호</p>
	                                            <p class="text-primary">예) 판교역로 235, 제주 첨단로 242</p>
	                                            <p class="help-block">지역명(동/리) + 번지</p>
	                                            <p class="text-primary">예) 삼평동 681, 제주 영평동 2181</p>
	                                            <p class="help-block">지역명(동/리) + 건물명(아파트명)</p>
	                                            <p class="text-primary">예) 분당 주공, 연수동 주공3차</p>
	                                            <p class="help-block">사서함명 + 번호</p>
	                                            <p class="text-primary">예) 분당우체국사서함 1~100</p>
	                                        </div>
	                                        <div class="modal-footer">
	                                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	                                            <button type="button" class="btn btn-primary">저장</button>
	                                        </div>
	                                    </div>
	                                    /.modal-content
	                                </div>
	                                /.modal-dialog
	                            </div> 
                            	</div>
                            	<div class="form-group">
                            		<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="signUpUserCompanyAddress" id="signUpUserCompanyAddress" type="text" readonly="readonly" />
                            	</div>
                            	<div class="form-group">
                            		<input class="form-control" placeholder="상세주소" name="signUpUserCompanyAddressDetail" id="signUpUserCompanyAddressDetail" type="text"  />
                            	</div>-->
                            	
                            	<input type="button" class="btn btn-lg btn-success btn-block" value="회원가입" onclick="DosignUp();" />
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 <script type="text/javascript">
 	function execPostCode() {
 		new daum.Postcode({
 			oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                
                $("[name=signUpUserPostNo]").val(data.zonecode);
                $("[name=signUpUserCompanyAddress]").val(fullRoadAddr);
                
                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
 		}).open();
 	}
 </script>

</body>

</html>

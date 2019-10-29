<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
    <head>
        <title>게시판</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                
                var status = false; //수정과 대댓글을 동시에 적용 못하도록
                
                $("#list").click(function(){
                    location.href = "SelectBoardListForm.do";
                });
                //글수정
                $("#modify").click(function(){
                    
                    var password = $("input[name='password']");
                    
                    if(password.val().trim() == ""){
                        alert("패스워드를 입력하세요.");
                        password.focus();
                        return false;
                    }
                                        
                    //ajax로 패스워드 검수 후 수정 페이지로 포워딩
                    //값 셋팅
                    var objParams = {
                            id         : $("#board_id").val(),    
                            password : $("#password").val()
                    };
                                        
                    //ajax 호출
                    $.ajax({
                        url            :    "/board/check",
                        dataType    :    "json",
                        contentType :    "application/x-www-form-urlencoded; charset=UTF-8",
                        type         :    "post",
                        async        :     false, //동기: false, 비동기: ture
                        data        :    objParams,
                        success     :    function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                location.href = "/board/edit?id="+$("#board_id").val();
                            }
                            
                        },
                        error        :    function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    
                });
                
                //글 삭제
                $("#delete").click(function(){
                    
                    var password = $("input[name='password']");
                    
                    if(password.val().trim() == ""){
                        alert("패스워드를 입력하세요.");
                        password.focus();
                        return false;
                    }
                    
                    //ajax로 패스워드 검수 후 수정 페이지로 포워딩
                    //값 셋팅
                    var objParams = {
                            id         : $("#board_id").val(),    
                            password : $("#password").val()
                    };
                                        
                    //ajax 호출
                    $.ajax({
                        url            :    "/board/del",
                        dataType    :    "json",
                        contentType :    "application/x-www-form-urlencoded; charset=UTF-8",
                        type         :    "post",
                        async        :     false, //동기: false, 비동기: ture
                        data        :    objParams,
                        success     :    function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                alert("삭제 되었습니다.");
                                location.href = "/board/list";
                            }
                            
                        },
                        error        :    function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    
                });
                
            });   
        </script>
    </head>
    <style>
        textarea{
              width:100%;
            }
        .reply_reply {
                border: 2px solid #FF50CF;
            }
        .reply_modify {
                border: 2px solid #FFBB00;
            }
    </style>
    <body>
        <input type="hidden" id="board_id" name="board_id" value="${boardView.id}" />
        <div align="center">
            </br>
            </br>
               <table border="1" width="70%" >
                 
<tr>
<td width="30%">
자산종류
</td>
<td width="70%">
홀롤로
</td>
</tr>
<tr>
<td width="30%">
모델
</td>
<td width="70%">
홀롤로
</td>
</tr>
<tr>
<td width="30%">
구매가격
</td>
<td width="70%">
홀롤로
</td>
</tr>
<tr>
<td width="30%">
 사용자
</td>
<td width="70%">
홀롤로
</td>
</tr>
<tr>
<td width="30%">
 상태
</td>
<td width="70%">
홀롤로
</td>
</tr>
<tr>
<td width="30%">
 제목
</td>
<td width="70%">
홀롤로
</td>
</tr>
<tr>
<td width="30%">
 제목
</td>
<td width="70%">
홀롤로
</td>
</tr>
<tr>
<td width="30%">
 제목
</td>
<td width="70%">
홀롤로
</td>
</tr>

               </table>
                 <tr>
                 	 <button id="list" name="list" style="float: right;">게시판</button>
                     <button id="modify" name="modify" style="float: right;">글 수정</button>
                     <button id="delete" name="delete" style="float: right;">글 삭제</button>
                      
                       
                   </tr>
				<table>
            
				</table>
        </div>
    </body>
</html>

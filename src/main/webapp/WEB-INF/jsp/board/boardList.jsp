<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<div class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<button class="navbar-toggle" type="button" data-toggle="collapse" date-target="#navbar-main">
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Blog</a>
		</div>
		
		<center>
			<div class="navbar-collapse collapse" id="navbar-main">
				<form class="navbar-form navbar-right" rol="search" action="">
					<div class="form-group">
						<input type="text" class="form-control" id="member_id" name="member_id" placeholder="Username">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="member_password" name="member_password" placeholder="Password">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인" id="btn_login" name="btn_login"></button>
				</form>
			</div>
		</center>
	</div>
	</div>

	<div class="container">
		<table class="table table-board">
			<colgroup>
				<col width="7%">
				<col width="*">
				<col width="15%">
				<col width="10%">
				<col width="7%">
			</colgroup>
			<thead>
				<tr>
					<th style="test-align:center;">글 번호</th>
					<th style="test-align:center;">제목</th>
					<th style="test-align:center;">작성자</th>
					<th style="test-align:center;">작성일</th>
					<th style="test-align:center;">조회수</th>
				</tr>
				<tr>
					<td style="text-align:center;">12</td>
					<td>Test 게시글</td>
					<td style="text-align:center;"></td>
					<td style="text-align:center;">2018-01-29</td>
					<td style="text-align:center;">0</td>
				</tr>
				<tr>
					<td style="text-align:center;">8</td>
					<td>Test 게시글</td>
					<td style="text-align:center;"></td>
					<td style="text-align:center;">2018-01-30</td>
					<td style="text-align:center;">0</td>
				</tr>
		</table>
		<div class="huge-top">
			<button class="btn btn-normal pull-right" id="insert" onclick="">쓰기</button>
		</div>
	</div>		
</body>
</html>
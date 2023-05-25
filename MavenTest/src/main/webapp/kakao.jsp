<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 로그인 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
					<div class="d-flex justify-content-center">
						<a href="#" class="text-reset p-2" title="Tooltip">비밀번호 찾기</a> 
						<span class="p-2"> | </span> 
						<a href="registerUser" class="text-reset p-2" title="Tooltip">회원가입</a>
					</div>
				</div>
				<div class="modal-footer ">
	    		   <p>SNS 로그인</p>
		    		<div class="border p-3 mb-4 bg-light d-flex justify-content-between">
			    		<%-- 
			    			카카오 로그인 처리중 중 오류가 발생하면 아래 경고창에 표시된다.
			    			카카오 로그인 오류는 스크립트에서 아래 경고창에 표시합니다.
			    		 --%>
			    		<div class="alert alert-danger d-none" id="alert-kakao-login">오류 메세지</div>
						    		
		    			<a id="btn-kakao-login" href="kakao/login">
		  					<img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="200" alt="카카오 로그인 버튼"/>
						</a>
		    		</div>
		    		<form id="form-kakao-login" method="post" action="kakao-login">
		    			<input type="hidden" name="email"/>
		    			<input type="hidden" name="name"/>
		    			<input type="hidden" name="img"/>
		    		</form>
				</div>
			</div>
		</div>
	</div>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- �α��� ���â -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
					<div class="d-flex justify-content-center">
						<a href="#" class="text-reset p-2" title="Tooltip">��й�ȣ ã��</a> 
						<span class="p-2"> | </span> 
						<a href="registerUser" class="text-reset p-2" title="Tooltip">ȸ������</a>
					</div>
				</div>
				<div class="modal-footer ">
	    		   <p>SNS �α���</p>
		    		<div class="border p-3 mb-4 bg-light d-flex justify-content-between">
			    		<%-- 
			    			īī�� �α��� ó���� �� ������ �߻��ϸ� �Ʒ� ���â�� ǥ�õȴ�.
			    			īī�� �α��� ������ ��ũ��Ʈ���� �Ʒ� ���â�� ǥ���մϴ�.
			    		 --%>
			    		<div class="alert alert-danger d-none" id="alert-kakao-login">���� �޼���</div>
						    		
		    			<a id="btn-kakao-login" href="kakao/login">
		  					<img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="200" alt="īī�� �α��� ��ư"/>
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
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
<form action="memberJoin.do" method="post" id="myform">
	<input type="image" src="img/member/kakao_account_login_btn_medium_wide.png" onclick="loginWithKakao()" id="custom-login-btn">
	<input type="hidden" id="code" name="code">
</form>
</a>
<script type='text/javascript'>
document.getElementById("myform").addEventListener("click", function(event){
	  event.preventDefault()
	});
	
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('2a7355b444cbdd1f5985d00f418807ee');    
    function loginWithKakao() {
   	
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
        success: function(authObj) {
          //alert(JSON.stringify(authObj));
          	document.getElementById("code").value=JSON.stringify(authObj);
        	document.getElementById("myform").submit();
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    };
  //]]>
</script>
</body>
</html>
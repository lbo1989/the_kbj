<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
//kakao javascript 방식
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
          Kakao.API.request({
          url: '/v2/user/me',
          success: function(res) {
            //alert(JSON.stringify(res));
            document.getElementById("code").value=JSON.stringify(res);
            alert(document.getElementById("code").value);
        	document.getElementById("myform").submit();
          },
          fail: function(error) {
            alert(JSON.stringify(error));
          }
        });
          
          	
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
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
<a id="kakao-login-btn"></a>

<form method="post" action="#" name="frm">
		
		<input type="submit" value="����">
</form>

<script type='text/javascript'>
function login()
{
	//<![CDATA[
    // ����� ���� JavaScript Ű�� ������ �ּ���.
    Kakao.init('2a7355b444cbdd1f5985d00f418807ee');
    // īī�� �α��� ��ư�� �����մϴ�.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        // �α��� ������, API�� ȣ���մϴ�.
        Kakao.API.request({
          url: '/v2/user/me',
          success: function(res) {
            login(JSON.stringify(res));
            /* alert(JSON.stringify(res)); */
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
  //]]>
}
</script>



</body>
</html>
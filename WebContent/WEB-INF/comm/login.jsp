<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/comm.css">
<link rel="stylesheet" href="css/login.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
<div id="wrap">
	<div class="loginBox">
            <p class="loginLogo"><a href="#">THE KBJ</a></p>
            <div class="login_inputBox">
                <form class="login_inputInner" name="login" action="main.html" method="get" enctype="text/plain">
                   <ul>
                       <li>
                          <label for="login_id">아이디</label>
                           <input type="text" id="login_id" class="login_input" name="login_id" placeholder="아이디" autofocus required>
                       </li>
                       <li>
                          <label for="login_pw">비밀번호</label>
                           <input type="password" id="login_pw" class="login_input"name="login_pw" placeholder="비밀번호" required>
                       </li>
                       <li>
                         <input type="submit" id="login_btn" class="login_btn1" name="login" value="로그인">
                       </li>
                       <li>
                          <input type="checkbox" name="login_keep" id="loginkeep">
                        <label for="login_keep" class="login_keep_chek">로그인 상태유지</label>
                       </li>
                   </ul>
                </form>
            </div>
            <div class="login_footer">
                <ul>
                    <li class="login_footTxt"><a href="#">아이디찾기   |</a></li>
                    <li class="login_footTxt"><a href="#">비밀번호찾기   |</a></li>
                    <li class="login_footTxt"><a href="join.html">회원가입</a></li>
                </ul>
            </div>
        </div>
</div>
</body>
</html>
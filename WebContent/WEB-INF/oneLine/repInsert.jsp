<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:set var="result" value="${requestScope.result }"/>
	
	<c:if test="${result > 0 }">
		<script>
			alert('������ ���������� �޾ҽ��ϴ�.');
			location.href="oneLineList.do";
		</script>
	</c:if>
	<c:if test="${result <= 0 }">
		<script>
			alert('���� : ���� Insert ����');
			location.href="oneLineList.do";
		</script>
	</c:if>
</body>
</html>
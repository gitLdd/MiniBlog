<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Logon failed !</title>
<link type="text/css" href="${pageContext.request.contextPath}/css/errorPage.css" rel="stylesheet">
</head>
<script type="text/javascript">
	setTimeout("javascript:location.href='${pageContext.request.contextPath}/jsp/login.jsp'",5000);
</script>
<script type="text/javascript">
	var i = 6;
	function showtime() {
		i = i - 1;
		document.getElementById("CountDown").innerHTML = i;
		if (i > 1) {
			setTimeout('showtime()', 1000);
		}
	}
</script>
<body onload="showtime()">
	<div id="wrapper">
		<div id="main">
			<header id="header">
			<h1>
				<span class="icon">!</span>001<span class="sub">Logon verification failed</span>
			</h1>
			</header>
			<div id="content">
				<h2>登录验证失败！</h2>
				<p>&nbsp;&nbsp;当您看到这个页面,表示您输入的账号或者密码错误,&nbsp;<span id="CountDown" style="color:red"></span>&nbsp;秒后将自动为您跳转到登陆页面......</p>
				<div class="utilities">
					<a class="button right" href="${pageContext.request.contextPath}/jsp/login.jsp">点此立即跳转</a>
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
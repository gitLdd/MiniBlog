<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>跳转页面</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errorPage.css">
<style type="text/css">
p{
	text-indent: 2em;
}
</style>
</head>
<script type="text/javascript">
	setTimeout("javascript:location.href='${pageContext.request.contextPath}/jsp/index.jsp'",3000);
</script>
<script type="text/javascript">
	var i = 3;
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
				<span class="icon">···</span>000<span class="sub">Page Jump</span>
			</h1>
			</header>
			<div id="content">
				<h2>跳转页面</h2>
				<p>注册成功，&nbsp;<span id="CountDown" style="color:red"></span>&nbsp;秒后将自动为您跳转到首页......</p>
				<div class="utilities">
					<a class="button right" href="#" onClick="history.go(-1);return true;">返回上页</a><a class="button right" href="${pageContext.request.contextPath}/jsp/index.jsp">立即跳转</a>
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>
</html>
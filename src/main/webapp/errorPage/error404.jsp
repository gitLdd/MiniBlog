<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>404 Page Not Found</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errorPage.css">
<style type="text/css">
p{
	text-indent: 2em;
}
</style>
</head>
<script type="text/javascript">
	setTimeout("javascript:location.href='${pageContext.request.contextPath}'",5000);
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
				<span class="icon">!</span>404<span class="sub">Page Not Found</span>
			</h1>
			</header>
			<div id="content">
				<h2>您打开的这个的页面不存在！</h2>
				<p>该页面不存在或已被删除，&nbsp;<span id="CountDown" style="color:red"></span>&nbsp;秒后将自动为您跳转到首页......</p>
				<div class="utilities">
					<a class="button right" href="#" onClick="history.go(-1);return true;">返回上页</a><a class="button right" href="${pageContext.request.contextPath}">立即返回</a>
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
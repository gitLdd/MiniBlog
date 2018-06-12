<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>500 Internal Server Error</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errorPage.css">
<style type="text/css">
p{
	text-indent: 2em;
}
</style>
</head>
<script type="text/javascript">
	setTimeout("history.back()", 5000);
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
    	<h1><span class="icon">!</span>500<span class="sub">Internal Server Error</span></h1>
    </header>
    <div id="content">
    	<h2>内部服务器错误！</h2>
        <p>服务器内部出错,您可以返回重新访问。如果您多次遇到这个页面,请联系我们进行反馈,感谢您的支持!&nbsp;<span id="CountDown" style="color:red"></span>&nbsp;秒后将自动返回上页......</p>
        <div class="utilities">
        	<a class="button right" href="#" onClick="history.go(-1);return true;">立即返回</a><a class="button right" href="${pageContext.request.contextPath}/jsp/contact.jsp">联系我们</a>
        	<div class="clear"></div>
      </div>
    </div>
  </div>
</div>
</html>
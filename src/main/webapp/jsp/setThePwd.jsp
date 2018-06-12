<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>MiniBlog-找回密码</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='http//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='http//fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700' rel='stylesheet' type='text/css'>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- grid-slider -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.mousewheel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.contentcarousel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<!-- //grid-slider -->
<script src="${pageContext.request.contextPath}/js/BaiduShare.js"></script>
<style type="text/css">
.pWd {
	background-attachment: scroll;
	background-clip: border-box;
	background-color: rgb(128, 223, 248);
	background-image: none;
	background-origin: padding-box;
	background-position: 0% 0%;
	background-position-x: 0%;
	background-position-y: 0%;
	background-repeat: repeat;
	background-size: auto auto;
	border-bottom-color: rgb(255, 255, 255);
	border-bottom-style: none;
	border-bottom-width: 0px;
	border-image-outset: 0;
	border-image-repeat: stretch stretch;
	border-image-slice: 100%;
	border-image-source: none;
	border-image-width: 1;
	border-left-color: rgb(255, 255, 255);
	border-left-style: none;
	border-left-width: 0px;
	border-right-color: rgb(255, 255, 255);
	border-right-style: none;
	border-right-width: 0px;
	border-top-color: rgb(255, 255, 255);
	border-top-style: none;
	border-top-width: 0px;
	box-sizing: border-box;
	color: rgb(255, 255, 255);
	cursor: default;
	float: left;
	font-family: "Open Sans", sans-serif;
	font-feature-settings: normal;
	font-kerning: auto;
	font-language-override: normal;
	font-size: 13.6px;
	font-size-adjust: none;
	font-stretch: normal;
	font-style: normal;
	font-variant: normal;
	font-variant-alternates: normal;
	font-variant-caps: normal;
	font-variant-east-asian: normal;
	font-variant-ligatures: normal;
	font-variant-numeric: normal;
	font-variant-position: normal;
	font-weight: 400;
	line-height: 19.4333px;
	margin-bottom: 10px;
	margin-left: 0px;
	margin-right: 0px;
	margin-top: 10px;
	outline-color: rgb(255, 255, 255);
	outline-style: none;
	outline-width: 0px;
	padding-bottom: 10px;
	padding-left: 10px;
	padding-right: 10px;
	padding-top: 10px;
	width: 90%;
	-moz-border-bottom-colors: none;
	-moz-border-left-colors: none;
	-moz-border-right-colors: none;
	-moz-border-top-colors: none;
}
</style>
</head>
<body>
    <!-- start header_bottom -->
    <div class="header-bottom">
		 <div class="container">
			<div class="header-bottom_left">
				<i class="phone"> </i><span>188-0392-6086</span>
			</div>
			<div class="social">
				<!-- ................................百度分享................................ -->
				<div class="bdsharebuttonbox">
					<!-- <a href="#" class="bds_more" data-cmd="more"></a> -->
					<a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
					<a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
					<a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
					<a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
					<a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
					<a href="#" class="bds_tieba" data-cmd="tieba" title="分享到百度贴吧"></a>
					<a href="#" class="bds_fbook" data-cmd="fbook" title="分享到Facebook"></a>
					<a href="#" class="bds_twi" data-cmd="twi" title="分享到Twitter"></a>
				</div>
				<!-- ................................百度分享................................ -->
		   </div>
		   <div class="clear"></div>
		</div>
    </div>
    <!-- start menu -->
    <div class="menu">
	  <div class="container">
		 <div class="logo">
			<a href="index.jsp"><img src="${pageContext.request.contextPath}/images/logo.png" alt=""/></a>
		 </div>
		 <div class="h_menu4"><!-- start h_menu4 -->
			 <ul class="nav">
			   <li><a href="${pageContext.request.contextPath}/jsp/index.jsp">推荐</a></li>
			   <li><a href="${pageContext.request.contextPath}/jsp/about.jsp">关于</a></li>
			   <li><a href="${pageContext.request.contextPath}/aboutBlog/requestBlog.do?uid=0&pageno=1">博客</a></li>
			   <li><a href="${pageContext.request.contextPath}/jsp/contact.jsp">联系</a></li>
			 </ul>
			  <script type="text/javascript" src="${pageContext.request.contextPath}/js/nav.js"></script>
		  </div><!-- end h_menu4 -->
		 <div class="clear"></div>
	  </div>
	</div>
	<!-- end menu -->
    <div class="main">
       <div class="about_banner_img"><img src="${pageContext.request.contextPath}/images/missPwd.jpg" class="img-responsive" alt=""/>
       </div>
        <div class="about_banner_wrap">
      	   <h1 class="m_11">重新设置密码</h1>
      	</div>
      	<div class="border"> </div>
      	<div class="rwo contact">
      	  <div class="container">
      	  <div class="col-md-4"></div>
      		 <div class="col-md-4 contact-top">
			     <form method="post" action="${pageContext.request.contextPath }/missPwd/setPwd.do">
					<span style="color:#fff;">账号：</span>
					<div class="to">
                     	<input name="userEmail" disabled="disabled" type="text" class="text" value="${uEmail }" style="width:90%;">
					</div>
					<div class="clear"></div>
					<span style="color:#fff;">输入密码：</span><span id="pwd1MSG" style="color:red;"></span>
					<div class="to">
                     	<input id="pwd1" name="pwd1" type="password" class="pWd" style="width:90%;" maxlength="20" required onblur="checkPwd(this.value)">
					</div>
					<div class="clear"></div>
					<span style="color:#fff;">确认密码：</span><span id="pwd2MSG" style="color:red;"></span>
					<div class="to">
                     	<input id="pwd2" type="password" class="pWd" style="width:90%;" maxlength="20" required oninput="checkPwd2(this.value)">
					</div>
					<div class="clear"></div>
					<div class="to">
						<input type="checkbox" onclick="checkit(this.checked)">&nbsp;显示密码
					</div>
					<div class="clear"></div>
	                <div class="form-submit1">
			           <input name="submit" type="submit" id="submit" value="提交" onclick="return subCheck();">
					</div>
					<div class="clear"></div>
                 </form>
                 <script type="text/javascript">
                 	var timeoutID;
                 	var Flag1 = false;/*密码格式正确*/
                 	var Flag2 = false;/*重复密码正确*/
                 	/*验证密码*/
					function checkPwd(password) {
						/*获取提示框*/
						var pwd1MSG = document.getElementById("pwd1MSG");
						/**/
						var reg = /^[a-zA-Z]\w{5,19}$/;
						var flag = reg.test(password);
						if ( !flag ) {
							pwd1MSG.innerText = "密码格式有误！";
							Flag1 = false;
						} else {
							pwd1MSG.innerText = "";
							Flag1 = true;
						}
					}
					
					/*验证重复密码*/
					function checkPwd2(pwd2) {
						/*获取提示框*/
						var pwd2MSG = document.getElementById("pwd2MSG");
						/*获取第一个框输入的密码*/
						var pwd1 = document.getElementById("pwd1").value;
						//对上次未完成的延时操作进行取消
						clearTimeout(timeoutID);
						//对于密码比对延迟500ms，避免频繁比对
						timeoutID = setTimeout(function(){
							/*进行比对*/
							if(pwd1 != pwd2){
								Flag2 = false;
								pwd2MSG.innerText = "两次输入的密码不一致！";
							}else{
								Flag2 = true;
								pwd2MSG.innerText = "";
							}
						},500);
					}
					
					/*显示密码*/
					function checkit(isChecked) {
						if (isChecked) {
							$("#pwd1").prop("type", 'text');
							$("#pwd2").prop("type", 'text');
						} else {
							$("#pwd1").prop("type", 'password');
							$("#pwd2").prop("type", 'password');
						}
					}
					
					/*提交验证*/
					function subCheck(){
						if(Flag1 && Flag2){
							alert("您已成功修改密码！");
							return true;
						}else{
							alert("密码有误！");
							return false;
						}
					}
                 </script>
             </div>
				<div class="col-md-4">
					<div class="login-page">
						<div class="login-title">
							<h4 class="title">提醒</h4>
							<div id="loginbox" class="loginbox">
								<p>密码长度为6-20位，以字母开头，只能包含字母、数字、下划线</p>
							</div>
						</div>
					</div>
				</div>
			</div>
        </div>
      </div>
		 <div class="footer-bottom">
		<div class="container">
			<div class="row section group">
				<div class="col-md-4">
					<h4 class="m_7">快速注册</h4>
					<p class="m_8">
						提交您的邮箱以快速注册<strong>Mini Blog</strong>账号，初始密码和您的邮箱相同
					</p>
					<form name="kszc" class="subscribe" action="#" method="post">
						<input type="text" id="uE" value="输入邮箱" oninput="cfxTest();" onfocus="this.value = '';">
						<p id="loading">
						</p>
						<div class="subscribe1">
							<a id="aE" href="" onClick="return false;">快速注册<i class="but_arrow"> </i></a>
						</div>
					</form>
					<script language="javascript">
						var timeoutID;
						/*获取动画框*/
						var loading = document.getElementById("loading");
						/*邮箱格式验证*/
			        	 var zhengze = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
						/*正则验证结果*/
						var zzResult = false;
						/*获取超链接*/
						var aElement = document.getElementById("aE");
						/*获取用户输入框框*/
						var input = document.getElementById("uE");
						
						function cfxTest(){
							//对上次未完成的延时操作进行取消
							clearTimeout(timeoutID);
							//对于服务器端交互延迟500ms，避免快速打字造成的频繁请求
							//使得输入框失焦
						    timeoutID = setTimeout(function(){input.blur();},1000);}
					         //文本框失焦后操作
					         $("#uE").blur(function(){
					        	 /*获取用户输入内容*/
					        	 var uEmail = input.value;
								/*前台验证邮箱*/
								zzResult = zhengze.test(uEmail);
								if(zzResult){
									/*添加验证动画*/
									loading.innerHTML = "<img alt='验证邮箱中...' src='${pageContext.request.contextPath }/gif/loading.gif' width='25px' height='25px'>验证邮箱中";
									/*邮箱重复性的异步验证*/
						             $.post("/MiniBlog/register/fastRegister01.do",{account:$(this).val()},
						                 function(data){
						                     if(data=="true"){/* 账号已存在(不可用) */
						                         loading.innerHTML = "<font color='red'>该账号已存在，请直接登录！</font>";
						                         /*取消超链接的onClick*/
						                         aElement.setAttribute("onClick","return false;");
						                     }else{ /* 账号可用 */
						                    	 loading.innerHTML = "<font color='green'>该账号可用！</font>";
						                     	 /*恢复超链接的onClick*/
						                    	 aElement.setAttribute("onClick","return getHref();");
						                     }
						             },"text");
								}else{
									loading.innerHTML = "<font color='red'>邮箱格式不正确!</font>";
									/*取消超链接的onClick*/
			                        aElement.setAttribute("onClick","return false;");
								}
					        	 
					         });
						function getHref() {
							/*拼接超链接*/
							var theERL = "${pageContext.request.contextPath }/register/fastRegister02.do?uEmail=" + input.value;
							aElement.href = theERL;
							return true;
						}
					</script>
				</div>
				<div class="col-md-4">
					<div class="f-logo">
						<img src="${pageContext.request.contextPath}/images/logo.png"
							alt="" />
					</div>
					<p class="m_9">在这里你可以分享自己的生活，分享自己的技术、资源。提出疑惑->得到解答，提升自己、亦或是发现问题->给出答案，帮助他人......</p>
					<p class="address">
						Phone : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="m_10">(00)
							222 666 444</span>
					</p>
					<p class="address">
						Email : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="m_10">info[at]mycompany.com</span>
					</p>
				</div>
				<div class="col-md-4">
					<ul class="list">
						<h4 class="m_7">导航</h4>
						<li><a href="#">关于</a></li>
						<li><a href="#">讲师</a></li>
						<li><a href="#">类别</a></li>
						<li><a href="#">我的</a></li>
						<li><a href="#">定价</a></li>
						<li><a href="#">联系</a></li>
					</ul>
					<ul class="list1">
						<h4 class="m_7">社区</h4>
						<li><a href="#">博客</a></li>
						<li><a href="#">论坛</a></li>
						<li><a href="#">支持</a></li>
						<li><a href="#">通讯</a></li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div class="copyright">
		<div class="container">
			<div class="copy">
				<p>(c) 2017 MiniBlog</p>
			</div>
			<div class="social">
				<div class="bdsharebuttonbox">
					<!-- <a href="#" class="bds_more" data-cmd="more"></a> -->
					<a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a> <a
						href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a> <a
						href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a> <a
						href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a> <a
						href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a> <a
						href="#" class="bds_tieba" data-cmd="tieba" title="分享到百度贴吧"></a> <a
						href="#" class="bds_fbook" data-cmd="fbook" title="分享到Facebook"></a>
					<a href="#" class="bds_twi" data-cmd="twi" title="分享到Twitter"></a>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</body>
</html>
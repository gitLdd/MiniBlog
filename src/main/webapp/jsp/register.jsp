<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Register</title>
<style>


#captcha2 {
	width: 300px;
	display: inline-block;
}

.show {
	display: block;
}

.hide {
	display: none;
}

#notice2 {
	color: red;
}


#wait222 {
	text-align: left;
	color: #666;
	margin: 0;
}
</style>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='http//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='http//fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700' rel='stylesheet' type='text/css'>
<script type="application/x-javascript"> 
	addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); 
	function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/BaiduShare.js"></script>
<script src="${pageContext.request.contextPath }/js/gt.js"></script>
<style type="text/css">
#password,#mm2 {
	padding: 0;
	border: 0;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	border: 1px solid #EEE;
	outline-color: #00BFF0;
	width: 96%;
	font-size: 1em;
	padding: 0.5em;
	font-family: 'Open Sans', sans-serif;
	line-height: inherit;
	color: inherit;
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
				<a href="index.jsp"><img src="${pageContext.request.contextPath}/images/logo.png" alt="" /></a>
			</div>
			<div class="h_menu4"><!-- start h_menu4 -->
			 <ul class="nav">
			   <li><a href="${pageContext.request.contextPath}/jsp/index.jsp">推荐</a></li>
			   <li><a href="${pageContext.request.contextPath}/jsp/about.jsp">关于</a></li>
			   <li><a href="${pageContext.request.contextPath}/jsp/blog.jsp">博客</a></li>
			   <li><a href="${pageContext.request.contextPath}/jsp/contact.jsp">联系</a></li>
			 </ul>
			  <script type="text/javascript" src="${pageContext.request.contextPath}/js/nav.js"></script>
		  </div><!-- end h_menu4 -->
			<div class="clear"></div>
		</div>
	</div>
	<!-- end menu -->
	<div class="main">
		<div class="register-grids">
			<div class="container">
				<form id="regForm" action="/MiniBlog/routineRegister/register.do" method="post">
					<div class="register-top-grid">
						<h3>个人 信息</h3>
						<div>
							<span>邮箱(账号)<label style="color:red;">*</label>&nbsp;<font id="zhMSG"></font></span>
							<input type="text" name="account" id="account" autofocus required onblur="checkAcc(this.value)">
						</div>
						<div>
							<span>昵称(最多8个字符)<label>&nbsp;</label>&nbsp;<font id="ncMSG"></font></span> 
							<input type="text" name="nick" id="nick" maxlength="8" value="" onblur="checkNick(this.value)">
						</div>
						<div>
							<span>个性签名(最多30个字符)</span>
							<input type="text" name="geqian" maxlength="30">
						</div>
						<div>
							<span style="margin-bottom:5px !important;">性别<label>&nbsp;</label></span>
							<input type="radio" name="sex" value="nan" required>&nbsp;男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="sex" value="nv" required>&nbsp;女
						</div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
					<div class="register-bottom-grid">
						<h3>登录 信息</h3>
						<div>
							<span>密码(6-20位以字母开头只能包含字母、数字、下划线)<label style="color:red;">*</label>&nbsp;<font id="passwordMSG"></font></span>
							<input type="password" name="password" id="password" maxlength="20" required onblur="checkPwd(this.value)">
						</div>
						<div>
							<span>重复密码<label style="color:red;">*</label>&nbsp;<font id="mm2MSG"></font></span>
							<input form="other" type="password" id="mm2" maxlength="20" required oninput="checkPwd2(this.value)">
						</div>
						<div class="clear"></div>
						<a class="news-letter" href="#">
							<label class="checkbox">
							<input type="checkbox" onclick="checkit(this.checked)"><i></i>显示/隐藏密码</label>
						</a>
						<script type="text/javascript">
							/*
								表单有效条件：Flag 1~5 均为true才能提交
								1.邮箱格式正确		2.邮箱不重复
								3.未输入昵称或者输入了昵称昵称不重复
								4.密码格式正确		5.重复密码正确
																*/
							var Flag1 = false;
							var Flag2 = false;
							var Flag3 = true;
							var Flag4 = false;
							var Flag5 = false;
							/*验证邮箱*/
							function checkAcc(account){
								/*获取提示信息框*/
								var zhMSG = document.getElementById("zhMSG");
								/*邮箱格式验证*/
					        	var zhengze = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
								var zhGSYZ = zhengze.test(account);
								if(zhGSYZ){
									/*格式正确，后台重复性验证*/
									Flag1 = true;
									zhMSG.innerHTML = "<img alt='验证邮箱中...' src='${pageContext.request.contextPath }/gif/loading.gif' width='15px' height='15px'>验证邮箱中...";
									/*邮箱重复性的异步验证*/
						             $.post("/MiniBlog/register/fastRegister01.do",{account:account},
						                 function(data){
						                     if(data=="true"){/* 账号已存在(不可用) */
						                    	 zhMSG.innerHTML = "<font color='red'>该账号已存在，请勿重复注册！</font>";
						                    	 Flag2 = false;
						                     }else{ /* 账号可用 */
						                    	 zhMSG.innerHTML = "<font color='green'><b>√</b></font>";
						                     	 Flag2 = true;
						                     }
						             },"text");
								}else{
									Flag1 = false;
									/*格式不正确或者为空*/
									if(account == ""){
										/*邮箱为空*/
										zhMSG.innerHTML = "<font color='red'>&nbsp;账号不能为空</font>";
									}else{
										/*格式不正确*/
										zhMSG.innerHTML = "<font color='red'>&nbsp;格式有误，请检查后重新输入！</font>";
									}
								}
							}
							
							/*验证昵称*/
							function checkNick(nick){
								/*获取提示信息框*/
								var ncMSG = document.getElementById("ncMSG");
								if(nick == "作者"){
									ncMSG.innerHTML = "<font color='red'>该昵称为系统保留，您不能使用该昵称！</font>";
			                    	Flag3 = false;
								}else if(nick != ""){
									ncMSG.innerHTML = "<img alt='验证昵称中...' src='${pageContext.request.contextPath }/gif/loading.gif' width='15px' height='15px'>验证昵称中...";
										/*昵称不为空，昵称重复性的异步验证*/
										$.post("/MiniBlog/routineRegister/nickCheck.do",{nick:nick},
								                 function(data){
								                     if(data=="true"){/* 昵称已存在(不可用) */
								                    	 ncMSG.innerHTML = "<font color='red'>该昵称已存在！</font>";
								                    	 Flag3 = false;
								                     }else{ /* 昵称可用 */
								                    	 ncMSG.innerHTML = "<font color='green'><b><b>√</b></b></font>";
								                     	 Flag3 = true;
								                     }
								             },"text");
								}else{
									/*昵称为空，采用默认昵称*/
									ncMSG.innerHTML = "";
									Flag3 = true;
								}
							}
							
							/*验证密码*/
							function checkPwd(password) {
								/*获取提示框*/
								var passwordMSG = document.getElementById("passwordMSG");
								/**/
								var reg = /^[a-zA-Z]\w{5,19}$/;
								var flag = reg.test(password);
								if ( !flag ) {
									passwordMSG.innerHTML = "<font color='red'>密码格式有误！</font>";
									Flag4 = false;
								} else {
									passwordMSG.innerHTML = "<font color='green'><b>√</b></font>";
									Flag4 = true;
								}
							}
							
							/*验证重复密码*/
							var timeoutID;
							function checkPwd2(pwd2) {
								/*获取提示框*/
								var mm2MSG = document.getElementById("mm2MSG");
								/*获取第一个框输入的密码*/
								var pwd1 = document.getElementById("password").value;
								//对上次未完成的延时操作进行取消
								clearTimeout(timeoutID);
								//对于密码比对延迟500ms，避免频繁比对
								timeoutID = setTimeout(function(){
									/*进行比对*/
									if(pwd1 != pwd2){
										Flag5 = false;
										mm2MSG.innerHTML = "<font color='red'>两次输入的密码不一致！</font>";
									}else{
										Flag5 = true;
										mm2MSG.innerHTML = "<font color='green'><b>√</b></font>";
									}
								},500);
							}
							
							/*显示密码*/
							function checkit(isChecked) {
								if (isChecked) {
									$("#password").prop("type", 'text');
									$("#mm2").prop("type", 'text');
								} else {
									$("#password").prop("type", 'password');
									$("#mm2").prop("type", 'password');
								}
							}
							
							/*提交验证*/
							function subCheck(){
								if(Flag1 && Flag2 && Flag3 && Flag4 && Flag5){
									return true;
								}else{
									alert("注册信息有误，请检查后重新输入！");
									return false;
								}
							}
						</script>
						<div class="clear"> </div>
					</div>
					<div class="clear"></div>
					<input type="submit" value="注册" onclick="return subCheck();">
				</form>
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
						<img src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/images/logo.png"
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
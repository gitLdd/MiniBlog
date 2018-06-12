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
      	   <h1 class="m_11">找回密码</h1>
      	</div>
      	<div class="border"> </div>
      	<div class="rwo contact">
      	  <div class="container">
      	  <div class="col-md-4"></div>
      		 <div class="col-md-8 contact-top">
			     <form method="post" action="${pageContext.request.contextPath}/missPwd/jumpToSetPwd.do">
					<span style="color:#fff;">输入您的账号：</span><span id="zhMSG" style="color:red;"></span>
					<div class="to">
                     	<input id="zhEmail" name="zhEmail" type="text" class="text" value="邮箱" style="width:50%;" onfocus="if (this.value == '邮箱') {this.value = '';}" onblur="if (this.value == '') {this.value = '邮箱';};checkzhEmail(this.value);">
					</div>
					<div class="clear"></div>
					<span style="color:#fff;">输入验证码：</span>
					<div class="to">
                     	<input id="yzmInput" type="text" class="text" value="验证码" style="width:50%;" onfocus="if (this.value == '验证码') {this.value = '';}" onblur="if (this.value == '') {this.value = '验证码';}">&nbsp;
					</div>
                    &nbsp;<input type="hidden" id="getYZM" value="获取验证码" onclick="toGetYzm()"><br><br>
	                <div class="form-submit1">
			           <input name="submit" type="submit" id="submit" value=" 找 回 密 码  " onclick = "return zhmmBt();">
					</div>
					<div class="clear"></div>
                 </form>
                 <script type="text/javascript">
                 	var Flag1 = false;/*输入邮箱正确且存在*/
                 	var Flag2 = false;/*输入的验证码正确*/
                 	var resultYZM = null;/*处理器返回验证码*/
                 	var time = 60;/*获取验证码时间间隔*/
                 	var yzm_email = null;/*获取验证码的邮箱，防止获取正确验证码后改变邮箱*/
                 	function checkzhEmail(zhEmail){/*验证输入的邮箱*/
						/*获取账号信息提示框*/
                 		var zhMSG = document.getElementById("zhMSG");
                 		/*邮箱格式验证*/
			        	 var zhengze = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
						/*正则验证结果*/
						var zzResult = false;
						zzResule = zhengze.test(zhEmail)
                 		if(zhEmail == "邮箱"){
                 			zhMSG.innerText = "";
                 		}else{
							if(!zzResule){
								zhMSG.innerText = "邮箱格式有误!";
								Flag1 = false;
						        document.getElementById("getYZM").type = "hidden";
	                 		} else {/*验证账号是否存在*/
	                 			zhMSG.innerHTML = "<img alt='验证邮箱中...' src='${pageContext.request.contextPath }/gif/loading.gif' width='20px' height='20px'>验证邮箱中";
	                 			$.post("/MiniBlog/register/fastRegister01.do",{account:zhEmail},
						                 function(data){
						                     if(data=="true"){/* 账号存在 */
						                    	 zhMSG.innerText = "";
						                    	 Flag1 = true;
						                    	 document.getElementById("getYZM").type = "button";
						                     }else{ /* 账号不存在 */
						                    	 zhMSG.innerText = "该账号不存在!";
						                    	 Flag1 = false;
						                    	 document.getElementById("getYZM").type = "hidden";
						                     }
						             },"text");
	                 		}
                 		}
                 	}
                 	function toGetYzm(){
                 		if(Flag1){
	                 		/*获取用户找回密码的账号*/
	                 		var zhEmail = document.getElementById("zhEmail").value;
	                 		/*发送邮件*/
	                 		$.post("/MiniBlog/missPwd/sendCheckEmail.do",{uAc:zhEmail},
					                 function(data){
	                 					resultYZM = data;
					                     },"text");
	                 		yzm_email = zhEmail;
	                 		/*xx秒后重新获取*/
	                 		document.getElementById("getYZM").disabled = true;
	                 		daoJiShi();
                 		} else {
                 			alert("输入的邮箱不正确或不存在")
                 		}
                 	}
                 	function daoJiShi(){
                 		time = time - 1;
                 		document.getElementById("getYZM").value = time + " 秒后重新获取";
                 		if (time > 0) {
                			setTimeout('daoJiShi()', 1000);
                		} else {
                			/*恢复获取验证码按钮*/
                			document.getElementById("getYZM").disabled = false;
                			document.getElementById("getYZM").value = "获取验证码";
                			time = 60;
                		}
                 	}
                 	function zhmmBt(){
                 		/*获取用户输入的验证码*/
                 		var uInputEmail =document.getElementById("zhEmail").value;
                 		/*获取用户输入的验证码*/
                 		var uInputYZM = document.getElementById("yzmInput").value;
                 		if(uInputYZM != resultYZM){
                 			Flag2 = false;
                 			alert("验证码不正确！");
                 			return false;
                 		} else {
                 			Flag2 = true;
                 		}
                 		if(uInputEmail != yzm_email){
                 			alert("账号和验证码不对应！");
                 			Flag1 = false;
                 			Flag2 = false;
                 			return false;
                 		}
                 		if(Flag1 && Flag2){
                 			return true;
                 		} else {
                 			return false;
                 		}
                 	}
                 </script>
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
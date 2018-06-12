<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>个人中心</title>
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
<!---calender-style---->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css" />
<!---//calender-style---->
<script src="${pageContext.request.contextPath}/js/BaiduShare.js"></script>	
</head>
<style type="text/css">
*{
	margin:0;
	padding:0;
	box-sizing:border-box
	}
.waiwei{
	position:relative;
	width:100px;
	height:100px;
	}
.fuceng{
	position:absolute;
	width:100px;
	height:100px;
	z-indent:2;
	left:0;
	top:0;
	background-color:rgba(29,172,253,0.5);
	text-align:center;
	}
i {
    background: url(${pageContext.request.contextPath}/images/updatePortait.png) no-repeat scroll center 0;
    display: block;
    width: 42px;
    height: 50px;
    margin-top: 22px;
    margin-top: 15px;
    margin-left: auto;
    margin-right: auto;
}
</style>
<body>
    <!-- start header_bottom -->
    <div class="header-bottom">
		 <div class="container">
			<div class="header-bottom_left">
				<i class="phone"> </i><span>188-0392-6086</span>
			</div>
			<c:choose>
				<c:when test="${empty  user}">
					<% 
						response.sendRedirect("/MiniBlog/jsp/login.jsp");
						session.setAttribute("realURL", "http://localhost:8888/MiniBlog/jsp/writeBlog.jsp");
					%>
				</c:when>
				<c:otherwise>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					欢迎您 <a id="on" title="我的博客" href="${pageContext.request.contextPath}/aboutPersonal/requestMyBlog.do?uid=${user.uid }&pageno=1">${user.nick }</a>&nbsp;|&nbsp;
					<a href="#" onclick="return logOut()">退出登录</a>
				</c:otherwise>
			</c:choose>
			<script type="text/javascript">
			function logOut(){
				var flag = confirm("确定退出登陆？");
				if(flag){
					$.post("/MiniBlog/logout.do",
						function(data){
							if(data=="true"){
								alert("您已成功退出！");
	                    	 	location.href = "${pageContext.request.contextPath}/jsp/index.jsp";
	                    	 	} else {
	                    	 		alert("失败");
	                    	 		}
							},"text");
					}
				return false;
				}
			</script>
			<div class="social">
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
			</div>
			<div class="clear"></div>
		</div>
    </div>
    <!-- start menu -->
    <div class="menu">
	  <div class="container">
		 <div class="logo">
			<a href="${pageContext.request.contextPath}/jsp/index.jsp"><img src="${pageContext.request.contextPath}/images/logo.png" alt=""/></a>
		 </div>
		 <div class="h_menu4"><!-- start h_menu4 -->
			 <ul class="nav">
			   <li><a href="${pageContext.request.contextPath}/jsp/index.jsp">推荐</a></li>
			   <li><a href="${pageContext.request.contextPath}/jsp/about.jsp">关于</a></li>
			   <li class="active"><a title="我的博客" href="${pageContext.request.contextPath}/aboutPersonal/requestMyBlog.do?uid=${user.uid }&pageno=1">我的</a>
			   	 <ul>
					<li><a href="${pageContext.request.contextPath}/jsp/personCenter.jsp">个人中心</a></li>
					<li><a href="${pageContext.request.contextPath}/jsp/writeBlog.jsp">书写博客</a></li>
				 </ul>
			   </li>
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
		<div class="about_banner_img">
			<img src="${pageContext.request.contextPath}/images/personCenter.jfif" class="img-responsive" alt="" />
		</div>
		<div class="about_banner_wrap">
			<h1 class="m_11">个人中心</h1>
		</div>
		<div class="border"></div>
		<div class="container">
			<div class="sap_tabs">
				<div id="horizontalTab"
					style="display: block; width: 100%; margin: 0px;">
					<ul class="resp-tabs-list">
						<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>信息修改</span></li>
						<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>密码修改</span></li>
						<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>统计信息</span></li>
						<div class="clear"></div>
					</ul>
					<div class="resp-tabs-container">
						<!-- tabel1 开始 -->
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
							<div class="facts">
								<ul class="tab-left">
									<table class="timetable">
										<thead>
											<tr>
												<th style="width:15% !important;">信息</th>
												<th style="width:45% !important;">点击即可编辑</th>
												<th style="width:15% !important;">限制</th>
												<th style="width:15% !important;">点此修改</th>
											</tr>
										</thead>
										<tbody>
											<tr class="row_1">
												<td style="width:15% !important;">&nbsp;昵&nbsp;&nbsp;称&nbsp;:</td>
												<td style="width:45% !important;"><p id="userNick" contenteditable="true">${user.nick }</p></td>
												<td style="width:15% !important;">最多只能含有8个字符</td>
												<td style="width:15% !important;"><a href="" title="修改昵称" onclick="return mdfNick();">修改</a></td>
											</tr>
											<tr class="row_1">
												<td style="width:15% !important;">&nbsp;性&nbsp;&nbsp;别&nbsp;:</td>
												<td style="width:45% !important;"><p id="userSex" contenteditable="true">${user.sex }</p></td>
												<td style="width:15% !important;">男&nbsp;or&nbsp;女&nbsp;or&nbsp;隐藏</td>
												<td style="width:15% !important;"><a href="" title="修改性别" onclick="return mdfSex();">修改</a></td>
											</tr>
											<tr class="row_1">
												<td style="width:15% !important;">&nbsp;擅&nbsp;&nbsp;长&nbsp;:</td>
												<td style="width:45% !important;"><p id="userSC" contenteditable="true">${user.shanchang }</p></td>
												<td style="width:15% !important;">emmm...没什么限制</td>
												<td style="width:15% !important;"><a href="" title="修改擅长" onclick="return mdfShanChang();">修改</a></td>
											</tr>
											<tr class="row_1">
												<td style="width:15% !important;">&nbsp;个&nbsp;性&nbsp;签&nbsp;名&nbsp;:</td>
												<td style="width:45% !important;"><p id="userGQ" contenteditable="true">${user.geqian }</p></td>
												<td style="width:15% !important;">最多只能含有30个字符</td>
												<td style="width:15% !important;"><a href="" title="修改个性签名" onclick="return mdfGeQian();">修改</a></td>
											</tr>
											<tr class="row_1">
												<td style="width:15% !important;">&nbsp;头&nbsp;&nbsp;像&nbsp;:</td>
												<td style="width: 45% !important;">
													<div id="waiwei" class="waiwei">
														<img id="yhtx" src="${pageContext.request.contextPath}/images/userPic/${user.fileName }.jpg" alt="用户头像" width="100px" height="100px" />
														<a id="af" href="" style="display: none" onclick="return changeTX();">
															<div id="xg" class="fuceng">
																<i></i>
																<p>修改头像</p>
															</div>
														</a>
													</div>
												</td>
												<td style="width:15% !important;"><span style="color:red;">会员专享</span><br>点击即可更换头像</td>
											</tr>
										</tbody>
									</table>
								</ul>
							</div>
						</div>
						<script language="javascript">
							window.onload = function() {
								var ww = document.getElementById("waiwei");
								ww.onmouseover = function() {
									var xx = document.getElementById("af");
									xx.removeAttribute("style");
								}
								ww.onmouseout = function() {
									var xx = document.getElementById("af");
									xx.setAttribute("style", "display:none");
								}
							}
							function mdfNick(){
								var input = document.getElementById("userNick");
								var text = input.innerText;
								text=text.replace(/\r\n/g,"")    
						        text=text.replace(/\n/g,"");
								var lengtn = text.length;
								var IntLen = parseFloat(lengtn);
								var flag = 0;
								if( 1 <= IntLen && IntLen < 9){
									if(text == '作者'){
										alert("该字段为系统保留，禁止使用！");
										return false;
									}
									/*判断昵称是否重复*/
									$.post("/MiniBlog/routineRegister/nickCheck.do",{nick:text},
								                 function(data){
								                     if(data=="true"){/* 昵称已存在(不可用) */
								                    	 alert("该昵称已被使用!");
								                     }else{ /* 昵称可用 */
								                    	 var xxx = toMdfNick();
								                     }
								             },"text");
									return false;
								} else {
									alert("长度错误！");
									return false;
								}
							}
							function toMdfNick(){
								var uid = ${user.uid };
								var input = document.getElementById("userNick");
								var text = input.innerText;
								/*异步修改昵称*/
								$.post("/MiniBlog/mdfPersonMsg/mdfNick.do",{uid:uid,nick:text},
						                 function(data1){
						                     if(data1=="true"){
						                        alert("修改成功！");
						                        /*刷新当前页面
						                        location.reload([true]);*/
						                     }else{
						                    	 alert("修改失败");
						                     }
						             },"text");
								return "xxx";
							}
							function mdfSex(){
								var uid = ${user.uid };
								var input = document.getElementById("userSex");
								var text = input.innerText;
						        text=text.replace(/\n/g,""); 
								if(text=="男"||text=="女"||text=="隐藏"){
									$.post("/MiniBlog/mdfPersonMsg/mdfSex.do",{uid:uid,sex:text},
							                 function(data){
							                     if(data=="true"){
							                        alert("修改成功！");
							                        /*刷新当前页面
							                        location.reload([true]);*/
							                     }else{
							                    	 alert("修改失败");
							                     }
							             },"text");
									return false;
								} else {
									alert("您输入的性别不符合要求！");
								}
								return false;
							}
							function mdfShanChang(){
								var uid = ${user.uid };
								var input = document.getElementById("userSC");
								var text = input.innerText;
						        text=text.replace(/\n/g,""); 
						        $.post("/MiniBlog/mdfPersonMsg/mdfShanChang.do",{uid:uid,shanchang:text},
						                 function(data){
						                     if(data=="true"){
						                        alert("修改成功！");
						                        /*刷新当前页面
						                        location.reload([true]);*/
						                     }else{
						                    	 alert("修改失败");
						                     }
						             },"text");
								return false;
							}
							function mdfGeQian(){
								var uid = ${user.uid };
								var input = document.getElementById("userGQ");
								var text = input.innerText;
						        text=text.replace(/\r\n/g,"")    
						        text=text.replace(/\n/g,"");
						        var IntLen = parseFloat(text.length);
								if(IntLen > 30){
									alert("长度超过限制！");
									return false;
								} else {
									 $.post("/MiniBlog/mdfPersonMsg/mdfGeQian.do",{uid:uid,geqian:text},
							                 function(data){
							                     if(data=="true"){
							                        alert("修改成功！");
							                        /*刷新当前页面
							                        location.reload([true]);*/
							                     }else{
							                    	 alert("修改失败");
							                     }
							             },"text");
									return false;
								}
							}
							function changeTX(){
								alert("此功能为会员专享！");
								return false;
							}
						</script>
						<!-- tabel1 结束 -->
						<div class="tab-2 resp-tab-content" aria-labelledby="tab_item-1">
							<div class="facts">
								<form name="xgmm" id="xgmm" method="post" action="/MiniBlog/mdfPersonMsg/mdfPassword.do" onsubmit="return toSubmit();">
								</form>
								<ul class="tab-left">
									<table class="timetable">
										<thead>
											<tr>
												<th style="width:20% !important;"></th>
												<th style="width:45% !important;">点击输入</th>
												<th style="width:20% !important;">&nbsp;验&nbsp;&nbsp;证&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<tr class="row_1">
												<td>&nbsp;密&nbsp;&nbsp;码&nbsp;：</td>
												<td style="padding:0px !important;margin:0px !important;">
													<input id="pw1" name="pw1" form="xgmm" type="password" maxlength="20" required onblur="checkPwd(this.value)" style="border:0;float:left;width: 70%; height: 100%;">
												</td>
												<td><div id="pw1MSG"></div></td>
											</tr>
											<tr class="row_1">
												<td>确认密码：</td>
												<td style="padding:0px !important;margin:0px !important;">
													<input id="pw2" name="pw2" type="password" maxlength="20" required oninput="checkPwd2(this.value)" style="border:0;float:left;width: 70%; height: 100%;">
													<a href="" onclick="return xsycPwd();">显示/隐藏密码</a>
												</td>
												<td><div id="pw2MSG"></div></td>
											</tr>
											<tr class="row_1">
												<td>验证码：</td>
												<td style="padding:0px !important;margin:0px !important;">
													<input id="yzm" name="yzm" type="text" required oninput="checkYzm(this.value)" style="border:0;float:left;width: 70%; height: 100%;">
													<input id="uEmail" type="hidden" value="${user.account }">
													<input type="button" id="getYZM" value="获取验证码" onclick="toGetYzm()">
												</td>
												<td><div id="yzmMSG"></div></td>
											</tr>
											<tr class="row_1">
												<td style="border:0;"></td>
												<td style="border:0;padding:0px !important;margin:0px !important;">
													密码长度6-20位，以字母开头且只能包含字母、数字、下划线
												</td>
												<!-- <td><a href="" onclick="return submit();">确认修改</a></td> -->
												<td><input form="xgmm" type="submit" value="确认修改"></td>
											</tr>
										</tbody>
									</table>
								</ul>
							</div>
							<script type="text/javascript">
								/*修改密码相关方法*/
								Flag1 = false;/*密码格式正确*/
								Flag2 = false;/*重复密码和密码相同*/
								Flag3 = false;/*验证码正确*/
								var resultYZM = null;/*处理器返回验证码*/
			                 	var time = 60;/*获取验证码时间间隔*/
								/*验证密码格式*/
								function checkPwd(password){
									/*获取提示框*/
									var pw1MSG = document.getElementById("pw1MSG");
									var reg = /^[a-zA-Z]\w{5,19}$/;
									var flag = reg.test(password);
									if ( !flag ) {
										pw1MSG.innerHTML = "<span style='color:red;'>密码格式错误！</span>";
										Flag1 = false;
									} else {
										pw1MSG.innerHTML = "<span style='color:green;'>验证通过</span>";
										Flag1 = true;
									}
								}
								/*验证重复密码*/
								var timeoutID;
								function checkPwd2(password){
									/*获取提示框*/
									var pw2MSG = document.getElementById("pw2MSG");
									/*获取第一个框输入的密码*/
									var pwd1 = document.getElementById("pw1").value;
									//对上次未完成的延时操作进行取消
									clearTimeout(timeoutID);
									//对于密码比对延迟500ms，避免频繁比对
									timeoutID = setTimeout(function(){
										/*进行比对*/
										if(pwd1 != password){
											Flag2 = false;
											pw2MSG.innerHTML = "<font color='red'>两次输入的密码不一致！</font>";
										}else{
											Flag2 = true;
											pw2MSG.innerHTML = "<font color='green'>验证通过</font>";
										}
									},500);
								}
								/*获取验证码*/
								function toGetYzm(){
									/*获取用户找回密码的账号*/
			                 		var zhEmail = document.getElementById("uEmail").value;
									/*发送邮件*/
			                 		$.post("/MiniBlog/missPwd/sendCheckEmail.do",{uAc:zhEmail},
							                 function(data){
			                 					resultYZM = data;
							                     },"text");
			                 		/*xx秒后重新获取*/
			                 		document.getElementById("getYZM").disabled = true;
			                 		daoJiShi(); 
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
								/*验证验证码*/
								function checkYzm(yzm){
									/*获取提示框*/
									var yzmMSG = document.getElementById("yzmMSG");
									if(resultYZM != yzm){
										yzmMSG.innerHTML = "<font color='red'>验证码错误！</font>";
										Flag3 = false;
									} else {
										yzmMSG.innerHTML = "<font color='green'>验证通过</font>";
										Flag3 = true;
									}
								}
								/*确认修改*/
								function toSubmit(){
									if(Flag1 && Flag2 && Flag3){
										alert("修改成功！");
										return true;
									} else {
										alert("验证失败！");
										return false;
									}
								}
								/*显示、隐藏密码*/
								function xsycPwd(){
									var type = document.getElementById("pw1").type;
									if (type=="password") {
										$("#pw1").prop("type", 'text');
										$("#pw2").prop("type", 'text');
										return false;
									} else {
										$("#pw1").prop("type", 'password');
										$("#pw2").prop("type", 'password');
										return false;
									}
								}
							</script>
						</div>
						<!-- tabel2 结束 -->
						<div class="tab-3 resp-tab-content" aria-labelledby="tab_item-2">
							<div class="facts">
								<ul class="tab-left">
									<table class="timetable">
										<thead>
											<tr>
												<th></th>
												<th>MONDAY</th>
												<th>TUESDAY</th>
												<th>WEDNESDAY</th>
												<th>THURSDAY</th>
												<th>FRIDAY</th>
												<th>SATURDAY</th>
												<th>SUNDAY</th>
											</tr>
										</thead>
										<tbody>
											<tr class="row_1 row_gray">
												<td>05.00 - 06.00</td>
												<td class="event"><a href="#" title="Boxing">Boxing</a>05.00 - 06.00</td>
												<td class="event"><a href="#" title="Boxing">Boxing</a>05.00 - 06.00</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</ul>
							</div>
						</div>
						<!-- tabel3 结束 -->
					</div>
				</div>
			</div>
			<script src="${pageContext.request.contextPath}/js/easyResponsiveTabs.js" type="text/javascript"></script>
		    <script type="text/javascript">
			    $(document).ready(function () {
			        $('#horizontalTab').easyResponsiveTabs({
			            type: 'default', //Types: default, vertical, accordion           
			            width: 'auto', //auto or any width like 600px
			            fit: true   // 100% fit in a container
			        });
			    });
			   </script>
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
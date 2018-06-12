<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>About</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/css/style.css"
	rel='stylesheet' type='text/css' />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link
	href='http//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='http//fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700'
	rel='stylesheet' type='text/css'>
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- grid-slider -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.mousewheel.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.contentcarousel.js"></script>
<!-- //grid-slider -->
<!---calender-style---->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.css" />
<!---//calender-style---->
<script src="${pageContext.request.contextPath}/js/BaiduShare.js"></script>
</head>
<body>
	<!-- start header_bottom -->
	<div class="header-bottom">
		<div class="container">
			<div class="header-bottom_left">
				<i class="phone"> </i><span>188-0392-6086</span>
			</div>
			<c:choose>
				<c:when test="${empty  user}">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 您还未登陆，请&nbsp;
					<a href="${pageContext.request.contextPath }/jsp/login.jsp">登录</a>&nbsp;|&nbsp;
					<a href="${pageContext.request.contextPath }/jsp/register.jsp">注册</a>
				</c:when>
				<c:otherwise>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					欢迎您 <a id="on" href="#">${user.nick }</a>&nbsp;|&nbsp;
					<a href="" onclick="return logOut()">退出登录</a>
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
	                    	 	/* location.href = "${pageContext.request.contextPath}/jsp/index.jsp"; */
								location.reload([true]);
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
	<div class="menu" id="menu">
		<div class="container">
			<div class="logo">
				<a href="${pageContext.request.contextPath}/jsp/index.jsp"><img
					src="${pageContext.request.contextPath}/images/logo.png" alt="" /></a>
			</div>
			<div class="h_menu4">
				<!-- start h_menu4 -->
				<!-- <a class="toggleMenu" href="#">Menu</a> -->
				<ul class="nav">
					<li><a href="${pageContext.request.contextPath}/jsp/index.jsp">推荐</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/jsp/about.jsp">关于</a></li>
					<c:choose>
						<c:when test="${empty  user}">
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath}/jsp/personCenter.jsp">我的</a></li>
						</c:otherwise>
					</c:choose>
					<li><a href="${pageContext.request.contextPath}/aboutBlog/requestBlog.do?uid=0&pageno=1">博客</a></li>
					<li><a href="${pageContext.request.contextPath}/jsp/contact.jsp">联系</a></li>
				</ul>
				<script type="text/javascript" src="${pageContext.request.contextPath}/js/nav.js"></script>
			</div>
			<!-- end h_menu4 -->
			<div class="clear"></div>
		</div>
	</div>
	<!-- end menu -->
	<div class="main">
		<div class="about_banner_img">
			<img src="${pageContext.request.contextPath}/images/about_img.jpg"
				class="img-responsive" alt="" />
		</div>
		<div class="about_banner_wrap">
			<h1 class="m_11">About Us</h1>
		</div>
		<div class="about-wrapper">
			<div class="container">
				<div class="row about-top">
					<div class="col-md-5">
						<img
							src="${pageContext.request.contextPath}/images/about_img1.jpg"
							class="img-responsive" alt="" />
					</div>
					<div class="col-md-7 about-left-text">
						<h2>Lorem ipsum dolorsit!</h2>
						<p>
							aliquam erat volutpat. Ut wisi enim ad minim veniam, quis <br>nostrud
							exerci tation ullamcorper suscipit lobortis.
						</p>
						<h4>
							ullamcorper - <span class="m_12">Gymsport Responsible</span>
						</h4>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="about_trainer">

				<h3 class="m_2">我们的团队</h3>
				<div class="row about_box">
					<div class="col-md-4">
						<div class="box1">
							<div class="box1_left">
								<img src="${pageContext.request.contextPath}/images/userPic/lxd.jpg"
									class="img-responsive" alt="" />
								<div class="desc1">
									<h3>
										卢 欣达<br>
										<span class="m_text">154803049</span>
									</h3>
									<p>
										2015级 软件学院<br>软件工程(Java方向)<br>Java1班
									</p>
									<!-- <div class="coursel_list">
							<i class="a_heart"> </i>
							<i class="like1"> </i>
						</div>
						<div class="coursel_list1">
							<i class="a_twt"> </i>
							<i class="a_fb"> </i>
						</div> -->
									<div class="clear"></div>
								</div>
							</div>
							<div class="box1_right">
								<h4>Qualifications</h4>
								<p>Lorem ipsum dolor consect adipiscing elit, diamnonu nibh
									euismod dolore eu feugiat nulla facilisis at vero eros et
									accumsan et iusto odio dignissim</p>
								<h4>Speciality</h4>
								<p class="para1">diam nonummy euismod tincidunt ut laoreet
									dolore magna aliquam volutpat.</p>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="box2">
							<div class="box1_left">
								<img src="${pageContext.request.contextPath}/images/userPic/lyf.jpg"
									class="img-responsive" alt="" />
								<div class="desc2">
									<h3>
										卢 彦丰<br>
										<span class="m_text">154803051</span>
									</h3>
									<p>
										2015级 软件学院<br>软件工程(Java方向)<br>Java1班
									</p>
									<!-- <div class="coursel_list">
							<i class="heart1"> </i>
							<i class="like"> </i>
						</div>
						<div class="coursel_list1">
							<i class="twt"> </i>
							<i class="fb"> </i>
						</div> -->
									<div class="clear"></div>
								</div>
							</div>
							<div class="box1_right">
								<h4 class="right_text">Qualifications</h4>
								<p class="right_text1">Lorem ipsum dolor consect adipiscing
									elit, diamnonu nibh euismod dolore eu feugiat nulla facilisis
									at vero eros et accumsan et iusto odio dignissim</p>
								<h4 class="right_text">Speciality</h4>
								<p class="right_text2">diam nonummy euismod tincidunt ut
									laoreet dolore magna aliquam volutpat.</p>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="box1">
							<div class="box1_left">
								<img src="${pageContext.request.contextPath}/images/userPic/hhy.jpg"
									class="img-responsive" alt="" />
								<div class="desc1">
									<h3>
										胡 浩洋<br>
										<span class="m_text">154803018</span>
									</h3>
									<p>
										2015级 软件学院<br>软件工程(Java方向)<br>Java1班
									</p>
									<!-- <div class="coursel_list">
							<i class="a_heart"> </i>
							<i class="like1"> </i>
						</div>
						<div class="coursel_list1">
							<i class="a_twt"> </i>
							<i class="a_fb"> </i>
						</div> -->
									<div class="clear"></div>
								</div>
							</div>
							<div class="box1_right">
								<h4>Qualifications</h4>
								<p>Lorem ipsum dolor consect adipiscing elit, diamnonu nibh
									euismod dolore eu feugiat nulla facilisis at vero eros et
									accumsan et iusto odio dignissim</p>
								<h4>Speciality</h4>
								<p class="para1">diam nonummy euismod tincidunt ut laoreet
									dolore magna aliquam volutpat.</p>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<div class="clear"></div>
				</div>

				<div class="row about_box1">
					<div class="col-md-4">
						<div class="box2">
							<div class="box1_left">
								<img src="${pageContext.request.contextPath}/images/userPic/lyh.jpg"
									class="img-responsive" alt="" />
								<div class="desc2">
									<h3>
										李 一含<br>
										<span class="m_text">154803041</span>
									</h3>
									<p>
										2015级 软件学院<br>软件工程(Java方向)<br>Java1班
									</p>
									<!-- <div class="coursel_list">
							<i class="heart1"> </i>
							<i class="like"> </i>
						</div>
						<div class="coursel_list1">
							<i class="twt"> </i>
							<i class="fb"> </i>
						</div> -->
									<div class="clear"></div>
								</div>
							</div>
							<div class="box1_right">
								<h4 class="right_text">Qualifications</h4>
								<p class="right_text1">Lorem ipsum dolor consect adipiscing
									elit, diamnonu nibh euismod dolore eu feugiat nulla facilisis
									at vero eros et accumsan et iusto odio dignissim</p>
								<h4 class="right_text">Speciality</h4>
								<p class="right_text2">diam nonummy euismod tincidunt ut
									laoreet dolore magna aliquam volutpat.</p>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="box1">
							<div class="box1_left">
								<img src="${pageContext.request.contextPath}/images/userPic/lrl.jpg"
									class="img-responsive" alt="" />
								<div class="desc1">
									<h3>
										李 若琳<br>
										<span class="m_text">154803034</span>
									</h3>
									<p>
										2015级 软件学院<br>软件工程(Java方向)<br>Java1班
									</p>
									<!-- <div class="coursel_list">
							<i class="a_heart"> </i>
							<i class="like1"> </i>
						</div>
						<div class="coursel_list1">
							<i class="a_twt"> </i>
							<i class="a_fb"> </i>
						</div> -->
									<div class="clear"></div>
								</div>
							</div>
							<div class="box1_right">
								<h4>Qualifications</h4>
								<p>Lorem ipsum dolor consect adipiscing elit, diamnonu nibh
									euismod dolore eu feugiat nulla facilisis at vero eros et
									accumsan et iusto odio dignissim</p>
								<h4>Speciality</h4>
								<p class="para1">diam nonummy euismod tincidunt ut laoreet
									dolore magna aliquam volutpat.</p>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<div class="clear"></div>
				</div>

			</div>
		</div>
		<div class="login">
		    <div class="row login_details">
		 	  <div class="col-md-6 col_1_of_login span_1_of_login">
				  <div class="join">
				  	 <h3>为什么加入我们？</h3>
				  	 <h4>Why do we join us ?</h4>
				  	 <p>balabala,balabalabalabala,balabala<br>balabala balabalabalabala balabala balabala . </p>	
				  	 <div class="btn3">
				       <a href="#" onclick="return false;">Join Today</a>
			         </div>	
				  </div>
				</div>
				 <div class="col-md-6 col_1_of_login span_1_of_login">
				  <div class="join-right">
				  	 <h3>为什么加入我们？</h3>
				  	 <h4>Why do we join us ?</h4>
				  	 <p>balabala,balabalabalabala,balabala<br>balabala balabalabalabala balabala balabala . </p>	
				  	 <div class="buttons_login">
				  	 <div class="btn4">
				       <a href="${pageContext.request.contextPath }/jsp/login.jsp">Log In</a>
			         </div>	
			         <div class="p-ww">
					  <form>
					   <input class="date" id="datepicker" type="text" value="View Calender" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'View Calender';}">
					  </form>
				     </div>
			         <div class="clear"></div>
			         <!---strat-date-piker---->
				  <script src="js/jquery-ui.js"></script>
				  <script>
				  $(function() {
				    $( "#datepicker" ).datepicker();
				  });
				  </script>
				  </div>
				  </div>
				</div>
				<div class="clear"></div>
		   </div>
	     </div>
	     <div class="testimonial">
		 	<div class="container">
		 		<i class="quot"> </i>
		 		<p>diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendreri</p>
		 		<p class="ceo">quis nostrud, <span class="ceo1">tation - ullamcorper</span></p>
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
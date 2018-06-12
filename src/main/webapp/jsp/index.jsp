<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Mini 博客</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='http//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='http//fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700' rel='stylesheet' type='text/css'>
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1200);
		});
	});
</script>
<!-- grid-slider -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.mousewheel.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.contentcarousel.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<!-- //grid-slider -->
<script src="${pageContext.request.contextPath}/js/BaiduShare.js"></script>
<style type="text/css">
.newBlog:hover {
	color: #4279CA !important;
	text-decoration: none;
}

.newBlog:link, .newBlog:visited {
	color: #FFF;
	text-decoration: none;
}

.btn1 .hotUser:hover {
	background-color: #00BFF0;
	color: #FFF !important;
}

.hotUser {
	border: 1px solid #00BFF0 !important;
	color: #00BFF0 !important;
	margin-bottom: 0px;
}
</style>
</head>
<body>
<!-- 判断 requestScope 中 Flag 是否存在，不存在则跳转至后台获取 -->
<%-- <c:if test="${empty sessionScope.NewestBlogs}"> --%>
<c:if test="${empty requestScope.Flag}">
	<% response.sendRedirect(request.getContextPath()+"/reqIndex.do"); %>
</c:if>
	<!-- start header_top -->
	<div class="header">
		<div class="container">
			<div class="header-text">
				<h1>mini 博客</h1>
				<h2>分享与发现的最好选择</h2>
				<p>在这里你可以分享自己的生活，分享自己的技术、资源。提出疑惑->得到解答，提升自己、亦或是发现问题->给出答案，帮助他人......</p>
				<div class="banner_btn">
					<a href="${pageContext.request.contextPath}/jsp/about.jsp">了解更多</a>
				</div>
			</div>
			<div class="header-arrow">
				<a href="#menu" class="class scroll"><span> </span></a>
			</div>
		</div>
	</div>
	<!-- end header_top -->
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
					欢迎您 <a id="on" href="${pageContext.request.contextPath}/aboutPersonal/requestMyBlog.do?uid=${user.uid }&pageno=1">${user.nick }</a>&nbsp;|&nbsp;
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
	<!-- end header_bottom -->
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
					<li class="active"><a href="${pageContext.request.contextPath}/jsp/index.jsp">推荐</a></li>
					<li><a href="${pageContext.request.contextPath}/jsp/about.jsp">关于</a></li>
					<c:choose>
						<c:when test="${empty  user}">
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath}/aboutPersonal/requestMyBlog.do?uid=${user.uid }&pageno=1">我的</a></li>
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
		<div class="container">
			<!-- start content-top -->
			<div class="row content-top">
				<div class="col-md-5">
					<img src="${pageContext.request.contextPath}/images/pic.png"
						class="img-responsive" alt="" />
				</div>
				<div class="col-md-7 content_left_text">
					<h3>发现新的世界！</h3>
					<p>趣闻趣事、高端技术、明星八卦、学习资源......你想要的一切，在这里都能找到</p>
				</div>
			</div>
		</div>
		<!-- end content-top -->
		<div class="container">
			<div class="row content-middle">
				<!-- start content-middle -->
				<div class="col-md-4">
					<a href="http://www.lieqiba.com/">
						<ul class="spinning">
							<li class="live">板块 <span class="m_1">奇闻趣事</span></li>
							<li class="room">Room 1</li>
							<div class="clear"></div>
						</ul>
						<div class="view view-fifth">
							<img src="${pageContext.request.contextPath}/images/pic3.jpg"
								class="img-responsive" alt="" />
							<div class="mask">
								<div class="info">Learn More</div>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4">
					<a href="https://www.csdn.net/">
						<ul class="spinning">
							<li class="live">板块 <span class="m_1">学习资料</span></li>
							<li class="room">Room 2</li>
							<div class="clear"></div>
						</ul>
						<div class="view view-fifth">
							<img src="${pageContext.request.contextPath}/images/pic2.jpg"
								class="img-responsive" alt="" />
							<div class="mask">
								<div class="info">Learn More</div>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4">
					<a href="https://baike.baidu.com/">
						<ul class="spinning">
							<li class="live">板块 <span class="m_1">生活百科</span></li>
							<li class="room">Room 3</li>
							<div class="clear"></div>
						</ul>
						<div class="view view-fifth">
							<img src="${pageContext.request.contextPath}/images/pic1.jpg"
								class="img-responsive" alt="" />
							<div class="mask">
								<div class="info">Learn More</div>
							</div>
						</div>
					</a>
				</div>
				<div class="clear"></div>
			</div>
			<!-- end content-middle -->
			<div class="row about">
				<div class="col-md-8">
					<h3 class="m_2">最新博文</h3>
					<div class="classes">
						<div class="cardio_list">
							<c:forEach items="${sessionScope.NewestBlogs }" var="newestBlog1" end="4">
            					<div class="cardio_sublist" style="padding-bottom:0px;">
									<ul class="cardio">
										<li>
											<i class="clock"> </i>
											<span><a class="newBlog" href="${pageContext.request.contextPath }/aboutBlogSingle/requestBlogSingle.do?tid=${newestBlog1.tid }&bloggerId=${newestBlog1.uid }">《${newestBlog1.title }》</a></span>
										</li>
									</ul>
									<div class="clear"></div>
									<p style="font-size:12px !important;text-align:right;padding-bottom:0px !important;">
									${newestBlog1.releasedate }
									</p>
								</div>
            				</c:forEach>
						</div>
						<div class="cardio_list1">
							<c:forEach items="${sessionScope.NewestBlogs }" var="newestBlog2" begin="5">
            					<div class="cardio_sublist" style="padding-bottom:0px;">
									<ul class="cardio">
										<li>
											<i class="clock"> </i>
											<span><a class="newBlog" href="${pageContext.request.contextPath }/aboutBlogSingle/requestBlogSingle.do?tid=${newestBlog2.tid }&bloggerId=${newestBlog2.uid }">《${newestBlog2.title }》</a></span>
										</li>
									</ul>
									<div class="clear"></div>
									<p style="font-size:12px !important;text-align:right;">${newestBlog2.releasedate }</p>
								</div>
            				</c:forEach>
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="col-md-4">
					<h3 class="m_4">推送说明</h3>
					<div class="members">
						<h4 class="m_3">热门博文</h4>
						<p>根据博文点赞数，推荐最好的5篇博文</p>
						<h4 class="m_3">最新博文</h4>
						<p>根据发布时间，实时推送最新发布的8篇博文</p>
						<h4 class="m_3">热门博主</h4>
						<p>根据所有博文点赞总数，推荐最热门的10位博主</p>
						<hr style="color: red;">
						<p>
							<strong>若发现恶意刷赞情况，将撤销博主首页推送资格</strong>
						</p>
						<!-- <div class="btn1">
				    <a href="#">More</a>
			       </div> -->
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="row content_middle_bottom">
				<div class="col-md-8">
					<h3 class="m_2">热门博主</h3>
					<div class="course_demo">
						<ul id="flexiselDemo3">
							<!-- 热门博主 -->
							<c:forEach items="${HotBlogers }" var="hotBloger">
								<li>
									<div class="view view-fifth">
										<!-- 博主头像 -->
										<img src="${pageContext.request.contextPath}/images/userPic/${hotBloger.fileName}.jpg" class="img-responsive" alt="" />
										<div class="mask">
											<div class="info">
												<!-- 博主首页 -->
												<a href="${pageContext.request.contextPath}/aboutBlog/requestBlog.do?uid=${hotBloger.uid }&pageno=1" style="color: red; font-size: 11px;" title="${hotBloger.nick }的博客">主页</a>
											</div>
										</div>
									</div>
									<div class="desc">
										<h3>
											${hotBloger.nick }<br> <span class="m_text">${hotBloger.shanchang }</span>
										</h3>
										<p><span style="color:red">❤${hotBloger.total }</span></p>
										<p>${hotBloger.geqian }</p>
										<div class="clear"></div>
									</div>
								</li>
							</c:forEach>
							<!-- 热门博主 -->
						</ul>
						<script type="text/javascript">
							$(window).load(function() {
								$("#flexiselDemo3").flexisel({
									visibleItems : 4,
									animationSpeed : 1000,
									autoPlay : true,
									autoPlaySpeed : 3000,
									pauseOnHover : true,
									enableResponsiveBreakpoints : true,
									responsiveBreakpoints : {
										portrait : {
											changePoint : 480,
											visibleItems : 1
										},
										landscape : {
											changePoint : 640,
											visibleItems : 2
										},
										tablet : {
											changePoint : 768,
											visibleItems : 2
										}
									}
								});

							});
						</script>
						<script type="text/javascript"
							src="${pageContext.request.contextPath}/js/jquery.flexisel.js"></script>
					</div>
				</div>
				<div class="col-md-4">
					<h3 class="m_2">热门博文</h3>
					<div class="blog_events">
						<c:forEach items="${sessionScope.HotBlogs }" var="hotBlog">
							<ul class="tab-left1">
								<div class="tab-text1" style="width: 100% !important;">
									<p>
										<img src="${pageContext.request.contextPath}/images/hot.png" alt="">
										<a href="${pageContext.request.contextPath }/aboutBlogSingle/requestBlogSingle.do?tid=${hotBlog.tid }&bloggerId=${hotBlog.uid }">《${hotBlog.title }》</a>
									</p>
									<span class="m_date" style="float: right;color:red;">❤${hotBlog.zannum }</span>
								</div>
								<div class="clear"></div>
							</ul>
						</c:forEach>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="row about">
				<div class="col-md-12">
					<h3 class="m_2">精选壁纸</h3>
					<div id="ca-container" class="ca-container">
						<div class="ca-wrapper">
							<div class="ca-item ca-item-1">
								<div class="ca-item-main">
									<div class="ca-icon"></div>
									<div class="ca-icon1"></div>
								</div>
							</div>
							<div class="ca-item ca-item-2">
								<div class="ca-item-main">
									<div class="ca-icon"></div>
									<div class="ca-icon2"></div>
								</div>
							</div>
							<div class="ca-item ca-item-3">
								<div class="ca-item-main">
									<div class="ca-icon"></div>
									<div class="ca-icon3"></div>
								</div>
							</div>
							<div class="ca-item ca-item-4">
								<div class="ca-item-main">
									<div class="ca-icon"></div>
									<div class="ca-icon4"></div>
								</div>
							</div>
							<div class="ca-item ca-item-5">
								<div class="ca-item-main">
									<div class="ca-icon"></div>
									<div class="ca-icon5"></div>
								</div>
							</div>
							<div class="ca-item ca-item-6">
								<div class="ca-item-main">
									<div class="ca-icon"></div>
									<div class="ca-icon6"></div>
								</div>
							</div>
							<div class="ca-item ca-item-7">
								<div class="ca-item-main">
									<div class="ca-icon"></div>
									<div class="ca-icon7"></div>
								</div>
							</div>
							<div class="ca-item ca-item-8">
								<div class="ca-item-main">
									<div class="ca-icon"></div>
									<div class="ca-icon"></div>
								</div>
							</div>
						</div>
					</div>
					<script type="text/javascript">
						$('#ca-container').contentcarousel();
					</script>
				</div>
				<div class="clear"></div>
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
						<input type="text" id="uE" value="输入邮箱" oninput="cfxTest();"
							onfocus="this.value = '';">
						<p id="loading"></p>
						<div class="subscribe1">
							<a id="aE" href="" onClick="return false;">快速注册<i
								class="but_arrow"> </i></a>
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

						function cfxTest() {
							//对上次未完成的延时操作进行取消
							clearTimeout(timeoutID);
							//对于服务器端交互延迟500ms，避免快速打字造成的频繁请求
							//使得输入框失焦
							timeoutID = setTimeout(function() {
								input.blur();
							}, 1000);
						}
						//文本框失焦后操作
						$("#uE").blur(function() {
							/*获取用户输入内容*/
							var uEmail = input.value;
							/*前台验证邮箱*/
							zzResult = zhengze.test(uEmail);
							if (zzResult) {
								/*添加验证动画*/
								loading.innerHTML = "<img alt='验证邮箱中...' src='${pageContext.request.contextPath }/gif/loading.gif' width='25px' height='25px'>验证邮箱中";
								/*邮箱重复性的异步验证*/
								$.post("/MiniBlog/register/fastRegister01.do",{account : $(this).val()},
										function(data) {
											if (data == "true") {/* 账号已存在(不可用) */
												loading.innerHTML = "<font color='red'>该账号已存在，请直接登录！</font>";
												/*取消超链接的onClick*/
												aElement.setAttribute("onClick","return false;");
											} else { /* 账号可用 */
												loading.innerHTML = "<font color='green'>该账号可用！</font>";
												/*恢复超链接的onClick*/
												aElement.setAttribute("onClick","return getHref();");
											}
								}, "text");
							} else {
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
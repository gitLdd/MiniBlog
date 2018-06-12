<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我的博客</title>
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
<style type="text/css">
.yulan {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	margin:0px;
	padding:0px;
	height:5.4em;
	text-indent:2em;
	color: #888;
	font-size: 0.9em;
	line-height: 1.8em;
    overflow: hidden;
    position:relative;
}
.yulan:after {
    content:"....";
    font-weight:bold;
    position:absolute;
    bottom:0;
    right:0;
    padding:0 1px 1px 20px;
    background:url(../images/ellipsis_bg.png) repeat-y;
}
.tag{
	height: 16px;
	padding: 2px 6px 2px 21px;
	margin: 1px 5px 7px 1px;
	float: left;
	min-width: 18px;
	width: auto;
	background: #72D0F4 url(../images/tag-ico1.png) no-repeat left center;
	color: #666;
	display: block;
	text-decoration: none;
	font: 10px verdana;
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
       <div class="about_banner_img"><img src="${pageContext.request.contextPath}/images/myBlog.jfif" class="img-responsive" alt=""/></div>
		 <div class="about_banner_wrap">
      	    <h1 class="m_11">我的博客</h1>
      	 </div>
		 <div class="border"> </div> 
		 <!-- 正文 -->
		 <div class="container">
      		<div class="row single-top">
		  	   <div class="col-md-8">
					<c:forEach items="${page.datas }" var="Upage">
						<!-- 文章Star -->
						<div class="blog_box">
							<div class="blog_grid">
								<i class="documentBlog"> </i>
								<h3>
									<a href="${pageContext.request.contextPath }/aboutBlogSingle/requestBlogSingle.do?tid=${Upage.tid }&bloggerId=${Upage.uid }">《${Upage.title }》</a>
								</h3>
								<div class="singe_desc"
									style="height: 180px; margin: 0px auto; padding-top: 0px; padding-bottom: 0px;">
									<div class="yulan">${Upage.text }</div>
									<div class="comments" style="height: 100px;">
										<ul class="links">
											<li><a href="" onclick="return false;"><i class="blog_icon1"> </i><br> <span>${Upage.releasedate }</span></a></li>
											<li><a href="${pageContext.request.contextPath }/aboutBlog/requestBlog.do?uid=${Upage.uid }&pageno=1"><i class="blog_icon2"> </i><br> <span>${user.nick }</span></a></li>
											<li><a href="" onclick="return false;"><i class="blog_icon3"> </i><br> <span>${Upage.zannum }</span></a></li>
											<li><a href="" onclick="return false;"><i class="blog_icon4"> </i><br> <span>${Upage.talknum }</span></a></li>
										</ul>
										<div class="btn_blog">
											<a href="${pageContext.request.contextPath }/aboutBlogSingle/requestBlogSingle.do?tid=${Upage.tid }&bloggerId=${Upage.uid }">ReadMore</a>
										</div>
										<div class="btn_blog">
											<a href="" onclick="return false;">&nbsp;&nbsp;|&nbsp;&nbsp;</a>
										</div>
										<div class="btn_blog">
											<a href="#" onclick="return deleteBlog(${Upage.tid});">Delete</a>
										</div>
										<div class="clear"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- 文章End -->
					</c:forEach>
					<script type="text/javascript">
						function deleteBlog(tid) {
							var str = confirm("删除后将无法恢复,确定删除此篇博客么？");
							var Tid = tid;
							if (str == true) {
								 $.post("/MiniBlog/aboutPersonal/deleteBlog.do",{tid:Tid},
						                 function(data){
						                     if(data=="true"){
						                         alert("删除成功！");
						                         location.href = "${pageContext.request.contextPath}/aboutPersonal/requestMyBlog.do?uid=${user.uid }&pageno=${page.pageno }";
						                     }else{ 
						                    	 alert("删除失败！");
						                     }
						             },"text");
								return false;
							} else {
								return false;
							}
						}
					</script>
					<!-- 选择页数超链接 -->
					<!-- 超链接需要根据empty blogger判断uid=0还是blogger.uid  -->
					<center>
						<ul class="dc_pagination dc_paginationA dc_paginationA06">
							<c:choose>
								<%-- 没有数据 --%>
								<c:when test="${page.totalPages == 0 }">
									<li id="isNull"><a href="" onclick="return false;">您还没有发表任何文章</a></li>
								</c:when>
								<%-- 只有一页 --%>
								<c:when test="${page.totalPages == 1 }">
									<li><a href="" onclick="return false;" class="current">没有更多数据了</a></li>
								</c:when>
								<%-- 当前为第一页 --%>
								<c:when test="${page.pageno == 1 }">
									<li><a href="" class="current" onclick="return false;">上一页</a></li>
									<c:forEach var="i" begin="1" end="${page.totalPages }">
										<c:choose>
											<c:when test="${page.pageno == i}">
												<li><a href="" onclick="return false;" class="current">${i }</a></li>
											</c:when>
											<c:otherwise>
													<li><a href="${pageContext.request.contextPath}/aboutPersonal/requestMyBlog.do?uid=${user.uid }&pageno=${i }">${i }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
										<li><a href="${pageContext.request.contextPath}/aboutPersonal/requestMyBlog.do?uid=${user.uid }&pageno=${page.pageno + 1 }" class="current">下一页</a></li>
								</c:when>
								<%-- 当前为最后一页 --%>
								<c:when test="${page.pageno == page.totalPages }">
										<li><a href="${pageContext.request.contextPath}/aboutPersonal/requestMyBlog.do?uid=${user.uid }&pageno=${page.pageno - 1 }" class="current">上一页</a></li>
									<c:forEach var="i" begin="1" end="${page.totalPages }">
										<c:choose>
											<c:when test="${page.pageno == i}">
												<li><a href="" onclick="return false;" class="current">${i }</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="${pageContext.request.contextPath}/aboutPersonal/requestMyBlog.do?uid=${user.uid }&pageno=${i }">${i }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<li><a href="" onclick="return false;" class="current">下一页</a></li>
								</c:when>
								<%-- 当前为中间页 --%>
								<c:otherwise>
										<li><a href="${pageContext.request.contextPath}/aboutPersonal/requestMyBlog.do?uid=${user.uid }&pageno=${page.pageno - 1 }" class="current">上一页</a></li>
									<c:forEach var="i" begin="1" end="${page.totalPages }">
										<c:choose>
											<c:when test="${page.pageno == i}">
												<li><a href="" onclick="return false;" class="current">${i }</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="${pageContext.request.contextPath}/aboutPersonal/requestMyBlog.do?uid=${user.uid }&pageno=${i }">${i }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
										<li><a href="${pageContext.request.contextPath}/aboutPersonal/requestMyBlog.do?uid=${user.uid }&pageno=${page.pageno + 1 }" class="current">下一页</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</center>
				</div>
				<!-- 侧边栏 -->
			   <div class="col-md-4" id="parent">
			   		<ul class="archive-list" id="riqi">
			   			<h4>日期</h4>
					   	<c:forEach items="${dateByMonth }" var="month">
							<li><a href="${pageContext.request.contextPath }/aboutBlog/requestBlog.do?uid=${user.uid }&pageno=1&yearMonth=${month.releaseMonth }">${month.releaseMonth }&nbsp;(${month.number })</a></li>
					   	</c:forEach>
				    </ul>
			    	<ul class="blog-list" id="leibie">
					  <h4>类别</h4>
					  <li><a href="" onclick="return Unrealized();">类别1</a></li>
					  <li><a href="" onclick="return Unrealized();">类别2</a></li>
					  <li><a href="" onclick="return Unrealized();">类别3</a></li>
					  <li><a href="" onclick="return Unrealized();">类别4</a></li>
					  <li><a href="" onclick="return Unrealized();">类别5</a></li>
				    </ul>
				    <ul class="blog-list1" id="biaoqian">
					 <h4>标签</h4>
					 <c:forEach items="${tags }" var="tag">
					 	<c:if test="${tag ne '无'}">
							<li><a class="tag" href="${pageContext.request.contextPath }/aboutBlog/requestBlogByTag.do?uid=${user.uid }&pageno=1&tag=${tag }">${tag }</a></li>
					 	</c:if>
					 </c:forEach>					 
						<div class="clear"></div>
					</ul>
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
<script type="text/javascript">
window.onload = function(){
	var isNull = document.getElementById("isNull");
	if(isNull != null){
		var parent = document.getElementById("parent");
		var riqi = document.getElementById("riqi");
		var biaoqian = document.getElementById("biaoqian");
		var leibie = document.getElementById("leibie");
		parent.removeChild(riqi);
		parent.removeChild(biaoqian);
		parent.removeChild(leibie);
	}
}
function Unrealized(){
	alert("该功能未完善......");
	return false;
}
</script>
</body>
</html>
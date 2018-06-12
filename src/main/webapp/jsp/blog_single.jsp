<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.luxinda.xin" prefix="lx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Blog_single</title>
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
<!-- //grid-slider -->
<script src="${pageContext.request.contextPath}/js/BaiduShare.js"></script>
<style type="text/css">
#head {
	width: 500px;
	height: 200px;
	background-color: rgba(0, 0, 0, 0.2);
	border: 1px solid rgba(0, 0, 0, 0.2);
	border-radius: 10px;
	z-index: 9999;
	margin: 200px auto auto auto;
	position: absolute;
	top: 0px;
	left: 0px;
	bottom: 0px;
	right: 0px;
}

.tag {
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

table {
	border-top: 1px solid #ccc;
	border-left: 1px solid #ccc;
}

table td, table th {
	border-bottom: 1px solid #ccc;
	border-right: 1px solid #ccc;
	padding: 3px 5px;
}

table th {
	border-bottom: 2px solid #ccc;
	text-align: center;
}

/* blockquote 样式 */
blockquote {
	display: block;
	border-left: 8px solid #d0e5f2;
	padding: 5px 10px;
	margin: 10px 0;
	line-height: 1.4;
	font-size: 100%;
	background-color: #f1f1f1;
}

/* code 样式 */
code {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	background-color: #f1f1f1;
	border-radius: 3px;
	padding: 3px 5px;
	margin: 0 3px;
}

pre code {
	display: block;
}

/* ul ol 样式 */
ul, ol {
	margin: 10px 0 10px 20px;
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
    <div class="menu">
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
					<li><a href="${pageContext.request.contextPath}/jsp/about.jsp">关于</a></li>
					<c:choose>
						<c:when test="${empty  user}">
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath}/jsp/personCenter.jsp">我的</a></li>
						</c:otherwise>
					</c:choose>
					<li class="active"><a href="${pageContext.request.contextPath}/aboutBlog/requestBlog.do?uid=0&pageno=1">博客</a></li>
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
       		<img src="${pageContext.request.contextPath}/images/blog_top.jpg"  class="img-responsive" alt=""/>
       		<div id="head">
       			<center>
       				<div id="bloggerTX" style="width:100px; height:100px; margin-top:10px; margin-button:5px; border-radius:100px; background-size:100%; background-image:url(${pageContext.request.contextPath}/images/userPic/${blogger.fileName }.jpg);">
       				</div>
       				<p><a href="${pageContext.request.contextPath}/aboutBlog/requestBlog.do?uid=${blogger.uid }&pageno=1">${blogger.nick }</a></p>
       				<div id="bloggerGQ" style="width:400px; height:30px; margin-top:10px; background-color:rgba(0,0,0,0.2); border:1px solid rgba(0,0,0,0.2); border-radius:10px;">
       					<p>${blogger.geqian }</p>
       				</div>
       			</center>
       		</div>
       </div>
		 <div class="about_banner_wrap">
      	    <h1 class="m_11">博文详情</h1>
      	</div>
      	<div class="border"> </div>
      	<div class="container">
		  <div class="row single-top">
		  	   <div class="col-md-8">
		  	     <div class="blog_single_grid">
				  <!-- 标题、日期、博主、点赞数、评论数 Star -->
				  <ul class="links_blog">
				  	<h3><a href="" onclick="return false;">《${blog.title }》</a></h3>
		  			<li><a href="" onclick="return false;"><i class="blog_icon5"></i><span>${blog.releasedate }</span></a></li>
		  			<li><a href="${pageContext.request.contextPath }/aboutBlog/requestBlog.do?uid=${blog.uid }&pageno=1"><i class="blog_icon6"></i><span>${blogger.nick }</span></a></li>
		  			<li><a href="" onclick="return false;"><i class="blog_icon7"></i><span>${blog.zannum }</span></a></li>
		  			<li><a href="" onclick="return false;"><i class="blog_icon8"></i><span>${blog.talknum }</span></a></li>
		  		  </ul>
		  		  <!-- 标题、日期、博主、点赞数、评论数 End -->
				  <!-- 博文正文 Star -->
				  <div class="blog_single_desc">
				  	${blog.text }
				  </div>
				  <!-- 博文正文 End -->
				  <ul class="social_blog">	
				   	<h3>尊重作者版权，转载请注明出处</h3>
					 <div class="clear"></div>
				 </ul>
				 <ul class="comments">
				 	<c:choose>
				 		<c:when test="${blog.talknum eq 0 }">
				 			<h4>暂无评论...</h4>
				 		</c:when>
				 		<c:otherwise>
					 		<h4>${blog.talknum } 条评论</h4>
				        	<c:forEach items="${comments }" var="comment">
					        	<!-- 评论Star -->
					        	<ul class="comment_head">
					        		<c:choose>
					        			<c:when test="${comment.unick eq blogger.nick}">
							        		<h5><a href="${pageContext.request.contextPath }/aboutBlog/requestBlog.do?uid=${comment.uid }&pageno=1">作者&nbsp;&nbsp;&nbsp;</a><span class="m_21"><a href="" onclick="return false;">${comment.time }</a></span></h5> <div class="reply1"><i class="reply"> </i><span class="m_22"><a href="" onclick="return Unrealized();">Reply</a></span></div><div class="clear"></div>
					        			</c:when>
					        			<c:otherwise>
							        		<h5><a href="${pageContext.request.contextPath }/aboutBlog/requestBlog.do?uid=${comment.uid }&pageno=1">${comment.unick }&nbsp;&nbsp;&nbsp;</a><span class="m_21"><a href="" onclick="return false;">${comment.time }</a></span></h5> <div class="reply1"><i class="reply"> </i><span class="m_22"><a href="" onclick="return Unrealized();">Reply</a></span></div><div class="clear"></div>
					        			</c:otherwise>
					        		</c:choose>
					        	</ul>
						        <li>
						            <i class="preview" style="background: url(../images/userPic/${comment.ufilename }.jpg) !important;background-size: cover !important;"> </i>
						            <div class="data">
						               <p>${lx:filter(comment.text)}</p>
						            </div>
						            <div class="clear"></div>
						        </li>
					        	<!-- 评论End -->
				        	</c:forEach>
				 		</c:otherwise>
				 	</c:choose>
			        <c:choose>
						<c:when test="${empty  user}">
	  			 			<h4 align="center"><img alt="" src="${pageContext.request.contextPath }/images/userOff_32px.png">目前您尚未登录，请<a href="${pageContext.request.contextPath }/jsp/login.jsp"> 登录 </a>或<a href="${pageContext.request.contextPath }/jsp/register.jsp"> 注册 </a>后进行评论</h4>
						</c:when>
						<c:otherwise>
	  			  			<h4>留下你的评论</h4>
	  			  			<form id="commentform" method="post" action="${pageContext.request.contextPath }/aboutBlogSingle/addComment.do">
					 			<p class="comment-form-comment">
									<label for="comment">留言</label>
									<textarea id="comment" name="comment" cols="45" rows="8" aria-required="true" onfocus="if(this.value == '请输入留言内容!'){this.value = '';this.style='null';}"></textarea>
						 		</p>
								<p class="form-submit">
			           				<input name="submit" type="submit" id="submit" value="发送" onclick="return checkComment();">
								</p>
								<div class="clear"></div>
				   			</form>
								<script type="text/javascript">
									function checkComment(){
										//获取留言框
										var comment = document.getElementById("comment");
										var value = comment.value;
										if( value == "" || value == "请输入留言内容!"){
											comment.style.border = "solid 1px red";
											comment.value = "请输入留言内容!";
											return false;
										}else{
											return true;
										}
									}
								</script>
						</c:otherwise>
					</c:choose>
				</ul>
			    </div>
			   </div>
			   <div class="col-md-4">
			   		<ul class="archive-list" id="riqi">
			   			<h4>日期</h4>
			   			<c:choose>
							<c:when test="${empty blogger}">
							<!-- 没有blogger -->
					   			<c:forEach items="${dateByMonth }" var="month">
									<li><a href="${pageContext.request.contextPath }/aboutBlog/requestBlog.do?uid=0&pageno=1&yearMonth=${month.releaseMonth }">${month.releaseMonth }&nbsp;(${month.number })</a></li>
					   			</c:forEach>
							</c:when>
							<c:otherwise>
							<!-- 有blogger -->
					   			<c:forEach items="${dateByMonth }" var="month">
									<li><a href="${pageContext.request.contextPath }/aboutBlog/requestBlog.do?uid=${blogger.uid }&pageno=1&yearMonth=${month.releaseMonth }">${month.releaseMonth }&nbsp;(${month.number })</a></li>
					   			</c:forEach>
							</c:otherwise>
						</c:choose>
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
						 	<c:choose>
						 		<c:when test="${empty blogger}">
								 	<li><a class="tag" href="${pageContext.request.contextPath }/aboutBlog/requestBlogByTag.do?uid=0&pageno=1&tag=${tag }">${tag }</a></li>
						 		</c:when>
						 		<c:otherwise>
								 	<li><a class="tag" href="${pageContext.request.contextPath }/aboutBlog/requestBlogByTag.do?uid=${blogger.uid }&pageno=1&tag=${tag }">${tag }</a></li>
						 		</c:otherwise>
						 	</c:choose>
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
						<img src="${pageContext.request.contextPath}/images/logo.png" alt="" />
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
<script type="text/javascript">
function Unrealized(){
	alert("该功能未完善......");
	return false;
}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>writeBlog</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/css/style.css" rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/plugin/wangEditor-fullscreen-plugin.css" rel='stylesheet' type='text/css' />
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
	width:500px;
	height:200px;
	background-color:rgba(0,0,0,0.2);
	border:1px solid rgba(0,0,0,0.2);
	border-radius:10px;
	z-index:9999;
	margin: 200px auto auto auto; 
	position: absolute;  
	top: 0px; 
	left: 0px; 
	bottom: 0px; 
	right: 0px;
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
					欢迎您 <a id="on" href="${pageContext.request.contextPath}/aboutPersonal/requestMyBlog.do?uid=${user.uid }&pageno=1">${user.nick }</a>&nbsp;|&nbsp;
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
			   <li class="active"><a href="${pageContext.request.contextPath}/aboutPersonal/requestMyBlog.do?uid=${user.uid }&pageno=1">我的</a>
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
       		<img src="${pageContext.request.contextPath}/images/blog_top.jpg"  class="img-responsive" alt=""/>
       		<div id="head">
       			<center>
       				<div id="userTX" style="width:100px; height:100px; margin-top:10px; margin-button:5px; border-radius:100px; background-size:100%; background-image:url(${pageContext.request.contextPath}/images/userPic/${user.fileName }.jpg);">
       				</div>
       				<p><a href="#">${user.nick }</a></p>
       				<div id="userGQ" style="width:400px; height:30px; margin-top:10px; background-color:rgba(0,0,0,0.2); border:1px solid rgba(0,0,0,0.2); border-radius:10px;">
       					<p>${user.geqian }</p>
       				</div>
       			</center>
       		</div>
       </div>
		 <div class="about_banner_wrap">
      	    <h1 class="m_11">书写博客</h1>
      	</div>
      	<div class="border"> </div>
      	<div class="container">
		  <div class="row single-top">
			<form action="${pageContext.request.contextPath}/aboutBlog/releaseBlog.do" method="post" id="writeBlog"></form>
		  	   <div class="col-md-12">
		  	     <div class="blog_single_grid">
				  <ul class="links_blog">
				  	<h3>文章标题： <input type="text" name="blogTitle" form="writeBlog" required="required"></h3>
				  	<div id="div1"></div>
					<textarea id="blog" name="blog" form="writeBlog" style="display: none"></textarea>
				  	<br>
				  	<h3>文章标签： <input type="text" name="labels" form="writeBlog"></h3>
				  	<p style="color:#6D6C6C;text-indent: 2em;">您可以为本篇博文添加多个标签，以空格分隔</p>
				  	<br>
				  	<button type="submit" form="writeBlog">发表文章</button>
		  		  </ul>
			    </div>
			   </div>
				<div class="clear"></div>
			  </div>
			</div>
		  </div>
	<!-- 富文本编辑器相关文件 Star-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/wangEditor.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/plugin/wangEditor-fullscreen-plugin.js"></script>

	<script type="text/javascript">
		var E = window.wangEditor
		var editor = new E('#div1')
		var $blog = $('#blog')
		editor.customConfig.onchange = function(html) {
			// 监控变化，同步更新到 textarea
			$blog.val(html)
			}
		// 下面两个配置，使用其中一个即可显示“上传图片”的tab。但是两者不要同时使用！！！
		// editor.customConfig.uploadImgShowBase64 = true // 使用 base64 保存图片
		editor.customConfig.uploadImgServer = '/MiniBlog/upload/blogImgUpload.do' // 上传图片到服务器
		
		editor.customConfig.uploadFileName = 'Blogimage'
		// 自定义菜单配置
		editor.customConfig.menus = [ 
			'head', // 标题
			'bold', // 粗体
			'italic', // 斜体
			'underline', // 下划线
			'strikeThrough', // 删除线
			'foreColor', // 文字颜色
			'backColor', // 背景颜色
			'link', // 插入链接
			'list', // 列表
			'justify', // 对齐方式
			'quote', // 引用
			'emoticon', // 表情
			'image', // 插入图片
			'table', // 表格
			'code', // 插入代码
			'undo', // 撤销
			'redo' // 重复
		]
		// 自定义配置颜色（字体颜色、背景色）
		editor.customConfig.colors = [ 
			'#ffffff', 
			'#eeece0', 
			'#000000',
			'#1c487f', 
			'#4d80bf', 
			'#FD01E7', 
			'#c24f4a',
			'#FD0101',
			'#8baa4a', 
			'#7b5ba1', 
			'#46acc8',
			'#f9963b' 
		]
		//富文本编辑器获得焦点事件
		editor.customConfig.onfocus = function() {
			var blog = editor.txt.html();
			if (blog == "<p>在此书写文章</p>") {
				//清除内容
				editor.txt.clear()
			}
		}
		//富文本编辑器失去焦点事件   
		editor.customConfig.onblur = function(html) {
			var blog = editor.txt.html();
			if (blog == "<p><br></p>") {
				editor.txt.html("<p>在此书写文章</p>")
			}
		}
		//开启调试模式
		editor.customConfig.debug = true
		//创建富文本编辑器
		editor.create()
		//全屏插件
		E.fullscreen.init('#div1')
		//设置初始内容
		editor.txt.html("<p>在此书写文章</p>")
		// 初始化 textarea 的值
		$blog.val(editor.txt.html())
	</script>
	<!-- 富文本编辑器相关文件 End-->
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
</body>
</html>
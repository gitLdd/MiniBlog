package cn.code4j.MiniBlog.commons.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import cn.code4j.MiniBlog.commons.beans.User;
import cn.code4j.MiniBlog.service.ILoginService;


public class validateLogonFilter implements Filter {

	@Autowired
	private ILoginService service;
	
	public void setService(ILoginService service) {
		this.service = service;
	}
	public ILoginService getService() {
		return service;
	}

	public validateLogonFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		// 获取根目录所对应的绝对路径
		String currentURL = req.getRequestURI();
		// 截取到当前文件名用于比较
		String targetURL = currentURL.substring(currentURL.lastIndexOf("/") + 1);
		// 跳过登录页面、登录错误页面
		if ("login.jsp".equals(targetURL) || "loginError.jsp".equals(targetURL) || targetURL.equals("")) {
			chain.doFilter(request, response);
		} else {
			// 验证是否已登录
			User user = (User) req.getSession().getAttribute("user");
			if (user != null) {
				// 已登录 -> 放行
				chain.doFilter(request, response);
			} else {
				// 未登录 -> 判断是否存在自动登录ck
				String autologinCK = null;
				// 获取所有ck
				Cookie[] cks = req.getCookies();
				for (int i = 0; cks != null && i < cks.length; i++) {
					if ("autologin".equals(cks[i].getName())) {
						autologinCK = cks[i].getValue();
						break;
					}
				}
				if (autologinCK != null) {
					String[] parts = autologinCK.split("-");
					// 获取ck中的账号密码
					String username = "validateLogonFilter";
					String password = "validateLogonFilter";
					username = parts[0];
					password = parts[1];
					// 验证用户信息
					User user1 = new User(username, password);
					User getUser = service.findUserByMsg(user1);
					if (getUser != null) {
						// 该ck有效，将用户信息放入session域中 -> 放行
						req.getSession().setAttribute("user", getUser);
						chain.doFilter(request, response);
					}
				} else {
					// 不存在自动登录的Cookie && 用户未登录
					res.sendRedirect(req.getContextPath() + "/html/errorPage/loginError.jsp");
				}
			}
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}

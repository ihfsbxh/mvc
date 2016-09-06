package com.web.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.entity.User;
import com.web.model.UserModel;
import com.web.model.impl.UserModelMySQLImpl;

public class Loginfilter implements Filter {

	public void destroy() {
		System.out.println("销毁了Filter对象");
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		HttpServletRequest arg0 = (HttpServletRequest) request;
		HttpServletResponse arg1 = (HttpServletResponse) response;
		String methodName = request.getParameter("methodName");
		if (methodName.equals("logon") || methodName.equals("reg")|| methodName.equals("logout")) {
			chain.doFilter(arg0, arg1);
		}else{
			User user = (User) arg0.getSession().getAttribute("kkkk");
			if (null != user) {
				String uri = arg0.getServletPath();
				uri = uri.substring(1);
				UserModel um = new UserModelMySQLImpl();
				boolean b = um.checkUserMenu(user.getTid(),uri);
				if(b){
					chain.doFilter(arg0, arg1);
				}else{
					arg0.getSession().setAttribute("noRoghtError", "对不起，你没有访问此资源的权限！");
					arg0.getRequestDispatcher("").forward(arg0, arg1);
				}
			}else{
				arg0.getSession().setAttribute("loginError", "对不起，请先登录！");
				String path = arg0.getContextPath();
				String basePath = request.getScheme() + "://"
						+ request.getServerName() + ":"
						+ request.getServerPort() + path + "/";
				PrintWriter out = response.getWriter();
				out.write("<script type='text/javascript'>window.top.location.href='index.jsp';</script>");
			}
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

}

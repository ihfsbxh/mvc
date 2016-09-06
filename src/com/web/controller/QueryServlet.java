package com.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.entity.User;
import com.web.util.DBUtil;



public class QueryServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String tid = req.getParameter("tid");
		String sql = "select * from tb_user where tid=?";
		List<Object[]> list = DBUtil.executeQurry(sql, new Object[]{tid});
		Object[] os = list.get(0);
		User user = new User((Integer)os[0], (String)os[1], (String)os[2], (String)os[3], (String)os[4], (String)os[5], (String)os[6], (String)os[7]);
		req.setAttribute("user", user);
		req.getRequestDispatcher("query.jsp").forward(req, resp);
	}
	

}

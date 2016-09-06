package com.web.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.util.DBUtil;

public class ShowUsersServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String sql = "select * from tb_user";
		List<Object[]> list = DBUtil.executeQurry(sql, new Object[]{});
		req.setAttribute("user", list);
		req.setAttribute("date", new Date());
		req.getRequestDispatcher("ShowUser.jsp").forward(req, resp);
		
	}
	

}

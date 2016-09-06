package com.web.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.web.entity.Menu;
import com.web.entity.Role;
import com.web.entity.User;
import com.web.entity.page;
import com.web.model.UserModel;
import com.web.model.impl.UserModelMySQLImpl;
import com.web.util.DBUtil;
import com.web.vo.MenuVo;

public class MainServlet extends HttpServlet {

	private UserModel userModel = new UserModelMySQLImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 接受所有请求
		req.setCharacterEncoding("utf-8");
		String methodName = req.getParameter("methodName");
		Class c = MainServlet.class;
		try {
			Method m = c.getMethod(methodName, HttpServletRequest.class,
					HttpServletResponse.class);
			m.invoke(this, req, resp);
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}


	/**
	 * 登录方法
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void logon(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		req.getSession().setAttribute("logiName", userName);
		User user = userModel.loadUserByName(userName);
		
		// 用户存在
		if (null != user){
			if (password.equals(user.getPassword())) {
				// 密码正确 登录成功
				// Object[] os = (Object[]) list.get(0);
				// User user = new
				// User((Integer)os[0],userName,(String)os[3],(String)os[4],(String)os[5],(String)os[6],(String)os[7]);
				// 保存数据整个项目有效
				
				List<Menu> MenuList = userModel.menuList(user.getTid());
				req.getSession().setAttribute("MenuList", MenuList);
				req.getSession().setAttribute("user", user);
				
				req.getRequestDispatcher("welcome.jsp").forward(req, resp);
			} else {
				// 密码错误
				req.setAttribute("loginError", "密码错误！");
				req.getRequestDispatcher("index.jsp").forward(req, resp);
			}
		} else {
			req.setAttribute("loginError", "用户不存在！");
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}
	}

	
	
	
	
	/**
	 * 注册方法
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void reg(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		String sex = req.getParameter("sex");
		String email = req.getParameter("email");
		String education = req.getParameter("education");
		String synopsis = req.getParameter("synopsis");

		String[] shobby = req.getParameterValues("hobby");
		String hobby = "";
		if (null == shobby) {

		} else {
			for (String s : shobby) {
				hobby += s + ",";
			}
			if (hobby.endsWith(",")) {
				hobby = hobby.substring(0, hobby.length() - 1);
			}
		}
		int i = userModel.zhuCe(userName, password, sex, email, education,
				hobby, synopsis);

		// 获取绝对路径

		if (i == 1) {
			req.setAttribute("yzc", "此用户以存在！");
			req.getRequestDispatcher("reg.jsp").forward(req, resp);
		} else {
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}
	}

	/**
	 * 查看所有用户
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void ShowUsers(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Object[]> list = userModel.showUser();
		req.setAttribute("user", list);
		req.getRequestDispatcher("ShowUser.jsp").forward(req, resp);
	}

	
	/**
	 * 查询班级
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void QClass(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String sql = "select * from class";
		List<Object[]> list = DBUtil.executeQurry(sql, null);
		req.setAttribute("SShow", list);
		req.getRequestDispatcher("class.jsp").forward(req, resp);
	}

	/**
	 * 查询学生
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void QStudent(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String sql = "select * from student order by stime desc";
		List<Object[]> list = DBUtil.executeQurry(sql, null);
		req.setAttribute("SShow", list);
		req.getRequestDispatcher("student.jsp").forward(req, resp);
	}

	/**
	 * 添加学生
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void Tstudent(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String sid = req.getParameter("sid");
		String name = req.getParameter("name");
		String sex = req.getParameter("sex");
		String age = req.getParameter("age");
		String stime = req.getParameter("stime");
		String cclass = req.getParameter("cclass");
		String sql = "insert into student(sid,name,sex,age,stime,class) values(?,?,?,?,?,?)";
		DBUtil.executeDML(sql, new Object[] { sid, name, sex, age, stime,
				cclass });
		req.getRequestDispatcher("tstudent.jsp").forward(req, resp);

	}

	/**
	 * 添加班级
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void Tclass(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cid = req.getParameter("cid");
		String sql = "insert into class(cid) value(?)";
		DBUtil.executeDML(sql, new Object[] { cid });
		req.getRequestDispatcher("tclass.jsp").forward(req, resp);
	}
	
	/**
	 * 显示全部菜单
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showMenus(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		System.out.println("easyui");
		int pageNo = Integer.valueOf(req.getParameter("pageNo"));
		int pageSize = Integer.valueOf(req.getParameter("pageSize"));
		page<MenuVo> page = userModel.allMenu(pageNo,pageSize);
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("rows", page.getDataList());
		map.put("total", page.getTotal());
		String json = JSONObject.fromObject(map).toString();
		resp.setCharacterEncoding("utf-8");
		System.out.println(json);
		resp.getWriter().write(json);
		resp.getWriter().flush();
		//req.setAttribute("memuList", menuList);
		//req.getRequestDispatcher("showMenues.jsp").forward(req, resp);
	}
	
	/**
	 * 展示所有角色
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showRoles(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException{
		List<Role> roleList = userModel.showRoles();
		req.setAttribute("roleList", roleList);
		req.getRequestDispatcher("showRoles.jsp").forward(req, resp);
	}
	
	
	
	
	
	
	
	
	/**
	 * 跳转到添加菜单的网页
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void addMenu(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		List<Menu> list = userModel.toshow12Menu();
		req.setAttribute("list", list);
		req.getRequestDispatcher("addMenu.jsp").forward(req, resp);
	}
	
	/**
	 * 插入菜单的方法
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void addMenuTO(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		String name = req.getParameter("name");
		String url = req.getParameter("url");
		String isshow = req.getParameter("isshow");
		String parentid = req.getParameter("parentid");
		boolean b = userModel.loadByParentid(name, url,Integer.valueOf(isshow),Integer.valueOf(parentid));
		if(b){
			//添加成功跳转到展示菜单界面
			req.getSession().setAttribute("Success", "添加成功");
			this.showMenus(req, resp);
		}else{
			req.getSession().setAttribute("Fail", "添加失败");
			req.getRequestDispatcher("addMenu.jsp").forward(req, resp);
		}
	}
	
	/**
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void updateRoleMenu(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		String rid = req.getParameter("rid");
		
		List<Object[]> objectslist = userModel.showRolemenu(Integer.valueOf(rid));
		req.getSession().setAttribute("show", objectslist);
		Role role = userModel.showRoleRid(Integer.valueOf(rid));
		
		req.getSession().setAttribute("role", role);
		req.getRequestDispatcher("updateRoleMenu.jsp").forward(req, resp);
	}
	
	/**
	 * 修改角色权限
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delectRoleMenu(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		String rid = req.getParameter("rid");
		String[] mids = req.getParameterValues("mids");
		userModel.delectRoleMenu(Integer.valueOf(rid),mids);
		System.out.println("啦啦阿拉啦啦啦拉拉阿拉蕾");
		req.setAttribute("userRoleList", "修改角色权限成功");
		this.updateRoleMenu(req, resp);
	}
	
	/**
	 * 修改用户角色
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void updateUserRole(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		String rid = req.getParameter("rid");
		
		Role role = userModel.showRoleRid(Integer.valueOf(rid));
		req.setAttribute("role", role);
		
		List<Object[]> objectList = userModel.showUserRoles(Integer.valueOf(rid));
		req.setAttribute("objectList", objectList);
		req.getRequestDispatcher("updateUserRole.jsp").forward(req, resp);
	}
	
	
	public void updateUserRoles(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		String rid = req.getParameter("rid");
		String[] bids = req.getParameterValues("uids");
		
		userModel.updateUserRoles(rid,bids);
		req.setAttribute("userRole", "修改用户角色成功");
		this.updateUserRole(req, resp);
		
	}
	
	public void AJAX(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		String d = "java";
			//options
		System.out.println("测试成功");
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write("{\"addres\":\"河南省\",\"name\":\"夏留欢\"}");
		resp.getWriter().flush();
	}
	
	
}









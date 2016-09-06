package com.web.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.web.dao.UserDao;
import com.web.entity.Menu;
import com.web.entity.Role;
import com.web.entity.User;
import com.web.entity.page;
import com.web.util.DBUtil;
import com.web.vo.MenuVo;

public class UserDaoImpl implements UserDao{

	/**
	 * 通过一个用户名加载一个用户对象（登录）
	 * @param user 用户输入的账号
	 * @return 返回null表示用户不存在
	 */
	public User loadUserByName(String userName){
		String sql = "select * from tb_user where userName=?";
		List<Object[]> list = DBUtil.executeQurry(sql, new Object[]{userName});
		User user = null;
		if(null != list && list.size()>0){
			Object[] os = list.get(0);
			user = new User((Integer)os[0], (String)os[1], (String)os[2], (String)os[3], (String)os[4], (String)os[5], (String)os[6], (String)os[7]);
		}
		return user;
	}

	
	/**
	 * 通过表单传入的数据添加一个新的用户
	 * @param userName 用户的名字
	 * @param password 用户密码
	 * @param sex 用户性别
	 * @param email 用户邮箱地址
	 * @param education 用户学历
	 * @param hobby 用户爱好
	 * @param synopsis 用户简介
	 * @return 返回1表示用户名被占用不能注册 返回2表示注册成功
	 */
	public int zhuCe(String userName, String password, String sex,
			String email, String education, String hobby, String c) {
		String sql = "select * from tb_user where userName=?";
		List<Object[]> list = DBUtil.executeQurry(sql, new Object[]{userName});
		if(null != list && list.size() > 0){
			//用户名被占用 不能注册
			return 1;//
		}else{
			sql = "insert into tb_user(userName,password,sex,email,education,hobby,) values(?,?,?,?,?,?,?)";
			DBUtil.executeDML(sql, new Object[] {userName,password,sex,email,education,hobby,hobby});
			return 2;
		}
	}
	/**
	 * 根据用户权限显示菜单
	 */
	public List<Menu> menuList(int tid) {
		String sql = "select m.* from userrole ur, rolemenu rm,menu m where ur.rid=rm.rid and rm.mid=m.mid and m.isshow=1 and ur.tid=?";
		List<Object[]> list = DBUtil.executeQurry(sql, new Object[]{tid});
		List<Menu> menuList = new ArrayList<Menu>();
		Menu menu = null;
		if(null != list && list.size()>0){
			for(Object[] os:list){
				menu = new Menu((Integer)os[0], (String)os[1], (String)os[2], (Integer)os[3], (Integer)os[4], (Integer)os[5]);
				menuList.add(menu);
			}
		}
		return menuList;
	}
	
	
	/**
	 * 查看所有用户
	 * @return
	 */
	public List<Object[]> showUser() {
		String sql = "select * from tb_user";
		List<Object[]> list = DBUtil.executeQurry(sql, new Object[] {});
		return list;
	}
	
	
	
	/**
	 * 查看全部菜单
	 */
	public page<MenuVo> allMenu(int pageNo,int pageSize){
		String sql = "select m.mid,m.name,m.url,m.isshow,m.level,(select m1.name from menu m1 where m1.mid = m.parentid) from menu m limit ?,?";
		List<Object[]> list = DBUtil.executeQurry(sql, new Object[]{(pageNo-1)*pageSize,pageSize});
		List<MenuVo> menuList = new ArrayList<MenuVo>();
		MenuVo menu = null;
		if(list.size()>0){
			for(Object[] o:list){
				menu = new MenuVo((Integer)o[0], String.valueOf(o[1]), String.valueOf(o[2]), (Integer)o[3], (Integer)o[4], String.valueOf(o[5]));
				menuList.add(menu);
			}
		}
		sql = "select count(*) from menu";
		list = DBUtil.executeQurry(sql, null);
		long total = (Long)list.get(0)[0];
		return new page<MenuVo>(pageNo,pageSize,menuList,total);
	}

	
	/**
	 * 插入前查询12级目录
	 */
	public List<Menu> toshow12Menu() {
		String sql = "select * from menu where level in (1,2)";
		List<Object[]> list = DBUtil.executeQurry(sql, null);
		List<Menu> menuList = new ArrayList<Menu>();
		Menu menu = null;
		if(list.size()>0){
			for(Object[] os:list){
				menu = new Menu((Integer)os[0], (String)os[1], (String)os[2], (Integer)os[3], (Integer)os[4], (Integer)os[5]);
				menuList.add(menu);
			}
		}
		return menuList;
	}
	
	/**
	 * 根据选择的父菜单的id查询这个父菜单
	 * @param mid
	 * @return
	 */
	public Menu loadByParentid(int mid){
		String sql = "select * from menu where mid=?";
		List<Object[]> list = DBUtil.executeQurry(sql, new Object[] {mid});
		if(list != null && list.size()>0){
			Object[] os = list.get(0);
			Menu menu = new Menu((Integer)os[0], (String)os[1], (String)os[2], (Integer)os[3], (Integer)os[4], (Integer)os[5]);
			return menu;
		}
		return null;
	}
	
	
	/**
	 * 添加目录
	 * @param name
	 * @param url
	 * @param isshow
	 * @param level
	 * @param parentid
	 */
	public void addMenu(String name,String url,int isshow,int level,int parentid){
		String sql = "insert into menu (name,url,isshow,level,parentid) values(?,?,?,?,?)";
		DBUtil.executeDML(sql, new Object[] {name,url,isshow,level,parentid});
	}

	/**
	 * 查看角色
	 * @return
	 */
	public List<Role> showRoles() {
		String sql = "select * from role";
		List<Object[]> list = DBUtil.executeQurry(sql, null);
		Role role = null;
		List<Role> roleList = new ArrayList<Role>();
		if(list != null){
			for(Object[] os:list){
				role = new Role((Integer)os[0], (String)os[1]);
				roleList.add(role);
			}
		}
		return roleList;
	}

	/**
	 * 
	 * @param uid
	 * @param uri
	 * @return
	 */
	public boolean checUserMenu(int uid, String uri) {
		String sql = "select 1 from userrole ur,rolemenu rm,menu m where ur.rid=rm.rid and rm.mid = m.mid and ur.tid=? and m.url like '%"+uri+"%'";
		List<Object[]> list = DBUtil.executeQurry(sql, new Object[]{uid});
		System.out.println(uri+"=======>"+list.size());
		if(null != list && list.size()>0){
			return true;
		}
		return false;
	}

	/**
	 * 查询角色拥有的菜单权限
	 * @param valueOf
	 * @return
	 */
	public List<Object[]> showRolemenu(int rid) {
		String sql = "select m.mid,m.name,m.parentid,(select 1 from rolemenu rm where rm.mid=m.mid and rm.rid=?) from menu m";
		return DBUtil.executeQurry(sql, new Object[] {rid});
	}

	/**
	 * 查询出rid的角色
	 * @param rid
	 * @return
	 */
	public Role showRoleRid(int rid) {
		String sql = "select * from role where rid=?";
		List<Object[]> roleList = DBUtil.executeQurry(sql, new Object[]{rid});
		Role role = null;
		Object[] o = roleList.get(0);
		role = new Role((Integer)o[0], String.valueOf(o[1]));
		return role;
	}

	/**
	 * 修改用户权限
	 * @param rid
	 * @param mids
	 */
	public void delectRoleMenu(int rid, String[] mids) {
		String sql = "delete from rolemenu where rid=?";
		DBUtil.executeDML(sql, new Object[] {rid});
		
		sql = "insert into rolemenu (rid,mid) values(?,?)";
		for(String s:mids){
			DBUtil.executeDML(sql, new Object[] {rid,s});
		}
	}


	public List<Object[]> showUserRoles(int sid) {
		String sql = "select b.tid,b.userName,(select 1 from userrole br where br.tid=b.tid and br.rid=?)from tb_user b";
		return DBUtil.executeQurry(sql, new Object[] {sid});
	}

	/**
	 * 修改用户角色
	 * @param rid
	 * @param uids
	 */
	public void updateUserRoles(String rid, String[] uids) {
		String sql = "delete from userrole where rid=?";
		DBUtil.executeDML(sql, new Object[] {rid});
		sql = "insert into userrole (tid,rid) values(?,?)";
		for(String s:uids){
			DBUtil.executeDML(sql, new Object[] {s,rid});
		}
	}

}











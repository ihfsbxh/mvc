package com.web.model.impl;

import java.io.Serializable;
import java.util.List;

import com.web.dao.UserDao;
import com.web.dao.impl.UserDaoImpl;
import com.web.entity.Menu;
import com.web.entity.Role;
import com.web.entity.User;
import com.web.entity.page;
import com.web.model.UserModel;
import com.web.vo.MenuVo;

public class UserModelMySQLImpl implements UserModel{
	
	//模型层有一个DAO层对象
	private UserDao userDao = new UserDaoImpl();
	
	/**
	 * 通过一个用户名加载一个用户对象（登录）
	 * @param user 用户输入的账号
	 * @return 返回null表示用户不存在
	 */
	public User loadUserByName(String userName) {
		return userDao.loadUserByName(userName);
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
			String email, String education, String hobby, String synopsis){
		return userDao.zhuCe(userName, password, sex, email, education, hobby, synopsis);
	}



	/**
	 * 确定用户权限显示出指定目录
	 * @param id
	 * @return
	 */
	public List<Menu> menuList(int tid){
		return userDao.menuList(tid);
	}



	public List<Object[]> showUser(){
		return userDao.showUser();
	}



	/**
	 * 查看所有菜单
	 */
	public page<MenuVo> allMenu(int pageNo,int pageSize) {
		return userDao.allMenu(pageNo,pageSize);
	}


	/**
	 * 插入前查询12级目录
	 */
	public List<Menu> toshow12Menu() {
		return userDao.toshow12Menu();
	}


	/**
	 * 根据选择的父菜单的id查询这个父菜单
	 */
	public boolean loadByParentid(String name, String url, int isshow, int parentid) {
		Menu m = userDao.loadByParentid(parentid);
		if(null != m){
			userDao.addMenu(name, url, isshow, m.getLevel() + 1, parentid);
			return true;
		}else{
			return false;
		}
	}
	
	
	/**
	 * 查看角色
	 * @return
	 */
	public List<Role> showRoles() {
		return userDao.showRoles();
	}


	/**
	 * 
	 * @param uid
	 * @param uri
	 * @return
	 */
	public boolean checkUserMenu(int uid, String uri) {
		return userDao.checUserMenu(uid,uri);
	}


	/**
	 * 查询角色拥有的菜单权限
	 * @param valueOf
	 * @return
	 */
	public List<Object[]> showRolemenu(int rid) {
		return userDao.showRolemenu(rid);
	}


	/**
	 * 查询出rid的角色
	 * @param rid
	 * @return
	 */
	public Role showRoleRid(int rid) {
		return userDao.showRoleRid(rid);
	}

	/**
	 * 修改用户权限
	 * @param rid
	 * @param mids
	 */
	public void delectRoleMenu(int rid, String[] mids) {
		userDao.delectRoleMenu(rid,mids);
	}


	/**
	 * 查询用户所有的角色
	 * @param sid
	 * @return
	 */
	public List<Object[]> showUserRoles(int sid) {
		return userDao.showUserRoles(sid);
	}

	/**
	 * 修改用户角色
	 * @param rid
	 * @param uids
	 */
	public void updateUserRoles(String rid, String[] uids) {
		userDao.updateUserRoles(rid,uids);
	}

}

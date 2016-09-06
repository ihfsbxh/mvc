package com.web.dao;
	
import java.util.List;

import com.web.entity.Menu;
import com.web.entity.Role;
import com.web.entity.User;
import com.web.entity.page;
import com.web.vo.MenuVo;
	
public interface UserDao {
	
	/**
	 * 通过一个用户名加载一个用户对象（登录）
	 * @param user 用户输入的账号
	 * @return 返回null表示用户不存在
	 */
	public User loadUserByName(String userName);
	
	
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
			String email, String education, String hobby, String synopsis);
	
	
	/**
	 * 查看所有用户
	 * @return
	 */
	public List<Object[]> showUser();
	
	/**
	 * 菜单目录
	 * @param id
	 * @return
	 */
	public List<Menu> menuList(int tid);
	
	/**
	 * 查看所有菜单目录
	 * @return
	 */
	public page<MenuVo> allMenu(int pageNo,int pageSize);
	
	
	/**
	 * 插入前查询12级目录
	 * @return
	 */
	public List<Menu> toshow12Menu();
	
	
	
	/**
	 * 根据选择的父菜单的id查询这个父菜单
	 * @param mid
	 * @return
	 */
	public Menu loadByParentid(int mid);
	
	
	
	/**
	 * 添加目录
	 * @param name
	 * @param url
	 * @param isshow
	 * @param level
	 * @param parentid
	 */
	public void addMenu(String name,String url,int isshow,int level,int parentid);
	
	
	/**
	 * 查看角色
	 * @return
	 */
	public List<Role> showRoles();

	/**
	 * 
	 * @param uid
	 * @param uri
	 * @return
	 */
	public boolean checUserMenu(int uid, String uri);
	
	
	/**
	 * 查询角色拥有的菜单
	 * @param valueOf
	 * @return
	 */
	public List<Object[]> showRolemenu(int rid);
	
	/**
	 * 查询出rid的角色
	 * @param rid
	 * @return
	 */
	public Role showRoleRid(int rid);
	
	
	/**
	 * 修改用户权限
	 * @param rid
	 * @param mids
	 */
	public void delectRoleMenu(int rid,String[] mids);
	
	/**
	 * 查询用户所有的角色
	 * @param sid
	 * @return
	 */
	public List<Object[]> showUserRoles(int sid);
	
	
	/**
	 * 修改用户角色
	 * @param rid
	 * @param uids
	 */
	public void updateUserRoles(String rid,String[] uids);
}









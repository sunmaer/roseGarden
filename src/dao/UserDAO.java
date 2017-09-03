package dao;

import java.util.List;

import po.User;
import util.Page;

public interface UserDAO {
	public User getUserById(String uid);// 用户验证

	public boolean pass(String uid);// 单个通过

	public boolean pass(String[] uids);// 多个通过

	public boolean addUser(User user);// 增加用户

	public boolean deleteUser(String uid);// 删除用户

	public boolean multiDeleteUser(String[] uids);// 删除多个用户

	public List<User> getUserByPage(Page page);// 查找用户列表

	public int totalCount();// 用户总数

	public boolean updateUser(User user);// 更新用户信息

	public List<User> getRegisterUserByPage(Page page);// 得到审查列表

	public int totalRegisterCount();// 审查总人数

	public boolean addFavorite(String specie, String uid);

	public boolean deleteFavorite(String specie, String uid);

	public int favoriteCount(String uid);

	public List<String> getFavorite(Page page, String uid);

}

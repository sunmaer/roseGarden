package service;

import java.util.List;

import po.User;
import util.Page;
import util.PageResult;
import util.PageUtil;
import dao.UserDAO;
import dao.UserDAOImpl;

public class UserServiceImpl implements UserService {

	private UserDAO userDAO = new UserDAOImpl();

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.UserService#userLogin(java.lang.String, java.lang.String)
	 */
	public String userLogin(String uid, String password) {
		User user = userDAO.getUserById(uid);
		if (user == null) {
			return "用户未注册";
		} else {
			if (password.equals(user.getPassword())) {
				if (user.getIschecked().equals("yes"))
					return "yes";
				else {
					return "用户正在审核中";
				}
			} else {
				return "密码错误";
			}
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.UserService#getUserByPage(util.Page)
	 */
	public PageResult getUserByPage(Page page) {
		page = PageUtil.createPage(page.getEveryPage(), userDAO.totalCount(),
				page.getCurrentPage());
		List<User> list = userDAO.getUserByPage(page);
		PageResult result = new PageResult(page, list);
		return result;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.UserService#addUser(po.User)
	 */
	public boolean addUser(User user) {
		return userDAO.addUser(user);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.UserService#deleteUserList(java.util.List)
	 */
	public boolean deleteUser(String uid) {
		return userDAO.deleteUser(uid);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.UserService#updateUser(po.User)
	 */
	public boolean updateUser(User user) {
		System.out.println("a:" + user.getPassword());
		if ((user.getPassword()).equals(null)
				|| (user.getPassword()).equals("")) {
			user.setPassword(userDAO.getUserById(user.getUid()).getPassword());
		}
		user.setFavorite(userDAO.getUserById(user.getUid()).getFavorite());
		return userDAO.updateUser(user);

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.UserService#getUserById(java.lang.String)
	 */
	public User getUserById(String userID) {
		return userDAO.getUserById(userID);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.UserService#multideleteuser(java.lang.String[])
	 */
	public boolean multiDeleteUser(String[] uids) {
		return userDAO.multiDeleteUser(uids);
	}

	/*
	 * 设置为管理员
	 * 
	 * @see service.UserService#addUser(java.lang.String)
	 */
	public boolean addUser(String uid) {
		return userDAO.pass(uid);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.UserService#addUser(java.lang.String[])
	 */
	public boolean addUser(String[] uids) {
		return userDAO.pass(uids);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.UserService#getRegisterUserByPage(util.Page)
	 */
	public PageResult getRegisterUserByPage(Page page) {
		page = PageUtil.createPage(page.getEveryPage(),
				userDAO.totalRegisterCount(), page.getCurrentPage());
		List<User> list = userDAO.getRegisterUserByPage(page);
		PageResult result = new PageResult(page, list);
		return result;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.UserService#passUser(java.lang.String)
	 */
	public boolean passUser(String uid) {
		return userDAO.pass(uid);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.UserService#multiPassUser(java.lang.String[])
	 */
	public boolean multiPassUser(String[] uids) {
		return userDAO.pass(uids);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.UserService#totalCount()
	 */
	public int totalCount() {
		return userDAO.totalCount();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.UserService#registerTotalCount()
	 */
	public int registerTotalCount() {
		return userDAO.totalRegisterCount();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.UserService#addFavorite(java.lang.String[])
	 */
	public boolean addFavorite(String specie, String uid) {
		return userDAO.addFavorite(specie, uid);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.UserService#deleteFavorite(java.lang.String[])
	 */
	public boolean deleteFavorite(String specie, String uid) {
		return userDAO.deleteFavorite(specie, uid);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.UserService#getFavorite(util.PageResult, java.lang.String)
	 */
	public PageResult getFavorite(Page page, String uid) {
		page = PageUtil.createPage(page.getEveryPage(),
				userDAO.favoriteCount(uid), page.getCurrentPage());
		List<String> list = userDAO.getFavorite(page, uid);
		PageResult result = new PageResult(page, list);
		return result;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.UserService#favoriteCount(java.lang.String)
	 */
	public int favoriteCount(String uid) {
		return userDAO.favoriteCount(uid);
	}

}

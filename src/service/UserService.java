package service;

import po.User;
import util.Page;
import util.PageResult;

public interface UserService {

	public String userLogin(String uid, String password);

	public PageResult getUserByPage(Page page);

	public boolean addUser(User user);

	public boolean deleteUser(String uid);

	public boolean updateUser(User user);

	public User getUserById(String userID);

	public boolean multiDeleteUser(String[] uids);

	public boolean addUser(String uid);// pass check

	public boolean addUser(String[] uids);// pass check

	public PageResult getRegisterUserByPage(Page page);

	public boolean passUser(String uid);

	public boolean multiPassUser(String[] uids);

	public int totalCount();

	public int registerTotalCount();

	public boolean addFavorite(String specie, String uid);

	public PageResult getFavorite(Page page, String uid);

	public int favoriteCount(String uid);

	public boolean deleteFavorite(String specie, String uid);

}

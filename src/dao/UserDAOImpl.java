package dao;

import java.util.Arrays;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import po.User;
import util.Page;

public class UserDAOImpl implements UserDAO {

	/*
	 * 通过注册
	 * 
	 * @see dao.UserDAO#passexamine(java.lang.String)
	 */
	public boolean pass(String uid) {
	
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Transaction transaction = null;// 声明一个事务对象
		try {
			transaction = session.beginTransaction();// 开启事务		
			User user = (User) session.get(User.class, uid);
			user.setIschecked("yes");
			user.setFavorite("");
			session.update(user);// 更新
			transaction.commit();// 提交事务
		} catch (Exception ex) {
			ex.printStackTrace();
			transaction.rollback();// 事务回滚
			return false;
		}
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return true;

	}

	/*
	 * 拒绝注册
	 * 
	 * @see dao.UserDAO#refuseexamine(java.lang.String)
	 */
	public boolean refuse(String uid) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Transaction transaction = null;// 声明一个事务对象
		try {
			transaction = session.beginTransaction();// 开启事务
			User user = (User) session.get(User.class, uid);
			session.delete(user);// 删除
			transaction.commit();// 提交事务
		} catch (Exception ex) {
			ex.printStackTrace();
			transaction.rollback();// 事务回滚
			return false;
		}
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return true;
	}

	/*
	 * 用户验证
	 * 
	 * @see dao.UserDAO#findUserById(java.lang.String)
	 */
	public User getUserById(String uid) {
		Session session = HibernateSessionFactory.getSession();
		User user = (User) session.get(User.class, uid);
		HibernateSessionFactory.closeSession();
		return user;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.UserDAO#addUser(po.User)
	 */
	public boolean addUser(User user) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Transaction transaction = null;// 声明一个事务对象
		try {
			transaction = session.beginTransaction();// 开启事务
			session.save(user);
			transaction.commit();// 提交事务
		} catch (Exception ex) {
			ex.printStackTrace();
			transaction.rollback();// 事务回滚
			return false;
		}
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.UserDAO#findUserList(util.Page)
	 */
	public List<User> getUserByPage(Page page) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Query query = session.createQuery("from User where ischecked='yes'");
		query.setMaxResults(page.getEveryPage());// 设置查询记录数
		query.setFirstResult(page.getBeginIndex());// 设置查询记录起始位置
		@SuppressWarnings("unchecked")
		List<User> list = query.list(); // 查询结果保存到list中
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return list;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.UserDAO#deleteUser(java.lang.String)
	 */
	public boolean deleteUser(String uid) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		User user = (User) session.get(User.class, uid);
		Transaction transaction = null;// 声明一个事务对象
		try {
			transaction = session.beginTransaction();// 开启事务
			session.delete(user);
			transaction.commit();// 提交事务
		} catch (Exception ex) {
			ex.printStackTrace();
			transaction.rollback();// 事务回滚
			return false;
		}
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.UserDAO#totalCount()
	 */
	public int totalCount() {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Query query = session
				.createQuery("select count(*) from User where ischecked='yes'");
		int count = ((Long) query.uniqueResult()).intValue();
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return count;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.UserDAO#updateUser(po.User)
	 */
	public boolean updateUser(User user) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Transaction transaction = null;// 声明一个事务对象
		try {
			transaction = session.beginTransaction();// 开启事务
			session.update(user);
			transaction.commit();// 提交事务
		} catch (Exception ex) {
			ex.printStackTrace();
			transaction.rollback();// 事务回滚
			return false;
		}
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return true;

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.UserDAO#multiDeleteUser(java.lang.String[])
	 */
	public boolean multiDeleteUser(String[] uids) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Transaction transaction = null;// 声明一个事务引用
		try {
			transaction = session.beginTransaction();// 开启事务
			for (int i = 0; i < uids.length; i++) {
				User user = (User) session.get(User.class, uids[i]);
				session.delete(user);
			}
			transaction.commit();// 提交事务
		} catch (Exception ex) {
			ex.printStackTrace();
			transaction.rollback();// 事务回滚
			return false;
		}
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.UserDAO#pass(java.lang.String[])
	 */
	public boolean pass(String[] uids) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Transaction transaction = null;// 声明一个事务对象
		try {
			transaction = session.beginTransaction();// 开启事务
			for (int i = 0; i < uids.length; i++) {
				User user = (User) session.get(User.class, uids[i]);
				user.setIschecked("yes");
				session.update(user);
			}
			transaction.commit();// 提交事务
		} catch (Exception ex) {
			ex.printStackTrace();
			transaction.rollback();// 事务回滚
			return false;
		}
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.UserDAO#refuse(java.lang.String[])
	 */
	public boolean refuse(String[] uids) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Transaction transaction = null;// 声明一个事务对象
		try {
			transaction = session.beginTransaction();// 开启事务
			for (int i = 0; i < uids.length; i++) {
				User user = (User) session.get(User.class, uids[i]);
				session.update(user);
			}
			transaction.commit();// 提交事务
		} catch (Exception ex) {
			ex.printStackTrace();
			transaction.rollback();// 事务回滚
			return false;
		}
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.UserDAO#getRegisterUserByPage(util.Page)
	 */
	public List<User> getRegisterUserByPage(Page page) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Query query = session.createQuery("from User where ischecked='no'");
		query.setMaxResults(page.getEveryPage());// 设置查询记录数
		query.setFirstResult(page.getBeginIndex());// 设置查询记录起始位置
		@SuppressWarnings("unchecked")
		List<User> list = query.list(); // 查询结果保存到list中
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return list;
	}

	public int totalRegisterCount() {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Query query = session
				.createQuery("select count(*) from User where ischecked='no'");
		int count = ((Long) query.uniqueResult()).intValue();
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return count;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.UserDAO#addFavorite(int)
	 */
	public boolean addFavorite(String specie, String uid) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Transaction transaction = null;// 声明一个事务对象
		try {
			transaction = session.beginTransaction();// 开启事务
			User user = (User) session.get(User.class, uid);
			if(user.getFavorite()==null){
				user.setFavorite(specie + ",");
			}
			else{
				user.setFavorite(user.getFavorite() + specie + ",");// 末尾始终有“，”
			}
			session.update(user);
			transaction.commit();// 提交事务
		} catch (Exception ex) {
			ex.printStackTrace();
			transaction.rollback();// 事务回滚
			return false;
		}
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.UserDAO#deleteFavorite(int)
	 */
	public boolean deleteFavorite(String specie, String uid) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Transaction transaction = null;// 声明一个事务对象
		try {
			transaction = session.beginTransaction();// 开启事务
			User user = (User) session.get(User.class, uid);
			String str = user.getFavorite().replace(specie + ",", "");
			user.setFavorite(str);
			session.update(user);
			transaction.commit();// 提交事务
		} catch (Exception ex) {
			ex.printStackTrace();
			transaction.rollback();// 事务回滚
			return false;
		}
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return true;
	}

	/*
	 * 
	 */
	public int favoriteCount(String uid) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		User user = (User) session.get(User.class, uid);
		if ("".equals(user.getFavorite())||null==user.getFavorite()) {
			return 0;
		} else {
			String[] species = user.getFavorite().split(",");
			HibernateSessionFactory.closeSession();// 关闭Session对象
			return species.length;
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.UserDAO#getFavorite(util.Page, java.lang.String)
	 */
	public List<String> getFavorite(Page page, String uid) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		User user = (User) session.get(User.class, uid);
		if ("".equals(user.getFavorite())||null==user.getFavorite()) {
			return null;
		} else {
			String[] species = user.getFavorite().split(",");
			List<String> list = Arrays.asList(species);
			HibernateSessionFactory.closeSession();// 关闭Session对象
			return list;
		}
	}
}

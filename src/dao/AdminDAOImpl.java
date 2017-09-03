package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import po.Admin;
import po.User;

public class AdminDAOImpl implements AdminDAO {
	/*
	 * 用来验证admin
	 * 
	 * @see dao.AdminDAO#findByAdminID(java.lang.String)
	 */
	public Admin getAdminById(String AdminID) {
		Session session = HibernateSessionFactory.getSession();
		Admin admin = (Admin) session.get(Admin.class, AdminID);
		HibernateSessionFactory.closeSession();
		return admin;
	}

	/*
	 * list admin
	 * 
	 * @see dao.AdminDAO#listAdmin()
	 */
	public List<Admin> getAdminList() {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Query query = session.createQuery("from Admin where role='admin' ");
		@SuppressWarnings("unchecked")
		List<Admin> list = query.list(); // 查询结果保存到list中
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return list;
	}

	/*
	 * 删除admin
	 * 
	 * @see dao.AdminDAO#deleteAdmin(java.lang.String)
	 */
	public boolean deleteAdmin(String aid) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Admin admin = (Admin) session.get(Admin.class, aid);
		Transaction transaction = null;// 声明一个事务对象
		try {
			transaction = session.beginTransaction();// 开启事务
			session.delete(admin);
			transaction.commit();// 提交事务
		} catch (Exception ex) {
			ex.printStackTrace();
			transaction.rollback();// 事务回滚
			return false;
		}
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return true;
	}

	public boolean multiDeleteAdmin(String[] aid) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Transaction transaction = null;// 声明一个事务对象
		try {
			transaction = session.beginTransaction();// 开启事务
			for (int i = 0; i < aid.length; i++) {
				Admin admin = (Admin) session.get(Admin.class, aid[i]);
				session.delete(admin);
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
	 * 将user变为admin
	 * 
	 * @see dao.AdminDAO#addAdmin(java.lang.String)
	 */
	public boolean addAdmin(String uid) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		
		User user = (User) session.get(User.class, uid);
		Admin admin = new Admin(uid, user.getName(), user.getPassword(), "admin",
				user.getTelephone());
		Transaction transaction = null;// 声明一个事务对象
		try {
			transaction = session.beginTransaction();// 开启事务
			session.save(admin);
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
	 * 添加admin
	 * 
	 * @see dao.AdminDAO#addAdmin(po.Admin)
	 */
	public boolean addAdmin(Admin admin) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Transaction transaction = null;// 声明一个事务对象
		transaction = session.beginTransaction();// 开启事务
		try {
			session.save(admin);
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
	 * 更改admin
	 * 
	 * @see dao.AdminDAO#updateAdmin(po.Admin)
	 */
	public boolean updateAdmin(Admin admin) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Transaction transaction = null;// 声明一个事务对象
		try {
			transaction = session.beginTransaction();// 开启事务
			session.update(admin);
			transaction.commit();// 提交事务
		} catch (Exception ex) {
			ex.printStackTrace();
			transaction.rollback();// 事务回滚
			return false;
		}
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return true;
	}
}

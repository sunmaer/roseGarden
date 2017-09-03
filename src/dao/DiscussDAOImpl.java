package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import po.Discuss;
import util.Page;

public class DiscussDAOImpl implements DiscussDAO {

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.DiscussDAO#deleteDiscuss(java.lang.String)
	 */
	public boolean deleteDiscuss(int did) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Discuss Discuss = (Discuss) session.get(Discuss.class, did);
		Transaction transaction = null;// 声明一个事务对象
		try {
			transaction = session.beginTransaction();// 开启事务
			session.delete(Discuss);
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
	 * @see dao.DiscussDAO#addDiscuss(po.Discuss)
	 */
	public boolean addDiscuss(Discuss discuss) {
		/*
		 * Session session = HibernateSessionFactory.getSession();// 获得Session对象
		 * Transaction transaction = null;// 声明一个事务对象 try { transaction =
		 * session.beginTransaction();// 开启事务 session.save(discuss);// 保存信息,异常？
		 * transaction.commit();// 提交事务 } catch (Exception ex) {
		 * ex.printStackTrace(); transaction.rollback();// 事务回滚 return false; }
		 * HibernateSessionFactory.closeSession();// 关闭Session对象 return true;
		 */

		Session session = HibernateSessionFactory.getSession();
		Transaction transaction = null;// 声明一个事务对象
		Query query = null;
		try {
			transaction = session.beginTransaction();// 开启事务
			query = session
					.createSQLQuery("insert into discuss values (0,?,?,?,?,?,?)");
			query.setParameter(0, discuss.getTid());
			query.setParameter(1, discuss.getUid());
			query.setParameter(2, discuss.getContent());
			query.setParameter(3, discuss.getTime());
			query.setParameter(4, discuss.getTheme());
			query.setParameter(5, discuss.getName());
			query.executeUpdate();
			transaction.commit();// 提交事务,执行到数据库
		} catch (Exception ex) {
			ex.printStackTrace();
			transaction.rollback();// 事务回滚
			return false;
		}

		HibernateSessionFactory.closeSession();
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.DiscussDAO#findDiscussList(util.Page)
	 */
	public List<Discuss> getDiscussByPage(Page page, int tid) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Query query = session.createQuery("from Discuss where tid =" + tid
				+ "order by time DESC");
		query.setMaxResults(page.getEveryPage());// 设置查询记录数
		query.setFirstResult(page.getBeginIndex());// 设置查询记录起始位置
		@SuppressWarnings("unchecked")
		List<Discuss> list = query.list(); // 查询结果保存到list中
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return list;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.DiscussDAO#totalCount()
	 */
	public int totalCount(int tid) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Query query = session
				.createQuery("select count(*) from Discuss where tid =" + tid);
		int count = ((Long) query.uniqueResult()).intValue();
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return count;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.DiscussDAO#getDiscussById(int)
	 */
	public Discuss getDiscussById(int did) {
		int Did = Integer.valueOf(did);
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Discuss discuss = (Discuss) session.get(Discuss.class, Did);
		return discuss;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.DiscussDAO#deleteDiscuss(java.lang.String[])
	 */
	public boolean deleteDiscuss(String[] dids) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象

		Transaction transaction = null;// 声明一个事务对象
		try {
			transaction = session.beginTransaction();// 开启事务
			for (int i = 0; i < dids.length; i++) {
				int did = Integer.valueOf(dids[i]);
				Discuss Discuss = (Discuss) session.get(Discuss.class, did);
				session.delete(Discuss);
				transaction.commit();// 提交事务
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			transaction.rollback();// 事务回滚
			return false;
		}
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return true;
	}

}

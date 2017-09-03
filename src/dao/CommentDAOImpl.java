package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import po.Comment;
import util.Page;

public class CommentDAOImpl implements CommentDAO {

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.CommentDAO#addComment(po.Comment)
	 */
	public boolean addComment(Comment comment) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Transaction transaction = null;// 声明一个事务对象
		try {
			transaction = session.beginTransaction();// 开启事务
			session.save(comment);// 保存信息
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
	 * @see dao.CommentDAO#findComment(util.Page)
	 */
	public List<Comment> getCommentByPage(Page page, int rid) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Query query = session.createQuery("from Comment where rid ='" + rid
				+ "'ORDER BY time ");
		query.setMaxResults(page.getEveryPage());// 设置查询记录数
		query.setFirstResult(page.getBeginIndex());// 设置查询记录起始位置
		@SuppressWarnings("unchecked")
		List<Comment> list = query.list(); // 查询结果保存到list中
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return list;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.CommentDAO#totalCount()
	 */
	public int totalCount(int rid) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Query query = session
				.createQuery("select count(*) from Comment where rid =" + rid);
		int count = ((Long) query.uniqueResult()).intValue();
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return count;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.CommentDAO#deleteComment(java.lang.String)
	 */
	public boolean deleteComment(int cid) {
		int Cid = Integer.valueOf(cid);
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Comment comment = (Comment) session.get(Comment.class, Cid);
		Transaction transaction = null;// 声明一个事务对象
		try {
			transaction = session.beginTransaction();// 开启事务
			session.delete(comment);
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
	 * @see dao.CommentDAO#getCommentById(int)
	 */
	public Comment getCommentById(int cid) {
		int Cid = Integer.valueOf(cid);
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Comment comment = (Comment) session.get(Comment.class, Cid);
		return comment;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.CommentDAO#deleteComment(java.lang.String[])
	 */
	public boolean deleteComment(String[] cids) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Transaction transaction = null;// 声明一个事务对象
		try {
			transaction = session.beginTransaction();// 开启事务
			for (int j = 0; j < cids.length; j++) {
				int cid = Integer.valueOf(cids[j]);
				Comment comment = (Comment) session.get(Comment.class, cid);
				session.delete(comment);
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
	 * @see dao.CommentDAO#getComment(int)
	 */
	public List<Comment> getComment(int rid) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Query query = session.createQuery("from Comment where rid = '" + rid
				+ "'ORDER BY time ");

		@SuppressWarnings("unchecked")
		List<Comment> list = query.list(); // 查询结果保存到list中
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return list;
	}
}

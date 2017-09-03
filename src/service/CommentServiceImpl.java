package service;

import java.util.List;

import dao.CommentDAO;
import dao.CommentDAOImpl;
import dao.RoseDAO;
import dao.RoseDAOImpl;
import dao.UserDAO;
import dao.UserDAOImpl;
import po.Comment;
import util.Page;
import util.PageResult;
import util.PageUtil;

public class CommentServiceImpl implements CommentService {

	private CommentDAO commentDAO = new CommentDAOImpl();

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.CommentService#addComment(po.Comment)
	 */
	public boolean addComment(Comment comment) {
		UserDAO userDAO = new UserDAOImpl();
		RoseDAO roseDAO = new RoseDAOImpl();
		comment.setName(userDAO.getUserById(comment.getUid()).getName());
		comment.setSpecie(roseDAO.getRoseById(comment.getRid()).getSpecie());
		return commentDAO.addComment(comment);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.CommentService#deleteComment(int)
	 */
	public boolean deleteComment(int cid) {
		return commentDAO.deleteComment(cid);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.CommentService#getCommentByPage(util.Page)
	 */
	public PageResult getCommentByPage(Page page, int rid) {
		page = PageUtil.createPage(page.getEveryPage(),
				commentDAO.totalCount(rid), page.getCurrentPage());
		List<Comment> list = commentDAO.getCommentByPage(page, rid);
		PageResult result = new PageResult(page, list);
		return result;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.CommentService#multiDeleteComment(java.lang.String[])
	 */
	public boolean multiDeleteComment(String[] cids) {
		return commentDAO.deleteComment(cids);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.CommentService#getCommentById(int)
	 */
	public Comment getCommentById(int cid) {
		return commentDAO.getCommentById(cid);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.CommentService#getComment(int)
	 */
	public List<Comment> getComment(int rid) {
		return commentDAO.getComment(rid);
	}

}

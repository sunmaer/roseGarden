package dao;

import java.util.List;

import po.Comment;
import util.Page;

public interface CommentDAO {
	// user的操作
	public boolean addComment(Comment comment);

	public boolean deleteComment(int cid);

	// admin的操作
	public List<Comment> getCommentByPage(Page page, int rid);

	public int totalCount(int rid);

	public Comment getCommentById(int cid);

	public boolean deleteComment(String[] cids);

	public List<Comment> getComment(int rid);
}

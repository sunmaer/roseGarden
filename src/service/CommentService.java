package service;

import java.util.List;

import po.Comment;
import util.Page;
import util.PageResult;

public interface CommentService {
	// user
	boolean addComment(Comment comment);

	// user and admin
	boolean deleteComment(int cid);

	// admin
	PageResult getCommentByPage(Page page, int rid);

	boolean multiDeleteComment(String[] cids);

	Comment getCommentById(int cid);

	List<Comment> getComment(int rid);

}

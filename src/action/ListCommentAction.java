package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import po.Comment;
import service.CommentService;
import service.CommentServiceImpl;
import util.Page;
import util.PageResult;

import com.opensymphony.xwork2.ActionSupport;

public class ListCommentAction extends ActionSupport {

	/**
	 * 查看rose下的评论列表
	 */
	private static final long serialVersionUID = 1L;
	private String rid;
	private int currentPage;
	private CommentService commentService = new CommentServiceImpl();

	public String execute() throws Exception {
		Page page = new Page();
		page.setEveryPage(50);
		page.setCurrentPage(currentPage);
		int Rid = Integer.valueOf(rid);
		PageResult pageResult = commentService.getCommentByPage(page, Rid);
		@SuppressWarnings("unchecked")
		List<Comment> comments = pageResult.getList();
		page = pageResult.getPage();
		HttpServletRequest request = ServletActionContext.getRequest();
		for (Comment comment : comments) {
			String otime = comment.getTime();
			comment.setTime(otime.substring(0, otime.length() - 2));
		}
		request.setAttribute("comments", comments);
		request.setAttribute("page", page);
		return SUCCESS;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

}

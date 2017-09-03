package action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import po.Comment;
import service.CommentService;
import service.CommentServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

/*
 * 查看详细评论
 */
public class FindCommentAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String cid;

	private CommentService commentService = new CommentServiceImpl();

	public String execute() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();
		int Cid = Integer.valueOf(cid);
		Comment comment = commentService.getCommentById(Cid);
		String otime = comment.getTime();
		comment.setTime(otime.substring(0, otime.length() - 2));
		request.setAttribute("comment", comment);
		return SUCCESS;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

}

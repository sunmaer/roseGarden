package action;

import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import service.CommentService;
import service.CommentServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

public class DeleteCommentAction extends ActionSupport {

	/**
	 * admin 单个，多个删除对rose评论
	 */
	private static final long serialVersionUID = 1L;
	private String cid;

	private String cids;
	CommentService commentService = new CommentServiceImpl();

	public String execute() throws Exception {
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		int Cid = Integer.valueOf(cid);
		if (commentService.deleteComment(Cid)) {
			writer.write("success");
			writer.close();
		} else {
			writer.write("fail");
			writer.close();
		}
		return null;
	}

	public void multiDeleteComment() throws Exception {
		String[] Cids = cids.split("-");
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (commentService.multiDeleteComment(Cids)) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		writer.close();
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCids() {
		return cids;
	}

	public void setCids(String cids) {
		this.cids = cids;
	}
}

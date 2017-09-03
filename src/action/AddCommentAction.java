package action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import po.Comment;
import service.CommentService;
import service.CommentServiceImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AddCommentAction extends ActionSupport {
	/*
	 * user add comment
	 */
	private static final long serialVersionUID = 1L;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private String rid;
	private String content;

	SimpleDateFormat formattime = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
	private String time = formattime.format(Calendar.getInstance().getTime());

	public String execute() throws Exception {
		System.out.println(rid);
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		String Uid = (String) session.get("uid");
		int Rid = Integer.valueOf(rid);
		Comment comment = new Comment(0, Rid, content, time, Uid, null, null);
		CommentService commentService = new CommentServiceImpl();
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (commentService.addComment(comment)) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		return null;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

}

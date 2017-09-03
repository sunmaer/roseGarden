package action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import po.Discuss;
import service.DiscussService;
import service.DiscussServiceImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AddDiscussAction extends ActionSupport {
	/*
	 * user add discuss in a theme
	 */

	private int tid;
	SimpleDateFormat formattime = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
	String time = formattime.format(Calendar.getInstance().getTime());
	private String content;
	private static final long serialVersionUID = 1L;

	public String execute() throws Exception {
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		String uid = (String) session.get("uid");
		Discuss discuss = new Discuss(0, tid, uid, time, content, null, null);
		DiscussService discussService = new DiscussServiceImpl();
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (discussService.addDiscuss(discuss)) {
			writer.write("success");
			writer.close();
		} else {
			writer.write("fail");
			writer.close();
		}
		return null;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

}

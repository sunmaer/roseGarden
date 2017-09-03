package action;

import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import service.DiscussService;
import service.DiscussServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

public class DeleteDiscussAction extends ActionSupport {

	/**
	 * admin删除单个多个对theme的讨论
	 */
	private static final long serialVersionUID = 1L;
	private String did;
	private String dids;
	DiscussService discussService = new DiscussServiceImpl();

	public String execute() throws Exception {
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		int Did = Integer.valueOf(did);
		if (discussService.deleteDiscuss(Did)) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		writer.close();
		return null;
	}

	public String multiDeleteAdmin() throws Exception {
		String[] dids = did.split("-");
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (discussService.multiDeleteAdmin(dids)) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		writer.close();
		return null;
	}

	public String getDid() {
		return did;
	}

	public void setDid(String did) {
		this.did = did;
	}

	public String getDids() {
		return dids;
	}

	public void setDids(String dids) {
		this.dids = dids;
	}

}

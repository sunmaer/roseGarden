package action;

import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import service.UserService;
import service.UserServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

public class DeleteUserAction extends ActionSupport {

	/**
	 * admin删除单个多个用户
	 */
	private static final long serialVersionUID = 1L;
	private String uid;
	private String uids;
	UserService userService = new UserServiceImpl();

	public String execute() throws Exception {
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (userService.deleteUser(uid)) {
			writer.write("success");
			writer.close();
		} else {
			writer.write("fail");
			writer.close();
		}
		return null;
	}

	public String multiDeleteUser() throws Exception {
		String[] Uids = uids.split("-");
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (userService.multiDeleteUser(Uids)) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		writer.close();
		return null;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUids() {
		return uids;
	}

	public void setUids(String uids) {
		this.uids = uids;
	}

}

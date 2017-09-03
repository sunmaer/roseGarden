package action;

import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import service.AdminService;
import service.AdminServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

public class PromoteUserAction extends ActionSupport {
	/**
	 * superadmin将user变为admin
	 */
	private static final long serialVersionUID = 1L;
	private String uid;
	AdminService adminService = new AdminServiceImpl();

	public String execute() throws Exception {
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (adminService.addAdmin(uid)) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		return null;
	}

	/*
	 * 用户是否为admin
	 */
	public void isAdmin() throws Exception {
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (adminService.getAdminById(uid) != null) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}
}

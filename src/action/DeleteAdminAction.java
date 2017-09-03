package action;

import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import service.AdminService;
import service.AdminServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

public class DeleteAdminAction extends ActionSupport {
	/**
	 * superadmin删除单个，多个admin
	 */
	private static final long serialVersionUID = 1L;
	private String aid;
	private String adminID;
	AdminService adminService = new AdminServiceImpl();

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getAdminID() {
		return adminID;
	}

	public void setAdminID(String adminID) {
		this.adminID = adminID;
	}

	public String execute() throws Exception {
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (adminService.deleteAdmin(adminID)) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		writer.close();
		return null;
	}

	public void multiDeleteAdmin() throws Exception {
		String[] aids = aid.split("-");
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (adminService.multiDeleteAdmin(aids)) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		writer.close();
	}
}

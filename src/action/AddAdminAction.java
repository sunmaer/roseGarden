package action;

import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import po.Admin;
import service.AdminService;
import service.AdminServiceImpl;

public class AddAdminAction extends ActionSupport {
	/**
	 * superadmin add admin
	 */
	private static final long serialVersionUID = 1L;
	private String aid;
	private String password;
	private String name;
	private String telephone;

	public String execute() throws Exception {
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		Admin admin = new Admin(aid, name, password, "admin", telephone);
		AdminService adminService = new AdminServiceImpl();
		if (adminService.addAdmin(admin)) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		return null;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String Aid) {
		this.aid = Aid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
}

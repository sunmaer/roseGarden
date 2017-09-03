package action;

import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import service.AdminService;
import service.AdminServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

/*
 * check admin ID是否存在，密码是否对
 */
@SuppressWarnings("serial")
public class AdminLoginAction extends ActionSupport {
	private String aid;
	private String password;

	private AdminService adminService = new AdminServiceImpl();

	public void adminLogin() throws Exception {
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (adminService.adminLogin(aid, password)) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		writer.close();
	}

	public void isAid() throws Exception {
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (adminService.getAdminById(aid) != null) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		writer.close();
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}

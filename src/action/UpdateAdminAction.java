package action;

import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import po.Admin;
import service.AdminService;
import service.AdminServiceImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateAdminAction extends ActionSupport {

	/**
	 * admin更改admin个人信息，密码，联系方式
	 */
	private static final long serialVersionUID = 1L;

	private String name;
	private String telephone;
	private String password;
	private String npassword;

	public String execute() throws Exception {
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		AdminService adminService = new AdminServiceImpl();
		ActionContext ctx = ActionContext.getContext();
		Admin oldadmin = (Admin) ctx.getSession().get("admin");
		password = oldadmin.getPassword();
		if (!npassword.equals("")) {
			password = npassword;
		}
		Admin admin = new Admin(oldadmin.getAid(), name, password, telephone,
				oldadmin.getRole());
		if (adminService.updateAdmin(admin)) {
			writer.write("success");
			writer.close();
		} else {
			writer.write("fail");
			writer.close();
		}
		return null;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNpassword() {
		return npassword;
	}

	public void setNpassword(String npassword) {
		this.npassword = npassword;
	}

	private String aid;

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}

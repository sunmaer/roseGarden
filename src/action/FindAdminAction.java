package action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import po.Admin;
import service.AdminService;
import service.AdminServiceImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FindAdminAction extends ActionSupport {
	/**
	 * 管理员个人信息
	 */
	private static final long serialVersionUID = 1L;

	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		String aid = (String) ((Admin) ctx.getSession().get("admin")).getAid();
		AdminService adminservice = new AdminServiceImpl();
		Admin admin = adminservice.getAdminById(aid);
		HttpServletRequest request = ServletActionContext.getRequest();
		if (admin.getRole().equals("admin")) {
			admin.setRole("普通管理员");
		} else {
			admin.setRole("超级管理员");
		}
		request.setAttribute("admin", admin);
		return SUCCESS;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}

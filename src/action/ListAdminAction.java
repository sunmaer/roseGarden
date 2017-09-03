package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import po.Admin;
import service.AdminServiceImpl;
import service.AdminService;

import com.opensymphony.xwork2.ActionSupport;

public class ListAdminAction extends ActionSupport {

	/**
	 * 查看admin列表
	 */
	private static final long serialVersionUID = 1L;

	private AdminService AdminService = new AdminServiceImpl();

	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		List<Admin> admins = AdminService.getAdminList();
		for (int i = 0; i < admins.size(); i++) {
			if (admins.get(i).getRole().equals("admin")) {
				admins.get(i).setRole("普通管理员");
			} else {
				admins.get(i).setRole("超级管理员");
			}
		}
		request.setAttribute("adminlist", admins);

		return SUCCESS;
	}

}

package action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import service.AdminService;
import service.AdminServiceImpl;
import service.RoseService;
import service.RoseServiceImpl;
import service.UserService;
import service.UserServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

/*
 * 查询首页信息
 */
public class FindInfoAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	private RoseService roseService = new RoseServiceImpl();
	private AdminService adminService = new AdminServiceImpl();
	private UserService userService = new UserServiceImpl();

	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		int admincount = adminService.getAdminList().size();
		int rosecount = roseService.totalCount("");
		int rosecount1 = roseService.totalCount("现代月季");
		int rosecount2 = roseService.totalCount("蔷薇属原种");
		int rosecount3 = roseService.totalCount("古老蔷薇");
		int usercount = userService.totalCount();
		int registerusercount = userService.registerTotalCount();

		request.setAttribute("admincount", admincount);
		request.setAttribute("rosecount", rosecount);
		request.setAttribute("rosecount1", rosecount1);
		request.setAttribute("rosecount2", rosecount2);
		request.setAttribute("rosecount3", rosecount3);
		request.setAttribute("usercount", usercount);
		request.setAttribute("registerusercount", registerusercount);

		return SUCCESS;
	}

}

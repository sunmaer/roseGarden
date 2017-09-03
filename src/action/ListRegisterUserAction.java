package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import po.User;
import service.UserService;
import service.UserServiceImpl;
import util.Page;
import util.PageResult;

import com.opensymphony.xwork2.ActionSupport;

public class ListRegisterUserAction extends ActionSupport {

	/**
	 * 查看申请注册的用户列表
	 */
	private static final long serialVersionUID = 1L;

	private int currentPage;
	private UserService userService = new UserServiceImpl();

	public String execute() throws Exception {
		Page page = new Page();
		page.setEveryPage(50);
		page.setCurrentPage(currentPage);
		PageResult pageResult = userService.getRegisterUserByPage(page);
		@SuppressWarnings("unchecked")
		List<User> registerusers = pageResult.getList();
		page = pageResult.getPage();
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("registerUsers", registerusers);
		request.setAttribute("page", page);
		return SUCCESS;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
}

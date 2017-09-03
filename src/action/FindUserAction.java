package action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import po.User;
import service.UserService;
import service.UserServiceImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/*
 * 查看user信息
 */
public class FindUserAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String userID;

	private UserService UserService = new UserServiceImpl();

	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		userID = (String) ctx.getSession().get("uid");
		HttpServletRequest request = ServletActionContext.getRequest();
		User user = UserService.getUserById(userID);
		request.setAttribute("user", user);
		return SUCCESS;
	}
}

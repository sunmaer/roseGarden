package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserOutAction extends ActionSupport {

	/**
	 * 用户注销登录
	 */
	private static final long serialVersionUID = 1L;

	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		ctx.getSession().remove("uid");
		return "index";
	}
}

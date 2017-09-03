package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminOutAction extends ActionSupport {

	/**
	 * admin退出
	 */
	private static final long serialVersionUID = 1L;

	public String execute() throws Exception {

		ActionContext ctx = ActionContext.getContext();
		ctx.getSession().remove("admin");
		return "adminlogin";
	}
}

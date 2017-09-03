package action;

import java.util.Map;

import po.Admin;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class AdminAuthInterceptor extends MethodFilterInterceptor {
	/*
	 * admin拦截器
	 */
	private static final long serialVersionUID = 1L;

	protected String doIntercept(ActionInvocation action) throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		Admin admin = (Admin) session.get("admin");
		if (admin != null) {
			// 通过
			return action.invoke();
		} else {
			// 不通过，报错
			return "adminlogin";
		}
	}
}
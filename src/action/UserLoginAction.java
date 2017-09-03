package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import service.UserService;
import service.UserServiceImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/*
 * 用户检查uid是否已经存在，并且检查密码
 */
@SuppressWarnings("serial")
public class UserLoginAction extends ActionSupport {
	private String uid;
	private String password;
	private UserService userService = new UserServiceImpl();

	public String execute() throws Exception {
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		writer.write(userService.userLogin(uid, password));
		if (userService.userLogin(uid, password).equals("yes")) {
			ActionContext actionContext = ActionContext.getContext();
			Map<String, Object> session = actionContext.getSession();
			session.put("uid", uid);
		}
		writer.close();
		return null;
	}

	public void showName() throws IOException {
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		String uid = (String) session.get("uid");
		if(uid==null){
			return;
		}else{
			String name = userService.getUserById(uid).getName();
			writer.write(name);
			writer.close();
		}	
	}
	public void isUid() throws Exception {
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (userService.getUserById(uid) != null) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		writer.close();
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}

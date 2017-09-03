package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import po.User;
import service.UserService;
import service.UserServiceImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateUserAction extends ActionSupport {

	/**
	 * user
	 */
	private static final long serialVersionUID = 1L;

	private String password;
	private String name;
	private String telephone;

	public String execute() throws IOException {
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		String uid = (String) session.get("uid");
		User user = new User(uid, name, password, telephone, "yes", null);
		UserService userService = new UserServiceImpl();

		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (userService.updateUser(user)) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		writer.close();
		return null;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

}

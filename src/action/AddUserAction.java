package action;

import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import po.User;
import service.UserService;
import service.UserServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

public class AddUserAction extends ActionSupport {

	/**
	 * admin add a user
	 */
	private static final long serialVersionUID = 1L;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private String uid;
	private String password;
	private String name;
	private String telephone;
	private String ischecked;
	UserService userService = new UserServiceImpl();

	public String execute() throws Exception {
		User user = new User(uid, name, password, telephone, "yes", null);
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (userService.addUser(user)) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		return null;
	}

	public String checkUserID() throws Exception {
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (userService.getUserById(uid) != null) {
			writer.write("UID已经存在");
			writer.close();
		} else {
			writer.write("UID不存在");
			writer.close();
		}
		return null;
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

	public String getIschecked() {
		return ischecked;
	}

	public void setIschecked(String ischecked) {
		this.ischecked = ischecked;
	}

}

package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import service.UserService;
import service.UserServiceImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AddFavoriteAction extends ActionSupport {

	/**
	 * user add favorite
	 */
	private static final long serialVersionUID = 1L;
	private String specie;

	public String execute() throws IOException {
		UserService userService = new UserServiceImpl();
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		String uid = (String) session.get("uid");
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (userService.addFavorite(specie, uid)) {
			writer.write("success");
			writer.close();
		} else {
			writer.write("fail");
			writer.close();
		}
		return null;
	}

	public String getSpecie() {
		return specie;
	}

	public void setSpecie(String specie) {
		this.specie = specie;
	}
}

package action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import po.Rose;
import po.User;
import service.RoseService;
import service.RoseServiceImpl;
import service.UserService;
import service.UserServiceImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class NormalSearchAction extends ActionSupport {

	/**
	 * user根据specie的名字，首汉字首字母，汉字首字母查询rose
	 */
	private static final long serialVersionUID = 1L;

	private RoseService roseService = new RoseServiceImpl();
	private UserService userService = new UserServiceImpl();
	private String specie;

	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		List<Rose> roses = roseService.searchRoseBySpecie(specie);
		if (roses.size() == 0) {
			request.setAttribute("tip", "没有搜索到相关月季");
			return SUCCESS;
		}
		String specie = null;
		Map<String, String> specietopic = new TreeMap<String, String>();
		for (int i = 0; i < roses.size(); i++) {
			specie = roses.get(i).getSpecie();
			String pic = "";
			String dir = ServletActionContext.getServletContext().getRealPath(
					"/RosePicture/" + specie);
			File directory = new File(dir);
			File[] files = directory.listFiles();
			if (directory.exists()&&files.length!=0) {	
				pic = "RosePicture/" + specie + "/" + files[0].getName();
			} else {
				pic = "images/empty.jpg";
			}
			specietopic.put(specie, pic);
		}
		request.setAttribute("specieTopic", specietopic);
		return SUCCESS;
	}

	public String searchByEveryFirstLetter() {
		HttpServletRequest request = ServletActionContext.getRequest();
		List<String> species = roseService
				.getRoseListByEveryFirstLetter(specie);
		if (species.size() == 0) {
			request.setAttribute("tip", "没有搜索到相关月季");
			return SUCCESS;
		}
		String specie = null;
		Map<String, String> specietopic = new TreeMap<String, String>();
		for (int i = 0; i < species.size(); i++) {
			specie = species.get(i);
			String pic = "";
			String dir = ServletActionContext.getServletContext().getRealPath(
					"/RosePicture/" + specie);
			File directory = new File(dir);
			File[] files = directory.listFiles();

			if (directory.exists()&&files.length!=0) {
				pic = "RosePicture/" + specie + "/" + files[0].getName();
			} else {
				pic = "images/empty.jpg";
			}
			specietopic.put(specie, pic);
		}
		request.setAttribute("specieTopic", specietopic);
		return SUCCESS;
	}

	public void getFavorite() throws IOException {
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		ActionContext actionContext = ActionContext.getContext();
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		Map<String, Object> session = actionContext.getSession();
		String uid = (String) session.get("uid");
		User user = userService.getUserById(uid);
		writer.write(user.getFavorite());
		writer.close();
	}

	public String getSpecie() {
		return specie;
	}

	public void setSpecie(String specie) {
		this.specie = specie;
	}
}

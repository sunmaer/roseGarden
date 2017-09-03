package action;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import service.UserService;
import service.UserServiceImpl;
import util.Page;
import util.PageResult;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CopyOfListFavoriteAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	private UserService userService = new UserServiceImpl();
	private int currentPage;

	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		ActionContext ctx = ActionContext.getContext();
		String userID = (String) ctx.getSession().get("uid");
		Page page = new Page();
		page.setEveryPage(25);
		page.setTotalCount(userService.favoriteCount(userID));
		page.setCurrentPage(currentPage);
		PageResult pageResult = userService.getFavorite(page, userID);
		page = pageResult.getPage();
		request.setAttribute("page", page);
		if (userService.favoriteCount(userID) == 0) {
			request.setAttribute("tip", "收藏月季为空");
			return SUCCESS;
		}
		@SuppressWarnings("unchecked")
		List<String> species = pageResult.getList();
		if (species != null) {

			Map<String, String> specietopic = new TreeMap<String, String>();

			for (int i = 0; i < species.size(); i++) {
				String pic = "";
				String specie = species.get(i);
				String dir = ServletActionContext.getServletContext()
						.getRealPath("/RosePicture/" + species.get(i));
				File directory = new File(dir);
				File[] files = directory.listFiles();

				if (directory.exists()) {
					pic = "RosePicture/" + specie + "/" + files[0].getName();
				} else {
					pic = "images/empty.jpg";
				}

				specietopic.put(specie, pic);
			}
			request.setAttribute("specieTopic", specietopic);

		}
		return SUCCESS;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

}

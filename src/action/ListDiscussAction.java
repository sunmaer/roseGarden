package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import po.Discuss;
import po.Theme;
import service.DiscussService;
import service.DiscussServiceImpl;
import service.ThemeService;
import service.ThemeServiceImpl;
import util.Page;
import util.PageResult;

import com.opensymphony.xwork2.ActionSupport;

public class ListDiscussAction extends ActionSupport {

	/**
	 * 查看theme下的讨论列表
	 */
	private static final long serialVersionUID = 1L;

	private int currentPage;
	private String tid;

	private DiscussService discussService = new DiscussServiceImpl();
	private ThemeService themeService = new ThemeServiceImpl();

	public String execute() throws Exception {
		Page page = new Page();
		page.setEveryPage(50);
		int Tid = Integer.valueOf(tid);
		page.setCurrentPage(currentPage);
		Theme theme = themeService.getThemeById(Tid);
		PageResult pageResult = discussService.getDiscussByPage(page, Tid);
		@SuppressWarnings("unchecked")
		List<Discuss> discusss = pageResult.getList();
		page = pageResult.getPage();
		HttpServletRequest request = ServletActionContext.getRequest();
		for (Discuss discuss : discusss) {
			String otime = discuss.getTime();
			discuss.setTime(otime.substring(0, otime.length() - 2));
		}
		request.setAttribute("theme", theme);
		request.setAttribute("discusslist", discusss);
		request.setAttribute("page", page);
		return SUCCESS;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

}

package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import po.Theme;
import service.DiscussService;
import service.DiscussServiceImpl;
import service.ThemeService;
import service.ThemeServiceImpl;
import util.Page;
import util.PageResult;

import com.opensymphony.xwork2.ActionSupport;

public class ListThemeAction extends ActionSupport {

	/**
	 * 查看主题帖子列表
	 */
	private static final long serialVersionUID = 1L;

	private int currentPage;
	private ThemeService themeService = new ThemeServiceImpl();
	private DiscussService discussService = new DiscussServiceImpl();

	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		Page page = new Page();
		page.setEveryPage(20);
		page.setCurrentPage(currentPage);
		PageResult pageResult = themeService.getThemeByPage(page);
		@SuppressWarnings("unchecked")
		List<Theme> themes = pageResult.getList();
		page = pageResult.getPage();
		int[] count = new int[themes.size()];

		for (int i = 0; i < themes.size(); i++) {
			String otime = themes.get(i).getTime();
			themes.get(i).setTime(otime.substring(0, otime.length() - 2));
			count[i] = discussService.totalCount(themes.get(i).getTid());
		}
		request.setAttribute("count", count);
		request.setAttribute("themelist", themes);
		request.setAttribute("page", page);
		return SUCCESS;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
}

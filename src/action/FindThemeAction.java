package action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import po.Theme;
import service.ThemeService;
import service.ThemeServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

/*
 * 查看帖子
 */
public class FindThemeAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String tid;

	private ThemeService themeService = new ThemeServiceImpl();

	public String execute() throws Exception {
		int Tid = Integer.valueOf(tid);
		HttpServletRequest request = ServletActionContext.getRequest();
		Theme theme = themeService.getThemeById(Tid);
		String otime = theme.getTime();
		theme.setTime(otime.substring(0, otime.length() - 2));
		request.setAttribute("theme", theme);
		return SUCCESS;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}
}

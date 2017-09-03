package action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import po.Theme;
import service.ThemeService;
import service.ThemeServiceImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AddThemeAction extends ActionSupport {
	/*
	 * user add theme
	 */

	SimpleDateFormat formattime = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
	String time = formattime.format(Calendar.getInstance().getTime());
	private String content;
	private String theme;

	private static final long serialVersionUID = 1L;

	public String execute() throws Exception {
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		String uid = (String) session.get("uid");
		Theme themee = new Theme(0, uid, time, content, theme, null);
		ThemeService themeService = new ThemeServiceImpl();
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (themeService.addTheme(themee)) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		return null;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

}

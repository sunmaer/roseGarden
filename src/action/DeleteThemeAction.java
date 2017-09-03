package action;

import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import service.ThemeService;
import service.ThemeServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

public class DeleteThemeAction extends ActionSupport {

	/**
	 * admin删除单个，多个theme以及theme的讨论
	 */
	private static final long serialVersionUID = 1L;
	private String tid;
	private String tids;
	ThemeService themeService = new ThemeServiceImpl();

	public String execute() throws Exception {
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		int Tid = Integer.valueOf(tid);
		if (themeService.deleteTheme(Tid)) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		writer.close();
		return null;
	}

	public void multiDeleteTheme() throws Exception {
		String[] Tids = tids.split("-");
		for (int i = 0; i < Tids.length; i++) {
			System.out.println(Tids[i]);
		}	
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (themeService.multiDeleteTheme(Tids)) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		writer.close();
	}

	public String getTids() {
		return tids;
	}

	public void setTids(String tids) {
		this.tids = tids;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

}

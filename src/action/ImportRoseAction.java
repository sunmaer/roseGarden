package action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import service.RoseService;
import service.RoseServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

public class ImportRoseAction extends ActionSupport {

	/**
	 * 导入月季表格进数据库
	 */
	private static final long serialVersionUID = 1L;
	private File importFile;

	RoseService roseService = new RoseServiceImpl();

	public String execute() throws IOException {
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (roseService.importRose(importFile)) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		writer.close();
		return null;
	}

	public File getImportFile() {
		return importFile;
	}

	public void setImportFile(File importFile) {
		this.importFile = importFile;
	}
}

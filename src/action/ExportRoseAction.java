package action;

import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import service.RoseService;
import service.RoseServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

public class ExportRoseAction extends ActionSupport {

	/**
	 * admin导出月季表格
	 */
	private static final long serialVersionUID = 1L;
	private String filename;

	RoseService roseService = new RoseServiceImpl();

	public String execute() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		OutputStream os = response.getOutputStream();// 取得输出流
		response.reset();// 清空输出流

		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Content-Disposition", "attachment;filename="
				+ "rose.xls");
		response.setContentType("application/vnd.ms-excel");
		roseService.exportRose(os);
		return SUCCESS;
	}

	/**
	 * @return the filename
	 */
	public String getFilename() {
		return filename;
	}

	/**
	 * @param filename
	 *            the filename to set
	 */
	public void setFilename(String filename) {
		this.filename = filename;
	}

}

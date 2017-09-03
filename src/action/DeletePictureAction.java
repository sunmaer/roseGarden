package action;

import java.io.File;
import java.io.PrintWriter;
import org.apache.struts2.ServletActionContext;
import service.RoseService;
import service.RoseServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class DeletePictureAction extends ActionSupport {

	/**
	 * admin删除rose picture
	 */
	private static final long serialVersionUID = 1L;

	private String fileName;
	RoseService roseService = new RoseServiceImpl();

	/**
	 * 上传图片 图片存放路径为RosePicture文件夹/月季品种名命名的文件夹/图片名称
	 */
	public String execute() throws Exception {
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		String path = ServletActionContext.getServletContext().getRealPath(
				"//" + fileName);
		File file = new File(path);
		if (file.delete()) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		writer.close();
		return null;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}

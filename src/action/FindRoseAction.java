package action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import po.Rose;
import service.RoseService;
import service.RoseServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

/*
 * 查看rose
 */
public class FindRoseAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private int rid;

	private RoseService roseService = new RoseServiceImpl();

	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		Rose rose = roseService.getRoseById(rid);
		String specie = rose.getSpecie();
		request.setAttribute("rose", rose);
		String dir = ServletActionContext.getServletContext().getRealPath(
				"/RosePicture/" + specie);
		File directory = new File(dir);
		File[] files = directory.listFiles();
		if (directory.exists()) {
			String[] path = new String[files.length];
			if (directory.exists()) {
				for (int i = 0; i < files.length; i++) {
					path[i] = "RosePicture/" + specie + "/"
							+ files[i].getName();
				}
				request.setAttribute("path", path);
			}
		}
		return SUCCESS;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

}

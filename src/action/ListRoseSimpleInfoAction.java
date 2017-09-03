package action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import service.RoseService;
import service.RoseServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

/*
 * 根据rids查看rose的picture,specie列表
 */
public class ListRoseSimpleInfoAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String rids;

	private RoseService roseService = new RoseServiceImpl();

	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		int rid = 0;
		String pics = "";
		String species = "";
		String specie = "";
		String[] Rids = rids.split(",");
		for (int j = 0; j < Rids.length; j++) {
			rid = Integer.valueOf(Rids[j]);
			specie = (roseService.getRoseById(rid)).getSpecie();
			if (j == 0) {
				species = specie;
			} else {
				species += "," + specie;
			}
			String dir = ServletActionContext.getServletContext().getRealPath(
					"/RosePicture/" + specie);
			File directory = new File(dir);
			File[] files = directory.listFiles();
			if (directory.exists()) {
				String path = "";
				path = "RosePicture/" + specie + "/" + files[0].getName();
				if (j == 0) {
					pics = path;
				} else {
					pics += "_" + path;
				}
			}
		}
		request.setAttribute("species", species);
		request.setAttribute("pics", pics);
		return SUCCESS;
	}

	public String getRids() {
		return rids;
	}

	public void setRids(String rids) {
		this.rids = rids;
	}

}

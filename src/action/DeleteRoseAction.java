package action;

import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import service.RoseService;
import service.RoseServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

public class DeleteRoseAction extends ActionSupport {

	/**
	 * admin删除多个，单个rose
	 */
	private static final long serialVersionUID = 1L;
	private String rid;

	private String rids;
	RoseService roseService = new RoseServiceImpl();

	public String execute() throws Exception {
		
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		int Rid = Integer.valueOf(rid);
		if (roseService.deleteRose(Rid)) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		writer.close();
		return null;
	}

	public void multiDeleteRose() throws Exception {
		
		String[] Rids = rids.split("-");
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (roseService.multiDeleteRose(Rids)) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		writer.close();
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getRids() {
		return rids;
	}

	public void setRids(String rids) {
		this.rids = rids;
	}

}

package action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

import po.Rose;
import service.RoseService;
import service.RoseServiceImpl;
import util.Page;
import util.PageResult;

import com.opensymphony.xwork2.ActionSupport;

public class ListSearchRoseAction extends ActionSupport {

	/**
	 * 根据specie模糊查看月季列表
	 */
	private static final long serialVersionUID = 1L;

	private int currentPage;
	private RoseService roseService = new RoseServiceImpl();
	private String specie;

	public String execute() throws Exception {
		Page page = new Page();
		page.setEveryPage(10);
		page.setCurrentPage(currentPage);

		PageResult pageResult = roseService.getSearchRose(page, specie);
		@SuppressWarnings("unchecked")
		List<Rose> roses = pageResult.getList();
		page = pageResult.getPage();
		if (roses.size() != 0) {
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("roselist", roses);
			request.setAttribute("page", page);
			return SUCCESS;
		} else {
			return "none";
		}
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSpecie() {
		return specie;
	}

	public void setSpecie(String specie) {
		this.specie = specie;
	}
}

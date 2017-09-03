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

public class ListRoseAction extends ActionSupport {

	/**
	 * 查看rose列表
	 */
	private static final long serialVersionUID = 1L;

	private int currentPage;
	private RoseService roseService = new RoseServiceImpl();
	private String type;

	public String execute() throws Exception {
		if ("所有月季".equals(type)) {
			type = null;
		}
		Page page = new Page();
		page.setEveryPage(50);
		page.setCurrentPage(currentPage);
		page.setTotalCount(roseService.totalCount(type));
		PageResult pageResult = roseService.getRoseByPage(page, type);
		@SuppressWarnings("unchecked")
		List<Rose> roses = pageResult.getList();
		page = pageResult.getPage();
		HttpServletRequest request = ServletActionContext.getRequest();
		for (int i = 0; i < roses.size(); i++) {
			if(roses.get(i).getClassification().equals("现代月季")){
				roses.get(i).setClassification(roses.get(i).getNowrose()+"(现代月季)");
			}
		}
		request.setAttribute("roselist", roses);
		request.setAttribute("page", page);
		request.setAttribute("type", type);
		return SUCCESS;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

}

package action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import po.Rose;
import service.CommentService;
import service.CommentServiceImpl;
import service.RoseService;
import service.RoseServiceImpl;
import util.Page;
import util.PageResult;

import com.opensymphony.xwork2.ActionSupport;

/*
 * 查看rose
 */
public class SearchRoseBySpecieAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String specie;
	private int currentPage;

	private RoseService roseService = new RoseServiceImpl();
	private CommentService commentService = new CommentServiceImpl();

	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		Rose rose = roseService.getRoseBySpecie(specie);
		request.setAttribute("rose", rose);
		Page page = new Page();
		page.setEveryPage(5);
		page.setCurrentPage(currentPage);
		PageResult pageResult = commentService.getCommentByPage(page,
				rose.getRid());
		page = pageResult.getPage();
		request.setAttribute("page", page);
		return SUCCESS;
	}

	public String getSpecie() {
		return specie;
	}

	public void setSpecie(String specie) {
		this.specie = specie;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
}

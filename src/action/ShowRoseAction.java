package action;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import po.Comment;
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
public class ShowRoseAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String specie;
	private int currentPage;
	private RoseService roseService = new RoseServiceImpl();
	private CommentService commentService = new CommentServiceImpl();

	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		Rose rose = roseService.getRoseBySpecie(specie);

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
		Page page = new Page();
		page.setEveryPage(10);
		page.setCurrentPage(currentPage);
		PageResult pageResult = commentService.getCommentByPage(page,
				rose.getRid());
		@SuppressWarnings("unchecked")
		List<Comment> comments = pageResult.getList();
		page = pageResult.getPage();

		for (Comment comment : comments) {
			String otime = comment.getTime();
			comment.setTime(otime.substring(0, otime.length() - 2));
		}
		request.setAttribute("comments", comments);
		request.setAttribute("page", page);
		return SUCCESS;
	}

}

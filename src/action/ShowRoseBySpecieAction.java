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

import com.opensymphony.xwork2.ActionSupport;

/*
 * 查看rose
 */
public class ShowRoseBySpecieAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String specie;
	private RoseService roseService = new RoseServiceImpl();
	private CommentService commentService = new CommentServiceImpl();

	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		Rose rose = roseService.getRoseBySpecie(specie);
		List<Comment> comments = null;
		request.setAttribute("rose", rose);
		if(commentService.getComment(rose.getRid())!=null){
			comments = commentService.getComment(rose.getRid());
			for (Comment comment : comments) {
				String otime = comment.getTime();
				comment.setTime(otime.substring(0, otime.length() - 2));
			}
			request.setAttribute("comments", comments);
		}
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

	public String getSpecie() {
		return specie;
	}

	public void setSpecie(String specie) {
		this.specie = specie;
	}
}

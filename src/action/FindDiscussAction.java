package action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import po.Discuss;
import service.DiscussService;
import service.DiscussServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

/*
 * 查看讨论
 */
public class FindDiscussAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String did;

	private DiscussService discussService = new DiscussServiceImpl();

	public String execute() throws Exception {
		int Did = Integer.valueOf(did);
		HttpServletRequest request = ServletActionContext.getRequest();
		Discuss discuss = discussService.getDiscussById(Did);
		String otime = discuss.getTime();
		discuss.setTime(otime.substring(0, otime.length() - 2));
		request.setAttribute("discuss", discuss);
		return SUCCESS;
	}

	public String getDid() {
		return did;
	}

	public void setDid(String did) {
		this.did = did;
	}
}

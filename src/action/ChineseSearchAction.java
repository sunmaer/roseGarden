package action;

import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import service.RoseService;
import service.RoseServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

public class ChineseSearchAction extends ActionSupport {

	/**
	 * 根据specie首字母字典顺序得到roselist
	 */
	private static final long serialVersionUID = 1L;

	private RoseService roseService = new RoseServiceImpl();
	private String letter;

	public String execute() throws Exception {
		if (null == letter) {
			letter = "a";
		}
		String[] specielist = roseService.getRoseListByFirstLetter(letter);
		String species = "";
		for (int i = 0; i < specielist.length; i++) {
			if (i == 0) {
				species = specielist[0];
			} else {
				species += "," + specielist[i];
			}
		}
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (specielist.length != 0) {
			writer.write(species);
		} else {
			writer.write("fail");
		}
		writer.close();
		return null;

	}

	public String getLetter() {
		return letter;
	}

	public void setLetter(String letter) {
		this.letter = letter;
	}
}

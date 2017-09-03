package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import po.Rose;
import service.RoseService;
import service.RoseServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

/*
 * 查看rose
 */
public class CompareRoseAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String species;

	private RoseService roseService = new RoseServiceImpl();

	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String[] specieStr = species.split(",");
		List<Rose> roses = new ArrayList<Rose>();
		Rose rose = null;
		for (int i = 0; i < specieStr.length; i++) {
			rose = roseService.getRoseBySpecie(specieStr[i]);
			roses.add(rose);
		}
		for (int i = specieStr.length; i < 4; i++) {
			rose = new Rose(0, null, null, null, null, null, null, null, null,
					null, null, null, null, null, null, null, null, null, null,
					null, null, null, null, null, null, null, null, null, null,
					null, null, null, null, null, null, null, null, null, null,
					null, null, null, null, null, null, null, null, null, null,
					null, null, null, null, null, null, null, null, null, null,
					null);
			roses.add(rose);
		}

		request.setAttribute("roses", roses);
		return SUCCESS;
	}

	public String getSpecies() {
		return species;
	}

	public void setSpecies(String species) {
		this.species = species;
	}
}

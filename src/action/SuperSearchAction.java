package action;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import po.Rose;
import service.RoseService;
import service.RoseServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

public class SuperSearchAction extends ActionSupport {

	/**
	 * 根据rose的各种属性查询月季
	 */
	private static final long serialVersionUID = 1L;

	private RoseService roseService = new RoseServiceImpl();
	private String classification;
	private String nowrose;

	private String type;
	private String growthpotential;
	private String height;

	private String sectionlong;
	private String isbranchestraight;
	private String branchangle;
	private String twigscolor;

	private String hasthorn;
	private String thornshape;
	private String thorndensity;
	private String longthornnumber;
	private String shortthornnumber;

	private String lobularnumber;
	private String lobularshape;
	private String leafarea;

	private String leaftexture;
	private String leaveluster;
	private String newleafcolor;
	private String oldleafcolor;
	private String serrat;

	private String flowertime;
	private String floweramount;
	private String inflorescence;
	private String flowercolor;
	private String singlecolor;
	private String multiplycolor;
	private String floral;
	private String singledoublepetal;
	private String flowerpattern;
	private String flowereye;
	private String flowerroll;
	private String petalshape;
	private String petalvelvet;
	private String petalshardness;

	private String firmness;
	private String pollenamount;

	private String fieldperformance;
	private String heatresistance;
	private String coldresistance;
	private String powderymildew;
	private String blackspot;

	public String execute() throws Exception {

		Rose rosecondition = new Rose(0, null, classification, nowrose, null,
				null, type, growthpotential, height, null, sectionlong,
				isbranchestraight, branchangle, twigscolor, hasthorn,
				thornshape, thorndensity, longthornnumber, shortthornnumber,
				lobularnumber, lobularshape, leafarea, null, null, null,
				leaftexture, leaveluster, newleafcolor, oldleafcolor, serrat,
				flowertime, null, null, null, null, floweramount,
				inflorescence, flowercolor, singlecolor, multiplycolor, floral,
				null, singledoublepetal, flowerpattern, flowereye, flowerroll,
				petalshape, petalvelvet, petalshardness, firmness,
				pollenamount, null, fieldperformance, heatresistance,
				coldresistance, powderymildew, blackspot, null, null, null);
		String str = "";

		List<String> specieList = roseService.superSearch(rosecondition);

		String pic = "";
		String specie = "";
		for (int i = 0; i < specieList.size(); i++) {
			specie = specieList.get(i);
			String dir = ServletActionContext.getServletContext().getRealPath(
					"/RosePicture/" + specie);
			File directory = new File(dir);
			File[] files = directory.listFiles();
			if (directory.exists()) {
				pic = "RosePicture/" + specie + "/" + files[0].getName();
			} else {
				pic = "images/empty.jpg";
			}
			if (i == specieList.size() - 1) {
				str += specie + "-" + pic;
			} else {
				str += specie + "-" + pic + ",";
			}
		}
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (specieList.size() != 0) {
			writer.write(str);
		} else {
			writer.write("fail");
		}
		writer.close();
		return null;
	}

	public String getClassification() {
		return classification;
	}

	public void setClassification(String classification) {
		this.classification = classification;
	}

	public String getNowrose() {
		return nowrose;
	}

	public void setNowrose(String nowrose) {
		this.nowrose = nowrose;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getGrowthpotential() {
		return growthpotential;
	}

	public void setGrowthpotential(String growthpotential) {
		this.growthpotential = growthpotential;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getIsbranchestraight() {
		return isbranchestraight;
	}

	public void setIsbranchestraight(String isbranchestraight) {
		this.isbranchestraight = isbranchestraight;
	}

	public String getBranchangle() {
		return branchangle;
	}

	public void setBranchangle(String branchangle) {
		this.branchangle = branchangle;
	}

	public String getTwigscolor() {
		return twigscolor;
	}

	public void setTwigscolor(String twigscolor) {
		this.twigscolor = twigscolor;
	}

	public String getHasthorn() {
		return hasthorn;
	}

	public void setHasthorn(String hasthorn) {
		this.hasthorn = hasthorn;
	}

	public String getThornshape() {
		return thornshape;
	}

	public void setThornshape(String thornshape) {
		this.thornshape = thornshape;
	}

	public String getThorndensity() {
		return thorndensity;
	}

	public void setThorndensity(String thorndensity) {
		this.thorndensity = thorndensity;
	}

	public String getLongthornnumber() {
		return longthornnumber;
	}

	public void setLongthornnumber(String longthornnumber) {
		this.longthornnumber = longthornnumber;
	}

	public String getShortthornnumber() {
		return shortthornnumber;
	}

	public void setShortthornnumber(String shortthornnumber) {
		this.shortthornnumber = shortthornnumber;
	}

	public String getLobularnumber() {
		return lobularnumber;
	}

	public void setLobularnumber(String lobularnumber) {
		this.lobularnumber = lobularnumber;
	}

	public String getLobularshape() {
		return lobularshape;
	}

	public void setLobularshape(String lobularshape) {
		this.lobularshape = lobularshape;
	}

	public String getLeafarea() {
		return leafarea;
	}

	public void setLeafarea(String leafarea) {
		this.leafarea = leafarea;
	}

	public String getLeaftexture() {
		return leaftexture;
	}

	public void setLeaftexture(String leaftexture) {
		this.leaftexture = leaftexture;
	}

	public String getLeaveluster() {
		return leaveluster;
	}

	public void setLeaveluster(String leaveluster) {
		this.leaveluster = leaveluster;
	}

	public String getNewleafcolor() {
		return newleafcolor;
	}

	public void setNewleafcolor(String newleafcolor) {
		this.newleafcolor = newleafcolor;
	}

	public String getOldleafcolor() {
		return oldleafcolor;
	}

	public void setOldleafcolor(String oldleafcolor) {
		this.oldleafcolor = oldleafcolor;
	}

	public String getSerrat() {
		return serrat;
	}

	public void setSerrat(String serrat) {
		this.serrat = serrat;
	}

	public String getFlowertime() {
		return flowertime;
	}

	public void setFlowertime(String flowertime) {
		this.flowertime = flowertime;
	}

	public String getFloweramount() {
		return floweramount;
	}

	public void setFloweramount(String floweramount) {
		this.floweramount = floweramount;
	}

	public String getInflorescence() {
		return inflorescence;
	}

	public void setInflorescence(String inflorescence) {
		this.inflorescence = inflorescence;
	}

	public String getFlowercolor() {
		return flowercolor;
	}

	public void setFlowercolor(String flowercolor) {
		this.flowercolor = flowercolor;
	}

	public String getSinglecolor() {
		return singlecolor;
	}

	public void setSinglecolor(String singlecolor) {
		this.singlecolor = singlecolor;
	}

	public String getMultiplycolor() {
		return multiplycolor;
	}

	public void setMultiplycolor(String multiplycolor) {
		this.multiplycolor = multiplycolor;
	}

	public String getFloral() {
		return floral;
	}

	public void setFloral(String floral) {
		this.floral = floral;
	}

	public String getSingledoublepetal() {
		return singledoublepetal;
	}

	public void setSingledoublepetal(String singledoublepetal) {
		this.singledoublepetal = singledoublepetal;
	}

	public String getFlowerpattern() {
		return flowerpattern;
	}

	public void setFlowerpattern(String flowerpattern) {
		this.flowerpattern = flowerpattern;
	}

	public String getFlowereye() {
		return flowereye;
	}

	public void setFlowereye(String flowereye) {
		this.flowereye = flowereye;
	}

	public String getFlowerroll() {
		return flowerroll;
	}

	public void setFlowerroll(String flowerroll) {
		this.flowerroll = flowerroll;
	}

	public String getPetalshape() {
		return petalshape;
	}

	public void setPetalshape(String petalshape) {
		this.petalshape = petalshape;
	}

	public String getPetalvelvet() {
		return petalvelvet;
	}

	public void setPetalvelvet(String petalvelvet) {
		this.petalvelvet = petalvelvet;
	}

	public String getPetalshardness() {
		return petalshardness;
	}

	public void setPetalshardness(String petalshardness) {
		this.petalshardness = petalshardness;
	}

	public String getFirmness() {
		return firmness;
	}

	public void setFirmness(String firmness) {
		this.firmness = firmness;
	}

	public String getPollenamount() {
		return pollenamount;
	}

	public void setPollenamount(String pollenamount) {
		this.pollenamount = pollenamount;
	}

	public String getFieldperformance() {
		return fieldperformance;
	}

	public void setFieldperformance(String fieldperformance) {
		this.fieldperformance = fieldperformance;
	}

	public String getHeatresistance() {
		return heatresistance;
	}

	public void setHeatresistance(String heatresistance) {
		this.heatresistance = heatresistance;
	}

	public String getColdresistance() {
		return coldresistance;
	}

	public void setColdresistance(String coldresistance) {
		this.coldresistance = coldresistance;
	}

	public String getPowderymildew() {
		return powderymildew;
	}

	public void setPowderymildew(String powderymildew) {
		this.powderymildew = powderymildew;
	}

	public String getBlackspot() {
		return blackspot;
	}

	public void setBlackspot(String blackspot) {
		this.blackspot = blackspot;
	}

	/**
	 * @return the sectionlong
	 */
	public String getSectionlong() {
		return sectionlong;
	}

	/**
	 * @param sectionlong
	 *            the sectionlong to set
	 */
	public void setSectionlong(String sectionlong) {
		this.sectionlong = sectionlong;
	}
}

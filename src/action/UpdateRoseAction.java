package action;

import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import po.Rose;
import service.RoseService;
import service.RoseServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

public class UpdateRoseAction extends ActionSupport {

	/**
	 * admin更改月季信息
	 */
	private static final long serialVersionUID = 1L;

	private String rid;
	private String specie;
	private String classification;
	private String nowrose;
	private String cultivate;
	private String introduction;
	private String type;
	private String growthpotential;
	private String height;
	private String stemroughness;
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
	private String topleafletslong;
	private String topleafletswide;
	private String topleaflets;
	private String leaftexture;
	private String leaveluster;
	private String newleafcolor;
	private String oldleafcolor;
	private String serrat;
	private String flowertime;
	private String flowerstart;
	private String flowerbloom;
	private String flowerend;
	private String singleflowerperiod;
	private String floweramount;
	private String inflorescence;
	private String flowercolor;
	private String singlecolor;
	private String multiplycolor;
	private String floral;
	private String flowerdiameter;
	private String singledoublepetal;
	private String flowerpattern;
	private String flowereye;
	private String flowerroll;
	private String petalshape;
	private String petalvelvet;
	private String petalshardness;
	private String firmness;
	private String pollenamount;
	private String pollenvitality;
	private String fieldperformance;
	private String heatresistance;
	private String coldresistance;
	private String powderymildew;
	private String blackspot;
	private String remark;

	RoseService roseService = new RoseServiceImpl();

	public String execute() throws Exception {
		int Rid = Integer.valueOf(rid);
		Rose rose = new Rose(Rid, specie, classification, nowrose, cultivate,
				introduction, type, growthpotential, height, stemroughness,
				sectionlong, isbranchestraight, branchangle, twigscolor,
				hasthorn, thornshape, thorndensity, longthornnumber,
				shortthornnumber, lobularnumber, lobularshape, leafarea,
				topleafletslong, topleafletswide, topleaflets, leaftexture,
				leaveluster, newleafcolor, oldleafcolor, serrat, flowertime,
				flowerstart, flowerbloom, flowerend, singleflowerperiod,
				floweramount, inflorescence, flowercolor, singlecolor,
				multiplycolor, floral, flowerdiameter, singledoublepetal,
				flowerpattern, flowereye, flowerroll, petalshape, petalvelvet,
				petalshardness, firmness, pollenamount, pollenvitality,
				fieldperformance, heatresistance, coldresistance,
				powderymildew, blackspot, remark, null, null);
		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		if (roseService.updateRose(rose)) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		writer.close();
		return null;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getSpecie() {
		return specie;
	}

	public void setSpecie(String specie) {
		this.specie = specie;
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

	public String getCultivate() {
		return cultivate;
	}

	public void setCultivate(String cultivate) {
		this.cultivate = cultivate;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
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

	public String getStemroughness() {
		return stemroughness;
	}

	public void setStemroughness(String stemroughness) {
		this.stemroughness = stemroughness;
	}

	public String getSectionlong() {
		return sectionlong;
	}

	public void setSectionlong(String sectionlong) {
		this.sectionlong = sectionlong;
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

	public String getTopleafletslong() {
		return topleafletslong;
	}

	public void setTopleafletslong(String topleafletslong) {
		this.topleafletslong = topleafletslong;
	}

	public String getTopleafletswide() {
		return topleafletswide;
	}

	public void setTopleafletswide(String topleafletswide) {
		this.topleafletswide = topleafletswide;
	}

	public String getTopleaflets() {
		return topleaflets;
	}

	public void setTopleaflets(String topleaflets) {
		this.topleaflets = topleaflets;
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

	public String getFlowerstart() {
		return flowerstart;
	}

	public void setFlowerstart(String flowerstart) {
		this.flowerstart = flowerstart;
	}

	public String getFlowerbloom() {
		return flowerbloom;
	}

	public void setFlowerbloom(String flowerbloom) {
		this.flowerbloom = flowerbloom;
	}

	public String getFlowerend() {
		return flowerend;
	}

	public void setFlowerend(String flowerend) {
		this.flowerend = flowerend;
	}

	public String getSingleflowerperiod() {
		return singleflowerperiod;
	}

	public void setSingleflowerperiod(String singleflowerperiod) {
		this.singleflowerperiod = singleflowerperiod;
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

	public String getFlowerdiameter() {
		return flowerdiameter;
	}

	public void setFlowerdiameter(String flowerdiameter) {
		this.flowerdiameter = flowerdiameter;
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

	public String getPollenvitality() {
		return pollenvitality;
	}

	public void setPollenvitality(String pollenvitality) {
		this.pollenvitality = pollenvitality;
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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public RoseService getRoseService() {
		return roseService;
	}

	public void setRoseService(RoseService roseService) {
		this.roseService = roseService;
	}

	public String getFieldperformance() {
		return fieldperformance;
	}

	public void setFieldperformance(String fieldperformance) {
		this.fieldperformance = fieldperformance;
	}

}

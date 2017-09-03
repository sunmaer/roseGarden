package service;

import java.io.File;
import java.io.OutputStream;
import java.util.List;

import po.Rose;
import util.Page;
import util.PageResult;
import util.PageUtil;
import dao.RoseDAO;
import dao.RoseDAOImpl;

public class RoseServiceImpl implements RoseService {
	private RoseDAO roseDAO = new RoseDAOImpl();

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.RoseService#queryRoseByPage(util.Page)
	 */
	public PageResult getRoseByPage(Page page, String type) {
		RoseDAO roseDAOImpl = new RoseDAOImpl();
		page = PageUtil.createPage(page.getEveryPage(),
				roseDAO.totalCount(type), page.getCurrentPage());
		List<Rose> list = roseDAOImpl.findRoseByPage(page, type);
		PageResult result = new PageResult(page, list);
		return result;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.RoseService#updateRose(po.Rose)
	 */
	public boolean updateRose(Rose rose) {
		return roseDAO.updateRose(rose);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.RoseService#addRose(po.Rose)
	 */
	public boolean addRose(Rose rose) {
		return roseDAO.addRose(rose);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.RoseService#getRoseById()
	 */
	public Rose getRoseById(int rid) {
		return roseDAO.getRoseById(rid);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.RoseService#importRose(java.lang.String)
	 */
	public boolean importRose(File file) {
		return roseDAO.importRose(file);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.RoseService#exportRose()
	 */
	public boolean exportRose(OutputStream os) {
		return roseDAO.exportRose(os);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.RoseService#totalCount()
	 */
	public int totalCount(String type) {
		return roseDAO.totalCount(type);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.RoseService#deleteRose(java.lang.String)
	 */
	public boolean deleteRose(int rid) {
		return roseDAO.deleteRose(rid);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.RoseService#multiDeleteRose(java.lang.String[])
	 */
	public boolean multiDeleteRose(String[] rids) {
		return roseDAO.deleteRose(rids);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.RoseService#getSearchRose(util.Page, java.lang.String)
	 */
	public PageResult getSearchRose(Page page, String specie) {
		RoseDAO roseDAO = new RoseDAOImpl();
		page = PageUtil.createPage(page.getEveryPage(),
				roseDAO.searchRoseTotal(specie), page.getCurrentPage());
		List<Rose> list = roseDAO.searchRose(page, specie);
		PageResult result = new PageResult(page, list);
		return result;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.RoseService#getRoseListByFirstLetter(java.lang.String)
	 */
	public String[] getRoseListByFirstLetter(String letter) {
		return roseDAO.getRoseListByFirstLetter(letter);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.RoseService#superSearch(po.Rose)
	 */
	public List<String> superSearch(Rose conditionRose) {

		return roseDAO.superSearch(conditionRose);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.RoseService#getRoseBySpecie(java.lang.String)
	 */
	public Rose getRoseBySpecie(String specie) {
		return roseDAO.getRoseBySpecie(specie);
	}

	@Override
	public List<String> getRoseListByEveryFirstLetter(String letter) {
		return roseDAO.getRoseListByEveryFirstLetter(letter);
	}

	@Override
	public List<Rose> searchRoseBySpecie(String specie) {
		return roseDAO.searchRoseBySpecie(specie);
	}

}

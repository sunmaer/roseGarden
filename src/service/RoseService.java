package service;

import java.io.File;
import java.io.OutputStream;
import java.util.List;

import po.Rose;
import util.Page;
import util.PageResult;

public interface RoseService {
	public boolean addRose(Rose rose);

	public PageResult getRoseByPage(Page page, String type);

	public Rose getRoseById(int rid);

	public boolean updateRose(Rose rose);

	public boolean deleteRose(int rid);

	public boolean importRose(File file);// 导入月季mysql

	public boolean exportRose(OutputStream os);// 导出月季excel

	public int totalCount(String type);// 所有月季数目

	public boolean multiDeleteRose(String[] rids);

	public PageResult getSearchRose(Page page, String specie);

	public String[] getRoseListByFirstLetter(String letter);

	public List<String> getRoseListByEveryFirstLetter(String letter);

	public Rose getRoseBySpecie(String specie);

	public List<Rose> searchRoseBySpecie(String specie);

	public List<String> superSearch(Rose rosecondition);

}

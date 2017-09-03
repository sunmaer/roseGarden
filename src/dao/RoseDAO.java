package dao;

import java.io.File;
import java.io.OutputStream;
import java.util.List;

import po.Rose;
import util.Page;

public interface RoseDAO {

	public boolean addRose(Rose rose);// 增加月季

	public boolean deleteRose(int rid);// 根据rid删除月季

	public boolean updateRose(Rose rose);// 更新月季

	public List<Rose> findRoseByPage(Page page, String type);// 查看所有月季

	public boolean importRose(File file);// excel导入月季

	public boolean exportRose(OutputStream os);// 导出月季excel

	public int totalCount(String type);// 所有月季数目

	public Rose getRoseById(int rid);

	public boolean deleteRose(String[] rids);

	public List<Rose> searchRose(Page page, String specie);

	public int searchRoseTotal(String specie);

	public String[] getRoseListByFirstLetter(String letter);

	public List<String> superSearch(Rose conditionRose);

	public Rose getRoseBySpecie(String specie);

	public List<String> getRoseListByEveryFirstLetter(String letter);

	public List<Rose> searchRoseBySpecie(String specie);

}

package dao;

import java.io.File;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import po.Rose;
import util.Page;

public class RoseDAOImpl implements RoseDAO {

	/*
	 * addRose
	 * 
	 * @see dao.AdminDAO#addRose(po.Rose)
	 */
	public boolean addRose(Rose rose) {
		Session session = HibernateSessionFactory.getSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			rose.setFirstletter(getFirstLetter(rose.getSpecie()));
			rose.setEveryfirstletter(getEveryFirstLetter(rose.getSpecie()));
			session.save(rose);
			transaction.commit();
		} catch (Exception ex) {
			ex.printStackTrace();
			transaction.rollback();
			return false;
		}
		HibernateSessionFactory.closeSession();
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.RoseDAO#updateRose(po.Rose)
	 */
	public boolean updateRose(Rose rose) {
		Session session = HibernateSessionFactory.getSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			
			rose.setFirstletter(getFirstLetter(rose.getSpecie()));
			rose.setEveryfirstletter(getEveryFirstLetter(rose.getSpecie()));
			session.update(rose);
			transaction.commit();
		} catch (Exception ex) {
			ex.printStackTrace();
			transaction.rollback();
			return false;
		}
		HibernateSessionFactory.closeSession();
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.RoseDAO#findRoseById(java.lang.String)
	 */
	public Rose getRoseById(int rid) {
		Session session = HibernateSessionFactory.getSession();
		Rose rose = (Rose) session.get(Rose.class, rid);
		HibernateSessionFactory.closeSession();
		return rose;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.RoseDAO#deleteRose(java.lang.String)
	 */
	public boolean deleteRose(int rid) {
		Session session = HibernateSessionFactory.getSession();
		
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Rose rose = (Rose)session.get(Rose.class, rid);
			session.delete(rose);
			transaction.commit();
		} catch (Exception ex) {
			ex.printStackTrace();
			transaction.rollback();
			return false;
		}
		HibernateSessionFactory.closeSession();
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.RoseDAO#findRoseList()
	 */
	public List<Rose> findRoseByPage(Page page, String type) {
		Session session = HibernateSessionFactory.getSession();
		String str = null;
		if (type == "" || type == null) {
			str = "from Rose";
		} else {
			str = "from Rose where classification = '" + type + "'";
		}
		Query query = session.createQuery(str);
		query.setMaxResults(page.getEveryPage());
		query.setFirstResult(page.getBeginIndex());
		@SuppressWarnings("unchecked")
		List<Rose> list = query.list();
		HibernateSessionFactory.closeSession();
		return list;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.RoseDAO#totalcount()
	 */
	public int totalCount(String type) {
		Session session = HibernateSessionFactory.getSession();
		String str = null;
		if (type == "" || type == null) {
			str = "select count(1) from Rose";
		} else {
			str = "select count(1) from Rose where classification = '" + type
					+ "'";
		}
		Query query = session.createQuery(str);
		int count = ((Long) query.uniqueResult()).intValue();
		HibernateSessionFactory.closeSession();
		return count;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.RoseDAO#deleteRose(jdava.lang.String[])
	 */
	public boolean deleteRose(String[] rids) {
		Session session = HibernateSessionFactory.getSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			for (int j = 0; j < rids.length; j++) {
				int rid = Integer.valueOf(rids[j]);
				Rose rose = (Rose) session.get(Rose.class, rid);
				session.delete(rose);
			}
			transaction.commit();
		} catch (Exception ex) {
			ex.printStackTrace();
			transaction.rollback();
			return false;
		}
		HibernateSessionFactory.closeSession();
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.RoseDAO#importRose(java.lang.String)
	 */
	public boolean importRose(File file) {
		Session session = HibernateSessionFactory.getSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			List<Rose> roseList = read(file);
			Rose rose = null;
			for (int i = 0; i < roseList.size(); i++) {
				rose = roseList.get(i);
				rose.setFirstletter(getFirstLetter(rose.getSpecie()));
				rose.setEveryfirstletter(getEveryFirstLetter(rose.getSpecie()));
				session.save(rose);
			}
			transaction.commit();
		} catch (Exception ex) {
			ex.printStackTrace();
			transaction.rollback();
			return false;
		}
		HibernateSessionFactory.closeSession();
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.RoseDAO#exportRose(java.lang.String)
	 */
	public boolean exportRose(OutputStream os) {
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery("from Rose");
		@SuppressWarnings("unchecked")
		List<Rose> listData = query.list();
		HibernateSessionFactory.closeSession();
		try {
			write(os, listData);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.RoseDAO#searchRose(util.Page, java.lang.String)
	 */
	public List<Rose> searchRose(Page page, String specie) {
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery("from Rose where specie like '%"
				+ specie + "%'");
		query.setMaxResults(page.getEveryPage());
		query.setFirstResult(page.getBeginIndex());
		@SuppressWarnings("unchecked")
		List<Rose> list = query.list();
		HibernateSessionFactory.closeSession();
		return list;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.RoseDAO#searchRoseTotal(java.lang.String)
	 */
	public int searchRoseTotal(String specie) {
		Session session = HibernateSessionFactory.getSession();// 获得Session对象
		Query query = session
				.createQuery("select count (1) from Rose where specie like '%"
						+ specie + "%'");
		int count = ((Long) query.uniqueResult()).intValue();
		HibernateSessionFactory.closeSession();// 关闭Session对象
		return count;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.RoseDAO#getRoseListByFirstLetter(java.lang.String)
	 */
	public String[] getRoseListByFirstLetter(String letter) {
		Session session = HibernateSessionFactory.getSession();
		Query query = session
				.createQuery("select specie from Rose where firstletter = '"
						+ letter + "'order by firstletter");
		@SuppressWarnings("unchecked")
		List<String> list = query.list();
		String[] listString = new String[list.size()];
		list.toArray(listString);
		HibernateSessionFactory.closeSession();
		return listString;
	}

	/*
	 * 得到第一个汉字的首字母
	 */
	public static String getFirstLetter(String chines) {
		String pinyinName = "";
		char[] nameChar = chines.toCharArray();// 转换成字符数组
		HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();// 定义pinyin格式
		defaultFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);// 小写字母
		defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);// 不要声调
		// 取得字符串第一个汉字的首字母的第一个，就是取多音字的第一个
		if (nameChar[0] > 128) {
			try {
				pinyinName += PinyinHelper.toHanyuPinyinStringArray(
						nameChar[0], defaultFormat)[0].charAt(0);
			} catch (BadHanyuPinyinOutputFormatCombination e) {
				e.printStackTrace();
			}
		}else {
			pinyinName += nameChar[0];
		}

		return pinyinName;
	}

	/*
	 * 得到所有汉字的首字母
	 */
	public static String getEveryFirstLetter(String chines) {
		String pinyinName = "";
		char[] nameChar = chines.toCharArray();
		HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
		defaultFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);
		defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
		for (int i = 0; i < nameChar.length; i++) {
			if (nameChar[i] > 128) {
				try {
					pinyinName += PinyinHelper.toHanyuPinyinStringArray(
							nameChar[i], defaultFormat)[0].charAt(0);//取第一个读音的首字母
				} catch (BadHanyuPinyinOutputFormatCombination e) {
					e.printStackTrace();
				}
			} else {
				pinyinName += nameChar[i];
			}
		}
		return pinyinName;

	}

	/*
    * 
    */
	public static List<Rose> read(File file) throws Exception {
		List<Rose> roseList = new ArrayList<Rose>();
		Workbook wb = null;
		// 获取工作簿对象
		if (file != null) {
			wb = Workbook.getWorkbook(file);

		}

		if (wb != null) {
			// 获取工作簿对象就可以获取工作簿内的工作表对象
			Sheet[] sheets = wb.getSheets();
			// 遍历工作簿内第1张工作表
			Sheet sheet0 = sheets[0];
			// 获取该工作表内的行数
			int rows = sheets[0].getRows();
			// 遍历行
			Cell[] cells = new Cell[57];
			for (int j = 1; j < rows; j++) {
				// 获取当前行的所有单元格
				Rose rose = null;
				String[] strs = new String[57];
				cells = sheet0.getRow(j);
				for (int i = 0; i <cells.length; i++) {
					strs[i] = cells[i].getContents();
				}
				rose = new Rose(0, strs[0], strs[1], strs[2], strs[3], strs[4],
						strs[5], strs[6], strs[7], strs[8], strs[9], strs[10],strs[11],
						strs[12], strs[13], strs[14], strs[15], strs[16],
						strs[17], strs[18], strs[19], strs[20], strs[21],
						strs[22], strs[23], strs[24], strs[25], strs[26],
						strs[27], strs[28], strs[29], strs[30], strs[31],
						strs[32], strs[33], strs[34], strs[35], strs[36],
						strs[37], strs[38], strs[39], strs[40], strs[41],
						strs[42], strs[43], strs[44], strs[45], strs[46],
						strs[47], strs[48], strs[49], strs[50], strs[51],
						strs[52], strs[53], strs[54], strs[55], strs[56], null, null);
				roseList.add(rose);
			}
			wb.close();
		}
		return roseList;
	}

	/**
	 * 写
	 * 
	 * @param String
	 *            fileName 被写入的Excel文件的路径
	 * @param List
	 *            <Object[]> listData 数据库中读取的数据
	 * @throws Exception
	 */
	public static void write(OutputStream os, List<Rose> roseList)
			throws Exception {
		WritableWorkbook wwb = null;
		Label label = null;
		Rose rose = null;
		// 创建可写入的工作簿对象
		wwb = Workbook.createWorkbook(os);
		/** ************设置单元格字体************** */
		WritableFont NormalFont = new WritableFont(WritableFont.TIMES, 15);
		WritableFont BoldFont = new WritableFont(WritableFont.TIMES, 15,
				WritableFont.BOLD);
		/** ************以下设置三种单元格样式，灵活备用************ */
		// 用于标题居中
		WritableCellFormat wcf_center = new WritableCellFormat(BoldFont);
		wcf_center.setBorder(Border.ALL, BorderLineStyle.THIN); // 线条
		wcf_center.setVerticalAlignment(VerticalAlignment.CENTRE); // 文字垂直对齐
		wcf_center.setAlignment(Alignment.CENTRE); // 文字水平对齐
		wcf_center.setWrap(false); // 文字是否换行

		// 用于正文居左
		WritableCellFormat wcf_left = new WritableCellFormat(NormalFont);
		wcf_left.setBorder(Border.NONE, BorderLineStyle.THIN); // 线条
		wcf_left.setVerticalAlignment(VerticalAlignment.CENTRE); // 文字垂直对齐
		wcf_left.setAlignment(Alignment.LEFT); // 文字水平对齐
		wcf_left.setWrap(false); // 文字是否换行

		String[] Title = {"品种名", "分类", "现代月季", "培育地", "引种地", "株型",
				"生长势", "株高", "茎干粗度", "节间长", "枝条曲直", "分枝角度", "嫩枝颜色", "有无刺",
				"刺形状", "刺密度", "长刺数量", "短刺数量", "小叶数量", "小叶形态", "顶端小叶大小",
				"顶端小叶长", "顶端小叶宽", "顶端小叶长宽比", "叶片质地", "叶片光泽", "新叶叶色", "老叶叶色",
				"叶缘锯齿形状", "开花时间", "始花期（以武汉本地月份为准）", "盛花期", "末花期", "单朵花花期",
				"花量", "花序", "花色", "单色", "复色", "花香", "花径", "单重瓣", "花型", "花眼",
				"花瓣翻卷", "花瓣形状", "花瓣质地", "花瓣软硬程度", "结实性", "花粉量", "花粉活力",
				"田间综合表现", "耐热性", "耐寒性", "白粉病抗性", "黑斑病抗性", "备注" };
		if (wwb != null) {
			// 在工作簿里创建可写入的工作表，第一个参数为工作表名，第二个参数为该工作表的所在位置
			WritableSheet ws = wwb.createSheet("月季", 1);
			if (ws != null) {
				/* 添加表结构 */
				// 行
				for (int i = 0; i < roseList.size(); i++) {
					rose = roseList.get(i);
					// 第一行
					if (i == 0) {
						for (int m = 0; m < 57; m++) {
							label = new Label(m, 0, Title[m]);
							ws.addCell(label);
						}
					} else {
						// Label构造器中有三个参数，第一个为列，第二个为行，第三个则为单元格填充的内容
						for (int j = 0; j < 57; j++) {
							switch (j) {
							case 0:
								label = new Label(j, i, rose.getSpecie());
								break;
							case 1:
								label = new Label(j, i,
										rose.getClassification());
								break;
							case 2:
								label = new Label(j, i, rose.getNowrose());
								break;
							case 3:
								label = new Label(j, i, rose.getCultivate());
								break;
							case 4:
								label = new Label(j, i, rose.getIntroduction());
								break;
							case 5:
								label = new Label(j, i, rose.getType());
								break;
							case 6:
								label = new Label(j, i,
										rose.getGrowthpotential());
								break;
							case 7:
								label = new Label(j, i, rose.getHeight());
								break;
							case 8:
								label = new Label(j, i, rose.getStemroughness());
								break;
							case 9:
								label = new Label(j, i, rose.getSectionlong());
								break;
							case 10:
								label = new Label(j, i,
										rose.getIsbranchestraight());
								break;
							case 11:
								label = new Label(j, i, rose.getBranchangle());
								break;
							case 12:
								label = new Label(j, i, rose.getTwigscolor());
								break;
							case 13:
								label = new Label(j, i, rose.getHasthorn());
								break;
							case 14:
								label = new Label(j, i, rose.getThornshape());
								break;
							case 15:
								label = new Label(j, i, rose.getThorndensity());
								break;
							case 16:
								label = new Label(j, i,
										rose.getLongthornnumber());
								break;
							case 17:
								label = new Label(j, i,
										rose.getShortthornnumber());
								break;
							case 18:
								label = new Label(j, i, rose.getLobularnumber());
								break;
							case 19:
								label = new Label(j, i, rose.getLobularshape());
								break;
							case 20:
								label = new Label(j, i, rose.getLeafarea());
								break;
							case 21:
								label = new Label(j, i,
										rose.getTopleafletslong());
								break;
							case 22:
								label = new Label(j, i,
										rose.getTopleafletswide());
								break;
							case 23:
								label = new Label(j, i, rose.getTopleaflets());
								break;
							case 24:
								label = new Label(j, i, rose.getLeaftexture());
								break;
							case 25:
								label = new Label(j, i, rose.getLeaveluster());
								break;
							case 26:
								label = new Label(j, i, rose.getNewleafcolor());
								break;
							case 27:
								label = new Label(j, i, rose.getOldleafcolor());
								break;
							case 28:
								label = new Label(j, i, rose.getSerrat());
								break;
							case 29:
								label = new Label(j, i, rose.getFlowertime());
								break;
							case 30:
								label = new Label(j, i, rose.getFlowerstart());
								break;
							case 31:
								label = new Label(j, i, rose.getFlowerbloom());
								break;
							case 32:
								label = new Label(j, i, rose.getFlowerend());
								break;
							case 33:
								label = new Label(j, i,
										rose.getSingleflowerperiod());
								break;
							case 34:
								label = new Label(j, i, rose.getFloweramount());
								break;
							case 35:
								label = new Label(j, i, rose.getInflorescence());
								break;
							case 36:
								label = new Label(j, i, rose.getFlowercolor());
								break;
							case 37:
								label = new Label(j, i, rose.getSinglecolor());
								break;
							case 38:
								label = new Label(j, i, rose.getMultiplycolor());
								break;
							case 39:
								label = new Label(j, i, rose.getFloral());
								break;
							case 40:
								label = new Label(j, i,
										rose.getFlowerdiameter());
								break;
							case 41:
								label = new Label(j, i,
										rose.getSingledoublepetal());
								break;
							case 42:
								label = new Label(j, i, rose.getFlowerpattern());
								break;
							case 43:
								label = new Label(j, i, rose.getFlowereye());
								break;
							case 44:
								label = new Label(j, i, rose.getFlowerroll());
								break;
							case 45:
								label = new Label(j, i, rose.getPetalshape());
								break;
							case 46:
								label = new Label(j, i, rose.getPetalvelvet());
								break;
							case 47:
								label = new Label(j, i,
										rose.getPetalshardness());
								break;
							case 48:
								label = new Label(j, i, rose.getFirmness());
								break;
							case 49:
								label = new Label(j, i, rose.getPollenamount());
								break;
							case 50:
								label = new Label(j, i,
										rose.getPollenvitality());
								break;
							case 51:
								label = new Label(j, i,
										rose.getFieldperformance());
								break;
							case 52:
								label = new Label(j, i,
										rose.getHeatresistance());
								break;
							case 53:
								label = new Label(j, i,
										rose.getColdresistance());
								break;
							case 54:
								label = new Label(j, i, rose.getPowderymildew());
								break;
							case 55:
								label = new Label(j, i, rose.getBlackspot());
								break;
							case 56:
								label = new Label(j, i, rose.getRemark());
								break;

							default:
								break;
							}
							// 将被写入数据的单元格添加到工作表
							ws.addCell(label);
						}
					}
				}
				// 从内存中写入到文件
				wwb.write();
			}
		}
		wwb.close();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.RoseDAO#superSearch(po.Rose)
	 */
	public List<String> superSearch(Rose conditionRose) {

		Session session = HibernateSessionFactory.getSession();
		String sql = "select specie from Rose where ";

		if (!(conditionRose.getClassification().equals(""))) {
			sql += "and classification = '" + conditionRose.getClassification()
					+ "'";
		}

		if (!conditionRose.getNowrose().equals("")) {
			sql += " and nowrose = '" + conditionRose.getNowrose() + "'";
		}

		if (!(conditionRose.getType().equals(""))) {
			sql += " and  type = '" + conditionRose.getType() + "'";
		}

		if (!(conditionRose.getGrowthpotential().equals(""))) {
			sql += " and  growthpotential = '"
					+ conditionRose.getGrowthpotential() + "'";
		}
		if (!(conditionRose.getHeight().equals(""))) {
			sql += " and  height = '" + conditionRose.getHeight() + "'";
		}

		if (!(conditionRose.getSectionlong().equals(""))) {
			sql += " and  sectionlong = '" + conditionRose.getSectionlong()
					+ "'";
		}
		if (!(conditionRose.getIsbranchestraight().equals(""))) {
			sql += " and isbranchestraight = '"
					+ conditionRose.getIsbranchestraight() + "'";
		}

		if (!(conditionRose.getBranchangle().equals(""))) {
			sql += " and branchangle = '" + conditionRose.getBranchangle()
					+ "'";
		}

		if (!(conditionRose.getTwigscolor().equals(""))) {
			sql += " and twigscolor = '" + conditionRose.getTwigscolor() + "'";
		}

		if (!(conditionRose.getHasthorn().equals(""))) {
			sql += " and hasthorn = '" + conditionRose.getHasthorn() + "'";
		}

		if (!(conditionRose.getThornshape().equals(""))) {
			sql += " and thornshape = '" + conditionRose.getThornshape() + "'";
		}

		if (!(conditionRose.getThorndensity().equals(""))) {
			sql += " and thorndensity = '" + conditionRose.getThorndensity()
					+ "'";
		}

		if (!(conditionRose.getLongthornnumber().equals(""))) {
			sql += " and longthornnumber = '"
					+ conditionRose.getLongthornnumber() + "'";
		}

		if (!(conditionRose.getShortthornnumber().equals(""))) {
			sql += " and shortthornnumber = '"
					+ conditionRose.getShortthornnumber() + "'";
		}

		if (!(conditionRose.getLobularnumber().equals(""))) {
			sql += " and lobularnumber = '" + conditionRose.getLobularnumber()
					+ "'";
		}

		if (!(conditionRose.getLobularshape().equals(""))) {
			sql += " and lobularshape = '" + conditionRose.getLobularshape()
					+ "'";
		}

		if (!(conditionRose.getLeafarea().equals(""))) {
			sql += " and leafarea = '" + conditionRose.getLeafarea() + "'";
		}

		if (!(conditionRose.getLeaftexture().equals(""))) {
			sql += " and leaftexture = '" + conditionRose.getLeaftexture()
					+ "'";
		}

		if (!(conditionRose.getLeaveluster().equals(""))) {
			sql += " and leaveluster = '" + conditionRose.getLeaveluster()
					+ "'";
		}

		if (!(conditionRose.getNewleafcolor().equals(""))) {
			sql += " and newleafcolor = '" + conditionRose.getNewleafcolor()
					+ "'";
		}

		if (!(conditionRose.getOldleafcolor().equals(""))) {
			sql += " and oldleafcolor = '" + conditionRose.getOldleafcolor()
					+ "'";
		}
		if (!(conditionRose.getSerrat().equals(""))) {
			sql += " and serrat = '" + conditionRose.getSerrat() + "'";
		}
		if (!(conditionRose.getFlowertime().equals(""))) {
			sql += " and flowertime = '" + conditionRose.getFlowertime() + "'";
		}
		if (!(conditionRose.getFloweramount().equals(""))) {
			sql += " and floweramount = '" + conditionRose.getFloweramount()
					+ "'";
		}
		if (!(conditionRose.getInflorescence().equals(""))) {
			sql += " and inflorescence = '" + conditionRose.getInflorescence()
					+ "'";
		}
		if (!(conditionRose.getFlowercolor().equals(""))) {
			sql += " and flowercolor = '" + conditionRose.getFlowercolor()
					+ "'";
		}
		if (!(conditionRose.getSinglecolor().equals(""))) {
			sql += " and singlecolor = '" + conditionRose.getSinglecolor()
					+ "'";
		}
		if (!(conditionRose.getMultiplycolor().equals(""))) {
			sql += " and multiplycolor = '" + conditionRose.getMultiplycolor()
					+ "'";
		}
		if (!(conditionRose.getFloral().equals(""))) {
			sql += " and floral = '" + conditionRose.getFloral() + "'";
		}

		if (!(conditionRose.getSingledoublepetal().equals(""))) {
			sql += " and singledoublepetal = '"
					+ conditionRose.getSingledoublepetal() + "'";
		}

		if (!(conditionRose.getFlowerpattern().equals(""))) {
			sql += " and  flowerpattern = '" + conditionRose.getFlowerpattern()
					+ "'";
		}

		if (!(conditionRose.getFlowereye().equals(""))) {
			sql += " and flowereye = '" + conditionRose.getFlowereye() + "'";
		}

		if (!(conditionRose.getFlowerroll().equals(""))) {
			sql += " and flowerroll = '" + conditionRose.getFlowerroll() + "'";
		}
		if (!(conditionRose.getPetalshape().equals(""))) {
			sql += " and petalshape = '" + conditionRose.getPetalshape() + "'";
		}
		if (!(conditionRose.getPetalvelvet().equals(""))) {
			sql += " and petalvelvet = '" + conditionRose.getPetalvelvet()
					+ "'";
		}
		if (!(conditionRose.getPetalshardness().equals(""))) {
			sql += " and petalshardness = '"
					+ conditionRose.getPetalshardness() + "'";
		}

		if (!(conditionRose.getFirmness().equals(""))) {
			sql += " and firmness = '" + conditionRose.getFirmness() + "'";
		}
		if (!(conditionRose.getPollenamount().equals(""))) {
			sql += " and  pollenamount = '" + conditionRose.getPollenamount()
					+ "'";
		}

		if (!(conditionRose.getFieldperformance().equals(""))) {
			sql += " and fieldperformance = '"
					+ conditionRose.getFieldperformance() + "'";
		}

		if (!(conditionRose.getHeatresistance().equals(""))) {
			sql += " and heatresistance = '"
					+ conditionRose.getHeatresistance() + "'";
		}

		if (!(conditionRose.getColdresistance().equals(""))) {
			sql += " and coldresistance = '"
					+ conditionRose.getColdresistance() + "'";
		}

		if (!(conditionRose.getPowderymildew().equals(""))) {
			sql += " and powderymildew = '" + conditionRose.getPowderymildew()
					+ "'";
		}

		if (!(conditionRose.getBlackspot().equals(""))) {
			sql += " and blackspot = '" + conditionRose.getBlackspot() + "'";
		}
		String sqll = null;
		if (sql.equals("select specie from Rose where ")) {
			sqll = "select specie from Rose";
		} else {
			int beginIndex = sql.indexOf("and");// 返回第一次出现的指定子字符串在此字符串中的索引。
			sqll = "select specie from Rose where "
					+ sql.substring(beginIndex + 3);
		}
		Query query = session.createQuery(sqll);
		@SuppressWarnings("unchecked")
		List<String> list = query.list();
		HibernateSessionFactory.closeSession();
		return list;

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.RoseDAO#getRoseBySpecie(java.lang.String)
	 */
	public Rose getRoseBySpecie(String specie) {
		Session session = HibernateSessionFactory.getSession();
		Rose rose = null;
		Query query = session.createQuery("from Rose where specie = '" + specie
				+ "'");

		@SuppressWarnings("unchecked")
		List<Rose> list = query.list();
		if (list.size() == 1) {
			rose = list.get(0);
		}
		HibernateSessionFactory.closeSession();
		return rose;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.RoseDAO#getRoseListByEveryFirstLetter(java.lang.String)
	 */
	public List<String> getRoseListByEveryFirstLetter(String letter) {
		Session session = HibernateSessionFactory.getSession();
		Query query = session
				.createQuery("select specie from Rose where everyfirstletter = '"
						+ letter + "'order by everyfirstletter");
		@SuppressWarnings("unchecked")
		List<String> list = query.list();
		HibernateSessionFactory.closeSession();
		return list;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.RoseDAO#searchRoseBySpecie(java.lang.String)
	 */
	public List<Rose> searchRoseBySpecie(String specie) {
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery("from Rose where specie like '%"
				+ specie + "%'");
		@SuppressWarnings("unchecked")
		List<Rose> list = query.list();
		HibernateSessionFactory.closeSession();
		return list;
	}
}

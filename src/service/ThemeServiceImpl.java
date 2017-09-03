package service;

import java.util.List;

import dao.ThemeDAO;
import dao.ThemeDAOImpl;
import dao.UserDAO;
import dao.UserDAOImpl;
import po.Theme;
import util.Page;
import util.PageResult;
import util.PageUtil;

public class ThemeServiceImpl implements ThemeService {
	private ThemeDAO themeDAO = new ThemeDAOImpl();

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.ThemeService#addTheme(po.Theme)
	 */
	public boolean addTheme(Theme theme) {
		UserDAO userDAO = new UserDAOImpl();
		theme.setName(userDAO.getUserById(theme.getUid()).getName());
		return themeDAO.addTheme(theme);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.ThemeService#getThemeByPage(util.Page)
	 */
	public PageResult getThemeByPage(Page page) {
		page = PageUtil.createPage(page.getEveryPage(), themeDAO.totalCount(),
				page.getCurrentPage());
		List<Theme> list = themeDAO.getThemeByPage(page);
		PageResult result = new PageResult(page, list);
		return result;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.ThemeService#deleteTheme(java.lang.String)
	 */
	public boolean deleteTheme(int tid) {
		return themeDAO.deleteTheme(tid);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.ThemeService#multiDeleteTheme(java.lang.String[])
	 */
	public boolean multiDeleteTheme(String[] tids) {
		return themeDAO.deleteTheme(tids);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.ThemeService#getThemeById(int)
	 */
	public Theme getThemeById(int tid) {
		return themeDAO.getThemeById(tid);
	}

}

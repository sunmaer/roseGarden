package service;

import java.util.List;

import dao.DiscussDAO;
import dao.DiscussDAOImpl;
import dao.ThemeDAO;
import dao.ThemeDAOImpl;
import dao.UserDAO;
import dao.UserDAOImpl;
import po.Discuss;
import util.Page;
import util.PageResult;
import util.PageUtil;

public class DiscussServiceImpl implements DiscussService {

	private DiscussDAO discussDAO = new DiscussDAOImpl();

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.DiscussService#addDiscuss(po.Discuss)
	 */
	public boolean addDiscuss(Discuss discuss) {
		UserDAO userDAO = new UserDAOImpl();
		ThemeDAO themeDAO = new ThemeDAOImpl();
		discuss.setName(userDAO.getUserById(discuss.getUid()).getName());
		discuss.setTheme(themeDAO.getThemeById(discuss.getTid()).getTheme());
		return discussDAO.addDiscuss(discuss);

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.DiscussService#deleteDiscuss(int)
	 */
	public boolean deleteDiscuss(int did) {
		return discussDAO.deleteDiscuss(did);

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.DiscussService#getDiscussByPage(util.Page)
	 */
	public PageResult getDiscussByPage(Page page, int tid) {
		page = PageUtil.createPage(page.getEveryPage(),
				discussDAO.totalCount(tid), page.getCurrentPage());
		List<Discuss> list = discussDAO.getDiscussByPage(page, tid);
		PageResult result = new PageResult(page, list);
		return result;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.DiscussService#multiDeleteAdmin(java.lang.String[])
	 */
	public boolean multiDeleteAdmin(String[] dids) {
		return discussDAO.deleteDiscuss(dids);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.DiscussService#getDiscussById(int)
	 */
	public Discuss getDiscussById(int did) {
		return discussDAO.getDiscussById(did);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.DiscussService#totalCount(int)
	 */
	public int totalCount(int tid) {
		return discussDAO.totalCount(tid);
	}

}

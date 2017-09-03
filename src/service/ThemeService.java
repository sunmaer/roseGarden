package service;

import po.Theme;
import util.Page;
import util.PageResult;

public interface ThemeService {

	// user
	public boolean addTheme(Theme Theme);

	// user and admin
	public boolean deleteTheme(int tid);

	// admin
	public PageResult getThemeByPage(Page page);

	public boolean multiDeleteTheme(String[] tids);

	public Theme getThemeById(int tid);
}

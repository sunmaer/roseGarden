package dao;

import java.util.List;

import po.Theme;
import util.Page;

public interface ThemeDAO {

	public boolean addTheme(Theme Theme);

	public List<Theme> getThemeByPage(Page page);

	public boolean deleteTheme(int tid);

	public int totalCount();

	public Theme getThemeById(int i);

	public boolean deleteTheme(String[] tids);
}

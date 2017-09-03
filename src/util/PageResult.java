package util;

import java.util.List;

public class PageResult {
	private Page page;
	@SuppressWarnings("rawtypes")
	private List list;

	@SuppressWarnings("rawtypes")
	public PageResult(Page page, List list) {
		this.page = page;
		this.list = list;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	@SuppressWarnings("rawtypes")
	public List getList() {
		return list;
	}

	@SuppressWarnings("rawtypes")
	public void setList(List list) {
		this.list = list;
	}
}

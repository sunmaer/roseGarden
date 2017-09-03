package service;

import po.Discuss;
import util.Page;
import util.PageResult;

public interface DiscussService {
	// user
	boolean addDiscuss(Discuss Discuss);

	// user and admin
	boolean deleteDiscuss(int did);

	// admin
	PageResult getDiscussByPage(Page page, int tid);

	boolean multiDeleteAdmin(String[] dids);

	Discuss getDiscussById(int did);

	int totalCount(int tid);
}

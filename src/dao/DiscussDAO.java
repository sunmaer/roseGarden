package dao;

import java.util.List;

import po.Discuss;
import util.Page;

public interface DiscussDAO {

	public boolean addDiscuss(Discuss discuss);

	public List<Discuss> getDiscussByPage(Page page, int tid);

	public boolean deleteDiscuss(int did);

	public int totalCount(int tid);

	public Discuss getDiscussById(int did);

	public boolean deleteDiscuss(String[] dids);

}

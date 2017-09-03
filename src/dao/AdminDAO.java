package dao;

import java.util.List;

import po.Admin;

public interface AdminDAO {
	/*
	 * superadmin对admin的操作
	 */
	public boolean addAdmin(String uid);// user成為管理员

	public boolean addAdmin(Admin admin);// 增加管理员

	public boolean deleteAdmin(String aid);// 删除管理员

	public boolean multiDeleteAdmin(String[] aid);// 批量删除管理员

	/*
	 * admin
	 */
	public Admin getAdminById(String adminID);// 根据adminid查找admin

	public List<Admin> getAdminList();// 得到管理员列表

	public boolean updateAdmin(Admin admin);// 更改管理员信息
}

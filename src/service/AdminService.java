package service;

import java.util.List;

import po.Admin;

public interface AdminService {

	public boolean adminLogin(String adminID, String password);

	public List<Admin> getAdminList();

	public Admin getAdminById(String aid);

	public boolean addAdmin(Admin admin);

	public boolean updateAdmin(Admin admin);

	public boolean deleteAdmin(String aid);

	public boolean multiDeleteAdmin(String[] aids);

	public boolean addAdmin(String uid);

}

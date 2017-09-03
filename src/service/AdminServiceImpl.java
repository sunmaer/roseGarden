package service;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import po.Admin;
import dao.AdminDAO;
import dao.AdminDAOImpl;

public class AdminServiceImpl implements AdminService {

	private AdminDAO adminDAO = new AdminDAOImpl();

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.AdminService#allowLogin(java.lang.String, java.lang.String)
	 */
	public boolean adminLogin(String adminID, String password) {
		Admin admin = adminDAO.getAdminById(adminID);
		if (admin == null) {
			return false;
		} else {
			if (password.equals(admin.getPassword())) {
				Map<String, Object> sess;
				sess = ActionContext.getContext().getSession();
				sess.put("admin", admin);
				if (admin.getRole().equals("admin")) {
					admin.setRole("普通管理员");
				} else {
					admin.setRole("超级管理员");
				}
				return true;
			} else {
				return false;
			}
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.AdminService#updateAdmin(po.Admin)
	 */
	public boolean updateAdmin(Admin admin) {
		return adminDAO.updateAdmin(admin);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.AdminService#getAdminById(java.lang.String)
	 */
	public Admin getAdminById(String aid) {
		return adminDAO.getAdminById(aid);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.AdminService#deleteAdmin(java.lang.String)
	 */
	public boolean deleteAdmin(String aid) {
		return adminDAO.deleteAdmin(aid);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.AdminService#addAdmin(po.Admin)
	 */
	public boolean addAdmin(Admin admin) {
		return adminDAO.addAdmin(admin);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.AdminService#getAdminList()
	 */
	public List<Admin> getAdminList() {
		List<Admin> list = adminDAO.getAdminList();
		return list;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.AdminService#multideleteAdmin(java.lang.String[])
	 */
	public boolean multiDeleteAdmin(String[] aids) {
		return adminDAO.multiDeleteAdmin(aids);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.AdminService#addAdmin(java.lang.String)
	 */
	public boolean addAdmin(String uid) {
		return adminDAO.addAdmin(uid);
	}
}

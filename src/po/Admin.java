package po;

public class Admin {
	private String aid;
	private String name;
	private String telephone;
	private String password;
	private String role;

	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Admin(String aid, String name, String password, String role,
			String telephone) {
		super();
		this.aid = aid;
		this.name = name;
		this.telephone = telephone;
		this.password = password;
		this.role = role;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}

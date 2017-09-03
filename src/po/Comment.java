package po;

import java.io.Serializable;

public class Comment implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int cid;
	private int rid;
	private String content;
	private String time;
	private String uid;
	private String name;
	private String specie;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Comment(int cid, int rid, String content, String time, String uid,
			String name, String specie) {
		super();
		this.cid = cid;
		this.rid = rid;
		this.content = content;
		this.time = time;
		this.uid = uid;
		this.name = name;
		this.specie = specie;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cid;
		result = prime * result + rid;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof Comment))
			return false;
		Comment other = (Comment) obj;
		if (cid != other.cid)
			return false;
		if (rid != other.rid)
			return false;
		return true;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getSpecie() {
		return specie;
	}

	public void setSpecie(String specie) {
		this.specie = specie;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}

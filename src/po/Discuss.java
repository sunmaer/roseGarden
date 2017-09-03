package po;

import java.io.Serializable;

public class Discuss implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int did;
	private int tid;
	private String uid;
	private String time;
	private String content;
	private String theme;
	private String name;

	public Discuss(int did, int tid, String uid, String time, String content,
			String theme, String name) {
		super();
		this.did = did;
		this.tid = tid;
		this.uid = uid;
		this.time = time;
		this.content = content;
		this.theme = theme;
		this.name = name;
	}

	public Discuss() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + did;
		result = prime * result + tid;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof Discuss))
			return false;
		Discuss other = (Discuss) obj;
		if (did != other.did)
			return false;
		if (tid != other.tid)
			return false;
		return true;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}

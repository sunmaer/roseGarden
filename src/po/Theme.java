package po;

public class Theme {
	public Theme() {
		super();
		// TODO Auto-generated constructor stub
	}

	private int tid;
	private String uid;
	private String time;
	private String content;
	private String theme;
	private String name;

	public Theme(int tid, String uid, String time, String content,
			String theme, String name) {
		super();
		this.tid = tid;
		this.uid = uid;
		this.time = time;
		this.content = content;
		this.theme = theme;
		this.name = name;
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

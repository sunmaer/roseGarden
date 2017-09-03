package action;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.font.TextAttribute;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.AttributedString;
import java.util.Date;

import javax.imageio.ImageIO;

import org.apache.struts2.ServletActionContext;

import service.RoseService;
import service.RoseServiceImpl;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class AddPictureAction extends ActionSupport {

	/**
	 * picture文件上传并且加水印，存储在webRoot中
	 */
	public static final String MARK_TEXT = "@roseGarden.hzau.edu.cn";
	public static final String FONT_NAME = "微软雅黑";
	public static final int FONT_STYLE = Font.PLAIN;
	
	public static final Color FONT_COLOR = Color.black;// 文字颜色

	public static float ALPHA = 0.8F; // 文字水印透明度
	private static final long serialVersionUID = 1L;

	private String specie;
	private String fileName;
	private File img;

	/*
	 * private List<String> uploadContentType; private List<String>
	 * uploadFileName;
	 */
	RoseService roseService = new RoseServiceImpl();

	/**
	 * 上传图片 图片存放路径为RosePicture文件夹/月季品种名命名的文件夹/图片名称
	 */
	public String execute() throws Exception {
		String path1 = ServletActionContext.getServletContext().getRealPath(
				"/RosePicture");
		File file1 = new File(path1);
		if (!file1.exists()) {
			file1.mkdir();
		}
		String path = ServletActionContext.getServletContext().getRealPath(
				"/RosePicture/" + specie);
		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();
		}
		// 文件保存到本地
		int pos = fileName.lastIndexOf(".");// 返回"."最后出现的位置 String
		// 返回子字符串从指定索引处的字符开始，直到此字符串末尾 substring(pos)
		// 图片名字以时间-毫秒数命名
		Date date = new Date();
		String time = String.valueOf(date.getTime());
		String str = time + fileName.substring(pos);

		Image image = ImageIO.read(img); // 解码原图
		int width = image.getWidth(null); // 获取原图的宽度
		int height = image.getHeight(null);// 获取原图的高度
		int FONT_SIZE = height/30; // 文字大小
		int X = FONT_SIZE*2; // 文字坐标
		int Y = FONT_SIZE;
		BufferedImage bufferedImage = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB); // 图像颜色的设置

		// 2 创建Java绘图工具对象
		Graphics2D g = bufferedImage.createGraphics();

		// 3 使用绘图工具对象将原图绘制到缓存图片对象
		g.drawImage(image, 0, 0, width, height, null);

		// 4 使用绘图工具对象将水印（文字/图片）绘制到缓存图片
		Font font = new Font(FONT_NAME, FONT_STYLE, FONT_SIZE);
		g.setFont(font);
		/* 消除java.awt.Font字体的锯齿 */  
        g.setRenderingHint(RenderingHints.KEY_ANTIALIASING,  
                                  RenderingHints.VALUE_ANTIALIAS_ON); 
		g.setColor(FONT_COLOR);

		AttributedString ats = new AttributedString(MARK_TEXT);
		
		g.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
				RenderingHints.VALUE_ANTIALIAS_ON);
		ats.addAttribute(TextAttribute.FONT, font, 0, MARK_TEXT.length());

		// 获取文字水印的宽度和高度值
		int width1 = FONT_SIZE * getTextLength(MARK_TEXT);// 文字水印宽度
		int height1 = FONT_SIZE; // 文字水印高度

		// 计算原图和文字水印的宽度和高度之差
		int widthDiff = width - width1 - X; // 宽度之差	
		int heightDiff = height - height1 - Y; // 高度之差

		// 水印透明度的设置
		g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP,
				ALPHA));
		// 绘制文字
		g.drawString(MARK_TEXT, widthDiff, heightDiff + FONT_SIZE);
		// 释放工具
		g.dispose();

		OutputStream os = null;
		// 创建文件输出流，指向最终的目标文件
		os = new FileOutputStream(new File(file, str));
		// 5 创建图像文件编码工具类
		JPEGImageEncoder en = JPEGCodec.createJPEGEncoder(os);
		// 6 使用图像编码工具类，输出缓存图像到目标文件
		en.encode(bufferedImage);
		os.close(); // 关闭流

		ServletActionContext.getResponse().setContentType(
				"text/html;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		File filetest = new File(str);
		System.out.println(filetest.getName());
		if (filetest.exists()) {
			writer.write("success");
		} else {
			writer.write("fail");
		}
		writer.close();
		return null;
	}

	// 文本长度的处理：文字水印的中英文字符的宽度转换
	public int getTextLength(String text) {
		int length = text.length();
		for (int i = 0; i < text.length(); i++) {
			String s = String.valueOf(text.charAt(i));
			if (s.getBytes().length > 1) { // 中文字符
				length++;
			}
		}
		length = length % 2 == 0 ? length / 2 : length / 2 + 1; // 中文和英文字符的转换
		return length;
	}

	public String getSpecie() {
		return specie;
	}

	public void setSpecie(String specie) {
		this.specie = specie;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public File getImg() {
		return img;
	}

	public void setImg(File img) {
		this.img = img;
	}
}

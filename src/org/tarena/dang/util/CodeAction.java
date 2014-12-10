package org.tarena.dang.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Map;
import java.util.Random;

import org.apache.struts2.interceptor.SessionAware;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class CodeAction implements SessionAware {
	private static int WIDTH = 80;// 验证码图片宽度
	private static int HEIGHT = 30;// 验证码图片高度
	private static int NUM = 5;// 验证码数量
	// 定义验证码内出现的内容集合
	private static char[] seq = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
			'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
			'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8',
			'9' };

	private byte[] randomImage() {
		Random r = new Random();
		String str = "ABCDEFGHIGKLMNO" + "PQRSTUVWXYZ0123456789";
		String value = "";
		BufferedImage image = new BufferedImage(WIDTH, HEIGHT,
				BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		// g.setColor(new Color(r.nextInt(255),
		// r.nextInt(255),r.nextInt(255)));
		g.setColor(new Color(255, 255, 255));
		g.fillRect(0, 0, WIDTH, HEIGHT);
		g.setColor(new Color(0, 0, 0));
		StringBuffer buf = new StringBuffer();
		for (int i = 0; i < NUM; i++) {
			g.setColor(new Color(r.nextInt(150), r.nextInt(150), r.nextInt(150)));
			String str1 = String.valueOf(str.charAt((r.nextInt(str.length()))));
			buf.append(str1);
			int h = (int) (30 * 0.3 + 30 * 0.7 * r.nextDouble());
			g.setFont(new Font(null, Font.BOLD | Font.ITALIC, h));
			g.drawString(str1, WIDTH / 5 * i, h);
		}
		for (int i = 0; i < 100; i++) {
			g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));
			int x = r.nextInt(WIDTH);
			int y = r.nextInt(HEIGHT);
			// g.drawLine(r.nextInt(WIDTH), r.nextInt(HEIGHT),
			// r.nextInt(WIDTH), r.nextInt(HEIGHT));
			// 设置干扰点
			g.drawOval(x, y, 1, 1);
		}
		this.session.put("checkcode", buf.toString());
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(os);
		try {
			encoder.encode(image);
			return os.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);

		}
	}

	public InputStream getInput() {
		return input;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	private Color randomColor(Random r) {
		return new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255));
	}

	private InputStream input;
	private Map<String, Object> session;

	public String execute() {
		byte[] image = randomImage();
		this.input = new ByteArrayInputStream(image);

		return "success";
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}

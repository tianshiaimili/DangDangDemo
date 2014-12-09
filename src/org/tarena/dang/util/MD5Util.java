package org.tarena.dang.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

public class MD5Util {
	/**
	 * 将字符串采用MD5算法加密
	 * @param str 原字符串
	 * @return 加密后结果
	 * @throws Exception 
	 * @throws Exception 
	 */
	public static String digest(String psd) throws Exception{
		MessageDigest md=MessageDigest.getInstance("MD5");
		byte[] bts=md.digest(psd.getBytes());
		//将加密之后的字节数据bts,转成字符串
		//采用Base64算法转换
		BASE64Encoder base64=new BASE64Encoder();
		return base64.encode(bts);
	}
}

package cn.code4j.MiniBlog.commons.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {

	private MD5Util(){}
	
	// 调用jdk自带的md5加密算法加密
	public static String md5Util(String message) {
		String temp = "";
		try {
			MessageDigest md5Digest = MessageDigest.getInstance("MD5");
			byte[] encodeMd5Digest = md5Digest.digest(message.getBytes());
			temp = convertByteToHexString(encodeMd5Digest);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return temp;
	}

	// byte数组转化为16进制输出
	public static String convertByteToHexString(byte[] bytes) {
		String result = "";
		for (int i = 0; i < bytes.length; i++) {
			int temp = bytes[i] & 0Xff;
			String tempHex = Integer.toHexString(temp);
			if (tempHex.length() < 2) {
				result += "0" + tempHex;
			} else {
				result += tempHex;
			}
		}
		return result;
	}
	

}

package cn.code4j.MiniBlog.commons.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

public class Email {

	private Email() {
	}

	public static void sendEmail(int verificationCode, String uAccount) throws Exception {

		/* 1.登录smtp邮件服务器 16 2.创建邮件对象 3.发送(session,mail) */

		// 1.创建一个程序与邮件服务器会话对象 Session
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "SMTP");
		props.setProperty("mail.host", "smtp.163.com");
		props.setProperty("mail.smtp.auth", "true");// 指定验证为true
		// 创建验证器
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("oxygen_orz", "lxdwpp937044");
			}
		};

		Session session = Session.getInstance(props, auth);

		// 2.创建一个Message，它相当于是邮件内容
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress("oxygen_orz@163.com")); // 设置发送者

		message.setRecipient(RecipientType.TO, new InternetAddress(uAccount)); // 设置发送方式与接收者

		message.setSubject("MiniBlog-密码找回服务");

		String content = "<div style='width:640px; background:#fff; border:solid 1px #efefef; margin:0 auto; padding:35px 0 35px 0'>"
				+ " <table width='560' border='0' align='center' cellpadding='0' cellspacing='0' style=' margin:0 auto; margin-left:30px; margin-right:30px;'>"
				+ "    <tbody><tr>" + " <td><img src=''></td>" + "    </tr>" + "    <tr>" + "      <td>"
				+ "      <h3 style='font-weight:normal; font-size:18px'>您好！亲爱的<span style='font-weight:bold; margin-left:5px;'>"
				+ uAccount + "</span></h3>"
				+ "      <p style='margin:5px 0; padding:3px 0;color:#666; font-size:14px'>MiniBlog找回/更改登录密码通知:</p>"
				+ "      <p style='color:#666; font-size:14px'>请在30分钟内使用下面验证码找回/更改您的登录密码： " + verificationCode
				+ "      <p style='margin:10px 0 5px 0; padding:3px 0;color:#666; font-size:14px'>如果您未使用MiniBlog找回/更改您的密码，您可以忽略此邮件</p>"
				+ "      <p style='margin:5px 0; padding:3px 0;color:#666; font-size:14px'>如果该验证码已经失效，请重新到MiniBlog网站找回/更改您的密码！谢谢您的合作<br></p>"
				+ "      <p style='margin:5px 0; padding:3px 0;color:#666; font-size:14px'>感谢您对MiniBlog的支持。</p>"
				+ "      <p style='text-align:center'><img src=''></p>" + "      </td>" + "    </tr>" + "    </tbody>"
				+ " </table>" + "</div>";

		message.setContent(content, "text/html;charset=utf-8");

		// 3.创建 Transport用于将邮件发送
		Transport.send(message);
	}

}

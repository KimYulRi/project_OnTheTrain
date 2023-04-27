package com.kh.onthetrain.member.api;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class SendEmail {
	
	
	@Value("${key.emailsender}")
	private String sender;

	@Value("${key.emailpass}")
	private String password;
	
	private static SendEmail instance;
	
	private SendEmail() {
		
	}
	
	
	public void sendEmail(String receiver, String tempPwd) {
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		Session session = Session.getInstance(props, new Authenticator() {
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
			});
		String title = "[온더트레인] 임시 비밀번호가 생성되었습니다.";
		String content = "<h2 style='color:blue'>안녕하세요. 온더트레인입니다.</h2><br>"
				+ "회원님의 임시비밀번호는 " + tempPwd + "입니다.<br>" 
				+ "로그인 후 [마이메뉴] > [나의 회원정보] > [정보수정]에서 비밀번호를 변경해주세요";
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(sender, "온더트레인", "utf-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(title);
			message.setContent(content, "text/html; charset=utf-8");
	
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	 public static SendEmail getInstance() {
	        if (instance == null) {
	            instance = new SendEmail();
	        }
	        return instance;
	    }
		 
}
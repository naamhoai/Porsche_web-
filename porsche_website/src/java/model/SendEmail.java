/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import javax.mail.Session;
import javax.mail.Transport;
import java.util.*;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author admin
 */
public class SendEmail {

    public static void process(HttpServletRequest request, User user) {

        String gr = getRandom();
        SentEmail(user, gr);
        saveVerifyCode(request, gr);

    }

    public static String getRandom() {
        Random rd = new Random();
        int number = rd.nextInt(999999);
        return String.format("%06d", number);
    }

    public static void SentEmail(User user, String gr) {
        // Thông tin tài khoản email
        String host = "smtp.gmail.com"; // SMTP server của Gmail
        String port = "587"; // Port cho SMTP
        String username = "domanhhuyy@gmail.com"; // Địa chỉ email của bạn
        String password = "fcrd gxmd apio focw"; // Mật khẩu email của bạn

        // Cấu hình properties
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);

        // Tạo session
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Tạo message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail()));
            message.setSubject("Verify Code");
            message.setText("Registered successfully. Please verify your account using this code: " + gr);

            // Gửi email
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    private static void saveVerifyCode(HttpServletRequest request, String gr) {
        HttpSession session = request.getSession();
        session.setAttribute("VerifyCode", gr);
    }

    public static void removeVerifyCode(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("VerifyCode");
    }
}

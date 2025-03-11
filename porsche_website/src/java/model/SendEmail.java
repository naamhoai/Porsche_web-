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
        if (user == null || user.getEmail() == null || user.getEmail().isEmpty()) {
            throw new IllegalArgumentException("Email không hợp lệ");
        }

        String host = "smtp.gmail.com";
        String port = "587";
        String username = "domanhhuyy@gmail.com";
        String password = "fcrd gxmd apio focw";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail()));
            message.setSubject("Verify Code");
            message.setText("Registered successfully. Please verify your account using this code: " + gr);

            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
            throw new RuntimeException("Gửi email thất bại: " + e.getMessage());
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

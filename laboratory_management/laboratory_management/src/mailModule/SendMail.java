package mailModule;
import model.Appointment;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.net.SocketTimeoutException;
import java.util.Properties;

public class SendMail {

//    For Gmail
//    public void sendMail(String recepient, Appointment appointment) throws SocketTimeoutException {
//
//
//        // Recipient's email ID needs to be mentioned.
//        String to = "";
//
//        // Sender's email ID and password need to be mentioned
//        String from = "";
//        final String username = ""; // Gmail username
//        final String password = ""; // Gmail password
//
//        // Assuming you are sending email through Gmail
//        String host = "smtp.gmail.com";
//
//        // Setup mail server properties
//        Properties props = new Properties();
//        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.starttls.enable", "true");
//        props.put("mail.smtp.host", host);
//        props.put("mail.smtp.port", "587");
//        props.put("mail.debug", "true");
//        props.put("mail.smtp.ssl.protocols", "TLSv1.2 TLSv1.3");
//        props.put("mail.smtp.socketFactory.port", "465");
//        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//        props.put("mail.smtp.socketFactory.fallback", "false");
//        System.setProperty("https.protocols", "TLSv1.2,TLSv1.3");
//        System.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
//
//        // Get the Session object
//        Session session = Session.getInstance(props,
//                new javax.mail.Authenticator() {
//                    protected PasswordAuthentication getPasswordAuthentication() {
//                        return new PasswordAuthentication(username, password);
//                    }
//                });
//
//        try {
//            // Create a default MimeMessage object
//            Message message = new MimeMessage(session);
//
//            // Set From: header field
//            message.setFrom(new InternetAddress(from));
//
//            // Set To: header field
//            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
//
//            // Set Subject: header field
//            message.setSubject("Appointment For ABC Laboratory");
//
//            // Set the actual message
//            String text =   "Your Appointment Details :- " + "\n" +
//                            "Patient Name      : " + appointment.getMessage() + "\n" +
//                            "Appointment No    : " + appointment.getAppointmentNumber() + "\n" +
//                            "Appointment Date  : " + appointment.getAppointmentDate() + "\n" +
//                            "Appointment Time  : " + appointment.getAppointmentTime() + "\n" +
//                            "Test Type         : " + appointment.getServiceType() + "\n" +
//                            "Doctor            : " + appointment.getDoctor() + "\n" +
//                            "Appointment Fee   : " + appointment.getAppointmentFee() + "\n" ;
//
//            message.setText(text);
//
//            // Send message
//            Transport.send(message);
//
//            System.out.println("Sent message successfully....");
//
//        } catch (MessagingException e) {
//
//        }
//    }

    public void sendMail(String recepient, Appointment appointment) throws SocketTimeoutException {
        recepient = "sachithraj50@gmail.com";
        Properties properties = new Properties();
        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.office365.com");
        properties.put("mail.smtp.port", "587");

        final String username = "sohan.edirisinghe@outlook.com"; // Your email
        final String password = "Sohan12345@"; // Your password

        Session session = Session.getInstance(properties,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });


        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("sohan.edirisinghe@outlook.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(recepient)); // Recipient's email


            String text = "Your Appointment Details :- " + "\n" +
                    "Patient Name      : " + appointment.getMessage() + "\n" +
                    "Appointment No    : " + appointment.getAppointmentNumber() + "\n" +
                    "Appointment Date  : " + appointment.getAppointmentDate() + "\n" +
                    "Appointment Time  : " + appointment.getAppointmentTime() + "\n" +
                    "Test Type         : " + appointment.getServiceType() + "\n" +
                    "Doctor            : " + appointment.getDoctor() + "\n" +
                    "Appointment Fee   : " + appointment.getAppointmentFee() + "\n";



            message.setSubject("Email Subject Here");
            message.setText(text);

            Transport.send(message);

            System.out.println("Email sent successfully!");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

      }



//    for Outlook
//    public void sendMail(String recipient, Appointment appointment) throws MessagingException {
//
//        // Recipient's email ID needs to be mentioned.
//        String to = recipient;
//
//        // Sender's email ID and password need to be mentioned
//        String from = "your_outlook_email@example.com";
//        final String username = "your_outlook_email@example.com"; // Outlook username (your email address)
//        final String password = "your_password"; // Outlook password
//
//        // Assuming you are sending email through Outlook
//        String host = "smtp.office365.com";
//
//        // Setup mail server properties
//        Properties props = new Properties();
//        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.starttls.enable", "true");
//        props.put("mail.smtp.host", host);
//        props.put("mail.smtp.port", "587");
//        // Debug is optional, enable if you want to see the detailed logs
//        props.put("mail.debug", "true");
//
//        // No need to specify socketFactory properties as you are not using SSL directly to connect
//
//        // Get the Session object
//        Session session = Session.getInstance(props,
//                new javax.mail.Authenticator() {
//                    protected PasswordAuthentication getPasswordAuthentication() {
//                        return new PasswordAuthentication(username, password);
//                    }
//                });
//
//        try {
//            // Create a default MimeMessage object
//            Message message = new MimeMessage(session);
//
//            // Set From: header field
//            message.setFrom(new InternetAddress(from));
//
//            // Set To: header field
//            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
//
//            // Set Subject: header field
//            message.setSubject("Appointment For ABC Laboratory");
//
//            // Set the actual message
//            String text = "Your Appointment Details :- " + "\n" +
//                    "Patient Name      : " + appointment.getMessage() + "\n" +
//                    "Appointment No    : " + appointment.getAppointmentNumber() + "\n" +
//                    "Appointment Date  : " + appointment.getAppointmentDate() + "\n" +
//                    "Appointment Time  : " + appointment.getAppointmentTime() + "\n" +
//                    "Test Type         : " + appointment.getServiceType() + "\n" +
//                    "Doctor            : " + appointment.getDoctor() + "\n" +
//                    "Appointment Fee   : " + appointment.getAppointmentFee() + "\n";
//
//            message.setText(text);
//
//            // Send message
//            Transport.send(message);
//
//            System.out.println("Sent message successfully....");
//
//        } catch (MessagingException e) {
//            System.out.println(e.toString());
//            throw new RuntimeException(e);
//        }
//    }


}

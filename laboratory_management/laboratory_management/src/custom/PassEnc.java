package custom;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PassEnc {


    public  String getPassword (String password) {
        String ed = null;
        try {
            MessageDigest m1 = MessageDigest.getInstance("MD5");
            m1.update(password.getBytes());
            byte[] bt = m1.digest();
            StringBuilder str = new StringBuilder();
            for (int i = 0; i < bt.length; i++) {
                str.append(Integer.toString((bt[i] & 0xff) + 0x100, 16).substring(1));
            }
            ed = str.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return ed;
    }

}

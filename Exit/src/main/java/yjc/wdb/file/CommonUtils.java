package yjc.wdb.file;

import java.util.Calendar;
import java.util.UUID;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;

public class CommonUtils {
   
   public static String nowtime() {
      Calendar calendar = Calendar.getInstance();
       java.util.Date date = calendar.getTime();
       return (new SimpleDateFormat("yyyy-MM-dd").format(date));
   }

   public static String getRandomString() {
      return UUID.randomUUID().toString().replaceAll("-", "");
   }

   public static String SHA256LOCK(String str) {
      try {
         MessageDigest digest = MessageDigest.getInstance("SHA-256");
         byte[] hash = digest.digest(str.getBytes("UTF-8"));
         StringBuffer hexString = new StringBuffer();

         for (int i = 0; i < hash.length; i++) {
            String hex = Integer.toHexString(0xff & hash[i]);
            if (hex.length() == 1)
               hexString.append('0');
            hexString.append(hex);
         }
         return hexString.toString();
      } catch (Exception ex) {
         throw new RuntimeException(ex);
      }
   }
}
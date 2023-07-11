package com.example.iumclient.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class ApplicationUtils {

    public static boolean isLessThanToday(String toCheck) {
        LocalDate dateToCheck = LocalDate.parse(toCheck, DateTimeFormatter.ofPattern("yyy-MM-dd"));
        LocalDate today = LocalDate.now();
        return today.isAfter(dateToCheck);
    }

    public static String toMD5(String s) {
        MessageDigest m = null;

        try {
            m = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        m.update(s.getBytes(),0,s.length());
        String hash = new BigInteger(1, m.digest()).toString(16);
        return hash;
    }



}

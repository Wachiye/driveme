package com.sirah.driveme.utils;

import jakarta.servlet.http.HttpServletRequest;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class Functions {
    //generate a new UUID as string
    public static String generateUUID(){
        UUID uuid = UUID.randomUUID();
        return uuid.toString();
    }
    //encrypts a string by shifting characters
    public static String encryptString(String str)
    {
        String newString = "";
        int size = str.length();
        char digit;

        for(int i = 0 ; i <size; i++)
        {
            digit = str.charAt(i);
            digit += 1;
            newString += digit;
        }
        return newString;
    }

    //decrypts a string
    public static String decryptString(String str)
    {
        String newString = "";
        int size = str.length();
        char digit;

        for(int i = 0 ; i <size; i++)
        {
            digit = str.charAt(i);
            digit -= 1;
            newString += digit;
        }
        return newString;

    }

    //compares encrypted string and plain string if they match
    public  static boolean compareEncrypted(String encrypted, String plain){
        if( encrypted.equals( encryptString(plain))){
            return true;
        }
        return false;
    }
    //check if user is logged in
    public static  boolean isLoggedIn(HttpServletRequest request){
        Boolean loggedIn = (Boolean) request.getSession().getAttribute("loggedIn");
        if(loggedIn != null && loggedIn){
            return true;
        }
        return false;
    }
    //check if user id logged as the given user type
    public static   boolean checkLoggedInAs(String userType, HttpServletRequest request){
        String type = (String) request.getSession().getAttribute("userType");
        if(isLoggedIn(request) &&
                (userType != null && userType.equalsIgnoreCase(type))){
            return  true;
        }
        return false;
    }
    //get current date
    public  static String getDateToday(){
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        return dateFormat.format(date);
    }
}

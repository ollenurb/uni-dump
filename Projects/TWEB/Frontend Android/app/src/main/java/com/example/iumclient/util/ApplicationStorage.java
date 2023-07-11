package com.example.iumclient.util;

import android.content.Context;
import android.content.SharedPreferences;

import com.example.iumclient.beans.User;

import java.util.HashSet;

public class ApplicationStorage {

    private final static String USER_DATA = "UserDataFile";
    private final static String SESSION_DATA = "SessionDataFile";

    private final static String COOKIES_KEY = "SESSION_COOKIES";

    private static SharedPreferences getSharedPrefs(String spName) {
        return GlobalApplication.getAppContext().getSharedPreferences(spName, Context.MODE_PRIVATE);
    }

    /**
     * Save the given user to Shared Preferences
     * @param data the user to be saved
     */
    public static void saveUserSession(User data) {
        SharedPreferences.Editor editor = getSharedPrefs(USER_DATA).edit();
        editor.putInt("id", data.getId());
        editor.putString("name", data.getName());
        editor.putString("surname", data.getSurname());
        editor.putString("email", data.getEmail());
        editor.putBoolean("administrator", data.isAdministrator());
        editor.apply();
    }

    /**
     * Get the user session, default values if not present
     * @return the previously saved user
     */
    public static User getUserSession() {
        SharedPreferences sP = getSharedPrefs(USER_DATA);
        return new User(
                sP.getInt("id", -1),
                sP.getString("name", null),
                sP.getString("surname", null),
                sP.getString("email", null),
                sP.getBoolean("administrator", false)
        );
    }

    public static void clearSessionAndCookies() {
        getSharedPrefs(USER_DATA).edit().clear().apply();
        getSharedPrefs(SESSION_DATA).edit().clear().apply();
    }

    /**
     * Set the session Data which are the cookies that will be put in the response by the server
     * @param sessionCookies the set of cookies string to save in shared preference
     */
    public static void saveCookiesData(HashSet<String> sessionCookies) {
        SharedPreferences.Editor editor = getSharedPrefs(SESSION_DATA).edit();
        editor.putStringSet(COOKIES_KEY, sessionCookies);
        editor.apply();
    }

    /**
     * Retrieve session data (cookies) if there are no cookies an empty set will be returned
     * @return Session data as set of string if not empty, empty set otherwise
     */
    public static HashSet<String> getCookiesData() {
        SharedPreferences sP = getSharedPrefs(SESSION_DATA);
        return (HashSet<String>) sP.getStringSet(COOKIES_KEY, new HashSet<>());
    }

    /**
     * Set shared preference listener
     * @param listener the listener to set
     */
    public static void setSessionListener(SharedPreferences.OnSharedPreferenceChangeListener listener) {
        getSharedPrefs(USER_DATA).registerOnSharedPreferenceChangeListener(listener);
    }

}

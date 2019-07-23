package com.tmna.ct.telematics.qa.apitesting.library;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Properties;

public class ConfiguratorSupport {
    private static Properties props = new Properties();
    private String strFileName;
    private String strValue;

    public String getProperty(String strKey) {
        try {
            File f = new File(strFileName);
            if (f.exists()) {
                FileInputStream in = new FileInputStream(f);
                props.load(in);
                strValue = props.getProperty(strKey);
                in.close();
            } else
                System.out.println("File not found!");
        } catch (Exception e) {
            System.out.println(e);
        }
        return strValue;
    }

    public void setProperty(String strKey, String strValue) {
        try {
            File f = new File(strFileName);
            if (f.exists()) {
                FileInputStream in = new FileInputStream(f);
                props.load(in);
                props.setProperty(strKey, strValue);
                props.store(new FileOutputStream(strFileName), null);

                in.close();
            } else {
                System.out.println("File not found!");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void removeProperty(String strKey) {
        try {
            File f = new File(strFileName);
            if (f.exists()) {
                FileInputStream in = new FileInputStream(f);
                props.load(in);
                props.remove(strKey);
                props.store(new FileOutputStream(strFileName), null);
                in.close();
            } else
                System.out.println("File not found!");
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public ConfiguratorSupport(String strFileName) {
        this.strFileName = strFileName;
    }

    public static String getHostName() throws UnknownHostException {
        InetAddress addr = InetAddress.getLocalHost();
        return addr.getHostName();
    }

    public void clean() {
        props.clear();
    }
}

package com.darksouls.util;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.util.Properties;

public class DuridJdbc {
    static {
        try {
            Properties properties = new Properties();

            properties.load(new FileInputStream(DuridJdbc.class.getClassLoader().getResource("druid.properties").getPath()));
            DataSource ds = DruidDataSourceFactory.createDataSource(properties);
            conn = ds.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private static Connection conn;


    public static Connection getConnection()  {
        return conn;
    }

}

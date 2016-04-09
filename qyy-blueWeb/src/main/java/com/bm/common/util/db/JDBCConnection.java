package com.bm.common.util.db;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.bm.common.util.XLogger;




/**
 * 获取spring 连接池
 * 
 * @author mike
 *
 */
public class JDBCConnection extends XLogger {

	/**
	 * 不允许实例化
	 */
	protected JDBCConnection(){}
	
	
	/**
	 * 加载properties 文件
	 * 
	 * @return Properties
	 * @throws Exception
	 */
	Properties loadProps() throws Exception {
		Properties props = null;
		try {
			props = PropertiesLoaderUtils
					.loadAllProperties("/jdbc.properties");
			String pwd = props.getProperty("password");
			// TODO MD5解密
			props.setProperty("password", pwd);
		} catch (Exception e) {
			log.error("加载properties文件出错", e);
		}
		return props;
	}

	/**
	 * 加载dataSource
	 * 
	 * @return
	 */
	DriverManagerDataSource loadDataSource() {
		Properties props;
		DriverManagerDataSource dataSource = null;
		try {
			props = loadProps();
			dataSource = new DriverManagerDataSource(props.getProperty("url"),
					props);
		} catch (Exception e) {
			log.error("获取dataSource失败", e);
		}
		return dataSource;
	}

	/**
	 * 获取一个链接
	 * 
	 * @return Connection
	 */
	Connection getConn() {
		Connection conn = null;
		try {
			DriverManagerDataSource dataSource = loadDataSource();
			conn = dataSource.getConnection();
		} catch (SQLException e) {
			log.error("获取一个链接失败", e);
		}
		return conn;
	}

	/**
	 * 用于测试的方法
	 * 
	 * @return
	 */
	public Connection getTestConn() {
		return this.getConn();
	}

}

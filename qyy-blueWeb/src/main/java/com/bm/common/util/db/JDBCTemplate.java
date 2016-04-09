package com.bm.common.util.db;

import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;

/**
 * jdbc template
 * 
 * @author mike
 *
 */
public class JDBCTemplate {

	private static JdbcTemplate template;

	/**
	 * 不允许实例化
	 */
	private JDBCTemplate() {
	}

	/**
	 * 获取JdbcTemplate
	 * 
	 * @return
	 */
	public static JdbcTemplate getTemplate() {
		if (template == null)
			template = (JdbcTemplate) ApplicationContextHepler
					.getApplicationContext().getBean("jdbcTemplate");
		return template;
	}

	/**
	 * 获取链接，默认键'default'
	 * 
	 * @return
	 */
	public static Connection getJDBCConn() {
		return JDBCManager.getConn("default");
	}

	/**
	 * 获取链接,从template中获取
	 * 
	 * @return
	 */
	public static Connection getTemplateConn() throws SQLException {
		return getTemplate().getDataSource().getConnection();
	}

}

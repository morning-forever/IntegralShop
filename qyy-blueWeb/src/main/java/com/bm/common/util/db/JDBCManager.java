package com.bm.common.util.db;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import com.bm.common.util.XLogger;





@SuppressWarnings("unused")
public class JDBCManager extends XLogger {

	private static Map<String, Connection> connManager = new HashMap<String, Connection>();
	
	private static int count = 0;
	private static Connection conn;
	private static JDBCConnection jdbc;

	static {
		if (jdbc == null)
			jdbc = new JDBCConnection();
	}

	private JDBCManager() {
	}

	public synchronized static Connection getConn() {
		return getConn("conn");
	}

	public synchronized static Connection getConn(String key) {
		conn = connManager.get(key);
		if (conn == null) {
			conn = jdbc.getConn();
			connManager.put(key, conn);
			count++;
			return conn;
		}
		return connManager.get(key);
	}

	public synchronized static void close(String key) {
		try {
			conn = connManager.get(key);
			conn.close();
			connManager.remove(key);
			count--;
			conn = null;
			Runtime.getRuntime().gc();
		} catch (SQLException e) {
			log.error("单个链接释放时异常", e);
		}
	}

	public static void closeAll() {
		try {
			Set<String> keys = connManager.keySet();
			for (Iterator<String> iterator = keys.iterator(); iterator
					.hasNext();) {
				String key = iterator.next();
				conn = connManager.get(key);
				conn.close();
				connManager.remove(key);
				conn = null;
				count--;
			}
			Runtime.getRuntime().gc();
		} catch (SQLException e) {
			log.error("释放所有链接时异常", e);
		}
	}

}

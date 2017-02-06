package com.andone.blog.test;

import java.util.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import org.apache.commons.dbutils.QueryRunner;import org.apache.commons.dbutils.ResultSetHandler;

import com.andone.blog.util.JdbcUtil;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.sun.jmx.snmp.Timestamp;

public class Test {

	
	
	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement preparedStatement;
		QueryRunner qr = new QueryRunner();
		String sql = "insert into test(id,createTime,updateTime) values(?,?,?)";
//		String sql = "SELECT createTime FROM test WHERE id=2";
		try{
			conn = (Connection) JdbcUtil.getConnection();
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			System.out.println(sdf.format(date));
//			qr.update(conn, sql, "3", sdf.format(date), sdf.format(date));
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.closeAll(conn, null, null);
		}
	}
}

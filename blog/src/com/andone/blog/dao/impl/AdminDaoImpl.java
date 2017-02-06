package com.andone.blog.dao.impl;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.andone.blog.dao.AdminDao;
import com.andone.blog.entity.Admin;
import com.andone.blog.util.JdbcUtil;
import com.mysql.jdbc.Connection;

public class AdminDaoImpl implements AdminDao {

	private Connection conn;
	private QueryRunner qr = new QueryRunner();
	
	@Override
	public Admin findByNameAndPwd(String username, String pwd) {
		Admin admin;
		try{
			String sql = "select * from admin WHERE username=? and pwd=?";
			conn = (Connection) JdbcUtil.getConnection();
			admin = qr.query(conn, sql,new BeanHandler<Admin>(Admin.class), username, pwd);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.closeAll(conn, null, null);
		}
		return admin;
	}

}

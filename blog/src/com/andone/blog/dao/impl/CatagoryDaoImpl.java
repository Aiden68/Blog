package com.andone.blog.dao.impl;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.andone.blog.dao.CatagoryDao;
import com.andone.blog.entity.Catagory;
import com.andone.blog.util.JdbcUtil;


public class CatagoryDaoImpl implements CatagoryDao {

	private Connection conn;
	private QueryRunner qr = new QueryRunner();
	
	@Override
	public List<Catagory> findAllCat() {
		String sql = "select * from catagory";
		List<Catagory> list = new ArrayList<>();
		try{
			conn = (Connection) JdbcUtil.getConnection();
			list = qr.query(conn, sql, new BeanListHandler<Catagory>(Catagory.class));
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.closeAll(conn, null, null);
		}
		return list;
	}

	@Override
	public void addCat(Catagory catagory) {
		String sql = "insert into catagory(catName) values(?)";
		try{
			conn = (Connection) JdbcUtil.getConnection();
			qr.update(conn, sql,catagory.getCatName());
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.closeAll(conn, null, null);
		}
	}

	@Override
	public Catagory findCatById(String id) {
		String sql = "select * from catagory where id=?";
		Catagory catagory = new Catagory();
		try{
			conn = (Connection) JdbcUtil.getConnection();
			catagory = qr.query(conn, sql, new BeanHandler<Catagory>(Catagory.class),id);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.closeAll(conn, null, null);
		}
		return catagory;
	}

	@Override
	public void deleteCatById(String id) {
		try{
			String sql = "delete from catagory where id=?";
			conn = (Connection) JdbcUtil.getConnection();
			qr.update(conn, sql, id);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.closeAll(conn, null, null);
		}
	}

	@Override
	public void updateCat(Catagory catagory) {
		try{
			String sql = "UPDATE catagory set catName=? WHERE id=?";
			conn = (Connection) JdbcUtil.getConnection();	
			qr.update(conn, sql, catagory.getCatName(), catagory.getId());
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.closeAll(conn, null, null);
		}
	}
	
}

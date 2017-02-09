package com.andone.blog.dao.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.andone.blog.dao.CommentDao;
import com.andone.blog.entity.Comment;
import com.andone.blog.entity.Post;
import com.andone.blog.util.JdbcUtil;
import com.andone.blog.util.Pager;
import com.mysql.jdbc.Connection;

public class CommentDaoImpl implements CommentDao{

	private Connection conn;
	private QueryRunner qr = new QueryRunner();
	
	@Override
	public void addComment(Comment comment) {
		String sql = "insert into comment(name,email,pid,createTime,content) values(?,?,?,?,?)";
		try{
			conn = (Connection) JdbcUtil.getConnection();
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			qr.update(conn, sql, comment.getName(),comment.getEmail(),comment.getPid(),
					sdf.format(date),comment.getContent());
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.closeAll(conn, null, null);
		}
	}

	@Override
	public List<Comment> findAllComment() {
		String sql = "select * from comment";
		List<Comment> list = new ArrayList<>();
		try{
			conn = (Connection) JdbcUtil.getConnection();
			list = qr.query(conn, sql, new BeanListHandler<Comment>(Comment.class));
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.closeAll(conn, null, null);
		}
		return list;
	}

	@Override
	public void deleteCommentById(String id) {
		try{
			String sql = "delete from comment where id=?";
			conn = (Connection) JdbcUtil.getConnection();
			qr.update(conn, sql, id);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.closeAll(conn, null, null);
		}
	}

	@Override
	public void updateComment(Comment comment) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Comment CommentFindById(String id) {
		String sql = "select * from comment where id=?";
		Comment comment;
		try{
			conn = (Connection) JdbcUtil.getConnection();
			comment = qr.query(conn, sql, new BeanHandler<Comment>(Comment.class),id);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.closeAll(conn, null, null);
		}
		return comment;
	}

	@Override
	public Pager<Comment> pageFind(Comment comment, int currenNum, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Comment> findAllCommentByPid(String pid) {
		String sql = "select * from comment where pid=?";
		List<Comment> list = new ArrayList<>();
		try{
			conn = (Connection) JdbcUtil.getConnection();
			list = qr.query(conn, sql, new BeanListHandler<Comment>(Comment.class),pid);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.closeAll(conn, null, null);
		}
		return list;
	}

	
}

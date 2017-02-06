package com.andone.blog.dao.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.print.PrintException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.andone.blog.dao.PostDao;
import com.andone.blog.entity.Post;
import com.andone.blog.util.JdbcUtil;
import com.andone.blog.util.Pager;
import com.mysql.jdbc.Connection;
import com.sun.glass.ui.Pixels.Format;

import javafx.geometry.Pos;

public class PostDaoImpl implements PostDao {
	
	private Connection conn;
	private QueryRunner qr = new QueryRunner();
	@Override
	public void addPost(Post post) {
		String sql = "insert into posts(title,summary,content,createTime,updateTime) values(?,?,?,?,?)";
		try{
			conn = (Connection) JdbcUtil.getConnection();
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			qr.update(conn, sql, post.getTitle(),post.getSummary(),post.getContent(),
					sdf.format(date),sdf.format(date));
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.closeAll(conn, null, null);
		}
	}

	@Override
	public List<Post> findAllPost() {
		String sql = "select * from posts";
		List<Post> list = new ArrayList<>();
		try{
			conn = (Connection) JdbcUtil.getConnection();
			list = qr.query(conn, sql, new BeanListHandler<Post>(Post.class));
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.closeAll(conn, null, null);
		}
		return list;
	}

	@Override
	public void deletePostById(String id) {
		try{
			String sql = "delete from posts where id=?";
			conn = (Connection) JdbcUtil.getConnection();
			qr.update(conn, sql, id);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.closeAll(conn, null, null);
		}
	}

	@Override
	public void updatePost(Post post) {
		try{
			String sql = "UPDATE posts SET title=?, summary=?, content=?, updateTime=? WHERE id=?";
			conn = (Connection) JdbcUtil.getConnection();	
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			qr.update(conn, sql, post.getTitle(),post.getSummary(),post.getContent(),
					sdf.format(date), post.getId());
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.closeAll(conn, null, null);
		}
	}

	@Override
	public Post postFindById(String id) {
		Post post = new Post();
		try{
			String sql = "select * from posts WHERE id=?";
			conn = (Connection) JdbcUtil.getConnection();
			post = qr.query(conn, sql,new BeanHandler<Post>(Post.class), id);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.closeAll(conn, null, null);
		}
		return post;
	}

	@Override
	public Pager<Post> pageFind(Post post, int currentNum, int pageSize) {
		Pager<Post> result = null;
		// 存放查询参数
		List<Object> paramList = new ArrayList<Object>();
		
//		String stuName = searchModel.getStuName();
//		int gender = searchModel.getGender();
		
		StringBuilder sql = new StringBuilder(
				"select * from posts where 1=1");
		StringBuilder countSql = new StringBuilder(
				"select count(id) as totalRecord from posts where 1=1 ");

//		if (stuName != null && !stuName.equals("")) {
//			sql.append(" and stu_name like ?");
//			countSql.append(" and stu_name like ?");
//			paramList.add("%" + stuName + "%");
//		}

//		if (gender == Constant.GENDER_FEMALE || gender == Constant.GENDER_MALE) {
//			sql.append(" and gender = ?");
//			countSql.append(" and gender = ?");
//			paramList.add(gender);
//		}
		sql.append(" order by createTime desc");
		// 起始索引
		int fromIndex	= pageSize * (currentNum -1);
		
		// 使用limit关键字，实现分页
		sql.append(" limit " + fromIndex + ", " + pageSize );
		
		// 存放所有查询出的学生对象
		List<Post> postList = new ArrayList<Post>();
		List<Post> list = new ArrayList<>();
		try{
			conn = (Connection) JdbcUtil.getConnection();
			list = qr.query(conn, sql.toString(), new BeanListHandler<Post>(Post.class));
			int totalRecord = qr.query(conn, countSql.toString(), new ScalarHandler<Long>()).intValue();
			//获取总页数
			int totalPage = totalRecord / pageSize;
			if(totalRecord % pageSize !=0){
				totalPage++;
			}
			
			// 组装pager对象
			result = new Pager<Post>(pageSize, currentNum, 
							totalRecord, totalPage, list);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.closeAll(conn, null, null);
		}
		return result;
	}

}

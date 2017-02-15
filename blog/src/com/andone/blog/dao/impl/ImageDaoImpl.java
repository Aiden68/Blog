package com.andone.blog.dao.impl;

import java.io.InputStream;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.andone.blog.dao.ImageDao;
import com.andone.blog.entity.Image;
import com.andone.blog.util.FileUtils;
import com.andone.blog.util.JdbcUtil;


public class ImageDaoImpl implements ImageDao{

	private Connection conn;
	private QueryRunner qr = new QueryRunner();
	
	@Override
	public ArrayList<Image> getByUserId(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addImage(Image image, InputStream inputStream) {
		FileUtils.upload(inputStream, image.getUrl());
        String sql = "insert into image(name, url, date) values(?, ?, ?)";
        Object[] parameters = {image.getName(), image.getUrl(), new SimpleDateFormat("yyyy-MM-dd HH:mm").format(image.getDate())};
        try{
			conn = (Connection) JdbcUtil.getConnection();
			int re = qr.update(conn, sql, parameters);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.closeAll(conn, null, null);
		}
	}

	@Override
	public void delByIdsAndUrls(String ids, String urls) {
		String[] idArray = ids.split(",");
        String[] urlArray = urls.split(",");
        if (!"".equals(idArray[0]) && !"".equals(urlArray[0])) {
            String[] sqls = new String[idArray.length];
            Object[][] parameters = new String[idArray.length][1];
            for (int i = 0; i < idArray.length; i++) {
                FileUtils.delete(urlArray[i]);
                sqls[i] = "delete from image where id = ?";
                parameters[i][0] = idArray[i];
            }
            try{
    			conn = (Connection) JdbcUtil.getConnection();
    			for(int i = 0; i < sqls.length; i++){
    				qr.update(conn, sqls[i], parameters[i]);
    			}
    		} catch (Exception e) {
    			throw new RuntimeException(e);
    		} finally {
    			JdbcUtil.closeAll(conn, null, null);
    		}
        }
	}

	@Override
	public ArrayList<Image> findAllImage() {
		String sql = "select * from image";
		List<Image> list = new ArrayList<>();
		try{
			conn = (Connection) JdbcUtil.getConnection();
			list = qr.query(conn, sql, new BeanListHandler<Image>(Image.class));
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.closeAll(conn, null, null);
		}
		return (ArrayList<Image>) list;
	}

}

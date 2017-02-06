package com.andone.blog.service.impl;

import com.andone.blog.dao.AdminDao;
import com.andone.blog.dao.impl.AdminDaoImpl;
import com.andone.blog.entity.Admin;
import com.andone.blog.service.AdminService;

public class AdminServiceImpl implements AdminService {

	private AdminDao adminDao = new AdminDaoImpl();
	@Override
	public Admin findByNameAndPwd(String username, String pwd) {
		return adminDao.findByNameAndPwd(username, pwd);
	}

}

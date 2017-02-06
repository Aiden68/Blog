package com.andone.blog.dao;

import com.andone.blog.entity.Admin;

public interface AdminDao {

	Admin findByNameAndPwd(String username, String pwd);
}

package com.andone.blog.service;

import com.andone.blog.entity.Admin;

public interface AdminService {

	Admin findByNameAndPwd(String username, String pwd);
}

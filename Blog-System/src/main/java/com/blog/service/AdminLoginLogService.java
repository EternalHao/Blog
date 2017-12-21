package com.blog.service;

import com.blog.model.AdminLoginLog;

public interface AdminLoginLogService {

    AdminLoginLog selectRencent(Integer adminId);

    int insert(AdminLoginLog adminLoginLog);

    int selectCountByAdminId(int adminId);
}

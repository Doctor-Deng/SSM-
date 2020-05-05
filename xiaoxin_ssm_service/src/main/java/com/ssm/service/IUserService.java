package com.ssm.service;

import com.ssm.domain.Role;
import com.ssm.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

/**
 * @author XiaoXin
 * @title: IUserService
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/11 14:49
 */
public interface IUserService extends UserDetailsService {

    List<UserInfo> findAll(Integer page,Integer size) throws Exception;

    void save(UserInfo userInfo) throws Exception;

    UserInfo findById(String id) throws Exception;

    List<Role> findOtherRoles(String userId) throws Exception;

    void addRoleToUser(String userId, String[] roleIds);

    void delUserById(String userId) throws Exception;
}

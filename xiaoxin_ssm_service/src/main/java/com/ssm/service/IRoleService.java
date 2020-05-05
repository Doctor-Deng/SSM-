package com.ssm.service;

import com.ssm.domain.Permission;
import com.ssm.domain.Role;

import java.util.List;

/**
 * @author XiaoXin
 * @title: IRoleService
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/15 17:03
 */


public interface IRoleService {

    public List<Role> findAll(Integer page,Integer size) throws Exception;

    public void save(Role role) throws Exception;

    public Role findById(String roleId) throws Exception;

    List<Permission> findOtherPermissions(String roleId) throws Exception;

    void addPermissionToRole(String roleId, String[] permissionids);

    void deleteRoleById(String roleId);
}

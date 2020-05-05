package com.ssm.service;

import com.ssm.domain.Permission;

import java.util.List;

/**
 * @author XiaoXin
 * @title: IPermissionService
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/15 17:38
 */
public interface IPermissionService {

    public List<Permission> findAll(Integer page,Integer size) throws Exception;

    public void save(Permission permission) throws Exception;

    void delPermissionById(String permissionId);
}

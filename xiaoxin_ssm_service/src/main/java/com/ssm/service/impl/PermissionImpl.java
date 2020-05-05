package com.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.ssm.dao.IPermissionDao;
import com.ssm.domain.Permission;
import com.ssm.service.IPermissionService;
import com.ssm.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author XiaoXin
 * @title: IPermissionImpl
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/15 17:38
 */

@Service
@Transactional
public class PermissionImpl implements IPermissionService {

    @Autowired
    private IPermissionDao permissionDao;



    @Override
    public List<Permission> findAll(Integer page,Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return permissionDao.findAll();
    }

    @Override
    public void save(Permission permission) throws Exception {
        String ppid = UUIDUtils.getUUID();
        permission.setId(ppid);
        permissionDao.save(permission);
    }

    @Override
    public void delPermissionById(String permissionId) {
        permissionDao.delRole_PermissionById(permissionId);
        permissionDao.delPermissionById(permissionId);
    }
}

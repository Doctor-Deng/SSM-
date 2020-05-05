package com.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.ssm.dao.IRoleDao;
import com.ssm.domain.Permission;
import com.ssm.domain.Role;
import com.ssm.service.IRoleService;
import com.ssm.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * @author XiaoXin
 * @title: IRoleServiceImpl
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/15 17:03
 */

@Service
@Transactional
public class RoleServiceImpl implements IRoleService {

    @Autowired
    private IRoleDao iRoleDao;


    @Override
    public List<Role> findAll(Integer page,Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return iRoleDao.findAll();
    }

    @Override
    public void save(Role role) {
        String rrid = UUIDUtils.getUUID();
        role.setId(rrid);
        iRoleDao.save(role);
    }

    @Override
    public Role findById(String roleId) throws Exception {
        return iRoleDao.findById(roleId);
    }

    @Override
    public List<Permission> findOtherPermissions(String roleId) throws Exception {
        return iRoleDao.findOtherPermissions(roleId);
    }

    @Override
    public void addPermissionToRole(String roleId, String[] permissionids) {
        for (String permissionId : permissionids){
            iRoleDao.addPermissionToRole(roleId,permissionId);
        }
    }

    @Override
    public void deleteRoleById(String roleId) {
        iRoleDao.deleteRoleBy_RoleId(roleId);
        iRoleDao.deleteRoleBy_UsersRoleId(roleId);
        iRoleDao.deleteRoleBy_RolePermissionId(roleId);
    }
}

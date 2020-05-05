package com.ssm.dao;

import com.ssm.domain.Permission;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author XiaoXin
 * @title: IPermissionDao
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/12 15:04
 */
public interface IPermissionDao {


    @Select("select * from permission where id in (select permissionId from role_permission where roleId=#{id} )")
    public List<Permission> findPermissionByRoleId(String id) throws Exception;

    @Select("select * from permission")
    public List<Permission> findAll() throws Exception;

    @Insert("insert into permission(id,permissionName,url) values(#{id},#{permissionName},#{url} )")
     void save(Permission permission) throws Exception;

    @Delete("delete from permission where id=#{permissionId}")
    void delPermissionById(String permissionId);

    @Delete("delete from role_permission where permissionId=#{permissionId}")
    void delRole_PermissionById(String permissionId);
}

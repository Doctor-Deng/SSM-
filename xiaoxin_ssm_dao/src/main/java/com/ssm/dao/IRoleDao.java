package com.ssm.dao;

import com.ssm.domain.Permission;
import com.ssm.domain.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author XiaoXin
 * @title: IRoleDao
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/11 17:00
 */
public interface IRoleDao {

    /**
      * 根据用户 id 查询出所有对应的角色
      * @param userId
      * @Return java.util.List<com.ssm.domain.Role>
      * @author XiaoXin
      * @date 2020/4/26 22:47
      */
    @Select("select * from role where id in (select roleId from users_role where userId=#{userId} )")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions",column = "id",javaType =java.util.List.class,many = @Many(select = "com.ssm.dao.IPermissionDao.findPermissionByRoleId"))
    })
    public List<Role> findRoleByUserId(String userId) throws Exception;

    @Select("select * from role")
    public List<Role> findAll() throws Exception;

    @Insert("insert into role(id,roleName,roleDesc) values(#{id},#{roleName},#{roleDesc})")
    void save(Role role);

    @Select("select * from role where id=#{roleId}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "roleName", column = "roleName"),
            @Result(property = "email", column = "email"),
            @Result(property = "roleDesc", column = "roleDesc"),
            @Result(property = "permissions", column = "id",javaType = java.util.List.class,many = @Many(select = "com.ssm.dao.IPermissionDao.findPermissionByRoleId"))
    })
    Role findById(String roleId);

    @Select("select * from permission where id not in (select permissionId from role_permission where roleId =#{roleId} )")
    List<Permission> findOtherPermissions(String roleId);

    @Insert("insert into role_permission(roleId,permissionId) values(#{roleId},#{permissionId} )")
    void addPermissionToRole(@Param("roleId") String roleId, @Param("permissionId") String permissionId);

    @Delete("delete from role where id=#{roleId}")
    void deleteRoleBy_RoleId(String roleId);

    @Delete("delete from users_role where roleId=#{roleId}")
    void deleteRoleBy_UsersRoleId(String roleId);

    @Delete("delete from role_permission where roleId=#{roleId}")
    void deleteRoleBy_RolePermissionId(String roleId);
}

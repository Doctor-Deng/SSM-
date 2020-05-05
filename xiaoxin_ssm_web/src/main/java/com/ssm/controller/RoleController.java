package com.ssm.controller;

import com.github.pagehelper.PageInfo;
import com.ssm.domain.Permission;
import com.ssm.domain.Role;
import com.ssm.service.IRoleService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;

/**
 * @author XiaoXin
 * @title: RoleController
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/15 17:01
 */

@RequestMapping("/role")
@Controller
public class RoleController {

    @Autowired
    private IRoleService roleService;

    @RequestMapping("/deleteRole.do")
    @RolesAllowed({"ADMIN", "SYSTEM"})
    public String deleteRole(@RequestParam(name = "id",required = true) String roleId) throws Exception{
        roleService.deleteRoleById(roleId);
        return "redirect:findAll.do";
    }


    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(name = "id",required = true) String id) throws Exception {
        ModelAndView mv = new ModelAndView();
        Role role = roleService.findById(id);
        mv.addObject("role",role);
        mv.setViewName("role-show");
        return mv;
    }

    /**
      * 给用户添加权限
      * @param roleId
      * @param permissionids
      * @Return void
      * @author XiaoXin
      * @date 2020/4/18 22:58
      */
    @RequestMapping("/addPermissionToRole.do")
    @RolesAllowed({"ADMIN", "SYSTEM"})
    public String addPermissionToRole(@RequestParam(name = "roleId",required = true) String roleId,
                                     @RequestParam(name = "ids",required = true)String[] permissionids)
    {
        roleService.addPermissionToRole(roleId,permissionids);
        return "redirect:findAll.do";
    }

    /**
      * 根据 roleId 查询 role，并查询出可以添加的权限
      * @RequestParam(name = "id" 传过来的名字为 id
      * user/findRoleByIdAndAllPermission.do?id=${role.id}
      * @param roleId
      * @Return void
      * @author XiaoXin
      * @date 2020/4/18 22:26
      */
    @RequestMapping("/findRoleByIdAndAllPermission.do")
    public ModelAndView findRoleByIdAndAllPermission(@RequestParam(name = "id",required = true) String roleId) throws Exception {
        ModelAndView mv = new ModelAndView();
        //根据 roleId 查询出 role
        Role role = roleService.findById(roleId);
        //根据 roleId 查询可以添加的权限
        List<Permission> otherPermissions = roleService.findOtherPermissions(roleId);
        mv.addObject("role",role);
        mv.addObject("permissionList",otherPermissions);
        mv.setViewName("role-permission-add");
        return mv;
    }

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,@RequestParam(name = "size",required = true,defaultValue = "5")Integer size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Role> roleList = roleService.findAll(page, size);
        PageInfo pageInfo = new PageInfo(roleList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("role-list");
        return mv;
    }

    @RequestMapping("/save.do")
    @RolesAllowed({"ADMIN", "SYSTEM"})
    public String save(Role role) throws Exception {
        roleService.save(role);
        //添加后要返回查询界面
        return "redirect:findAll.do";
    }
}

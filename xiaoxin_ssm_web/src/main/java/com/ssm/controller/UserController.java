package com.ssm.controller;

import com.github.pagehelper.PageInfo;
import com.ssm.domain.Role;
import com.ssm.domain.UserInfo;
import com.ssm.service.IUserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;

/**
 * @author XiaoXin
 * @title: UserController
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/12 10:21
 */

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    /***
      * 删除用户
      * @param userId
      * @Return java.lang.String
      * @author XiaoXin
      * @date 2020/4/24 15:59
      */
    @RequestMapping("/delUser.do")
    public String delUser(@RequestParam(name = "id",required = true) String userId) throws Exception {
        userService.delUserById(userId);
        return "redirect:findAll.do";
    }

    /**
      * 该方法的功能是给用户添加角色
      * 根据 jsp 界面里的标签进行操作
      * (@RequestParam(name = "userId",required = true) String userid,String[] roleIds)
      * <input name="ids" type="checkbox" value="${role.id}">
      * <input type="hidden" name="userId" value="${user.id}">
      * @param userId
      * @param roleIds
      * @Return void
      * @author XiaoXin
      * @date 2020/4/17 16:59
      */
    @RequestMapping("/addRoleToUser.do")
    public String addRoleToUser(@RequestParam(name = "userId",required = true) String userId,
                              @RequestParam(name = "ids",required = true) String[] roleIds)
    {
        userService.addRoleToUser(userId,roleIds);
        //添加完成后查询下信息
        return "redirect:findAll.do";
    }

    /**
      * 查询用户和用户可添加的角色
      * @Return void
      * @author XiaoXin
      * @date 2020/4/17 16:40
      */
    @RequestMapping("/findUserByIdAndAllRole.do")
    public ModelAndView findUserByIdAndAllRole(@RequestParam(name = "id",required = true)String userid) throws Exception {
        ModelAndView mv = new ModelAndView();
        //根据用户 id 查询用户
        UserInfo userInfo =  userService.findById(userid);
        //根据用户 id 查询可添加的角色
        List<Role> otherRoles= userService.findOtherRoles(userid);
        mv.addObject("user",userInfo);
        mv.addObject("roleList",otherRoles);
        mv.setViewName("user-role-add");
        return mv;
    }

    /**
      * 查询指定 id 的用户
      * @param id
      * @Return org.springframework.web.servlet.ModelAndView
      * @author XiaoXin
      * @date 2020/4/12 14:47
      */
    @RequestMapping("/findById.do")
    public ModelAndView findById(String id) throws Exception{
        ModelAndView mv = new ModelAndView();
        UserInfo userInfo = userService.findById(id);
        //根据 user-show.jsp 页面中的这段代码中的 user 确定 attributeName
        // <tr data-tt-id="0">
        //		<td colspan="2">${user.username}</td>
        // </tr>
        mv.addObject("user",userInfo);
        mv.setViewName("user-show");
        return mv;
    }

/**
  * 查找用户
  * @Return org.springframework.web.servlet.ModelAndView
  * @author XiaoXin
  * @date 2020/4/12 11:05
  */
    @RequestMapping("/findAll.do")
    @RolesAllowed({"ADMIN","SYSTEM"})
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,@RequestParam(name = "size",required = true,defaultValue ="5")Integer size) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UserInfo> userList = userService.findAll(page, size);
        PageInfo pageInfo = new PageInfo(userList);
        //	user-list.jsp 页面的 <c:forEach items="${userList}" var="user"> 确定 attributeName
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("user-list");
        return mv;
    }

 /**
   * 添加用户
   * @param userInfo
   * @Return org.springframework.web.servlet.ModelAndView
   * @author XiaoXin
   * @date 2020/4/12 11:05
   */
    @RequestMapping("/save.do")
    @PreAuthorize("authentication.principal.username == 'admin'")
    public String save(UserInfo userInfo) throws Exception{
        userService.save(userInfo);
        //用户添加完成后，查询所有用户信息
        return "redirect:findAll.do";
    }
}

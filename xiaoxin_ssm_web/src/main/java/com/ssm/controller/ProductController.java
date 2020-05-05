package com.ssm.controller;

import com.github.pagehelper.PageInfo;
import com.ssm.domain.Product;
import com.ssm.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;

/**
 * @author XiaoXin
 * @title: ProductController
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/8 14:43
 */

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private IProductService productService;

    /**
      * 删除产品
      * @param productId
      * @Return java.lang.String
      * @author XiaoXin
      * @date 2020/4/28 14:02
      */
    @RequestMapping("/delete.do")
    @RolesAllowed({"ADMIN","BUSINESS"})
    public String deleteProduct(@RequestParam(name = "id",required =true) String productId) throws Exception{
        productService.deleteProductById(productId);
        return "redirect:findAll.do";
    }
    /**
      * 产品添加
      * @param product
      * @Return java.lang.String
      * @author XiaoXin
      * @date 2020/4/8 19:21
      */
    @RequestMapping("/save.do")
    @RolesAllowed({"ADMIN","BUSINESS"})
    public String save(Product product) throws Exception {
        productService.save(product);
        //产品添加完成后，查询所有产品信息
        return "redirect:findAll.do";
    }

    /**
      * 查询所有
      * ModelAndView
      * 当控制器处理完请求时，通常会将包含视图名称或视图对象以及一些模型属性的 ModelAndView 对象返回到 DispatcherServlet。
      * 因此，经常需要在控制器中构造 ModelAndView 对象。ModelAndView 类提供了几个重载的构造器和一些方便的方法，
      * 当视图解释器解析 ModelAndVIew 时，其中 model 本身就是一个 Map 的实现类的子类。
      * 视图解析器将 model 中的每个元素都通过 request.setAttribute(name, value);
      * 添加 request 请求域中。这样就可以在 JSP 页面中通过 EL 表达式来获取对应的值
      * @Return org.springframework.web.servlet.ModelAndView
      * @author XiaoXin
      * @date 2020/4/8 19:03
      */
    @RequestMapping("/findAll.do")
    @RolesAllowed({"ADMIN","BUSINESS"})
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,@RequestParam(name = "size",required = true,defaultValue = "5")Integer size) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Product> productList = productService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(productList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("product-list");
        return mv;
    }
}

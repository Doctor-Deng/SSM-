package com.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.ssm.dao.IProductDao;
import com.ssm.domain.Product;
import com.ssm.service.IProductService;
import com.ssm.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * @author XiaoXin
 * @title: ProductServiceImpl
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/8 11:56
 */

@Service
@Transactional
public class ProductServiceImpl implements IProductService {

    @Autowired
    private IProductDao productDao;

    @Override
    public List<Product> findAll(Integer page,Integer size) throws Exception {
        //开启分页
        PageHelper.startPage(page,size);
        return productDao.findAll();
    }

    @Override
    public void save(Product product) throws Exception {
        // randomUUID()获取类型 4（伪随机生成的）UUID 的静态工厂。 使用加密的强伪随机数生成器生成该 UUID。
        String ppid = UUIDUtils.getUUID();
        product.setId(ppid);
        productDao.save(product);
    }

    @Override
    public void deleteProductById(String productId) {
        productDao.deleteProductById(productId);
    }
}

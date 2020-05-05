package com.ssm.service;

import com.ssm.domain.Product;

import java.util.List;

/**
 * @author XiaoXin
 * @title: IProductService
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/8 11:55
 */
public interface IProductService {
    public List<Product> findAll(Integer page,Integer size) throws Exception;

    void save(Product product) throws Exception;

    void deleteProductById(String productId);
}

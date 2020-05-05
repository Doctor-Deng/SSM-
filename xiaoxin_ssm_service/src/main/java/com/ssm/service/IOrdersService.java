package com.ssm.service;

import com.ssm.domain.Orders;

import java.util.List;
import java.util.Objects;

/**
 * @author XiaoXin
 * @title: IOrdersService
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/9 10:06
 */
public interface IOrdersService {
    public List<Orders> findAll(Integer page,Integer size) throws Exception;

    Orders findById(String ordersId) throws Exception;

    void deleteById(String orderId);
}

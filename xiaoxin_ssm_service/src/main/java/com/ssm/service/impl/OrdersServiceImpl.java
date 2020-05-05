package com.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.ssm.dao.IOrdersDao;
import com.ssm.domain.Orders;
import com.ssm.service.IOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author XiaoXin
 * @title: OrdersServiceImpl
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/9 10:06
 */

@Service
@Transactional
public class OrdersServiceImpl implements IOrdersService {

    @Autowired
    private IOrdersDao ordersDao;

    @Override
    public List<Orders> findAll(Integer page,Integer size) throws Exception {
        //参数 pageNum 表示页码值，参数 pageSize 表示每页显示的条数
        PageHelper.startPage(page,size);
        return ordersDao.findAll();
    }

    @Override
    public Orders findById(String ordersId) throws Exception{
        return ordersDao.findById(ordersId);
    }

    @Override
    public void deleteById(String orderId) {
        ordersDao.deleteByOrder_traveller(orderId);
        ordersDao.deleteByOrders_Id(orderId);
    }
}

package com.ssm.dao;

import com.ssm.domain.Traveller;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author XiaoXin
 * @title: ITravellerDao
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/9 16:42
 */
public interface ITravellerDao {
    /**
      * 待办，改善该 查询语句
      * @param orders
      * @Return java.util.List<com.ssm.domain.Traveller>
      * @author XiaoXin
      * @date 2020/4/9 16:48
      */

    @Select("select * from traveller where id in (select travellerId from order_traveller where orderId=#{ordersId})")
    public List<Traveller> findByOrdersId(String orders) throws Exception;
}

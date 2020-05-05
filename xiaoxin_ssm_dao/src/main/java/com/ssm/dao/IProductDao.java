package com.ssm.dao;

import com.ssm.domain.Product;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author XiaoXin
 * @title: IProductDao
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/8 11:26
 */
public interface IProductDao {

    @Select("select * from product where id= #{id}")
    public Product findById(String id);

    /***
      *
      * 查询所有商品信息
      * @Return java.util.List<com.ssm.domain.Product>
      * @author XiaoXin
      * @date 2020/4/8 11:27
      */
    @Select("select * from product")
    public List<Product> findAll() throws Exception;

    @Insert("insert into product(id,productNum,productName,cityName,departureTime,productPrice,productDesc,productStatus) values(#{id},#{productNum},#{productName},#{cityName},#{departureTime},#{productPrice},#{productDesc},#{productStatus})")
    void save(Product product);

    @Delete("delete from product where id=#{productId}")
    void deleteProductById(String productId);
}

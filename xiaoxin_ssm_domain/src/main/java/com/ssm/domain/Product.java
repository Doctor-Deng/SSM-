package com.ssm.domain;

import com.ssm.utils.DateUtils;
import com.ssm.utils.UUIDUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author XiaoXin
 * @title: Product
 * @projectName xiaoxin_ssm
 * @description: T实体类商品信息
 * @date 2020/4/8 11:19
 */
public class Product {
    // 主键
    private String id;
    // 编号 唯一
    private String productNum;
    // 名称
    private String productName;
    // 出发城市
    private String cityName;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
    // 出发时间
    private Date departureTime;
    private String departureTimeStr;
    // 产品价格
    private double productPrice;
    // 产品描述
    private String productDesc;
    // 状态 0 关闭 1 开启
    private Integer productStatus;
    private String productStatusStr;

    /***
     * productStatusStr 与 departureTimeStr 在数据库中是没有对应的属性的
     * 因为在界面中，不能直接展示 Date 类型的数据还有 0 和 1 这样的数据
     * productStatusStr 与 departureTimeStr 为了更好的展示
     */


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProductNum() {
        return productNum;
    }

    public void setProductNum(String productNum) {
        this.productNum = productNum;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public Date getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(Date departureTime) {
        this.departureTime = departureTime;
    }


    public String getDepartureTimeStr() {
        if (departureTime!=null){
            departureTimeStr = DateUtils.date2String(departureTime,"yyyy-MM-dd HH:mm:ss");
        }
        return departureTimeStr;
    }

    public void setDepartureTimeStr(String departureTimeStr) {
        this.departureTimeStr = departureTimeStr;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public Integer getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(Integer productStatus) {
        this.productStatus = productStatus;
    }

    public String getProductStatusStr() {
        if (productStatus != null){
            // 状态 0关闭 1开启
            if (productStatus==0){
                productStatusStr = "关闭";
            }else if (productStatus==1){
                productStatusStr = "开启";
            }
        }
        return productStatusStr;
    }

    public void setProductStatusStr(String productStatusStr) {
        this.productStatusStr = productStatusStr;
    }
}

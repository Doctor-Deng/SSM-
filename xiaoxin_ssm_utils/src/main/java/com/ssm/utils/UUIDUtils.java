package com.ssm.utils;

import java.util.UUID;

/**
 * @author XiaoXin
 * @title: UUIDUtils
 * @projectName xiaoxin_ssm
 * @description: 随机生成 ID
 * @date 2020/4/8 20:15
 */
public class UUIDUtils {

    public static String getUUID(){
        String uuid = UUID.randomUUID().toString().replace("-","");
        return uuid;
    }
}

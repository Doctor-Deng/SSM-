package com.ssm.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * @author XiaoXin
 * @title: BCryptPasswordEncoderUtils
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/12 12:24
 */
public class BCryptPasswordEncoderUtils {

    private static BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
    public static String encodePassword(String password){
        return bCryptPasswordEncoder.encode(password);
    }

    public static void main(String[] args) {
        String password="123456";
        String s = encodePassword(password);
        //第一次输出：$2a$10$bdk/P374U6kIu0gmGwIjueGv5Q7SFH5CEhu2zK3bQFZFcMldDvcfy
        //第二次输出：$2a$10$BjE0yC6/.0sIm5o0x520MuIreH.4KhhOnESysvfuCqUNnfgD6jdJe
        //每次运行都是随机加密密码
        System.out.println(s);
    }
}

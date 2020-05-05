package com.ssm.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author XiaoXin
 * @title: DateUtils
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/8 15:35
 */
public class DateUtils {

    //日期转换成字符串
    public static String date2String(Date date, String patt){
        // SimpleDateFormat 是一个以与语言环境有关的方式来格式化和解析日期的具体类。
        //它允许进行格式化（日期 -> 文本）、解析（文本 -> 日期）和规范化。
        SimpleDateFormat sdf = new SimpleDateFormat(patt);
        // public final String format(Date date)将一个 Date 格式化为日期/时间字符串。
        String format = sdf.format(date);
        return format;
    }

    //字符串转换成日期
    public static Date string2Date(String str,String patt) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(patt);
        // parse 从给定字符串的开始解析文本，以生成一个日期。该方法不使用给定字符串的整个文本。
        Date parse = sdf.parse(str);
        return parse;
    }
}

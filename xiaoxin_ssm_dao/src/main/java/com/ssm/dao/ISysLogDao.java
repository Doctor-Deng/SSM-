package com.ssm.dao;

import com.ssm.domain.SysLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author XiaoXin
 * @title: ISysLogDao
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/22 17:43
 */
public interface ISysLogDao {

    @Insert("insert into `sysLog`(visitTime,username,ip,url,executionTime,method) values(#{visitTime},#{username},#{ip},#{url},#{executionTime},#{method} )" )
    public void save(SysLog sysLog) throws Exception;

    @Select("select * from `sysLog`")
    public List<SysLog> findAll();
}

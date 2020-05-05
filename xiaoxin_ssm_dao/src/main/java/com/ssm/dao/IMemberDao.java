package com.ssm.dao;

import com.ssm.domain.Member;
import org.apache.ibatis.annotations.Select;

/**
 * @author XiaoXin
 * @title: IMemberDao
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/9 16:37
 */
public interface IMemberDao {

    @Select("select * from `member` where id = #{id}")
    public Member findById(String id) throws Exception;
}

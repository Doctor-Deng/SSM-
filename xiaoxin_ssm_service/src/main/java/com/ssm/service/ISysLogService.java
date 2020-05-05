package com.ssm.service;

import com.ssm.domain.SysLog;

import java.util.List;

/**
 * @author XiaoXin
 * @title: ISysLogService
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/22 17:41
 */
public interface ISysLogService {
    public void save(SysLog sysLog) throws Exception;

    public List<SysLog> findAll(Integer page,Integer size) throws Exception;
}

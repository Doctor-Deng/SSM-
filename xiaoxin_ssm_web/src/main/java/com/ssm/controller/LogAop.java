package com.ssm.controller;

import com.ssm.domain.SysLog;
import com.ssm.service.ISysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * @author XiaoXin
 * @title: LogAop
 * @projectName xiaoxin_ssm
 * @description: TODO
 * @date 2020/4/22 16:00
 */

@Component
@Aspect
public class LogAop {

    // 在 web.xml 配置 request 监听器
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private ISysLogService sysLogService;

    //开始时间
    private Date visitTime;
    //访问的类
    private Class clazz;
    //访问的方法
    private Method method;
    /**
      * 前置通知 获取开始时间，执行的是哪个类，执行的是哪个方法
      * @param jp
      * @Return void
      * @author XiaoXin
      * @date 2020/4/22 16:05
      */
    @Before("execution(* com.ssm.controller.*.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {
        //访问时系统当前时间就是访问时间
        visitTime = new Date();
        //具体访问的类
        clazz = jp.getTarget().getClass();
        //获取访问的方法名称
        String methodName = jp.getSignature().getName();
        //获取访问的方法的参数
        Object[] args = jp.getArgs();

        //获取具体执行的方法的 Method 对象
        if (args == null || args.length == 0){
            //只能获取无参数的方法
            method = clazz.getMethod(methodName);
        }else {
            //新建一个 Class 数组，长度由 args（方法里的参数长度）决定
            Class[] classArgs = new Class[args.length];
            //把每一个参数的 class 拿到
            for (int i = 0; i < args.length; i++) {
                classArgs[i] = args[i].getClass();
            }
            method = clazz.getMethod(methodName,classArgs);
        }
    }

    @After("execution(* com.ssm.controller.*.*(..))")
    public void doAfter(JoinPoint jp) throws Exception {
        //获取访问时长：系统当前时间 - 访问时系统当前时间
        long time = System.currentTimeMillis() - visitTime.getTime();

        String url = "";

        //获取访问的 Url
        if ((clazz != null && clazz != LogAop.class ) || method != null){
            //获取类上的 @RequestMapping("/orders")
            RequestMapping clazzAnnotation = (RequestMapping)clazz.getAnnotation(RequestMapping.class);
            if (clazzAnnotation != null) {
                //获取 @RequestMapping("/orders") 里面的值
                //@RequestMapping源码
                //    @AliasFor("value")
                //    String[] path() default {};
                String[] classValue = clazzAnnotation.value();
                //获取方法上的 @RequestMapping("XXX")
                RequestMapping methodAnnotation = method.getAnnotation(RequestMapping.class);
                if (methodAnnotation != null) {
                    String[] methodValue = methodAnnotation.value();
                    //拼接起来就是 @RequestMapping("/orders") + 类中的方法的 @RequestMapping("/orders")
                    url = classValue[0] + methodValue[0];

                        //获取当前访问的 ip 地址
                        String ip = request.getRemoteAddr();

                        //获取当前操作者，从上下文中获取了当前登录的用户
                        SecurityContext context = SecurityContextHolder.getContext();
                        //获取当前的对象
                        User user = (User) context.getAuthentication().getPrincipal();
                        String username = user.getUsername();

                        //将日志相关的信息封装到 SysLog 对象
                        SysLog sysLog = new SysLog();
                        sysLog.setExecutionTime(time);
                        sysLog.setVisitTime(visitTime);
                        sysLog.setIp(ip);
                        sysLog.setMethod("[类名]" + clazz.getName() + "方法名" + method.getName());
                        sysLog.setUrl(url);
                        sysLog.setUsername(username);

                        // 调用 Service 层完成操作
                        sysLogService.save(sysLog);
                }
            }
        }
    }
}

package com.taskconsole.util;

import com.taobao.pamirs.schedule.ConsoleManager;
import org.springframework.context.ApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2017/10/24<br>
 * <br>
 */
public class DeDispatcherServlet  extends DispatcherServlet {
    public DeDispatcherServlet(){
        super();
    }
    protected void onRefresh(ApplicationContext context)  {
        super.initStrategies(context);
        try {
            ConsoleManager.initial();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    }

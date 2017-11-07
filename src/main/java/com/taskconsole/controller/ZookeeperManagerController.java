package com.taskconsole.controller;

import com.taobao.pamirs.schedule.ConsoleManager;
import com.taskconsole.service.impl.ZookeeperServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.StringReader;
import java.io.StringWriter;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2017/10/27<br>
 * <br>
 */
@Controller
@RequestMapping("zookeeper")
public class ZookeeperManagerController {
    @Resource
    private ZookeeperServiceImpl zookeeperService;

    @RequestMapping("getZookeeperData")
    public String getZookeeperData(HttpServletRequest request, HttpServletResponse response, Model model){
        String zookeeperData = null;
        zookeeperData = zookeeperService.getZookeeperData();
        model.addAttribute("zookeeperData",zookeeperData);
        return "schedule/zookeeperData";
    }

    @RequestMapping("initExprortConfig")
    public String initExprortConfig(HttpServletRequest request, HttpServletResponse response, Model model){
        String rootPath = null;
        rootPath = zookeeperService.getRootPath();
        model.addAttribute("rootPath",rootPath);
        return "schedule/exportConfig";
    }


    @RequestMapping("exportConfig")
    public String exportConfig(HttpServletRequest request, HttpServletResponse response, Model model){
        try {
            if (ConsoleManager.isInitial() == false) {
                response.sendRedirect("config.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        StringWriter confWriter = new StringWriter();
        StringWriter errWriter = new StringWriter();
        String rootPath = null;
        try {
            rootPath = ConsoleManager.getScheduleStrategyManager().getRootPath();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String type = (String) request.getParameter("type");
        if ("POST".equals(request.getMethod())) {
            StringWriter tmpWriter = new StringWriter();
            try {
                StringBuffer buffer = null;
                if (rootPath != null && rootPath.length() > 0) {
                    buffer = ConsoleManager.getScheduleStrategyManager()
                            .exportConfig(rootPath, confWriter);
                } else {
                    tmpWriter.write("没有设置导出配置信息的路径");
                }
                // 导出文件
                if (type != null && type.equals("1")) {
                    // 导出进行保存
                    if (buffer != null) {
                        response.setContentType("text/plain;charset=GBK");
                        response.setHeader("Content-disposition",
                                "attachment; filename=config.txt");
                        PrintWriter out_=response.getWriter();
                        out_.print(buffer.toString());
                        out_.close();
                    }
                }
                if (tmpWriter != null && tmpWriter.toString().length() > 0) {
                    errWriter.write("<font color=\"red\">错误信息：</font>\n\t");
                    errWriter.write(tmpWriter.toString());
                }
            } catch (Exception e) {
                if (tmpWriter != null && tmpWriter.toString().length() > 0) {
                    errWriter.write("<font color=\"red\">错误信息：</font>\n\t");
                    errWriter.write(tmpWriter.toString());
                }
                StringWriter strWriter = new StringWriter();
                PrintWriter printWriter = new PrintWriter(strWriter);
                e.printStackTrace(printWriter);
                errWriter.write("<font color=\"red\">错误的堆栈信息:</font>\n\t" + e.getMessage()+"\n"+strWriter);
            }
            model.addAttribute("confWriter",confWriter);
            model.addAttribute("errWriter",errWriter);
            model.addAttribute("rootPath",rootPath);
        }
        return "schedule/exportConfig";
    }

    @RequestMapping("initimportconfig")
    public String initImportConfig(HttpServletRequest request, HttpServletResponse response, Model model){
    /*    String rootPath = null;
        rootPath = zookeeperService.getRootPath();
        model.addAttribute("rootPath",rootPath);*/
        return "schedule/importConfig";
    }

    @RequestMapping("importConfig")
    public String importConfig(HttpServletRequest request, HttpServletResponse response, Model model){

        try {
            if (ConsoleManager.isInitial() == false) {
                response.sendRedirect("config.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        StringWriter writer = new StringWriter();
        boolean isUpdate = false;
        String configContent = "";
        try {
            if ("POST".equals(request.getMethod())) {
                configContent = request.getParameter("configContent");
                StringReader strReader = new StringReader(configContent);
                BufferedReader bufReader = new BufferedReader(strReader);
                String line = null;
                boolean isUploadConfig = false;
                isUpdate = Boolean
                        .valueOf(request.getParameter("isUpdate"));
                while ((line = bufReader.readLine()) != null) {
                    isUploadConfig = true;
                    if (line.contains("strategy")
                            || line.contains("baseTaskType")) {
                        ConsoleManager.getScheduleStrategyManager()
                                .importConfig(line, writer, isUpdate);
                    } else {
                        writer.write("<h3><font color=\"red\">非法配置信息：\n\t\t</font>"
                                + line + "</h3>");
                    }
                }
                if (!isUploadConfig) {
                    writer.append("<h3><font color=\"red\">错误信息：\n\t</font>没有选择导入的配置文件</h3>");
                }
            }
        } catch (Exception e) {
            StringWriter strWriter = new StringWriter();
            PrintWriter printWriter = new PrintWriter(strWriter);
            e.printStackTrace(printWriter);
            writer.append("<h3><font color=\"red\">错误信息堆栈：\n\t\t</font>"
                    + e.getMessage() + "\n" + strWriter.toString()
                    + "</h3>");
        }
        model.addAttribute("isUpdate",isUpdate);
        model.addAttribute("configContent",configContent);
        model.addAttribute("writer",writer.toString());
        return "schedule/importConfig";
    }
}

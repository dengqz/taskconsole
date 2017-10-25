package com.taskconsole.controller;

import com.taskconsole.dto.Organization;
import com.taskconsole.service.OrganizationService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2017/10/26<br>
 * <br>
 */
@Controller
@RequestMapping("/org")
public class OrganizationController {


    private Logger log = Logger.getLogger(OrganizationController.class);
    @Resource
    private OrganizationService organizationService;
    @RequestMapping("/showorg")
    public String showOrg(HttpServletRequest request, HttpServletResponse response, Model model){
        log.info("查询所有用户信息");
        List<Organization> orgList = organizationService.getAllOrg();
        model.addAttribute("orgList",orgList);
        return "showOrg";
    }
}

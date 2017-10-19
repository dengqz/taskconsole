package com.taskconsole.util;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2017/10/12<br>
 * <br>
 */
public class StringUtils {
    /**
     * 字符串加密
     * @param name unique dependencies.dependency.(groupId:artifactId:type:classifier)' must be unique
     * @return
     */
    public static String sec(String name){
        if(name==null)
            return null;
        String starStr="*****";
        name = name.substring(0, 2) + starStr
                + name.substring(name.length() - 4, name.length());
        return name;
    }
}

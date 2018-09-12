package com.fast.common.util;

/**
 * 常量类
 *  
 * @author yuyanan
 * @date   2018年7月21日
 */
public class Constant {
	
	public static class App{
		public static final String author = "yyn";
		
	}

	public static class Jwt{
		//secretKey
		public static String secretkey = "secretkey";
		public static final String User = "user";
		public static final int JWT_TTL = 60*60*1000;  //millisecond
	}
	
    public static class Job {

        // 停止计划任务
        public static String STATUS_RUNNING_STOP = "stop";
        // 开启计划任务
        public static String STATUS_RUNNING_START = "start";

    }


    public static class Generator {

        // 自动去除表前缀
        public static String AUTO_REOMVE_PRE = "true";

    }

    public static class Sys {

        // 部门根节点id
        public static Long DEPT_ROOT_ID = 0L;
    }
}

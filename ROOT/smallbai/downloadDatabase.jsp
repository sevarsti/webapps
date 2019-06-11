<%@ page import="javax.sql.DataSource" %>
<%@ page import="servlet.GlobalContext" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.saille.sys.Setting" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.util.zip.ZipOutputStream" %>
<%@ page import="java.util.zip.ZipEntry" %>
<%@ page import="org.springframework.util.FileCopyUtils" %>
<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2017-12-22
  Time: 23:52
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../include/include.jsp"%>
<html>
<head>
    <title>小白博客数据库导出</title>
</head>
<body>
<%
    String method = request.getMethod();
//    DataSource ds = (DataSource) GlobalContext.getSpringContext().getBean("mysql_ds");
    if("POST".equals(method)) {
        String pwd = Setting.getSettingString("SMALLBAI_DBPASSWORD");
        String includedata = request.getParameter("includedata");
        String[] tables = request.getParameterValues("table");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        byte[] bytes = (sdf.format(new Date()) + ".zip").getBytes("GBK");
        String encoded = new String(bytes, "ISO-8859-1");
        response.addHeader("Content-Disposition", "attachment; filename=" + encoded);
        response.setHeader("Content-Type", " application/zip");

        List<String> commandstr = new ArrayList<String>();
        commandstr.add("F:\\software\\mysql-5.7.20-winx64\\bin\\mysqldump.exe");
        if(includedata == null) {
            commandstr.add("--no-data");
        }
        commandstr.add("--default-character-set=utf8");
        commandstr.add("-hrm-wz9duuymduknb02bd72o.mysql.rds.aliyuncs.com");
        commandstr.add("-uroot");
        commandstr.add("-p" + pwd);
        commandstr.add("small-bai-blog");
        String[] commands = new String[commandstr.size()];
        commandstr.toArray(commands);
        ProcessBuilder pb = new ProcessBuilder(commands);
        Process p = pb.start();
        InputStream is = p.getInputStream();
        ZipOutputStream zos = new ZipOutputStream(response.getOutputStream());
        zos.putNextEntry(new ZipEntry(sdf.format(new Date()) + ".sql"));
        FileCopyUtils.copy(is, zos);
        is.close();
        p.destroy();
        out.clear();
        out = pageContext.pushBody();
        return;
    }
%>
<form action="" method="post">
    <input type="checkbox" id="includedata" name="includedata"/>
    <label for="includedata" style="cursor: pointer;">只导出表结构</label>
    <br/>
    <input type="submit" value="确定"/>
</form>
</body>
</html>

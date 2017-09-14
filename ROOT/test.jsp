<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ page import="servlet.GlobalContext" %>
<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="com.saille.rm.util.ImdUtils" %><%
    File[] dir = new File("D:\\rm\\zizhi").listFiles();
    DataSource ds = (DataSource) GlobalContext.getSpringContext().getBean("mysql_ds");
    JdbcTemplate jt = new JdbcTemplate(ds);
    for(File d : dir) {
        String path = d.getName();
        File[] ff = d.listFiles();
        for(File f : ff) {
            if(!f.getName().toLowerCase().endsWith(".imd")) {
                continue;
            }
            int size = (int)f.length();
            byte[] bytes = new byte[size];
            FileInputStream fis = new FileInputStream(f);
            fis.read(bytes);
            fis.close();

            Pattern p = Pattern.compile(".+_(\\d)k_(.+)\\.imd");
            Matcher m = p.matcher(f.getName());
            int key = 0;
            int level = 0;
            if(m.matches()) {
                key = Integer.parseInt(m.group(1));
                String lv = m.group(2);
                if("nm".equalsIgnoreCase(lv)) {
                    level = 2;
                } else if("hd".equalsIgnoreCase(lv)) {
                    level = 3;
                } else if("ez".equalsIgnoreCase(lv)) {
                    level = 1;
                }
            }
            int totalkey = ImdUtils.getTotalKeys(bytes);
            jt.update("update rm_customsongimd set totalkey = ? where `key` = ? and `level` = ? and songid = (select id from rm_customsong where path=?)",
                      new Object[]{totalkey, key, level, path});
        }
    }
    out.println("done");
%>
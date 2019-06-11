<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="com.saille.rm.util.ImdUtils" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="servlet.GlobalContext" %>
<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %><%
    File dir = new File("F:\\rm\\zizhi");
    File[] songs = dir.listFiles();
    for(File songdir : songs) {
        File[] imds = songdir.listFiles();
        double bpm = 0d;
        for(File imd : imds) {
            if(imd.getName().toLowerCase().endsWith(".imd")) {
                FileInputStream fis = new FileInputStream(imd);
                byte[] bytes = new byte[(int)imd.length()];
                fis.read(bytes);
                fis.close();
                double newbpm = ImdUtils.getBpm(bytes);
                if(bpm == 0d) {
                    bpm = newbpm;
                } else if(bpm != newbpm) {
                    System.out.println(imd.getName() + " bpmδ֪");
                    bpm = 0d;
                    break;
                }
            }
        }
        if(bpm != 0) {
            DataSource ds = (DataSource) GlobalContext.getSpringContext().getBean("mysql_ds");
            JdbcTemplate jt = new JdbcTemplate(ds);
            jt.update("update rm_customsong set bpm = ? where path = ?", new Object[]{bpm, songdir.getName()});
        }
    }
    out.println("done");
%>